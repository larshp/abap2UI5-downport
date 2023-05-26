CLASS ltcl_unit_01_json DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PUBLIC SECTION.

  PRIVATE SECTION.
    METHODS test_json_attri     FOR TESTING RAISING cx_static_check.
    METHODS test_json_object    FOR TESTING RAISING cx_static_check.
    METHODS test_json_struc     FOR TESTING RAISING cx_static_check.
    METHODS test_json_trans     FOR TESTING RAISING cx_static_check.
    METHODS test_json_trans_gen FOR TESTING RAISING cx_static_check.
ENDCLASS.

CLASS ltcl_unit_01_utility DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PUBLIC SECTION.

  PRIVATE SECTION.

    METHODS test_util_uuid_session  FOR TESTING RAISING cx_static_check.
    METHODS test_util_04_attri_by_ref  FOR TESTING RAISING cx_static_check.
    METHODS test_util_01_get_t_attri  FOR TESTING RAISING cx_static_check.
    METHODS test_util_03_get_t_attri_struc  FOR TESTING RAISING cx_static_check.
    METHODS test_util_02_get_attri  FOR TESTING RAISING cx_static_check.
ENDCLASS.





CLASS ltcl_unit_04_deep_data DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PUBLIC SECTION.
    INTERFACES z2ui5_if_app.

    DATA check_initialized TYPE abap_bool.

    TYPES:
      BEGIN OF ty_row,
        title    TYPE string,
        value    TYPE string,
        descr    TYPE string,
        icon     TYPE string,
        info     TYPE string,
        selected TYPE abap_bool,
        checkbox TYPE abap_bool,
      END OF ty_row.

    CLASS-DATA t_tab TYPE STANDARD TABLE OF ty_row WITH DEFAULT KEY.

    CLASS-DATA sv_status TYPE string.

  PRIVATE SECTION.
    METHODS test_app_deep_data        FOR TESTING RAISING cx_static_check.
    METHODS test_app_deep_data_change FOR TESTING RAISING cx_static_check.
ENDCLASS.



CLASS ltcl_unit_01_json IMPLEMENTATION.

  METHOD test_json_attri.

    DATA lo_tree TYPE REF TO z2ui5_lcl_utility_tree_json.
    CREATE OBJECT lo_tree TYPE z2ui5_lcl_utility_tree_json.

    lo_tree->add_attribute( n = `AAA` v = `BBB` ).

    DATA lv_result TYPE string.
    lv_result = lo_tree->stringify( ).
    IF `{"AAA":"BBB"}` <> lv_result.
      cl_abap_unit_assert=>fail( 'json tree - wrong stringify attributes' ).
    ENDIF.

  ENDMETHOD.

  METHOD test_json_object.

    DATA lo_tree TYPE REF TO z2ui5_lcl_utility_tree_json.
    CREATE OBJECT lo_tree TYPE z2ui5_lcl_utility_tree_json.

    lo_tree->add_attribute_object( `CCC`
         )->add_attribute( n = `AAA` v = `BBB` ).

    DATA lv_result TYPE string.
    lv_result = lo_tree->stringify( ).
    IF `{"CCC":{"AAA":"BBB"}}` <> lv_result.
      cl_abap_unit_assert=>fail( 'json tree - wrong stringify object attributes' ).
    ENDIF.

  ENDMETHOD.

  METHOD test_json_struc.

    DATA lo_tree TYPE REF TO z2ui5_lcl_utility_tree_json.
    CREATE OBJECT lo_tree TYPE z2ui5_lcl_utility_tree_json.

    TYPES:
      BEGIN OF ty_s_test,
        comp1 TYPE string,
        comp2 TYPE string,
      END OF ty_s_test.

    DATA temp34 TYPE ty_s_test.
    CLEAR temp34.
    temp34-comp1 = `AAA`.
    temp34-comp2 = `BBB`.
    DATA ls_test LIKE temp34.
    ls_test = temp34.

    lo_tree->add_attribute_object( `CCC`
        )->add_attribute_struc( ls_test ).

    DATA lv_result TYPE string.
    lv_result = lo_tree->stringify( ).
    IF `{"CCC":{"COMP1":"AAA","COMP2":"BBB"}}` <> lv_result.
      cl_abap_unit_assert=>fail( 'json tree - wrong stringify structure' ).
    ENDIF.

  ENDMETHOD.

  METHOD test_json_trans.

    TYPES:
      BEGIN OF ty_row,
        title    TYPE string,
        value    TYPE string,
        selected TYPE abap_bool,
      END OF ty_row.
    TYPES ty_t_tab TYPE STANDARD TABLE OF ty_row WITH DEFAULT KEY.

    DATA temp35 TYPE ty_t_tab.
    CLEAR temp35.
    DATA temp36 LIKE LINE OF temp35.
    temp36-title = 'Test'.
    temp36-value = 'this is a description'.
    temp36-selected = abap_true.
    INSERT temp36 INTO TABLE temp35.
    temp36-title = 'Test2'.
    temp36-value = 'this is a new descr'.
    temp36-selected = abap_false.
    INSERT temp36 INTO TABLE temp35.
    DATA lt_tab LIKE temp35.
    lt_tab = temp35.

    DATA temp37 TYPE ty_t_tab.
    CLEAR temp37.
    DATA lt_tab2 LIKE temp37.
    lt_tab2 = temp37.

    DATA lv_tab TYPE string.
    lv_tab = z2ui5_lcl_utility=>trans_any_2_json( lt_tab ).

    /ui2/cl_json=>deserialize(
      EXPORTING
        json             = lv_tab
      CHANGING
        data             = lt_tab2
    ).

    IF lt_tab <> lt_tab2.
      cl_abap_unit_assert=>fail( msg = 'json serial -  /ui2/cl_json wrong simple table' quit = 5 ).
    ENDIF.

  ENDMETHOD.

  METHOD test_json_trans_gen.

    TYPES:
      BEGIN OF ty_row,
        title    TYPE string,
        value    TYPE string,
        selected TYPE abap_bool,
      END OF ty_row.
    TYPES ty_t_tab TYPE STANDARD TABLE OF ty_row WITH DEFAULT KEY.

    DATA temp38 TYPE ty_t_tab.
    CLEAR temp38.
    DATA temp39 LIKE LINE OF temp38.
    temp39-title = 'Test'.
    temp39-value = 'this is a description'.
    temp39-selected = abap_true.
    INSERT temp39 INTO TABLE temp38.
    temp39-title = 'Test2'.
    temp39-value = 'this is a new descr'.
    temp39-selected = abap_false.
    INSERT temp39 INTO TABLE temp38.
    DATA lt_tab LIKE temp38.
    lt_tab = temp38.

    DATA temp40 TYPE ty_t_tab.
    CLEAR temp40.
    DATA lt_tab2 LIKE temp40.
    lt_tab2 = temp40.

    DATA lv_tab TYPE string.
    lv_tab = z2ui5_lcl_utility=>trans_any_2_json( lt_tab ).

    DATA lo_data TYPE REF TO data.
    /ui2/cl_json=>deserialize(
      EXPORTING
        json             = lv_tab
      CHANGING
        data             = lo_data
    ).

    z2ui5_lcl_utility=>trans_ref_tab_2_tab(
      EXPORTING
        ir_tab_from = lo_data
      IMPORTING
        t_result    = lt_tab2
    ).

    IF lt_tab <> lt_tab2.
      cl_abap_unit_assert=>fail( msg = 'json serial -  /ui2/cl_json wrong generic table' quit = 5 ).
    ENDIF.

  ENDMETHOD.


ENDCLASS.

CLASS ltcl_unit_01_utility IMPLEMENTATION.


  METHOD test_util_04_attri_by_ref.

*    DATA(lo_app) = NEW ltcl_unit_04_deep_data( ).
*
*    DATA(lt_attri) = z2ui5_lcl_utility=>get_t_attri_by_ref( lo_app ).
*
*    DATA(lt_test) = VALUE z2ui5_lcl_utility=>ty_t_attri(
*( name = `Z2UI5_IF_APP~ID` type_kind = `g` type = `STRING` bind_type = `` data_stringify = `` gen_type_kind = `` gen_type = `` gen_kind = `` )
*( name = `CHECK_INITIALIZED` type_kind = `C` type = `ABAP_BOOL` bind_type = `` data_stringify = `` gen_type_kind = `` gen_type = `` gen_kind = `` )
*( name = `SV_STATUS` type_kind = `g` type = `STRING` bind_type = `` data_stringify = `` gen_type_kind = `` gen_type = `` gen_kind = `` )
*( name = `T_TAB` type_kind = `h` type = `` bind_type = `` data_stringify = `` gen_type_kind = `` gen_type = `` gen_kind = `` )
* ).
*
*    IF lt_test <> lt_attri.
*      cl_abap_unit_assert=>fail( msg = 'utility - get t_attri table wrong' quit = 5 ).
*    ENDIF.

  ENDMETHOD.


  METHOD test_util_uuid_session.

    DATA lv_one TYPE string.
    lv_one = z2ui5_lcl_utility=>get_uuid_session( ).
    DATA lv_two TYPE string.
    lv_two = z2ui5_lcl_utility=>get_uuid_session( ).

    IF lv_one <> `1`.
      cl_abap_unit_assert=>fail( msg = 'utility - create session id' quit = 5 ).
    ENDIF.

    IF lv_two <> `2`.
      cl_abap_unit_assert=>fail( msg = 'utility - create session id' quit = 5 ).
    ENDIF.

  ENDMETHOD.

  METHOD test_util_02_get_attri.

    DATA lo_app TYPE REF TO ltcl_unit_04_deep_data.
    CREATE OBJECT lo_app TYPE ltcl_unit_04_deep_data.

    lo_app->sv_status = `ABC`.
    FIELD-SYMBOLS <any> TYPE any.
    DATA lv_assign TYPE string.
    lv_assign = `LO_APP->` && 'SV_STATUS'.
    ASSIGN (lv_assign) TO <any>.

    IF <any> <> `ABC`.
      cl_abap_unit_assert=>fail( msg = 'utility - assign of attribute from outside not working' quit = 5 ).
    ENDIF.

  ENDMETHOD.

  METHOD test_util_01_get_t_attri.

    DATA lo_app TYPE REF TO ltcl_unit_04_deep_data.
    CREATE OBJECT lo_app TYPE ltcl_unit_04_deep_data.

    DATA temp41 TYPE REF TO cl_abap_classdescr.
    temp41 ?= cl_abap_objectdescr=>describe_by_object_ref( lo_app ).
    DATA lt_attri LIKE temp41->attributes.
    lt_attri = temp41->attributes.

    DATA temp42 TYPE abap_attrdescr_tab.
    CLEAR temp42.
    DATA temp43 LIKE LINE OF temp42.
    temp43-length = '8'.
    temp43-decimals = '0'.
    temp43-name = 'Z2UI5_IF_APP~ID'.
    temp43-type_kind = 'g'.
    temp43-visibility = 'U'.
    temp43-is_interface = 'X'.
    temp43-is_inherited = ''.
    temp43-is_class = ''.
    temp43-is_constant = ''.
    temp43-is_virtual = ''.
    temp43-is_read_only = ''.
    temp43-alias_for = ''.
    INSERT temp43 INTO TABLE temp42.
    temp43-length = '2'.
    temp43-decimals = '0'.
    temp43-name = 'CHECK_INITIALIZED'.
    temp43-type_kind = 'C'.
    temp43-visibility = 'U'.
    temp43-is_interface = ''.
    temp43-is_inherited = ''.
    temp43-is_class = ''.
    temp43-is_constant = ''.
    temp43-is_virtual = ''.
    temp43-is_read_only = ''.
    temp43-alias_for = ''.
    INSERT temp43 INTO TABLE temp42.
    temp43-length = '8'.
    temp43-decimals = '0'.
    temp43-name = 'SV_STATUS'.
    temp43-type_kind = 'g'.
    temp43-visibility = 'U'.
    temp43-is_interface = ''.
    temp43-is_inherited = ''.
    temp43-is_class = 'X'.
    temp43-is_constant = ''.
    temp43-is_virtual = ''.
    temp43-is_read_only = ''.
    temp43-alias_for = ''.
    INSERT temp43 INTO TABLE temp42.
    temp43-length = '8'.
    temp43-decimals = '0'.
    temp43-name = 'T_TAB'.
    temp43-type_kind = 'h'.
    temp43-visibility = 'U'.
    temp43-is_interface = ''.
    temp43-is_inherited = ''.
    temp43-is_class = 'X'.
    temp43-is_constant = ''.
    temp43-is_virtual = ''.
    temp43-is_read_only = ''.
    temp43-alias_for = ''.
    INSERT temp43 INTO TABLE temp42.
    DATA lt_test LIKE temp42.
    lt_test = temp42.

    IF lt_test <> lt_attri.
      cl_abap_unit_assert=>fail( msg = 'utility - get abap_attrdescr_tab table wrong' quit = 5 ).
    ENDIF.

  ENDMETHOD.

  METHOD test_util_03_get_t_attri_struc.

* DATA(lo_app) = NEW ltcl_unit_04_deep_data( ).
*
*    lcl_utility=>_get_t_attri_by_struc

  ENDMETHOD.

ENDCLASS.

CLASS ltcl_unit_02_app_start DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PUBLIC SECTION.
    INTERFACES z2ui5_if_app.

    DATA product  TYPE string.
    DATA quantity TYPE string.
    DATA check_initialized TYPE abap_bool.

    CLASS-DATA sv_state TYPE string.

  PRIVATE SECTION.
    METHODS test_index_html       FOR TESTING RAISING cx_static_check.
    METHODS test_xml_view         FOR TESTING RAISING cx_static_check.
    METHODS test_id               FOR TESTING RAISING cx_static_check.
    METHODS test_xml_popup        FOR TESTING RAISING cx_static_check.
    METHODS test_bind_one_way     FOR TESTING RAISING cx_static_check.
    METHODS test_bind_two_way     FOR TESTING RAISING cx_static_check.
    METHODS test_message_toast    FOR TESTING RAISING cx_static_check.
    METHODS test_message_box      FOR TESTING RAISING cx_static_check.
    METHODS test_timer            FOR TESTING RAISING cx_static_check.
    METHODS test_landing_page     FOR TESTING RAISING cx_static_check.
    METHODS test_scroll_cursor    FOR TESTING RAISING cx_static_check.
    METHODS test_navigate         FOR TESTING RAISING cx_static_check.
    METHODS test_startup_path     FOR TESTING RAISING cx_static_check.
ENDCLASS.


CLASS ltcl_unit_02_app_start IMPLEMENTATION.

  METHOD test_index_html.

    DATA temp44 LIKE z2ui5_cl_http_handler=>client.
    CLEAR temp44.
    DATA temp24 TYPE z2ui5_if_client=>ty_t_name_value.
    CLEAR temp24.
    DATA temp25 LIKE LINE OF temp24.
    temp25-name = '~path'.
    temp25-value = 'dummy'.
    INSERT temp25 INTO TABLE temp24.
    temp44-t_header = temp24.
    z2ui5_cl_http_handler=>client = temp44.

    DATA lv_index_html TYPE string.
    lv_index_html = z2ui5_cl_http_handler=>http_get(  ).

    IF lv_index_html IS INITIAL.
      cl_abap_unit_assert=>fail( 'HTTP GET - index html initial' ).
    ENDIF.

  ENDMETHOD.

  METHOD z2ui5_if_app~main.

    IF check_initialized = abap_false.
      check_initialized = abap_true.
      product  = 'tomato'.
      quantity = '500'.

    ENDIF.

    CASE client->get( )-event.
      WHEN 'BUTTON_POST'.
        client->popup_message_toast( |{ product } { quantity } - send to the server| ).
      WHEN 'BACK'.
        client->nav_app_leave( client->get_app( client->get( )-id_prev_app_stack  ) ).
    ENDCASE.

    IF sv_state = 'TEST_MESSAGE_BOX'.
      client->popup_message_box(
        text = 'test message box'
      ).
    ENDIF.

    IF sv_state = 'TEST_MESSAGE_TOAST'.
      client->popup_message_toast(
        text = 'test message toast'
      ).
    ENDIF.


    CASE sv_state.

      WHEN 'TEST_ONE_WAY'.
        DATA temp45 TYPE z2ui5_if_client=>ty_s_next.
        CLEAR temp45.
        temp45-xml_main = z2ui5_cl_xml_view=>factory( )->shell( )->page( title = 'abap2UI5 - First Example' navbuttonpress = client->_event( 'BACK' ) shownavbutton = abap_true )->simple_form( title = 'Form Title' editable = abap_true )->content( 'form' )->title( 'Input' )->label( 'quantity' )->input( client->_bind_one( quantity ) )->label( 'product' )->input( value = product enabled = abap_false )->button( text = 'post' press = client->_event( 'BUTTON_POST' ) )->get_root( )->xml_get( ).
        client->set_next( temp45 ).

      WHEN 'TEST_POPUP'.
        DATA temp46 TYPE z2ui5_if_client=>ty_s_next.
        CLEAR temp46.
        temp46-xml_popup = z2ui5_cl_xml_view=>factory( )->dialog( title = 'abap2UI5 - First Example' )->simple_form( title = 'Form Title' editable = abap_true )->content( 'form' )->title( 'Input' )->label( 'quantity' )->input( client->_bind_one( quantity ) )->label( 'product' )->input( value = product enabled = abap_false )->button( text = 'post' press = client->_event( 'BUTTON_POST' ) )->get_root( )->xml_get( ).
        client->set_next( temp46 ).

      WHEN 'TEST_TIMER'.
        DATA temp47 TYPE z2ui5_if_client=>ty_s_next.
        CLEAR temp47.
        CLEAR temp47-s_timer.
        temp47-s_timer-event_finished = 'TIMER_FINISHED'.
        temp47-s_timer-interval_ms = `500`.
        temp47-xml_main = z2ui5_cl_xml_view=>factory( )->shell( )->page( title = 'abap2UI5 - First Example' navbuttonpress = client->_event( 'BACK' ) shownavbutton = abap_true )->simple_form( title = 'Form Title' editable = abap_true )->content( 'form' )->title( 'Input' )->label( 'quantity' )->input( client->_bind( quantity ) )->label( 'product' )->input( value = product enabled = abap_false )->button( text = 'post' press = client->_event( 'BUTTON_POST' ) )->get_root( )->xml_get( ).
        client->set_next( temp47 ).

      WHEN OTHERS.
        DATA temp48 TYPE z2ui5_if_client=>ty_s_next.
        CLEAR temp48.
        temp48-xml_main = z2ui5_cl_xml_view=>factory( )->shell( )->page( title = 'abap2UI5 - First Example' navbuttonpress = client->_event( 'BACK' ) shownavbutton = abap_true )->simple_form( title = 'Form Title' editable = abap_true )->content( 'form' )->title( 'Input' )->label( 'quantity' )->input( client->_bind( quantity ) )->label( 'product' )->input( value = product enabled = abap_false )->button( text = 'post' press = client->_event( 'BUTTON_POST' ) )->get_root( )->xml_get( ).
        client->set_next( temp48 ).

    ENDCASE.

    IF sv_state = 'TEST_SCROLL_CURSOR'.

      DATA temp49 TYPE z2ui5_if_client=>ty_s_next.
      CLEAR temp49.
      temp49-xml_main = `test`.
      CLEAR temp49-s_cursor.
      temp49-s_cursor-id = 'id_text2'.
      temp49-s_cursor-cursorpos = '5'.
      temp49-s_cursor-selectionstart = '5'.
      temp49-s_cursor-selectionend = '10'.
      DATA temp26 TYPE z2ui5_if_client=>ty_t_name_value.
      CLEAR temp26.
      DATA temp27 LIKE LINE OF temp26.
      temp27-name = 'id_page'.
      temp27-value = '99999'.
      INSERT temp27 INTO TABLE temp26.
      temp27-name = 'id_text3'.
      temp27-value = '99999'.
      INSERT temp27 INTO TABLE temp26.
      temp49-t_scroll = temp26.
      client->set_next( temp49 ).

    ENDIF.

    IF sv_state = 'TEST_NAVIGATE'.
      DATA lo_app TYPE REF TO ltcl_unit_02_app_start.
      CREATE OBJECT lo_app TYPE ltcl_unit_02_app_start.
      sv_state = 'LEAVE_APP'.
      client->nav_app_call( lo_app ).
      RETURN.
    ENDIF.

    IF sv_state = 'LEAVE_APP'.
      CLEAR sv_state.
      client->nav_app_leave( client->get_app( client->get( )-id_prev_app ) ).
    ENDIF.

  ENDMETHOD.

  METHOD test_xml_view.

    DATA temp50 LIKE z2ui5_cl_http_handler=>client.
    CLEAR temp50.
    DATA temp28 TYPE z2ui5_if_client=>ty_t_name_value.
    CLEAR temp28.
    DATA temp29 LIKE LINE OF temp28.
    temp29-name = '~path_info'.
    temp29-value = 'LTCL_UNIT_02_APP_START'.
    INSERT temp29 INTO TABLE temp28.
    temp50-t_header = temp28.
    z2ui5_cl_http_handler=>client = temp50.

    sv_state = ``.
    DATA lv_response TYPE string.
    lv_response = z2ui5_cl_http_handler=>http_post(  ).

    DATA lo_data TYPE REF TO data.
    /ui2/cl_json=>deserialize(
      EXPORTING
         json            = lv_response
      CHANGING
        data             = lo_data ).

    FIELD-SYMBOLS <val> TYPE any.
    UNASSIGN <val>.
    DATA lv_assign TYPE string.
    lv_assign = `PARAMS->XML_MAIN->*`.
    ASSIGN lo_data->(lv_assign) TO <val>.
    <val> = shift_left( <val> ).
    IF <val>(9) <> `<mvc:View`.
      cl_abap_unit_assert=>fail( msg = 'xml view - intital view wrong' quit = 5 ).
    ENDIF.

  ENDMETHOD.

  METHOD test_id.

    DATA temp51 LIKE z2ui5_cl_http_handler=>client.
    CLEAR temp51.
    DATA temp30 TYPE z2ui5_if_client=>ty_t_name_value.
    CLEAR temp30.
    DATA temp31 LIKE LINE OF temp30.
    temp31-name = '~path_info'.
    temp31-value = 'LTCL_UNIT_02_APP_START'.
    INSERT temp31 INTO TABLE temp30.
    temp51-t_header = temp30.
    z2ui5_cl_http_handler=>client = temp51.

    sv_state = ``.
    DATA lv_response TYPE string.
    lv_response = z2ui5_cl_http_handler=>http_post(  ).

    DATA lo_data TYPE REF TO data.
    /ui2/cl_json=>deserialize(
      EXPORTING
         json            = lv_response
      CHANGING
        data             = lo_data ).

    FIELD-SYMBOLS <val> TYPE any.
    UNASSIGN <val>.
    DATA lv_assign TYPE string.
    lv_assign = `ID->*`.
    ASSIGN lo_data->(lv_assign) TO <val>.
    IF <val> IS INITIAL.
      cl_abap_unit_assert=>fail( msg = 'id - initial value is initial' quit = 5 ).
    ENDIF.

  ENDMETHOD.

  METHOD test_bind_one_way.

    DATA temp52 LIKE z2ui5_cl_http_handler=>client.
    CLEAR temp52.
    DATA temp32 TYPE z2ui5_if_client=>ty_t_name_value.
    CLEAR temp32.
    DATA temp33 LIKE LINE OF temp32.
    temp33-name = '~path_info'.
    temp33-value = 'LTCL_UNIT_02_APP_START'.
    INSERT temp33 INTO TABLE temp32.
    temp52-t_header = temp32.
    z2ui5_cl_http_handler=>client = temp52.

    sv_state = `TEST_ONE_WAY`.
    DATA lv_response TYPE string.
    lv_response = z2ui5_cl_http_handler=>http_post(  ).

    DATA lo_data TYPE REF TO data.
    /ui2/cl_json=>deserialize(
      EXPORTING
         json            = lv_response
      CHANGING
        data             = lo_data ).

    FIELD-SYMBOLS <val> TYPE any.
    UNASSIGN <val>.
    DATA lv_assign TYPE string.
    lv_assign = `OVIEWMODEL->OVIEWMODEL->QUANTITY->*`.
    ASSIGN lo_data->(lv_assign) TO <val>.
    IF <val> <> `500`.
      cl_abap_unit_assert=>fail( msg = 'data binding - initial set oUpdate wrong' quit = 5 ).
    ENDIF.

  ENDMETHOD.

  METHOD test_bind_two_way.

    DATA temp53 LIKE z2ui5_cl_http_handler=>client.
    CLEAR temp53.
    DATA temp34 TYPE z2ui5_if_client=>ty_t_name_value.
    CLEAR temp34.
    DATA temp35 LIKE LINE OF temp34.
    temp35-name = '~path_info'.
    temp35-value = 'LTCL_UNIT_02_APP_START'.
    INSERT temp35 INTO TABLE temp34.
    temp53-t_header = temp34.
    z2ui5_cl_http_handler=>client = temp53.

    sv_state = ``.
    DATA lv_response TYPE string.
    lv_response = z2ui5_cl_http_handler=>http_post(  ).

    DATA lo_data TYPE REF TO data.
    /ui2/cl_json=>deserialize(
      EXPORTING
         json            = lv_response
      CHANGING
        data             = lo_data ).

    FIELD-SYMBOLS <val> TYPE any.
    UNASSIGN <val>.
    DATA lv_assign TYPE string.
    lv_assign = `OVIEWMODEL->OVIEWMODEL->OUPDATE->QUANTITY->*`.
    ASSIGN lo_data->(lv_assign) TO <val>.
    IF <val> <> `500`.
      cl_abap_unit_assert=>fail( msg = 'data binding - initial set oUpdate wrong' quit = 5 ).
    ENDIF.

  ENDMETHOD.

  METHOD test_message_box.

    DATA temp54 LIKE z2ui5_cl_http_handler=>client.
    CLEAR temp54.
    DATA temp36 TYPE z2ui5_if_client=>ty_t_name_value.
    CLEAR temp36.
    DATA temp37 LIKE LINE OF temp36.
    temp37-name = '~path_info'.
    temp37-value = 'LTCL_UNIT_02_APP_START'.
    INSERT temp37 INTO TABLE temp36.
    temp54-t_header = temp36.
    z2ui5_cl_http_handler=>client = temp54.

    sv_state = `TEST_MESSAGE_BOX`.
    DATA lv_response TYPE string.
    lv_response = z2ui5_cl_http_handler=>http_post(  ).

    DATA lo_data TYPE REF TO data.
    /ui2/cl_json=>deserialize(
      EXPORTING
         json            = lv_response
      CHANGING
        data             = lo_data ).

    FIELD-SYMBOLS <val> TYPE any.

    UNASSIGN <val>.
    DATA lv_assign TYPE string.
    lv_assign = `S_MSG->CONTROL->*`.
    ASSIGN lo_data->(lv_assign) TO <val>.
    IF <val> <> `MessageBox`.
      cl_abap_unit_assert=>fail( msg = 'message box - control wrong' quit = 5 ).
    ENDIF.

    UNASSIGN <val>.
    lv_assign = `S_MSG->TEXT->*`.
    ASSIGN lo_data->(lv_assign) TO <val>.
    IF <val> <> `test message box`.
      cl_abap_unit_assert=>fail( msg = 'message box - text wrong' quit = 5 ).
    ENDIF.

    UNASSIGN <val>.
    lv_assign = `S_MSG->TYPE->*`.
    ASSIGN lo_data->(lv_assign) TO <val>.
    IF <val> <> `information`.
      cl_abap_unit_assert=>fail( msg = 'message box - type wrong' quit = 5 ).
    ENDIF.

  ENDMETHOD.

  METHOD test_message_toast.

    DATA temp55 LIKE z2ui5_cl_http_handler=>client.
    CLEAR temp55.
    DATA temp38 TYPE z2ui5_if_client=>ty_t_name_value.
    CLEAR temp38.
    DATA temp39 LIKE LINE OF temp38.
    temp39-name = '~path_info'.
    temp39-value = 'LTCL_UNIT_02_APP_START'.
    INSERT temp39 INTO TABLE temp38.
    temp55-t_header = temp38.
    z2ui5_cl_http_handler=>client = temp55.

    sv_state = `TEST_MESSAGE_TOAST`.
    DATA lv_response TYPE string.
    lv_response = z2ui5_cl_http_handler=>http_post(  ).

    DATA lo_data TYPE REF TO data.
    /ui2/cl_json=>deserialize(
      EXPORTING
         json            = lv_response
      CHANGING
        data             = lo_data ).

    FIELD-SYMBOLS <val> TYPE any.

    UNASSIGN <val>.
    DATA lv_assign TYPE string.
    lv_assign = `S_MSG->CONTROL->*`.
    ASSIGN lo_data->(lv_assign) TO <val>.
    IF <val> <> `MessageToast`.
      cl_abap_unit_assert=>fail( msg = 'message toast - control wrong' quit = 5 ).
    ENDIF.

    UNASSIGN <val>.
    lv_assign = `S_MSG->TEXT->*`.
    ASSIGN lo_data->(lv_assign) TO <val>.
    IF <val> <> `test message toast`.
      cl_abap_unit_assert=>fail( msg = 'message toast - text wrong' quit = 5 ).
    ENDIF.

    UNASSIGN <val>.
    lv_assign = `S_MSG->TYPE->*`.
    ASSIGN lo_data->(lv_assign) TO <val>.
    IF <val> <> `show`.
      cl_abap_unit_assert=>fail( msg = 'message toast - type wrong' quit = 5 ).
    ENDIF.

  ENDMETHOD.

  METHOD test_timer.

    DATA temp56 LIKE z2ui5_cl_http_handler=>client.
    CLEAR temp56.
    DATA temp40 TYPE z2ui5_if_client=>ty_t_name_value.
    CLEAR temp40.
    DATA temp41 LIKE LINE OF temp40.
    temp41-name = '~path_info'.
    temp41-value = 'LTCL_UNIT_02_APP_START'.
    INSERT temp41 INTO TABLE temp40.
    temp56-t_header = temp40.
    z2ui5_cl_http_handler=>client = temp56.

    sv_state = `TEST_TIMER`.
    DATA lv_response TYPE string.
    lv_response = z2ui5_cl_http_handler=>http_post(  ).

    DATA lo_data TYPE REF TO data.
    /ui2/cl_json=>deserialize(
      EXPORTING
         json            = lv_response
      CHANGING
        data             = lo_data ).

    FIELD-SYMBOLS <val> TYPE any.

    UNASSIGN <val>.
    DATA lv_assign TYPE string.
    lv_assign = `PARAMS->S_TIMER->EVENT_FINISHED->*`.
    ASSIGN lo_data->(lv_assign) TO <val>.
    IF <val> <> `TIMER_FINISHED`.
      cl_abap_unit_assert=>fail( msg = 'timer - event wrong' quit = 5 ).
    ENDIF.

    UNASSIGN <val>.
    lv_assign = `PARAMS->S_TIMER->INTERVAL_MS->*`.
    ASSIGN lo_data->(lv_assign) TO <val>.
    IF <val> <> `500`.
      cl_abap_unit_assert=>fail( msg = 'timer - ms wrong' quit = 5 ).
    ENDIF.

  ENDMETHOD.

  METHOD test_xml_popup.

    DATA temp57 LIKE z2ui5_cl_http_handler=>client.
    CLEAR temp57.
    DATA temp42 TYPE z2ui5_if_client=>ty_t_name_value.
    CLEAR temp42.
    DATA temp43 LIKE LINE OF temp42.
    temp43-name = '~path_info'.
    temp43-value = 'LTCL_UNIT_02_APP_START'.
    INSERT temp43 INTO TABLE temp42.
    temp57-t_header = temp42.
    z2ui5_cl_http_handler=>client = temp57.

    sv_state = `TEST_POPUP`.
    DATA lv_response TYPE string.
    lv_response = z2ui5_cl_http_handler=>http_post(  ).

    DATA lo_data TYPE REF TO data.
    /ui2/cl_json=>deserialize(
      EXPORTING
         json            = lv_response
      CHANGING
        data             = lo_data ).

    FIELD-SYMBOLS <val> TYPE any.
    UNASSIGN <val>.
    DATA lv_assign TYPE string.
    lv_assign = `PARAMS->XML_POPUP->*`.
    ASSIGN lo_data->(lv_assign) TO <val>.
    <val> = shift_left( <val> ).
    IF <val>(9) <> `<mvc:View`.
      cl_abap_unit_assert=>fail( msg = 'xml popup - intital popup wrong' quit = 5 ).
    ENDIF.

  ENDMETHOD.

  METHOD test_landing_page.

    DATA temp58 LIKE z2ui5_cl_http_handler=>client.
    CLEAR temp58.
    DATA temp44 TYPE z2ui5_if_client=>ty_t_name_value.
    CLEAR temp44.
    DATA temp45 LIKE LINE OF temp44.
    temp45-name = 'referer'.
    temp45-value = 'dummy'.
    INSERT temp45 INTO TABLE temp44.
    temp58-t_header = temp44.
    z2ui5_cl_http_handler=>client = temp58.

    DATA lv_response TYPE string.
    lv_response = z2ui5_cl_http_handler=>http_post(  ).

    DATA lo_data TYPE REF TO data.
    /ui2/cl_json=>deserialize(
      EXPORTING
         json            = lv_response
      CHANGING
        data             = lo_data ).

    FIELD-SYMBOLS <val> TYPE any.
    UNASSIGN <val>.
    DATA lv_assign TYPE string.
    lv_assign = `PARAMS->XML_MAIN->*`.
    ASSIGN lo_data->(lv_assign) TO <val>.
    <val> = shift_left( <val> ).
    IF <val> NS `Step 4`.
      cl_abap_unit_assert=>fail( msg = 'landing page - not started when no app' quit = 5 ).
    ENDIF.

  ENDMETHOD.

  METHOD test_scroll_cursor.

    DATA temp59 LIKE z2ui5_cl_http_handler=>client.
    CLEAR temp59.
    DATA temp46 TYPE z2ui5_if_client=>ty_t_name_value.
    CLEAR temp46.
    DATA temp47 LIKE LINE OF temp46.
    temp47-name = '~path_info'.
    temp47-value = 'LTCL_UNIT_02_APP_START'.
    INSERT temp47 INTO TABLE temp46.
    temp59-t_header = temp46.
    z2ui5_cl_http_handler=>client = temp59.

    sv_state = `TEST_SCROLL_CURSOR`.
    DATA lv_response TYPE string.
    lv_response = z2ui5_cl_http_handler=>http_post(  ).

    DATA lo_data TYPE REF TO data.
    /ui2/cl_json=>deserialize(
      EXPORTING
         json            = lv_response
      CHANGING
        data             = lo_data ).

    " FIELD-SYMBOLS <val> TYPE any.

*    UNASSIGN <val>.
*    DATA(lv_assign) = `OMESSAGE->CONTROL->*`.
*    ASSIGN lo_data->(lv_assign) TO <val>.
*    IF <val> <> `MessageBox`.
*      cl_abap_unit_assert=>fail( msg = 'message box - control wrong' quit = 5 ).
*    ENDIF.
*
*    UNASSIGN <val>.
*    lv_assign = `OMESSAGE->TEXT->*`.
*    ASSIGN lo_data->(lv_assign) TO <val>.
*    IF <val> <> `test message box`.
*      cl_abap_unit_assert=>fail( msg = 'message box - text wrong' quit = 5 ).
*    ENDIF.
*
*    UNASSIGN <val>.
*    lv_assign = `OMESSAGE->TYPE->*`.
*    ASSIGN lo_data->(lv_assign) TO <val>.
*    IF <val> <> `information`.
*      cl_abap_unit_assert=>fail( msg = 'message box - type wrong' quit = 5 ).
*    ENDIF.

  ENDMETHOD.

  METHOD test_startup_path.

    DATA temp60 LIKE z2ui5_cl_http_handler=>client.
    CLEAR temp60.
    DATA temp48 TYPE z2ui5_if_client=>ty_t_name_value.
    CLEAR temp48.
    DATA temp49 LIKE LINE OF temp48.
    temp49-name = '~path_info'.
    temp49-value = 'LTCL_UNIT_02_APP_START'.
    INSERT temp49 INTO TABLE temp48.
    temp60-t_header = temp48.
    z2ui5_cl_http_handler=>client = temp60.

    sv_state = `TEST_NAVIGATE`.
    DATA lv_response TYPE string.
    lv_response = z2ui5_cl_http_handler=>http_post(  ).

    DATA lo_data TYPE REF TO data.
    /ui2/cl_json=>deserialize(
      EXPORTING
         json            = lv_response
      CHANGING
        data             = lo_data ).

    "  FIELD-SYMBOLS <val> TYPE any.

  ENDMETHOD.

  METHOD test_navigate.

    DATA temp61 LIKE z2ui5_cl_http_handler=>client.
    CLEAR temp61.
    DATA temp50 TYPE z2ui5_if_client=>ty_t_name_value.
    CLEAR temp50.
    DATA temp51 LIKE LINE OF temp50.
    temp51-name = '~path_info'.
    temp51-value = 'LTCL_UNIT_02_APP_START'.
    INSERT temp51 INTO TABLE temp50.
    temp61-t_header = temp50.
    z2ui5_cl_http_handler=>client = temp61.

    sv_state = `TEST_NAVIGATE`.
    DATA lv_response TYPE string.
    lv_response = z2ui5_cl_http_handler=>http_post(  ).

    DATA lo_data TYPE REF TO data.
    /ui2/cl_json=>deserialize(
      EXPORTING
         json            = lv_response
      CHANGING
        data             = lo_data ).

    "  FIELD-SYMBOLS <val> TYPE any.

  ENDMETHOD.

ENDCLASS.

CLASS ltcl_unit_03_app_ajax DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PUBLIC SECTION.

    INTERFACES z2ui5_if_app.

    DATA product  TYPE string.
    DATA quantity TYPE string.
    DATA check_initialized TYPE abap_bool.
    CLASS-DATA sv_state TYPE string.
  PRIVATE SECTION.
    METHODS test_app_change_value FOR TESTING RAISING cx_static_check.
    METHODS test_app_event        FOR TESTING RAISING cx_static_check.
    METHODS test_app_dump         FOR TESTING RAISING cx_static_check.

ENDCLASS.

CLASS ltcl_unit_03_app_ajax IMPLEMENTATION.

  METHOD z2ui5_if_app~main.

    IF check_initialized = abap_false.
      check_initialized = abap_true.
      product  = 'tomato'.
      quantity = '500'.

    ENDIF.

    CASE client->get( )-event.
      WHEN 'BUTTON_POST'.
        client->popup_message_toast( |{ product } { quantity } - send to the server| ).
      WHEN 'BACK'.
        client->nav_app_leave( client->get_app( client->get( )-id_prev_app_stack  ) ).
    ENDCASE.

    IF sv_state = 'ERROR'.
      z2ui5_lcl_utility=>raise( `exception test` ).
    ENDIF.

    DATA temp62 TYPE z2ui5_if_client=>ty_s_next.
    CLEAR temp62.
    temp62-xml_main = z2ui5_cl_xml_view=>factory( )->shell( )->page( title = 'abap2UI5 - First Example' navbuttonpress = client->_event( 'BACK' ) shownavbutton = abap_true )->simple_form( title = 'Form Title' editable = abap_true )->content( 'form' )->title( 'Input' )->label( 'quantity' )->input( client->_bind( quantity ) )->label( 'product' )->input( value = product enabled = abap_false )->button( text = 'post' press = client->_event( 'BUTTON_POST' ) )->get_root( )->xml_get( ).
    client->set_next( temp62 ).

  ENDMETHOD.

  METHOD test_app_change_value.

    DATA temp63 LIKE z2ui5_cl_http_handler=>client.
    CLEAR temp63.
    DATA temp52 TYPE z2ui5_if_client=>ty_t_name_value.
    CLEAR temp52.
    DATA temp53 LIKE LINE OF temp52.
    temp53-name = '~path_info'.
    temp53-value = 'LTCL_UNIT_02_APP_START'.
    INSERT temp53 INTO TABLE temp52.
    temp63-t_header = temp52.
    z2ui5_cl_http_handler=>client = temp63.

    DATA lv_response TYPE string.
    lv_response = z2ui5_cl_http_handler=>http_post(  ).

    DATA lo_data TYPE REF TO data.
    /ui2/cl_json=>deserialize(
      EXPORTING
         json            = lv_response
      CHANGING
        data             = lo_data ).

    FIELD-SYMBOLS <val> TYPE any.

    UNASSIGN <val>.
    DATA lv_assign TYPE string.
    lv_assign = `ID->*`.
    ASSIGN lo_data->(lv_assign) TO <val>.
    IF <val> IS INITIAL.
      cl_abap_unit_assert=>fail( msg = 'id - initial value is initial' quit = 5 ).
    ENDIF.
    DATA temp64 TYPE string.
    temp64 = <val>.
    DATA lv_id LIKE temp64.
    lv_id = temp64.

    DATA lv_request TYPE string.
    lv_request = `{"oUpdate":{"QUANTITY":"600"},"ID": "` && lv_id && `" ,"oEvent":{"EVENT":"BUTTON_POST","METHOD":"UPDATE"}}`.
    DATA temp65 LIKE z2ui5_cl_http_handler=>client.
    CLEAR temp65.
    temp65-body = lv_request.
    z2ui5_cl_http_handler=>client = temp65.
    lv_response = z2ui5_cl_http_handler=>http_post(  ).

    CLEAR lo_data.
    /ui2/cl_json=>deserialize(
      EXPORTING
         json            = lv_response
      CHANGING
        data             = lo_data ).

    UNASSIGN <val>.
    lv_assign = `OVIEWMODEL->OVIEWMODEL->OUPDATE->QUANTITY->*`.
    ASSIGN lo_data->(lv_assign) TO <val>.
    IF <val> <> `600`.
      cl_abap_unit_assert=>fail( msg = 'data binding - frontend updated value wrong after roundtrip' quit = 5 ).
    ENDIF.

  ENDMETHOD.

  METHOD test_app_event.

    DATA temp66 LIKE z2ui5_cl_http_handler=>client.
    CLEAR temp66.
    DATA temp54 TYPE z2ui5_if_client=>ty_t_name_value.
    CLEAR temp54.
    DATA temp55 LIKE LINE OF temp54.
    temp55-name = '~path_info'.
    temp55-value = 'LTCL_UNIT_02_APP_START'.
    INSERT temp55 INTO TABLE temp54.
    temp66-t_header = temp54.
    z2ui5_cl_http_handler=>client = temp66.

    DATA lv_response TYPE string.
    lv_response = z2ui5_cl_http_handler=>http_post(  ).

    DATA lo_data TYPE REF TO data.
    /ui2/cl_json=>deserialize(
      EXPORTING
         json            = lv_response
      CHANGING
        data             = lo_data ).

    FIELD-SYMBOLS <val> TYPE any.

    UNASSIGN <val>.
    DATA lv_assign TYPE string.
    lv_assign = `ID->*`.
    ASSIGN lo_data->(lv_assign) TO <val>.
    IF <val> IS INITIAL.
      cl_abap_unit_assert=>fail( msg = 'id - initial value is initial' quit = 5 ).
    ENDIF.
    DATA temp67 TYPE string.
    temp67 = <val>.
    DATA lv_id LIKE temp67.
    lv_id = temp67.

    DATA lv_request TYPE string.
    lv_request = `{"oUpdate":{"QUANTITY":"700"},"ID": "` && lv_id && `" ,"oEvent":{"EVENT":"BUTTON_POST","METHOD":"UPDATE"}}`.
    DATA temp68 LIKE z2ui5_cl_http_handler=>client.
    CLEAR temp68.
    temp68-body = lv_request.
    z2ui5_cl_http_handler=>client = temp68.
    lv_response = z2ui5_cl_http_handler=>http_post(  ).

    CLEAR lo_data.
    /ui2/cl_json=>deserialize(
      EXPORTING
         json            = lv_response
      CHANGING
        data             = lo_data ).

    UNASSIGN <val>.
    lv_assign = `S_MSG->TEXT->*`.
    ASSIGN lo_data->(lv_assign) TO <val>.
    IF <val> <> `tomato 700 - send to the server`.
      cl_abap_unit_assert=>fail( msg = 'message toast - text wrong' quit = 5 ).
    ENDIF.

  ENDMETHOD.

  METHOD test_app_dump.

    DATA temp69 LIKE z2ui5_cl_http_handler=>client.
    CLEAR temp69.
    DATA temp56 TYPE z2ui5_if_client=>ty_t_name_value.
    CLEAR temp56.
    DATA temp57 LIKE LINE OF temp56.
    temp57-name = '~path_info'.
    temp57-value = 'LTCL_UNIT_03_APP_AJAX'.
    INSERT temp57 INTO TABLE temp56.
    temp69-t_header = temp56.
    z2ui5_cl_http_handler=>client = temp69.

    sv_state = `ERROR`.
    DATA lv_response TYPE string.
    lv_response = z2ui5_cl_http_handler=>http_post(  ).

    DATA lo_data TYPE REF TO data.
    /ui2/cl_json=>deserialize(
      EXPORTING
         json            = lv_response
      CHANGING
        data             = lo_data ).

    FIELD-SYMBOLS <val> TYPE any.
    UNASSIGN <val>.
    DATA lv_assign TYPE string.
    lv_assign = `PARAMS->XML_MAIN->*`.
    ASSIGN lo_data->(lv_assign) TO <val>.
    <val> = shift_left( <val> ).
    IF <val> NS `MessagePage`.
      cl_abap_unit_assert=>fail( msg = 'system app error - not shown by exception' quit = 5 ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.

CLASS ltcl_unit_04_deep_data IMPLEMENTATION.


  METHOD z2ui5_if_app~main.

    IF check_initialized = abap_false.
      check_initialized = abap_true.

      DATA temp70 LIKE t_tab.
      CLEAR temp70.
      DATA temp71 LIKE LINE OF temp70.
      temp71-title = 'Peter'.
      temp71-info = 'completed'.
      temp71-descr = 'this is a description'.
      temp71-icon = 'sap-icon://account'.
      INSERT temp71 INTO TABLE temp70.
      temp71-title = 'Peter'.
      temp71-info = 'incompleted'.
      temp71-descr = 'this is a description'.
      temp71-icon = 'sap-icon://account'.
      INSERT temp71 INTO TABLE temp70.
      t_tab = temp70.

    ENDIF.

    CASE sv_status.

      WHEN `CHANGE`.
        DATA temp72 TYPE z2ui5_if_client=>ty_s_next.
        CLEAR temp72.
        temp72-xml_main = z2ui5_cl_xml_view=>factory( )->shell( )->page( title = 'abap2UI5 - First Example' navbuttonpress = client->_event( 'BACK' ) shownavbutton = abap_true )->list( headertext = 'List Ouput' items = client->_bind( t_tab ) mode = `SingleSelectMaster` selectionchange = client->_event( 'SELCHANGE' ) )->standard_list_item( title = '{TITLE}' description = '{DESCR}' icon = '{ICON}' info = '{INFO}' press = client->_event( 'TEST' ) type = `Navigation` selected = `{SELECTED}` )->get_root( )->xml_get( ).
        client->set_next( temp72 ).

      WHEN OTHERS.
        DATA temp73 TYPE z2ui5_if_client=>ty_s_next.
        CLEAR temp73.
        temp73-xml_main = z2ui5_cl_xml_view=>factory( )->shell( )->page( title = 'abap2UI5 - First Example' navbuttonpress = client->_event( 'BACK' ) shownavbutton = abap_true )->list( headertext = 'List Ouput' items = client->_bind_one( t_tab ) mode = `SingleSelectMaster` selectionchange = client->_event( 'SELCHANGE' ) )->standard_list_item( title = '{TITLE}' description = '{DESCR}' icon = '{ICON}' info = '{INFO}' press = client->_event( 'TEST' ) type = `Navigation` selected = `{SELECTED}` )->get_root( )->xml_get( ).
        client->set_next( temp73 ).

    ENDCASE.
  ENDMETHOD.

  METHOD test_app_deep_data.

    DATA temp74 LIKE z2ui5_cl_http_handler=>client.
    CLEAR temp74.
    DATA temp58 TYPE z2ui5_if_client=>ty_t_name_value.
    CLEAR temp58.
    DATA temp59 LIKE LINE OF temp58.
    temp59-name = '~path_info'.
    temp59-value = 'LTCL_UNIT_04_DEEP_DATA'.
    INSERT temp59 INTO TABLE temp58.
    temp74-t_header = temp58.
    z2ui5_cl_http_handler=>client = temp74.

    DATA lv_response TYPE string.
    lv_response = z2ui5_cl_http_handler=>http_post(  ).

    DATA lo_data TYPE REF TO data.
    /ui2/cl_json=>deserialize(
      EXPORTING
         json            = lv_response
      CHANGING
        data             = lo_data ).

    FIELD-SYMBOLS <val> TYPE any.

    UNASSIGN <val>.
    FIELD-SYMBOLS <tab> TYPE STANDARD TABLE.
    FIELD-SYMBOLS <row> TYPE REF TO data.
    DATA lv_assign TYPE string.
    lv_assign = `OVIEWMODEL->OVIEWMODEL->T_TAB->*`.
    ASSIGN lo_data->(lv_assign) TO <tab>.
    READ TABLE <tab> INDEX 1 ASSIGNING <row>.

    DATA ls_tab_test TYPE ty_row.
    CLEAR ls_tab_test.
    ls_tab_test-title = 'Peter'.
    ls_tab_test-info = 'completed'.
    ls_tab_test-descr = 'this is a description'.
    ls_tab_test-icon = 'sap-icon://account'.

    lv_assign = `TITLE->*`.
    ASSIGN <row>->(lv_assign) TO <val>.
    IF <val> <> ls_tab_test-title.
      cl_abap_unit_assert=>fail( msg = 'data binding - initial tab data wrong' quit = 5 ).
    ENDIF.

    lv_assign = `INFO->*`.
    ASSIGN <row>->(lv_assign) TO <val>.
    IF <val> <> ls_tab_test-info.
      cl_abap_unit_assert=>fail( msg = 'data binding - initial tab data wrong' quit = 5 ).
    ENDIF.

    lv_assign = `DESCR->*`.
    ASSIGN <row>->(lv_assign) TO <val>.
    IF <val> <> ls_tab_test-descr.
      cl_abap_unit_assert=>fail( msg = 'data binding - initial tab data wrong' quit = 5 ).
    ENDIF.

  ENDMETHOD.

  METHOD test_app_deep_data_change.

    DATA temp75 LIKE z2ui5_cl_http_handler=>client.
    CLEAR temp75.
    DATA temp60 TYPE z2ui5_if_client=>ty_t_name_value.
    CLEAR temp60.
    DATA temp61 LIKE LINE OF temp60.
    temp61-name = '~path_info'.
    temp61-value = 'LTCL_UNIT_04_DEEP_DATA'.
    INSERT temp61 INTO TABLE temp60.
    temp75-t_header = temp60.
    z2ui5_cl_http_handler=>client = temp75.

    sv_status = 'CHANGE'.
    DATA lv_response TYPE string.
    lv_response = z2ui5_cl_http_handler=>http_post(  ).

    DATA lo_data TYPE REF TO data.
    /ui2/cl_json=>deserialize(
      EXPORTING
         json            = lv_response
      CHANGING
        data             = lo_data ).

    FIELD-SYMBOLS <val> TYPE any.

    UNASSIGN <val>.
    FIELD-SYMBOLS <tab> TYPE STANDARD TABLE.
    FIELD-SYMBOLS <row> TYPE REF TO data.
    DATA lv_assign TYPE string.
    lv_assign = `OVIEWMODEL->OVIEWMODEL->OUPDATE->T_TAB->*`.
    ASSIGN lo_data->(lv_assign) TO <tab>.
    READ TABLE <tab> INDEX 1 ASSIGNING <row>.

    DATA ls_tab_test TYPE ty_row.
    CLEAR ls_tab_test.
    ls_tab_test-title = 'Peter'.
    ls_tab_test-info = 'completed'.
    ls_tab_test-descr = 'this is a description'.
    ls_tab_test-icon = 'sap-icon://account'.

    lv_assign = `TITLE->*`.
    ASSIGN <row>->(lv_assign) TO <val>.
    IF <val> <> ls_tab_test-title.
      cl_abap_unit_assert=>fail( msg = 'data binding - initial tab data wrong' quit = 5 ).
    ENDIF.

    lv_assign = `INFO->*`.
    ASSIGN <row>->(lv_assign) TO <val>.
    IF <val> <> ls_tab_test-info.
      cl_abap_unit_assert=>fail( msg = 'data binding - initial tab data wrong' quit = 5 ).
    ENDIF.

    lv_assign = `DESCR->*`.
    ASSIGN <row>->(lv_assign) TO <val>.
    IF <val> <> ls_tab_test-descr.
      cl_abap_unit_assert=>fail( msg = 'data binding - initial tab data wrong' quit = 5 ).
    ENDIF.

    UNASSIGN <val>.
    lv_assign = `ID->*`.
    ASSIGN lo_data->(lv_assign) TO <val>.
    IF <val> IS INITIAL.
      cl_abap_unit_assert=>fail( msg = 'id - initial value is initial' quit = 5 ).
    ENDIF.
    DATA temp76 TYPE string.
    temp76 = <val>.
    DATA lv_id LIKE temp76.
    lv_id = temp76.

    DATA lv_tab TYPE string.
    lv_tab = z2ui5_lcl_utility=>trans_any_2_json( t_tab ).

    DATA lv_request TYPE string.
    lv_request = `{"oUpdate":{"QUANTITY":"600", "T_TAB":`  && lv_tab && `},"oSystem":{"ID": "` && lv_id && `"` &&  `,"CHECK_DEBUG_ACTIVE":true},"oEvent":{"EVENT":"BUTTON_POST","METHOD":"UPDATE"}}`.
    DATA temp77 LIKE z2ui5_cl_http_handler=>client.
    CLEAR temp77.
    temp77-body = lv_request.
    z2ui5_cl_http_handler=>client = temp77.
    lv_response = z2ui5_cl_http_handler=>http_post(  ).

    CLEAR lo_data.
    /ui2/cl_json=>deserialize(
      EXPORTING
         json            = lv_response
      CHANGING
        data             = lo_data ).

  ENDMETHOD.

ENDCLASS.
