CLASS z2ui5_cl_xml_view DEFINITION
  PUBLIC
  FINAL
  CREATE PROTECTED.

  PUBLIC SECTION.
    TYPES:
      BEGIN OF ty_s_name_value,
        n TYPE string,
        v TYPE string,
      END OF ty_s_name_value.
    TYPES ty_t_name_value TYPE STANDARD TABLE OF ty_s_name_value WITH DEFAULT KEY.

    DATA m_name   TYPE string.
    DATA m_ns     TYPE string.
    DATA mt_prop  TYPE ty_t_name_value.

    DATA m_root   TYPE REF TO z2ui5_cl_xml_view.
    DATA m_last   TYPE REF TO z2ui5_cl_xml_view.
    DATA m_parent TYPE REF TO z2ui5_cl_xml_view.
    DATA t_child  TYPE STANDARD TABLE OF REF TO z2ui5_cl_xml_view WITH DEFAULT KEY.

    CLASS-METHODS factory
      IMPORTING t_ns          TYPE ty_t_name_value OPTIONAL
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    CLASS-METHODS factory_popup
      IMPORTING t_ns          TYPE ty_t_name_value OPTIONAL
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    CLASS-METHODS hlp_get_source_code_url
      IMPORTING
        app           TYPE REF TO z2ui5_if_app
      RETURNING
        VALUE(result) TYPE string.

    CLASS-METHODS hlp_replace_controller_name
      IMPORTING xml           TYPE string
      RETURNING VALUE(result) TYPE string.

    METHODS constructor.

    METHODS horizontal_layout
      IMPORTING class         TYPE clike OPTIONAL
                width         TYPE clike OPTIONAL
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS Dynamic_Page
      IMPORTING headerExpanded           TYPE clike OPTIONAL
                showFooter               TYPE clike OPTIONAL
                headerPinned             TYPE clike OPTIONAL
                toggleHeaderOnTitleClick TYPE clike OPTIONAL
      RETURNING VALUE(result)            TYPE REF TO z2ui5_cl_xml_view.

    METHODS Dynamic_Page_Title
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS Dynamic_Page_Header
      IMPORTING pinnable      TYPE clike OPTIONAL
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS Illustrated_Message
      IMPORTING enableVerticalResponsiveness TYPE clike OPTIONAL
                illustrationType             TYPE clike OPTIONAL
      RETURNING VALUE(result)                TYPE REF TO z2ui5_cl_xml_view.

    METHODS additional_Content
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS flex_box
      IMPORTING class          TYPE clike OPTIONAL
                rendertype     TYPE clike OPTIONAL
                width          TYPE clike OPTIONAL
                fitContainer   TYPE clike OPTIONAL
                height         TYPE clike OPTIONAL
                alignitems     TYPE clike OPTIONAL
                justifycontent TYPE clike OPTIONAL
                wrap           TYPE clike OPTIONAL
      RETURNING VALUE(result)  TYPE REF TO z2ui5_cl_xml_view.

    METHODS popover
      IMPORTING title         TYPE clike OPTIONAL
                class         TYPE clike OPTIONAL
                placement     TYPE clike OPTIONAL
                initialFocus  TYPE clike OPTIONAL
                contentwidth  TYPE clike OPTIONAL
                contentheight TYPE clike OPTIONAL
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS list_item
      IMPORTING text           TYPE clike OPTIONAL
                additionaltext TYPE clike OPTIONAL
      RETURNING VALUE(result)  TYPE REF TO z2ui5_cl_xml_view.

    METHODS table
      IMPORTING items               TYPE clike OPTIONAL
                growing             TYPE clike OPTIONAL
                growingthreshold    TYPE clike OPTIONAL
                growingscrolltoload TYPE clike OPTIONAL
                headertext          TYPE clike OPTIONAL
                sticky              TYPE clike OPTIONAL
                mode                TYPE clike OPTIONAL
                width               TYPE clike OPTIONAL
                selectionchange     TYPE clike OPTIONAL
                alternateRowColors  TYPE clike OPTIONAL
                autoPopinMode       TYPE clike OPTIONAL
                  PREFERRED PARAMETER items
      RETURNING VALUE(result)       TYPE REF TO z2ui5_cl_xml_view.

    METHODS message_strip
      IMPORTING text          TYPE clike OPTIONAL
                type          TYPE clike OPTIONAL
                showicon      TYPE clike OPTIONAL
                class         TYPE clike OPTIONAL
                  PREFERRED PARAMETER text
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS footer
      IMPORTING ns            TYPE string OPTIONAL
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS message_page
      IMPORTING show_header         TYPE clike OPTIONAL
                text                TYPE clike OPTIONAL
                enableformattedtext TYPE clike OPTIONAL
                description         TYPE clike OPTIONAL
                icon                TYPE clike OPTIONAL
      RETURNING VALUE(result)       TYPE REF TO z2ui5_cl_xml_view.

    METHODS object_page_layout
      IMPORTING showTitleInHeaderContent TYPE clike OPTIONAL
                showEditHeaderButton     TYPE clike OPTIONAL
                editHeaderButtonPress    TYPE clike OPTIONAL
                upperCaseAnchorBar       TYPE clike OPTIONAL
      RETURNING VALUE(result)            TYPE REF TO z2ui5_cl_xml_view.

    METHODS Object_Page_Dyn_Header_Title
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS expanded_heading
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS snapped_heading
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS expanded_content
      IMPORTING ns            TYPE clike
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS snapped_content
      IMPORTING ns            TYPE clike
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS heading
      IMPORTING ns            TYPE clike
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS actions
      IMPORTING ns            TYPE clike
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS snapped_Title_On_Mobile
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS header
      IMPORTING ns            TYPE clike DEFAULT `f`
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS navigation_actions
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS avatar
      IMPORTING src           TYPE clike OPTIONAL
                class         TYPE clike OPTIONAL
                displaysize   TYPE clike OPTIONAL
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS header_title
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS sections
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS Object_Page_Section
      IMPORTING titleUppercase TYPE clike OPTIONAL
                title          TYPE clike OPTIONAL
                importance     TYPE clike OPTIONAL
                id             TYPE clike OPTIONAL
      RETURNING VALUE(result)  TYPE REF TO z2ui5_cl_xml_view.

    METHODS sub_sections
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS Object_page_Sub_Section
      IMPORTING id            TYPE clike OPTIONAL
                title         TYPE clike OPTIONAL
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS shell
      IMPORTING ns            TYPE clike OPTIONAL
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS blocks
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS layout_data
      IMPORTING ns            TYPE clike OPTIONAL
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS flex_item_data
      IMPORTING growfactor       TYPE clike OPTIONAL
                basesize         TYPE clike OPTIONAL
                backgrounddesign TYPE clike OPTIONAL
                styleclass       TYPE clike OPTIONAL
      RETURNING VALUE(result)    TYPE REF TO z2ui5_cl_xml_view.

    METHODS code_editor
      IMPORTING value         TYPE clike OPTIONAL
                type          TYPE clike OPTIONAL
                height        TYPE clike OPTIONAL
                width         TYPE clike OPTIONAL
                editable      TYPE clike OPTIONAL
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS suggestion_items
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS vertical_layout
      IMPORTING class         TYPE clike OPTIONAL
                width         TYPE clike OPTIONAL
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS multi_input
      IMPORTING showclearicon    TYPE clike OPTIONAL
                showValueHelp    TYPE clike OPTIONAL
                suggestionitems  TYPE clike OPTIONAL
                tokenUpdate      TYPE clike OPTIONAL
                width            TYPE clike OPTIONAL
                id               TYPE clike OPTIONAL
                value            TYPE clike OPTIONAL
                tokens           TYPE clike OPTIONAL
                submit           TYPE clike OPTIONAL
                valueHelpRequest TYPE clike OPTIONAL
                enabled          TYPE clike OPTIONAL
                class            TYPE clike OPTIONAL
      RETURNING VALUE(result)    TYPE REF TO z2ui5_cl_xml_view.

    METHODS tokens
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS token
      IMPORTING key           TYPE clike OPTIONAL
                text          TYPE clike OPTIONAL
                selected      TYPE clike OPTIONAL
                visible       TYPE clike OPTIONAL
                editable      TYPE clike OPTIONAL
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS input
      IMPORTING id               TYPE clike OPTIONAL
                value            TYPE clike OPTIONAL
                placeholder      TYPE clike OPTIONAL
                type             TYPE clike OPTIONAL
                showclearicon    TYPE clike OPTIONAL
                valuestate       TYPE clike OPTIONAL
                valuestatetext   TYPE clike OPTIONAL
                description      TYPE clike OPTIONAL
                editable         TYPE clike OPTIONAL
                enabled          TYPE clike OPTIONAL
                suggestionitems  TYPE clike OPTIONAL
                showsuggestion   TYPE clike OPTIONAL
                showvaluehelp    TYPE clike OPTIONAL
                valuehelprequest TYPE clike OPTIONAL
                class            TYPE clike OPTIONAL
                visible          TYPE clike OPTIONAL
                submit           TYPE clike OPTIONAL
                  PREFERRED PARAMETER value
      RETURNING VALUE(result)    TYPE REF TO z2ui5_cl_xml_view.

    METHODS dialog
      IMPORTING title         TYPE clike OPTIONAL
                icon          TYPE clike OPTIONAL
                showheader    TYPE clike OPTIONAL
                stretch       TYPE clike OPTIONAL
                contentheight TYPE clike OPTIONAL
                contentwidth  TYPE clike OPTIONAL
                resizable     TYPE clike OPTIONAL
                  PREFERRED PARAMETER title
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS carousel
      IMPORTING
        height        TYPE clike OPTIONAL
        class         TYPE clike OPTIONAL
        loop          TYPE clike OPTIONAL
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS buttons
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS get_root
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS get_parent
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS get
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS get_child
      IMPORTING index         TYPE i DEFAULT 1
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS columns
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS column
      IMPORTING width          TYPE clike OPTIONAL
                minScreenWidth TYPE clike OPTIONAL
                demandPopin    TYPE clike OPTIONAL
                  PREFERRED PARAMETER width
      RETURNING VALUE(result)  TYPE REF TO z2ui5_cl_xml_view.

    METHODS items
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS interact_donut_chart
      IMPORTING selectionchanged  TYPE clike OPTIONAL
                errormessage      TYPE clike OPTIONAL
                errormessagetitle TYPE clike OPTIONAL
                showerror         TYPE clike OPTIONAL
                displayedsegments TYPE clike OPTIONAL
                press             TYPE clike OPTIONAL
      RETURNING VALUE(result)     TYPE REF TO z2ui5_cl_xml_view.

    METHODS segments
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS interact_donut_chart_segment
      IMPORTING label          TYPE clike OPTIONAL
                value          TYPE clike OPTIONAL
                displayedvalue TYPE clike OPTIONAL
                selected       TYPE clike OPTIONAL
      RETURNING VALUE(result)  TYPE REF TO z2ui5_cl_xml_view.

    METHODS interact_bar_chart
      IMPORTING selectionchanged  TYPE clike OPTIONAL
                press             TYPE clike OPTIONAL
                labelwidth        TYPE clike OPTIONAL
                errormessage      TYPE clike OPTIONAL
                errormessagetitle TYPE clike OPTIONAL
                showerror         TYPE clike OPTIONAL
      RETURNING VALUE(result)     TYPE REF TO z2ui5_cl_xml_view.

    METHODS bars
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS interact_bar_chart_bar
      IMPORTING label          TYPE clike OPTIONAL
                value          TYPE clike OPTIONAL
                displayedvalue TYPE clike OPTIONAL
                selected       TYPE clike OPTIONAL
      RETURNING VALUE(result)  TYPE REF TO z2ui5_cl_xml_view.

    METHODS interact_line_chart
      IMPORTING selectionchanged  TYPE clike OPTIONAL
                press             TYPE clike OPTIONAL
                precedingpoint    TYPE clike OPTIONAL
                succeddingpoint   TYPE clike OPTIONAL
                errormessage      TYPE clike OPTIONAL
                errormessagetitle TYPE clike OPTIONAL
                showerror         TYPE clike OPTIONAL
      RETURNING VALUE(result)     TYPE REF TO z2ui5_cl_xml_view.

    METHODS points
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS interact_line_chart_point
      IMPORTING label          TYPE clike OPTIONAL
                value          TYPE clike OPTIONAL
                secondarylabel TYPE clike OPTIONAL
                displayedvalue TYPE clike OPTIONAL
                selected       TYPE clike OPTIONAL
      RETURNING VALUE(result)  TYPE REF TO z2ui5_cl_xml_view.

    METHODS radial_micro_chart
      IMPORTING sice          TYPE clike OPTIONAL
                percentage    TYPE clike OPTIONAL
                press         TYPE clike OPTIONAL
                valuecolor    TYPE clike OPTIONAL
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS column_list_item
      IMPORTING valign        TYPE clike OPTIONAL
                selected      TYPE clike OPTIONAL
                type          TYPE clike OPTIONAL
                press         TYPE clike OPTIONAL
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS cells
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS bar
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS content_left
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS content_middle
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS content_right
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS custom_header
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS header_content
      IMPORTING ns            TYPE clike OPTIONAL
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS sub_header
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS custom_data
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS badge_custom_data
      IMPORTING key           TYPE clike OPTIONAL
                value         TYPE clike OPTIONAL
                visible       TYPE clike OPTIONAL
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS toggle_button
      IMPORTING text          TYPE clike OPTIONAL
                icon          TYPE clike OPTIONAL
                type          TYPE clike OPTIONAL
                enabled       TYPE clike OPTIONAL
                press         TYPE clike OPTIONAL
                class         TYPE clike OPTIONAL
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS button
      IMPORTING text          TYPE clike OPTIONAL
                icon          TYPE clike OPTIONAL
                type          TYPE clike OPTIONAL
                enabled       TYPE clike OPTIONAL
                press         TYPE clike OPTIONAL
                class         TYPE clike OPTIONAL
                id            TYPE clike OPTIONAL
                ns            TYPE clike OPTIONAL
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS search_field
      IMPORTING search        TYPE clike OPTIONAL
                width         TYPE clike OPTIONAL
                value         TYPE clike OPTIONAL
                id            TYPE clike OPTIONAL
                change        TYPE clike OPTIONAL
                liveChange    TYPE clike OPTIONAL
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS message_view
      IMPORTING items         TYPE clike OPTIONAL
                groupItems    TYPE clike OPTIONAL
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS message_popover
      IMPORTING items         TYPE clike OPTIONAL
                groupItems    TYPE clike OPTIONAL
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS message_item
      IMPORTING type          TYPE clike OPTIONAL
                title         TYPE clike OPTIONAL
                subtitle      TYPE clike OPTIONAL
                description   TYPE clike OPTIONAL
                groupName     TYPE clike OPTIONAL
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS page
      IMPORTING title          TYPE clike OPTIONAL
                navbuttonpress TYPE clike OPTIONAL
                shownavbutton  TYPE clike OPTIONAL
                id             TYPE clike OPTIONAL
                class          TYPE clike OPTIONAL
                ns             TYPE clike OPTIONAL
                  PREFERRED PARAMETER title
      RETURNING VALUE(result)  TYPE REF TO z2ui5_cl_xml_view.

    METHODS panel
      IMPORTING expandable    TYPE clike OPTIONAL
                expanded      TYPE clike OPTIONAL
                headertext    TYPE clike OPTIONAL
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS vbox
      IMPORTING height         TYPE clike OPTIONAL
                justifyContent TYPE clike OPTIONAL
                class          TYPE clike OPTIONAL
                  PREFERRED PARAMETER class
      RETURNING VALUE(result)  TYPE REF TO z2ui5_cl_xml_view.

    METHODS hbox
      IMPORTING class          TYPE clike OPTIONAL
                justifycontent TYPE clike OPTIONAL
      RETURNING VALUE(result)  TYPE REF TO z2ui5_cl_xml_view.

    METHODS scroll_container
      IMPORTING height        TYPE clike OPTIONAL
                width         TYPE clike OPTIONAL
                vertical      TYPE clike OPTIONAL
                horizontal    TYPE clike OPTIONAL
                focusable     TYPE clike OPTIONAL
                  PREFERRED PARAMETER height
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS simple_form
      IMPORTING title         TYPE clike OPTIONAL
                layout        TYPE clike OPTIONAL
                editable      TYPE clike OPTIONAL
                columnsXL     TYPE clike OPTIONAL
                columnsL      TYPE clike OPTIONAL
                columnsM      TYPE clike OPTIONAL
                  PREFERRED PARAMETER title
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS zz_plain
      IMPORTING val           TYPE clike OPTIONAL
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS content
      IMPORTING ns            TYPE clike OPTIONAL
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS title
      IMPORTING ns            TYPE clike OPTIONAL
                text          TYPE clike OPTIONAL
                wrapping      TYPE clike OPTIONAL
                level         TYPE clike OPTIONAL
                  PREFERRED PARAMETER text
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS tab_container
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS tab
      IMPORTING text          TYPE clike OPTIONAL
                selected      TYPE clike OPTIONAL
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS overflow_toolbar
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS overflow_toolbar_toggle_button
      IMPORTING text          TYPE clike OPTIONAL
                icon          TYPE clike OPTIONAL
                type          TYPE clike OPTIONAL
                enabled       TYPE clike OPTIONAL
                press         TYPE clike OPTIONAL
                tooltip       TYPE clike OPTIONAL
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS overflow_toolbar_button
      IMPORTING text          TYPE clike OPTIONAL
                icon          TYPE clike OPTIONAL
                type          TYPE clike OPTIONAL
                enabled       TYPE clike OPTIONAL
                press         TYPE clike OPTIONAL
                tooltip       TYPE clike OPTIONAL
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS overflow_toolbar_menu_button
      IMPORTING text          TYPE clike OPTIONAL
                icon          TYPE clike OPTIONAL
                buttonmode    TYPE clike OPTIONAL
                type          TYPE clike OPTIONAL
                enabled       TYPE clike OPTIONAL
                tooltip       TYPE clike OPTIONAL
                defaultaction TYPE clike OPTIONAL
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS menu_item
      IMPORTING press         TYPE clike OPTIONAL
                text          TYPE clike OPTIONAL
                icon          TYPE clike OPTIONAL
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS toolbar_spacer
      IMPORTING ns            TYPE clike OPTIONAL
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS label
      IMPORTING text          TYPE clike OPTIONAL
                labelfor      TYPE clike OPTIONAL
                  PREFERRED PARAMETER text
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS image
      IMPORTING src           TYPE clike OPTIONAL
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS date_picker
      IMPORTING value         TYPE clike OPTIONAL
                placeholder   TYPE clike OPTIONAL
                  PREFERRED PARAMETER value
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS time_picker
      IMPORTING value         TYPE clike OPTIONAL
                placeholder   TYPE clike OPTIONAL
                  PREFERRED PARAMETER value
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS date_time_picker
      IMPORTING value         TYPE clike OPTIONAL
                placeholder   TYPE clike OPTIONAL
                  PREFERRED PARAMETER value
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS link
      IMPORTING text          TYPE clike OPTIONAL
                href          TYPE clike OPTIONAL
                target        TYPE clike OPTIONAL
                enabled       TYPE clike OPTIONAL
                press         TYPE clike OPTIONAL
                id            TYPE clike OPTIONAL
                ns            TYPE clike OPTIONAL
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS list
      IMPORTING headertext      TYPE clike OPTIONAL
                items           TYPE clike OPTIONAL
                mode            TYPE clike OPTIONAL
                selectionChange TYPE clike OPTIONAL
                noData          TYPE clike OPTIONAL
      RETURNING VALUE(result)   TYPE REF TO  z2ui5_cl_xml_view.

    METHODS custom_list_item
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS input_list_item
      IMPORTING label         TYPE clike OPTIONAL
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS standard_list_item
      IMPORTING title         TYPE clike OPTIONAL
                description   TYPE clike OPTIONAL
                icon          TYPE clike OPTIONAL
                info          TYPE clike OPTIONAL
                press         TYPE clike OPTIONAL
                type          TYPE clike OPTIONAL
                selected      TYPE clike OPTIONAL
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS item
      IMPORTING key           TYPE clike OPTIONAL
                text          TYPE clike OPTIONAL
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS segmented_button_item
      IMPORTING icon          TYPE clike OPTIONAL
                key           TYPE clike OPTIONAL
                text          TYPE clike OPTIONAL
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS combobox
      IMPORTING selectedkey   TYPE clike OPTIONAL
                showclearicon TYPE clike OPTIONAL
                label         TYPE clike OPTIONAL
                items         TYPE clike OPTIONAL
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS grid
      IMPORTING class         TYPE clike OPTIONAL
                default_span  TYPE clike OPTIONAL
                  PREFERRED PARAMETER default_span
      RETURNING VALUE(result) TYPE REF TO  z2ui5_cl_xml_view.

    METHODS grid_data
      IMPORTING span          TYPE clike OPTIONAL
                  PREFERRED PARAMETER span
      RETURNING VALUE(result) TYPE REF TO  z2ui5_cl_xml_view.

    METHODS text_area
      IMPORTING value           TYPE clike OPTIONAL
                rows            TYPE clike OPTIONAL
                height          TYPE clike OPTIONAL
                width           TYPE clike OPTIONAL
                editable        TYPE clike OPTIONAL
                enabled         TYPE clike OPTIONAL
                growing         TYPE clike OPTIONAL
                growingmaxlines TYPE clike OPTIONAL
                id              TYPE clike OPTIONAL
                  PREFERRED PARAMETER value
      RETURNING VALUE(result)   TYPE REF TO  z2ui5_cl_xml_view.

    METHODS range_slider
      IMPORTING max           TYPE clike OPTIONAL
                min           TYPE clike OPTIONAL
                step          TYPE clike OPTIONAL
                startvalue    TYPE clike OPTIONAL
                endvalue      TYPE clike OPTIONAL
                showtickmarks TYPE clike OPTIONAL
                labelinterval TYPE clike OPTIONAL
                width         TYPE clike OPTIONAL
                class         TYPE clike OPTIONAL
                id            TYPE clike OPTIONAL
      RETURNING VALUE(result) TYPE REF TO  z2ui5_cl_xml_view.

    METHODS generic_tag
      IMPORTING arialabelledby TYPE clike OPTIONAL
                text           TYPE clike OPTIONAL
                design         TYPE clike OPTIONAL
                status         TYPE clike OPTIONAL
                class          TYPE clike OPTIONAL
      RETURNING VALUE(result)  TYPE REF TO z2ui5_cl_xml_view.

    METHODS object_attribute
      IMPORTING title         TYPE clike OPTIONAL
                text          TYPE clike OPTIONAL
      RETURNING VALUE(result) TYPE REF TO  z2ui5_cl_xml_view.

    METHODS object_number
      IMPORTING state         TYPE clike OPTIONAL
                emphasized    TYPE clike OPTIONAL
                number        TYPE clike OPTIONAL
                unit          TYPE clike OPTIONAL
      RETURNING VALUE(result) TYPE REF TO  z2ui5_cl_xml_view.

    METHODS switch
      IMPORTING state         TYPE clike OPTIONAL
                customtexton  TYPE clike OPTIONAL
                customtextoff TYPE clike OPTIONAL
                enabled       TYPE clike OPTIONAL
                type          TYPE clike OPTIONAL
      RETURNING VALUE(result) TYPE REF TO  z2ui5_cl_xml_view.

    METHODS step_input
      IMPORTING value         TYPE clike
                min           TYPE clike
                max           TYPE clike
                step          TYPE clike
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS progress_indicator
      IMPORTING percentvalue  TYPE clike OPTIONAL
                displayvalue  TYPE clike OPTIONAL
                showvalue     TYPE clike OPTIONAL
                state         TYPE clike OPTIONAL
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS segmented_button
      IMPORTING selected_key     TYPE clike
                selection_change TYPE clike OPTIONAL
      RETURNING VALUE(result)    TYPE REF TO z2ui5_cl_xml_view.

    METHODS checkbox
      IMPORTING text          TYPE clike OPTIONAL
                selected      TYPE clike OPTIONAL
                enabled       TYPE clike OPTIONAL
                  PREFERRED PARAMETER selected
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS header_toolbar
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS toolbar
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS text
      IMPORTING text          TYPE clike OPTIONAL
                class         TYPE clike OPTIONAL
                ns            TYPE clike OPTIONAL
                  PREFERRED PARAMETER text
      RETURNING VALUE(result) TYPE REF TO  z2ui5_cl_xml_view.

    METHODS formatted_text
      IMPORTING htmltext      TYPE clike OPTIONAL
      RETURNING VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS _generic
      IMPORTING
        name          TYPE clike
        ns            TYPE clike           OPTIONAL
        t_prop        TYPE ty_t_name_value OPTIONAL
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS cc_file_uploader
      IMPORTING
                value         TYPE clike OPTIONAL
                path          TYPE clike OPTIONAL
                placeholder   TYPE clike OPTIONAL
                upload        TYPE clike OPTIONAL
      RETURNING VALUE(result) TYPE REF TO  z2ui5_cl_xml_view.

    CLASS-METHODS cc_file_uploader_get_js
      RETURNING VALUE(result) TYPE string.

    METHODS xml_get
      RETURNING VALUE(result) TYPE string.

ENDCLASS.



CLASS Z2UI5_CL_XML_VIEW IMPLEMENTATION.


  METHOD actions.
    result = _generic( name = `actions`
                       ns   = ns ).
  ENDMETHOD.


  METHOD additional_content.
    result = _generic( name = `additionalContent` ).
  ENDMETHOD.


  METHOD avatar.
    result = me.
    DATA temp1 TYPE ty_t_name_value.
    CLEAR temp1.
    DATA temp2 LIKE LINE OF temp1.
    temp2-n = `src`.
    temp2-v = src.
    INSERT temp2 INTO TABLE temp1.
    temp2-n = `class`.
    temp2-v = class.
    INSERT temp2 INTO TABLE temp1.
    temp2-n = `displaysize`.
    temp2-v = displaysize.
    INSERT temp2 INTO TABLE temp1.
    _generic( name   = `Avatar`
              t_prop = temp1 ).
  ENDMETHOD.


  METHOD badge_custom_data.
    result = me.
    DATA temp3 TYPE ty_t_name_value.
    CLEAR temp3.
    DATA temp4 LIKE LINE OF temp3.
    temp4-n = `key`.
    temp4-v = key.
    INSERT temp4 INTO TABLE temp3.
    temp4-n = `value`.
    temp4-v = value.
    INSERT temp4 INTO TABLE temp3.
    temp4-n = `visible`.
    temp4-v = lcl_utility=>get_json_boolean( visible ).
    INSERT temp4 INTO TABLE temp3.
    _generic( name   = `BadgeCustomData`
              t_prop = temp3 ).
  ENDMETHOD.


  METHOD bar.
    result = _generic( name = `Bar` ).
  ENDMETHOD.


  METHOD bars.
    result = _generic( name = `bars`
                       ns   = `mchart` ).
  ENDMETHOD.


  METHOD blocks.
    result = _generic( name = `blocks`
                       ns   = `uxap` ).
  ENDMETHOD.


  METHOD button.
    result = me.
    DATA temp5 TYPE ty_t_name_value.
    CLEAR temp5.
    DATA temp6 LIKE LINE OF temp5.
    temp6-n = `press`.
    temp6-v = press.
    INSERT temp6 INTO TABLE temp5.
    temp6-n = `text`.
    temp6-v = text.
    INSERT temp6 INTO TABLE temp5.
    temp6-n = `enabled`.
    temp6-v = lcl_utility=>get_json_boolean( enabled ).
    INSERT temp6 INTO TABLE temp5.
    temp6-n = `icon`.
    temp6-v = icon.
    INSERT temp6 INTO TABLE temp5.
    temp6-n = `type`.
    temp6-v = type.
    INSERT temp6 INTO TABLE temp5.
    temp6-n = `id`.
    temp6-v = id.
    INSERT temp6 INTO TABLE temp5.
    temp6-n = `class`.
    temp6-v = class.
    INSERT temp6 INTO TABLE temp5.
    _generic( name   = `Button`
              ns     = ns
              t_prop = temp5 ).
  ENDMETHOD.


  METHOD buttons.
    result = _generic( `buttons` ).
  ENDMETHOD.


  METHOD carousel.

    DATA temp7 TYPE ty_t_name_value.
    CLEAR temp7.
    DATA temp8 LIKE LINE OF temp7.
    temp8-n = `loop`.
    temp8-v = lcl_utility=>get_json_boolean( loop ).
    INSERT temp8 INTO TABLE temp7.
    temp8-n = `class`.
    temp8-v = class.
    INSERT temp8 INTO TABLE temp7.
    temp8-n = `height`.
    temp8-v = height.
    INSERT temp8 INTO TABLE temp7.
    result = _generic( name   = `Carousel`
                       t_prop = temp7 ).

  ENDMETHOD.


  METHOD cc_file_uploader.
    result = me.
    DATA temp9 TYPE ty_t_name_value.
    CLEAR temp9.
    DATA temp10 LIKE LINE OF temp9.
    temp10-n = `placeholder`.
    temp10-v = placeholder.
    INSERT temp10 INTO TABLE temp9.
    temp10-n = `upload`.
    temp10-v = upload.
    INSERT temp10 INTO TABLE temp9.
    temp10-n = `path`.
    temp10-v = path.
    INSERT temp10 INTO TABLE temp9.
    temp10-n = `value`.
    temp10-v = value.
    INSERT temp10 INTO TABLE temp9.
    _generic( name   = `FileUploader`
              ns     = `z2ui5`
              t_prop = temp9 ).
  ENDMETHOD.


  METHOD cc_file_uploader_get_js.
    result = ` jQuery.sap.declare("z2ui5.FileUploader");` && |\n| &&
                          |\n| &&
                          `        sap.ui.define([` && |\n| &&
                          `            "sap/ui/core/Control",` && |\n| &&
                          `            "sap/m/Button",` && |\n| &&
                          `            "sap/ui/unified/FileUploader"` && |\n| &&
                          `        ], function (Control, Button, FileUploader) {` && |\n| &&
                          `            "use strict";` && |\n| &&
                          |\n| &&
                          `            return Control.extend("z2ui5.FileUploader", {` && |\n| &&
                          |\n| &&
                          `                metadata: {` && |\n| &&
                          `                    properties: {` && |\n| &&
                          `                        value: {` && |\n| &&
                          `                            type: "string",` && |\n| &&
                          `                            defaultValue: ""` && |\n| &&
                          `                        },` && |\n| &&
                          `                        path: {` && |\n| &&
                          `                            type: "string",` && |\n| &&
                          `                            defaultValue: ""` && |\n| &&
                          `                        },` && |\n| &&
                          `                        tooltip: {` && |\n| &&
                          `                            type: "string",` && |\n| &&
                          `                            defaultValue: ""` && |\n| &&
                          `                        },` && |\n| &&
                          `                        fileType: {` && |\n| &&
                          `                            type: "string",` && |\n| &&
                          `                            defaultValue: ""` && |\n| &&
                          `                        },` && |\n| &&
                          `                        placeholder: {` && |\n| &&
                          `                            type: "string",` && |\n| &&
                          `                            defaultValue: ""` && |\n| &&
                          `                        },` && |\n| &&
                          `                        buttonText: {` && |\n| &&
                          `                            type: "string",` && |\n| &&
                          `                            defaultValue: "Upload"` && |\n| &&
                          `                        },` && |\n| &&
                          `                        enabled: {` && |\n| &&
                          `                            type: "boolean",` && |\n| &&
                          `                            defaultValue: true` && |\n| &&
                          `                        },` && |\n| &&
                          `                        multiple: {` && |\n| &&
                          `                            type: "boolean",` && |\n| &&
                          `                            defaultValue: false` && |\n| &&
                          `                        }` && |\n| &&
                          `                    },` && |\n| &&
                          |\n| &&
                          |\n| &&
                          `                    aggregations: {` && |\n| &&
                          `                    },` && |\n| &&
                          `                    events: {` && |\n| &&
                          `                        "upload": {` && |\n| &&
                          `                            allowPreventDefault: true,` && |\n| &&
                          `                            parameters: {}` && |\n| &&
                          `                        }` && |\n| &&
                          `                    },` && |\n| &&
                          `                    renderer: null` && |\n| &&
                          `                },` && |\n| &&
                          |\n| &&
                          `                renderer: function (oRm, oControl) {` && |\n| &&
                          |\n| &&
                          `                    oControl.oUploadButton = new Button({` && |\n| &&
                          `                        text: oControl.getProperty("buttonText"),` && |\n| &&
                          `                        enabled: oControl.getProperty("path") !== "",` && |\n| &&
                          `                        press: function (oEvent) {` && |\n| &&
                          |\n| &&
                          `                            this.setProperty("path", this.oFileUploader.getProperty("value"));` && |\n| &&
                          |\n| &&
                          `                            var file = this.oFileUploader.oFileUpload.files[0];` && |\n| &&
                          `                            var reader = new FileReader();` && |\n| &&
                          |\n| &&
                          `                            reader.onload = function (evt) {` && |\n| &&
                          `                                var vContent = evt.currentTarget.result;` && |\n| &&
                          `                                this.setProperty("value", vContent);` && |\n| &&
                          `                                this.fireUpload();` && |\n| &&
                          `                                //this.getView().byId('picture' ).getDomRef().src = vContent;` && |\n| &&
                          `                            }.bind(this)` && |\n| &&
                          |\n| &&
                          `                            reader.readAsDataURL(file);` && |\n| &&
                          `                        }.bind(oControl)` && |\n| &&
                          `                    });` && |\n| &&
                          |\n| &&
                          `                    oControl.oFileUploader = new FileUploader({` && |\n| &&
                          `                        icon: "sap-icon://browse-folder",` && |\n| &&
                          `                        iconOnly: true,` && |\n| &&
                          `                        value: oControl.getProperty("path"),` && |\n| &&
                          `                        placeholder: oControl.getProperty("placeholder"),` && |\n| &&
                          `                        change: function (oEvent) {` && |\n| &&
                          `                            var value = oEvent.getSource().getProperty("value");` && |\n| &&
                          `                            this.setProperty("path", value);` && |\n| &&
                          `                            if (value) {` && |\n| &&
                          `                                this.oUploadButton.setEnabled();` && |\n| &&
                          `                            } else {` && |\n| &&
                          `                                this.oUploadButton.setEnabled(false);` && |\n| &&
                          `                            }` && |\n| &&
                          `                            this.oUploadButton.rerender();` && |\n| &&
                          `                        }.bind(oControl)` && |\n| &&
                          `                    });` && |\n| &&
                          |\n| &&
                          `                    var hbox = new sap.m.HBox();` && |\n| &&
                          `                    hbox.addItem(oControl.oFileUploader);` && |\n| &&
                          `                    hbox.addItem(oControl.oUploadButton);` && |\n| &&
                          `                    oRm.renderControl(hbox);` && |\n| &&
                          `                }` && |\n| &&
                          `            });` && |\n| &&
                          `        });`.
  ENDMETHOD.


  METHOD cells.
    result = _generic( `cells` ).
  ENDMETHOD.


  METHOD checkbox.
    result = me.
    DATA temp11 TYPE ty_t_name_value.
    CLEAR temp11.
    DATA temp12 LIKE LINE OF temp11.
    temp12-n = `text`.
    temp12-v = text.
    INSERT temp12 INTO TABLE temp11.
    temp12-n = `selected`.
    temp12-v = selected.
    INSERT temp12 INTO TABLE temp11.
    temp12-n = `enabled`.
    temp12-v = lcl_utility=>get_json_boolean( enabled ).
    INSERT temp12 INTO TABLE temp11.
    _generic( name   = `CheckBox`
              t_prop = temp11 ).
  ENDMETHOD.


  METHOD code_editor.
    result = me.
    DATA temp13 TYPE ty_t_name_value.
    CLEAR temp13.
    DATA temp14 LIKE LINE OF temp13.
    temp14-n = `value`.
    temp14-v = value.
    INSERT temp14 INTO TABLE temp13.
    temp14-n = `type`.
    temp14-v = type.
    INSERT temp14 INTO TABLE temp13.
    temp14-n = `editable`.
    temp14-v = lcl_utility=>get_json_boolean( editable ).
    INSERT temp14 INTO TABLE temp13.
    temp14-n = `height`.
    temp14-v = height.
    INSERT temp14 INTO TABLE temp13.
    temp14-n = `width`.
    temp14-v = width.
    INSERT temp14 INTO TABLE temp13.
    _generic( name   = `CodeEditor`
              ns     = `editor`
              t_prop = temp13 ).
  ENDMETHOD.


  METHOD column.
    DATA temp15 TYPE ty_t_name_value.
    CLEAR temp15.
    DATA temp16 LIKE LINE OF temp15.
    temp16-n = `width`.
    temp16-v = width.
    INSERT temp16 INTO TABLE temp15.
    temp16-n = `minScreenWidth`.
    temp16-v = minScreenWidth.
    INSERT temp16 INTO TABLE temp15.
    temp16-n = `demandPopin`.
    temp16-v = Lcl_utility=>get_json_boolean( demandPopin ).
    INSERT temp16 INTO TABLE temp15.
    result = _generic( name   = `Column`
                       t_prop = temp15 ).
  ENDMETHOD.


  METHOD columns.
    result = _generic( `columns` ).
  ENDMETHOD.


  METHOD column_list_item.
    DATA temp17 TYPE ty_t_name_value.
    CLEAR temp17.
    DATA temp18 LIKE LINE OF temp17.
    temp18-n = `vAlign`.
    temp18-v = valign.
    INSERT temp18 INTO TABLE temp17.
    temp18-n = `selected`.
    temp18-v = selected.
    INSERT temp18 INTO TABLE temp17.
    temp18-n = `type`.
    temp18-v = type.
    INSERT temp18 INTO TABLE temp17.
    temp18-n = `press`.
    temp18-v = press.
    INSERT temp18 INTO TABLE temp17.
    result = _generic( name   = `ColumnListItem`
                       t_prop = temp17 ).
  ENDMETHOD.


  METHOD combobox.
    DATA temp19 TYPE ty_t_name_value.
    CLEAR temp19.
    DATA temp20 LIKE LINE OF temp19.
    temp20-n = `showClearIcon`.
    temp20-v = lcl_utility=>get_json_boolean( showclearicon ).
    INSERT temp20 INTO TABLE temp19.
    temp20-n = `selectedKey`.
    temp20-v = selectedkey.
    INSERT temp20 INTO TABLE temp19.
    temp20-n = `items`.
    temp20-v = items.
    INSERT temp20 INTO TABLE temp19.
    temp20-n = `label`.
    temp20-v = label.
    INSERT temp20 INTO TABLE temp19.
    result = _generic( name   = `ComboBox`
                       t_prop = temp19 ).
  ENDMETHOD.


  METHOD constructor.
    DATA temp21 TYPE ty_t_name_value.
    CLEAR temp21.
    DATA temp22 LIKE LINE OF temp21.
    temp22-n = `xmlns`.
    temp22-v = `sap.m`.
    INSERT temp22 INTO TABLE temp21.
    temp22-n = `xmlns:z2ui5`.
    temp22-v = `z2ui5`.
    INSERT temp22 INTO TABLE temp21.
    temp22-n = `xmlns:core`.
    temp22-v = `sap.ui.core`.
    INSERT temp22 INTO TABLE temp21.
    temp22-n = `xmlns:mvc`.
    temp22-v = `sap.ui.core.mvc`.
    INSERT temp22 INTO TABLE temp21.
    temp22-n = `xmlns:layout`.
    temp22-v = `sap.ui.layout`.
    INSERT temp22 INTO TABLE temp21.
    temp22-n = `xmlns:f`.
    temp22-v = `sap.f`.
    INSERT temp22 INTO TABLE temp21.
    temp22-n = `xmlns:form`.
    temp22-v = `sap.ui.layout.form`.
    INSERT temp22 INTO TABLE temp21.
    temp22-n = `xmlns:editor`.
    temp22-v = `sap.ui.codeeditor`.
    INSERT temp22 INTO TABLE temp21.
    temp22-n = `xmlns:mchart`.
    temp22-v = `sap.suite.ui.microchart`.
    INSERT temp22 INTO TABLE temp21.
    temp22-n = `xmlns:webc`.
    temp22-v = `sap.ui.webc.main`.
    INSERT temp22 INTO TABLE temp21.
    temp22-n = `xmlns:uxap`.
    temp22-v = `sap.uxap`.
    INSERT temp22 INTO TABLE temp21.
    temp22-n = `xmlns:sap`.
    temp22-v = `sap`.
    INSERT temp22 INTO TABLE temp21.
    temp22-n = `xmlns:text`.
    temp22-v = `sap.ui.richtextedito`.
    INSERT temp22 INTO TABLE temp21.
    temp22-n = `xmlns:html`.
    temp22-v = `http://www.w3.org/1999/xhtml`.
    INSERT temp22 INTO TABLE temp21.
    mt_prop = temp21.
  ENDMETHOD.


  METHOD content.
    result = _generic( ns = ns name = `content` ).
  ENDMETHOD.


  METHOD content_left.
    result = _generic( name = `contentLeft` ).
  ENDMETHOD.


  METHOD content_middle.
    result = _generic( name = `contentMiddle` ).
  ENDMETHOD.


  METHOD content_right.
    result = _generic( name = `contentRight` ).
  ENDMETHOD.


  METHOD custom_data.
    result = _generic( `customData` ).
  ENDMETHOD.


  METHOD custom_Header.
    result = _generic( name = `customHeader` ).
  ENDMETHOD.


  METHOD custom_list_item.
    result = _generic( name = `CustomListItem` ).
  ENDMETHOD.


  METHOD date_picker.
    result = me.
    DATA temp23 TYPE ty_t_name_value.
    CLEAR temp23.
    DATA temp24 LIKE LINE OF temp23.
    temp24-n = `value`.
    temp24-v = value.
    INSERT temp24 INTO TABLE temp23.
    temp24-n = `placeholder`.
    temp24-v = placeholder.
    INSERT temp24 INTO TABLE temp23.
    _generic( name   = `DatePicker`
              t_prop = temp23 ).
  ENDMETHOD.


  METHOD date_time_picker.
    result = me.
    DATA temp25 TYPE ty_t_name_value.
    CLEAR temp25.
    DATA temp26 LIKE LINE OF temp25.
    temp26-n = `value`.
    temp26-v = value.
    INSERT temp26 INTO TABLE temp25.
    temp26-n = `placeholder`.
    temp26-v = placeholder.
    INSERT temp26 INTO TABLE temp25.
    _generic( name   = `DateTimePicker`
              t_prop = temp25 ).
  ENDMETHOD.


  METHOD dialog.
    DATA temp27 TYPE ty_t_name_value.
    CLEAR temp27.
    DATA temp28 LIKE LINE OF temp27.
    temp28-n = `title`.
    temp28-v = title.
    INSERT temp28 INTO TABLE temp27.
    temp28-n = `icon`.
    temp28-v = icon.
    INSERT temp28 INTO TABLE temp27.
    temp28-n = `stretch`.
    temp28-v = stretch.
    INSERT temp28 INTO TABLE temp27.
    temp28-n = `showHeader`.
    temp28-v = showheader.
    INSERT temp28 INTO TABLE temp27.
    temp28-n = `contentWidth`.
    temp28-v = contentwidth.
    INSERT temp28 INTO TABLE temp27.
    temp28-n = `contentHeight`.
    temp28-v = contentheight.
    INSERT temp28 INTO TABLE temp27.
    temp28-n = `resizable`.
    temp28-v = lcl_utility=>get_json_boolean( resizable ).
    INSERT temp28 INTO TABLE temp27.
    result = _generic( name   = `Dialog`
                       t_prop = temp27 ).
  ENDMETHOD.


  METHOD dynamic_page.
    DATA temp29 TYPE ty_t_name_value.
    CLEAR temp29.
    DATA temp30 LIKE LINE OF temp29.
    temp30-n = `headerExpanded`.
    temp30-v = lcl_utility=>get_json_boolean( headerexpanded ).
    INSERT temp30 INTO TABLE temp29.
    temp30-n = `headerPinned`.
    temp30-v = lcl_utility=>get_json_boolean( headerPinned ).
    INSERT temp30 INTO TABLE temp29.
    temp30-n = `showFooter`.
    temp30-v = lcl_utility=>get_json_boolean( showFooter ).
    INSERT temp30 INTO TABLE temp29.
    temp30-n = `toggleHeaderOnTitleClick`.
    temp30-v = toggleHeaderOnTitleClick.
    INSERT temp30 INTO TABLE temp29.
    result = _generic( name   = `DynamicPage`
                       ns     = `f`
                       t_prop = temp29 ).
  ENDMETHOD.


  METHOD dynamic_page_header.
    DATA temp31 TYPE ty_t_name_value.
    CLEAR temp31.
    DATA temp32 LIKE LINE OF temp31.
    temp32-n = `pinnable`.
    temp32-v = lcl_utility=>get_json_boolean( pinnable ).
    INSERT temp32 INTO TABLE temp31.
    result = _generic(
                 name   = `DynamicPageHeader`
                 ns     = `f`
                 t_prop = temp31 ).
  ENDMETHOD.


  METHOD dynamic_page_title.
    result = _generic( name = `DynamicPageTitle`
                       ns   = `f` ).
  ENDMETHOD.


  METHOD expanded_content.
    result = _generic( name = `expandedContent`
                       ns   = ns ).
  ENDMETHOD.


  METHOD expanded_heading.
    result = _generic( name = `expandedHeading`
                       ns   = `uxap` ).
  ENDMETHOD.


  METHOD factory.
    CREATE OBJECT result.

    IF t_ns IS NOT INITIAL.
      result->mt_prop = t_ns.
    ENDIF.

    DATA temp33 TYPE ty_t_name_value.
    CLEAR temp33.
    temp33 = result->mt_prop.
    DATA temp34 LIKE LINE OF temp33.
    temp34-n = 'displayBlock'.
    temp34-v = 'true'.
    INSERT temp34 INTO TABLE temp33.
    temp34-n = 'height'.
    temp34-v = '100%'.
    INSERT temp34 INTO TABLE temp33.
    temp34-n = 'controllerName'.
    temp34-v = z2ui5_cl_http_handler=>config-controller_name.
    INSERT temp34 INTO TABLE temp33.
    result->mt_prop  = temp33.

    result->m_name   = `View`.
    result->m_ns     = `mvc`.
    result->m_root   = result.
    result->m_parent = result.
  ENDMETHOD.


  METHOD factory_popup.
    CREATE OBJECT result.

    IF t_ns IS NOT INITIAL.
      result->mt_prop = t_ns.
    ENDIF.

    result->m_name   = `FragmentDefinition`.
    result->m_ns     = `core`.
    result->m_root   = result.
    result->m_parent = result.
  ENDMETHOD.


  METHOD flex_box.
    DATA temp35 TYPE ty_t_name_value.
    CLEAR temp35.
    DATA temp36 LIKE LINE OF temp35.
    temp36-n = `class`.
    temp36-v = class.
    INSERT temp36 INTO TABLE temp35.
    temp36-n = `renderType`.
    temp36-v = rendertype.
    INSERT temp36 INTO TABLE temp35.
    temp36-n = `width`.
    temp36-v = width.
    INSERT temp36 INTO TABLE temp35.
    temp36-n = `height`.
    temp36-v = height.
    INSERT temp36 INTO TABLE temp35.
    temp36-n = `alignItems`.
    temp36-v = alignitems.
    INSERT temp36 INTO TABLE temp35.
    temp36-n = `fitContainer`.
    temp36-v = lcl_utility=>get_json_boolean( fitContainer ).
    INSERT temp36 INTO TABLE temp35.
    temp36-n = `justifyContent`.
    temp36-v = justifycontent.
    INSERT temp36 INTO TABLE temp35.
    temp36-n = `wrap`.
    temp36-v = wrap.
    INSERT temp36 INTO TABLE temp35.
    result = _generic( name   = `FlexBox`
                       t_prop = temp35 ).
  ENDMETHOD.


  METHOD flex_item_data.
    result = me.

    DATA temp37 TYPE ty_t_name_value.
    CLEAR temp37.
    DATA temp38 LIKE LINE OF temp37.
    temp38-n = `growFactor`.
    temp38-v = growfactor.
    INSERT temp38 INTO TABLE temp37.
    temp38-n = `baseSize`.
    temp38-v = basesize.
    INSERT temp38 INTO TABLE temp37.
    temp38-n = `backgroundDesign`.
    temp38-v = backgrounddesign.
    INSERT temp38 INTO TABLE temp37.
    temp38-n = `styleClass`.
    temp38-v = styleclass.
    INSERT temp38 INTO TABLE temp37.
    _generic( name   = `FlexItemData`
              t_prop = temp37 ).
  ENDMETHOD.


  METHOD footer.
    result = _generic( ns   = ns
                       name = `footer` ).
  ENDMETHOD.


  METHOD formatted_text.
    result = me.
    DATA temp39 TYPE ty_t_name_value.
    CLEAR temp39.
    DATA temp40 LIKE LINE OF temp39.
    temp40-n = `htmlText`.
    temp40-v = htmltext.
    INSERT temp40 INTO TABLE temp39.
    _generic( name   = `FormattedText`
              t_prop = temp39 ).
  ENDMETHOD.


  METHOD generic_tag.
    DATA temp41 TYPE ty_t_name_value.
    CLEAR temp41.
    DATA temp42 LIKE LINE OF temp41.
    temp42-n = `ariaLabelledBy`.
    temp42-v = arialabelledby.
    INSERT temp42 INTO TABLE temp41.
    temp42-n = `class`.
    temp42-v = class.
    INSERT temp42 INTO TABLE temp41.
    temp42-n = `design`.
    temp42-v = design.
    INSERT temp42 INTO TABLE temp41.
    temp42-n = `status`.
    temp42-v = status.
    INSERT temp42 INTO TABLE temp41.
    temp42-n = `text`.
    temp42-v = text.
    INSERT temp42 INTO TABLE temp41.
    result = _generic( name   = `GenericTag`
                       t_prop = temp41 ).
  ENDMETHOD.


  METHOD get.
    result = m_root->m_last.
  ENDMETHOD.


  METHOD get_child.
    DATA temp43 LIKE LINE OF t_child.
    DATA temp44 LIKE sy-tabix.
    temp44 = sy-tabix.
    READ TABLE t_child INDEX index INTO temp43.
    sy-tabix = temp44.
    IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE cx_sy_itab_line_not_found.
    ENDIF.
    result = temp43.
  ENDMETHOD.


  METHOD get_parent.
    result = m_parent.
  ENDMETHOD.


  METHOD get_root.
    result = m_root.
  ENDMETHOD.


  METHOD grid.
    DATA temp45 TYPE ty_t_name_value.
    CLEAR temp45.
    DATA temp46 LIKE LINE OF temp45.
    temp46-n = `defaultSpan`.
    temp46-v = default_span.
    INSERT temp46 INTO TABLE temp45.
    temp46-n = `class`.
    temp46-v = class.
    INSERT temp46 INTO TABLE temp45.
    result = _generic( name   = `Grid`
                       ns     = `layout`
                       t_prop = temp45 ).
  ENDMETHOD.


  METHOD grid_data.
    result = me.
    DATA temp47 TYPE ty_t_name_value.
    CLEAR temp47.
    DATA temp48 LIKE LINE OF temp47.
    temp48-n = `span`.
    temp48-v = span.
    INSERT temp48 INTO TABLE temp47.
    _generic( name   = `GridData`
              ns     = `layout`
              t_prop = temp47 ).
  ENDMETHOD.


  METHOD hbox.
    DATA temp49 TYPE ty_t_name_value.
    CLEAR temp49.
    DATA temp50 LIKE LINE OF temp49.
    temp50-n = `class`.
    temp50-v = class.
    INSERT temp50 INTO TABLE temp49.
    temp50-n = `justifyContent`.
    temp50-v = justifycontent.
    INSERT temp50 INTO TABLE temp49.
    result = _generic( name   = `HBox`
                       t_prop = temp49 ).
  ENDMETHOD.


  METHOD header.
    result = _generic( name = `header`
                       ns   = ns ).
  ENDMETHOD.


  METHOD header_content.
    result = _generic( name = `headerContent`
                       ns   = ns ).
  ENDMETHOD.


  METHOD header_title.
    result = _generic( name = `headerTitle`
                       ns   = `uxap` ).
  ENDMETHOD.


  METHOD header_toolbar.
    result = _generic( `headerToolbar` ).
  ENDMETHOD.


  METHOD heading.
    result = me.
    result = _generic( name = `heading`
                       ns   = ns ).
  ENDMETHOD.


  METHOD hlp_get_source_code_url.
    DATA lv_url TYPE z2ui5_if_client=>ty_s_name_value-value.
    DATA temp1 LIKE LINE OF z2ui5_cl_http_handler=>client-t_header.
    DATA temp2 LIKE sy-tabix.
    temp2 = sy-tabix.
    READ TABLE z2ui5_cl_http_handler=>client-t_header WITH KEY name = `referer` INTO temp1.
    sy-tabix = temp2.
    IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE cx_sy_itab_line_not_found.
    ENDIF.
    lv_url = temp1-value.

    DATA lv_dummy TYPE string.
    SPLIT lv_url AT '?' INTO lv_url lv_dummy.

    DATA temp51 LIKE LINE OF z2ui5_cl_http_handler=>client-t_header.
    DATA temp52 LIKE sy-tabix.
    temp52 = sy-tabix.
    READ TABLE z2ui5_cl_http_handler=>client-t_header WITH KEY name = `origin` INTO temp51.
    sy-tabix = temp52.
    IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE cx_sy_itab_line_not_found.
    ENDIF.
    result = temp51-value &&
       `/sap/bc/adt/oo/classes/` && lcl_utility=>get_classname_by_ref( app ) &&
       `/source/main`.

  ENDMETHOD.


  METHOD hlp_replace_controller_name.
    result = lcl_utility=>get_replace(
                 iv_val     = xml
                 iv_begin   = 'controllerName="'
                 iv_end     = '"'
                 iv_replace = `controllerName="` && z2ui5_cl_http_handler=>config-controller_name && `"` ).
  ENDMETHOD.


  METHOD horizontal_layout.
    DATA temp53 TYPE ty_t_name_value.
    CLEAR temp53.
    DATA temp54 LIKE LINE OF temp53.
    temp54-n = `class`.
    temp54-v = class.
    INSERT temp54 INTO TABLE temp53.
    temp54-n = `width`.
    temp54-v = width.
    INSERT temp54 INTO TABLE temp53.
    result = _generic( name   = `HorizontalLayout`
                       ns     = `layout`
                       t_prop = temp53 ).
  ENDMETHOD.


  METHOD illustrated_message.
    DATA temp55 TYPE ty_t_name_value.
    CLEAR temp55.
    DATA temp56 LIKE LINE OF temp55.
    temp56-n = `enableVerticalResponsiveness`.
    temp56-v = enableVerticalResponsiveness.
    INSERT temp56 INTO TABLE temp55.
    temp56-n = `illustrationType`.
    temp56-v = illustrationType.
    INSERT temp56 INTO TABLE temp55.
    result = _generic( name   = `IllustratedMessage`
                       t_prop = temp55 ).
  ENDMETHOD.


  METHOD image.
    result = me.
    DATA temp57 TYPE ty_t_name_value.
    CLEAR temp57.
    DATA temp58 LIKE LINE OF temp57.
    temp58-n = `src`.
    temp58-v = src.
    INSERT temp58 INTO TABLE temp57.
    _generic( name   = `Image`
              t_prop = temp57 ).
  ENDMETHOD.


  METHOD input.
    result = me.
    DATA temp59 TYPE ty_t_name_value.
    CLEAR temp59.
    DATA temp60 LIKE LINE OF temp59.
    temp60-n = `id`.
    temp60-v = id.
    INSERT temp60 INTO TABLE temp59.
    temp60-n = `placeholder`.
    temp60-v = placeholder.
    INSERT temp60 INTO TABLE temp59.
    temp60-n = `type`.
    temp60-v = type.
    INSERT temp60 INTO TABLE temp59.
    temp60-n = `showClearIcon`.
    temp60-v = lcl_utility=>get_json_boolean( showclearicon ).
    INSERT temp60 INTO TABLE temp59.
    temp60-n = `description`.
    temp60-v = description.
    INSERT temp60 INTO TABLE temp59.
    temp60-n = `editable`.
    temp60-v = lcl_utility=>get_json_boolean( editable ).
    INSERT temp60 INTO TABLE temp59.
    temp60-n = `enabled`.
    temp60-v = lcl_utility=>get_json_boolean( enabled ).
    INSERT temp60 INTO TABLE temp59.
    temp60-n = `visible`.
    temp60-v = lcl_utility=>get_json_boolean( visible ).
    INSERT temp60 INTO TABLE temp59.
    temp60-n = `valueState`.
    temp60-v = valuestate.
    INSERT temp60 INTO TABLE temp59.
    temp60-n = `valueStateText`.
    temp60-v = valuestatetext.
    INSERT temp60 INTO TABLE temp59.
    temp60-n = `value`.
    temp60-v = value.
    INSERT temp60 INTO TABLE temp59.
    temp60-n = `suggestionItems`.
    temp60-v = suggestionitems.
    INSERT temp60 INTO TABLE temp59.
    temp60-n = `showSuggestion`.
    temp60-v = lcl_utility=>get_json_boolean( showsuggestion ).
    INSERT temp60 INTO TABLE temp59.
    temp60-n = `valueHelpRequest`.
    temp60-v = valuehelprequest.
    INSERT temp60 INTO TABLE temp59.
    temp60-n = `submit`.
    temp60-v = submit.
    INSERT temp60 INTO TABLE temp59.
    temp60-n = `showValueHelp`.
    temp60-v = lcl_utility=>get_json_boolean( showvaluehelp ).
    INSERT temp60 INTO TABLE temp59.
    temp60-n = `class`.
    temp60-v = class.
    INSERT temp60 INTO TABLE temp59.
    _generic( name   = `Input`
              t_prop = temp59 ).
  ENDMETHOD.


  METHOD input_list_item.
    DATA temp61 TYPE ty_t_name_value.
    CLEAR temp61.
    DATA temp62 LIKE LINE OF temp61.
    temp62-n = `label`.
    temp62-v = label.
    INSERT temp62 INTO TABLE temp61.
    result = _generic( name   = `InputListItem`
                       t_prop = temp61 ).
  ENDMETHOD.


  METHOD interact_bar_chart.
    DATA temp63 TYPE ty_t_name_value.
    CLEAR temp63.
    DATA temp64 LIKE LINE OF temp63.
    temp64-n = `selectionChanged`.
    temp64-v = selectionchanged.
    INSERT temp64 INTO TABLE temp63.
    temp64-n = `showError`.
    temp64-v = showerror.
    INSERT temp64 INTO TABLE temp63.
    temp64-n = `press`.
    temp64-v = press.
    INSERT temp64 INTO TABLE temp63.
    temp64-n = `labelWidth`.
    temp64-v = labelwidth.
    INSERT temp64 INTO TABLE temp63.
    temp64-n = `errorMessageTitle`.
    temp64-v = errormessagetitle.
    INSERT temp64 INTO TABLE temp63.
    temp64-n = `errorMessage`.
    temp64-v = errormessage.
    INSERT temp64 INTO TABLE temp63.
    result = _generic( name   = `InteractiveBarChart`
                       ns     = `mchart`
                       t_prop = temp63 ).
  ENDMETHOD.


  METHOD interact_bar_chart_bar.
    DATA temp65 TYPE ty_t_name_value.
    CLEAR temp65.
    DATA temp66 LIKE LINE OF temp65.
    temp66-n = `label`.
    temp66-v = label.
    INSERT temp66 INTO TABLE temp65.
    temp66-n = `displayedValue`.
    temp66-v = displayedvalue.
    INSERT temp66 INTO TABLE temp65.
    temp66-n = `value`.
    temp66-v = value.
    INSERT temp66 INTO TABLE temp65.
    temp66-n = `selected`.
    temp66-v = selected.
    INSERT temp66 INTO TABLE temp65.
    result = _generic( name   = `InteractiveBarChartBar`
                       ns     = `mchart`
                       t_prop = temp65 ).
  ENDMETHOD.


  METHOD interact_donut_chart.
    DATA temp67 TYPE ty_t_name_value.
    CLEAR temp67.
    DATA temp68 LIKE LINE OF temp67.
    temp68-n = `selectionChanged`.
    temp68-v = selectionchanged.
    INSERT temp68 INTO TABLE temp67.
    temp68-n = `showError`.
    temp68-v = lcl_utility=>get_json_boolean( showerror ).
    INSERT temp68 INTO TABLE temp67.
    temp68-n = `errorMessageTitle`.
    temp68-v = errormessagetitle.
    INSERT temp68 INTO TABLE temp67.
    temp68-n = `errorMessage`.
    temp68-v = errormessage.
    INSERT temp68 INTO TABLE temp67.
    temp68-n = `displayedSegments`.
    temp68-v = displayedsegments.
    INSERT temp68 INTO TABLE temp67.
    temp68-n = `press`.
    temp68-v = press.
    INSERT temp68 INTO TABLE temp67.
    result = _generic( name   = `InteractiveDonutChart`
                       ns     = `mchart`
                       t_prop = temp67 ).
  ENDMETHOD.


  METHOD interact_donut_chart_segment.
    DATA temp69 TYPE ty_t_name_value.
    CLEAR temp69.
    DATA temp70 LIKE LINE OF temp69.
    temp70-n = `label`.
    temp70-v = label.
    INSERT temp70 INTO TABLE temp69.
    temp70-n = `displayedValue`.
    temp70-v = displayedvalue.
    INSERT temp70 INTO TABLE temp69.
    temp70-n = `value`.
    temp70-v = value.
    INSERT temp70 INTO TABLE temp69.
    temp70-n = `selected`.
    temp70-v = selected.
    INSERT temp70 INTO TABLE temp69.
    result = _generic( name   = `InteractiveDonutChartSegment`
                       ns     = `mchart`
                       t_prop = temp69 ).
  ENDMETHOD.


  METHOD interact_line_chart.
    DATA temp71 TYPE ty_t_name_value.
    CLEAR temp71.
    DATA temp72 LIKE LINE OF temp71.
    temp72-n = `selectionChanged`.
    temp72-v = selectionchanged.
    INSERT temp72 INTO TABLE temp71.
    temp72-n = `showError`.
    temp72-v = lcl_utility=>get_json_boolean( showerror ).
    INSERT temp72 INTO TABLE temp71.
    temp72-n = `press`.
    temp72-v = press.
    INSERT temp72 INTO TABLE temp71.
    temp72-n = `errorMessageTitle`.
    temp72-v = errormessagetitle.
    INSERT temp72 INTO TABLE temp71.
    temp72-n = `errorMessage`.
    temp72-v = errormessage.
    INSERT temp72 INTO TABLE temp71.
    temp72-n = `precedingPoint`.
    temp72-v = precedingpoint.
    INSERT temp72 INTO TABLE temp71.
    temp72-n = `succeedingPoint`.
    temp72-v = succeddingpoint.
    INSERT temp72 INTO TABLE temp71.
    result = _generic( name   = `InteractiveLineChart`
                       ns     = `mchart`
                       t_prop = temp71 ).
  ENDMETHOD.


  METHOD interact_line_chart_point.
    DATA temp73 TYPE ty_t_name_value.
    CLEAR temp73.
    DATA temp74 LIKE LINE OF temp73.
    temp74-n = `label`.
    temp74-v = label.
    INSERT temp74 INTO TABLE temp73.
    temp74-n = `secondaryLabel`.
    temp74-v = secondarylabel.
    INSERT temp74 INTO TABLE temp73.
    temp74-n = `value`.
    temp74-v = value.
    INSERT temp74 INTO TABLE temp73.
    temp74-n = `displayedValue`.
    temp74-v = displayedvalue.
    INSERT temp74 INTO TABLE temp73.
    temp74-n = `selected`.
    temp74-v = lcl_utility=>get_json_boolean( selected ).
    INSERT temp74 INTO TABLE temp73.
    result = _generic( name   = `InteractiveLineChartPoint`
                       ns     = `mchart`
                       t_prop = temp73 ).
  ENDMETHOD.


  METHOD item.
    result = me.
    DATA temp75 TYPE ty_t_name_value.
    CLEAR temp75.
    DATA temp76 LIKE LINE OF temp75.
    temp76-n = `key`.
    temp76-v = key.
    INSERT temp76 INTO TABLE temp75.
    temp76-n = `text`.
    temp76-v = text.
    INSERT temp76 INTO TABLE temp75.
    _generic( name   = `Item`
              ns     = `core`
              t_prop = temp75 ).
  ENDMETHOD.


  METHOD items.
    result = _generic( `items` ).
  ENDMETHOD.


  METHOD label.
    result = me.
    DATA temp77 TYPE ty_t_name_value.
    CLEAR temp77.
    DATA temp78 LIKE LINE OF temp77.
    temp78-n = `text`.
    temp78-v = text.
    INSERT temp78 INTO TABLE temp77.
    temp78-n = `labelFor`.
    temp78-v = labelfor.
    INSERT temp78 INTO TABLE temp77.
    _generic( name   = `Label`
              t_prop = temp77 ).
  ENDMETHOD.


  METHOD layout_data.
    result = _generic( ns   = ns
                       name = `layoutData` ).
  ENDMETHOD.


  METHOD link.
    result = me.
    DATA temp79 TYPE ty_t_name_value.
    CLEAR temp79.
    DATA temp80 LIKE LINE OF temp79.
    temp80-n = `text`.
    temp80-v = text.
    INSERT temp80 INTO TABLE temp79.
    temp80-n = `target`.
    temp80-v = target.
    INSERT temp80 INTO TABLE temp79.
    temp80-n = `href`.
    temp80-v = href.
    INSERT temp80 INTO TABLE temp79.
    temp80-n = `press`.
    temp80-v = press.
    INSERT temp80 INTO TABLE temp79.
    temp80-n = `id`.
    temp80-v = id.
    INSERT temp80 INTO TABLE temp79.
    temp80-n = `enabled`.
    temp80-v = lcl_utility=>get_json_boolean( enabled ).
    INSERT temp80 INTO TABLE temp79.
    _generic( name   = `Link`
              ns     = ns
              t_prop = temp79 ).
  ENDMETHOD.


  METHOD list.
    DATA temp81 TYPE ty_t_name_value.
    CLEAR temp81.
    DATA temp82 LIKE LINE OF temp81.
    temp82-n = `headerText`.
    temp82-v = headertext.
    INSERT temp82 INTO TABLE temp81.
    temp82-n = `items`.
    temp82-v = items.
    INSERT temp82 INTO TABLE temp81.
    temp82-n = `mode`.
    temp82-v = mode.
    INSERT temp82 INTO TABLE temp81.
    temp82-n = `selectionChange`.
    temp82-v = selectionchange.
    INSERT temp82 INTO TABLE temp81.
    temp82-n = `noData`.
    temp82-v = noData.
    INSERT temp82 INTO TABLE temp81.
    result = _generic( name   = `List`
                       t_prop = temp81 ).
  ENDMETHOD.


  METHOD list_item.
    result = me.
    DATA temp83 TYPE ty_t_name_value.
    CLEAR temp83.
    DATA temp84 LIKE LINE OF temp83.
    temp84-n = `text`.
    temp84-v = text.
    INSERT temp84 INTO TABLE temp83.
    temp84-n = `additionalText`.
    temp84-v = additionaltext.
    INSERT temp84 INTO TABLE temp83.
    _generic( name   = `ListItem`
              ns     = `core`
              t_prop = temp83 ).
  ENDMETHOD.


  METHOD menu_item.
    result = me.
    DATA temp85 TYPE ty_t_name_value.
    CLEAR temp85.
    DATA temp86 LIKE LINE OF temp85.
    temp86-n = `press`.
    temp86-v = press.
    INSERT temp86 INTO TABLE temp85.
    temp86-n = `text`.
    temp86-v = text.
    INSERT temp86 INTO TABLE temp85.
    temp86-n = `icon`.
    temp86-v = icon.
    INSERT temp86 INTO TABLE temp85.
    _generic( name   = `MenuItem`
              t_prop = temp85 ).
  ENDMETHOD.


  METHOD message_item.
    DATA temp87 TYPE ty_t_name_value.
    CLEAR temp87.
    DATA temp88 LIKE LINE OF temp87.
    temp88-n = `type`.
    temp88-v = type.
    INSERT temp88 INTO TABLE temp87.
    temp88-n = `title`.
    temp88-v = title.
    INSERT temp88 INTO TABLE temp87.
    temp88-n = `subtitle`.
    temp88-v = subtitle.
    INSERT temp88 INTO TABLE temp87.
    temp88-n = `description`.
    temp88-v = description.
    INSERT temp88 INTO TABLE temp87.
    temp88-n = `groupName`.
    temp88-v = groupName.
    INSERT temp88 INTO TABLE temp87.
    result = _generic( name   = `MessageItem`
                       t_prop = temp87 ).
  ENDMETHOD.


  METHOD message_page.
    DATA temp89 TYPE ty_t_name_value.
    CLEAR temp89.
    DATA temp90 LIKE LINE OF temp89.
    temp90-n = `showHeader`.
    temp90-v = lcl_utility=>get_json_boolean( show_header ).
    INSERT temp90 INTO TABLE temp89.
    temp90-n = `description`.
    temp90-v = description.
    INSERT temp90 INTO TABLE temp89.
    temp90-n = `icon`.
    temp90-v = icon.
    INSERT temp90 INTO TABLE temp89.
    temp90-n = `text`.
    temp90-v = text.
    INSERT temp90 INTO TABLE temp89.
    temp90-n = `enableFormattedText`.
    temp90-v = lcl_utility=>get_json_boolean( enableformattedtext ).
    INSERT temp90 INTO TABLE temp89.
    result = _generic( name   = `MessagePage`
                       t_prop = temp89 ).
  ENDMETHOD.


  METHOD message_popover.
    DATA temp91 TYPE ty_t_name_value.
    CLEAR temp91.
    DATA temp92 LIKE LINE OF temp91.
    temp92-n = `items`.
    temp92-v = items.
    INSERT temp92 INTO TABLE temp91.
    temp92-n = `groupItems`.
    temp92-v = lcl_utility=>get_json_boolean( groupItems ).
    INSERT temp92 INTO TABLE temp91.
    result = _generic( name   = `MessagePopover`
                       t_prop = temp91 ).
  ENDMETHOD.


  METHOD message_strip.
    result = me.
    DATA temp93 TYPE ty_t_name_value.
    CLEAR temp93.
    DATA temp94 LIKE LINE OF temp93.
    temp94-n = `text`.
    temp94-v = text.
    INSERT temp94 INTO TABLE temp93.
    temp94-n = `type`.
    temp94-v = type.
    INSERT temp94 INTO TABLE temp93.
    temp94-n = `showIcon`.
    temp94-v = lcl_utility=>get_json_boolean( showicon ).
    INSERT temp94 INTO TABLE temp93.
    temp94-n = `class`.
    temp94-v = class.
    INSERT temp94 INTO TABLE temp93.
    _generic( name   = `MessageStrip`
              t_prop = temp93 ).
  ENDMETHOD.


  METHOD message_view.
    DATA temp95 TYPE ty_t_name_value.
    CLEAR temp95.
    DATA temp96 LIKE LINE OF temp95.
    temp96-n = `items`.
    temp96-v = items.
    INSERT temp96 INTO TABLE temp95.
    temp96-n = `groupItems`.
    temp96-v = lcl_utility=>get_json_boolean( groupItems ).
    INSERT temp96 INTO TABLE temp95.
    result = _generic( name   = `MessageView`
                       t_prop = temp95 ).
  ENDMETHOD.


  METHOD multi_input.
    DATA temp97 TYPE ty_t_name_value.
    CLEAR temp97.
    DATA temp98 LIKE LINE OF temp97.
    temp98-n = `tokens`.
    temp98-v = tokens.
    INSERT temp98 INTO TABLE temp97.
    temp98-n = `showClearIcon`.
    temp98-v = lcl_utility=>get_json_boolean( showclearicon ).
    INSERT temp98 INTO TABLE temp97.
    temp98-n = `showValueHelp`.
    temp98-v = lcl_utility=>get_json_boolean( showvaluehelp ).
    INSERT temp98 INTO TABLE temp97.
    temp98-n = `enabled`.
    temp98-v = lcl_utility=>get_json_boolean( enabled ).
    INSERT temp98 INTO TABLE temp97.
    temp98-n = `suggestionItems`.
    temp98-v = suggestionitems.
    INSERT temp98 INTO TABLE temp97.
    temp98-n = `tokenUpdate`.
    temp98-v = tokenUpdate.
    INSERT temp98 INTO TABLE temp97.
    temp98-n = `submit`.
    temp98-v = submit.
    INSERT temp98 INTO TABLE temp97.
    temp98-n = `width`.
    temp98-v = width.
    INSERT temp98 INTO TABLE temp97.
    temp98-n = `value`.
    temp98-v = value.
    INSERT temp98 INTO TABLE temp97.
    temp98-n = `id`.
    temp98-v = id.
    INSERT temp98 INTO TABLE temp97.
    temp98-n = `valueHelpRequest`.
    temp98-v = valueHelpRequest.
    INSERT temp98 INTO TABLE temp97.
    temp98-n = `class`.
    temp98-v = class.
    INSERT temp98 INTO TABLE temp97.
    result = _generic( name   = `MultiInput`
                       t_prop = temp97 ).
  ENDMETHOD.


  METHOD navigation_actions.
    result = _generic( name = `navigationActions`
                       ns   = `f` ).
  ENDMETHOD.


  METHOD object_attribute.
    result = me.

    DATA temp99 TYPE ty_t_name_value.
    CLEAR temp99.
    DATA temp100 LIKE LINE OF temp99.
    temp100-n = `title`.
    temp100-v = title.
    INSERT temp100 INTO TABLE temp99.
    temp100-n = `text`.
    temp100-v = text.
    INSERT temp100 INTO TABLE temp99.
    _generic( name   = `ObjectAttribute`
              t_prop = temp99 ).
  ENDMETHOD.


  METHOD object_number.
    result = me.
    DATA temp101 TYPE ty_t_name_value.
    CLEAR temp101.
    DATA temp102 LIKE LINE OF temp101.
    temp102-n = `emphasized`.
    temp102-v = lcl_utility=>get_json_boolean( emphasized ).
    INSERT temp102 INTO TABLE temp101.
    temp102-n = `number`.
    temp102-v = number.
    INSERT temp102 INTO TABLE temp101.
    temp102-n = `state`.
    temp102-v = state.
    INSERT temp102 INTO TABLE temp101.
    temp102-n = `unit`.
    temp102-v = unit.
    INSERT temp102 INTO TABLE temp101.
    _generic( name   = `ObjectNumber`
              t_prop = temp101 ).
  ENDMETHOD.


  METHOD object_page_dyn_header_title.
    result = _generic( name = `ObjectPageDynamicHeaderTitle`
                       ns   = `uxap` ).
  ENDMETHOD.


  METHOD object_page_layout.
    DATA temp103 TYPE ty_t_name_value.
    CLEAR temp103.
    DATA temp104 LIKE LINE OF temp103.
    temp104-n = `showTitleInHeaderContent`.
    temp104-v = lcl_utility=>get_json_boolean( showTitleInHeaderContent ).
    INSERT temp104 INTO TABLE temp103.
    temp104-n = `showEditHeaderButton`.
    temp104-v = lcl_utility=>get_json_boolean( showEditHeaderButton ).
    INSERT temp104 INTO TABLE temp103.
    temp104-n = `editHeaderButtonPress`.
    temp104-v = editHeaderButtonPress.
    INSERT temp104 INTO TABLE temp103.
    temp104-n = `upperCaseAnchorBar`.
    temp104-v = upperCaseAnchorBar.
    INSERT temp104 INTO TABLE temp103.
    result = _generic(
                 name   = `ObjectPageLayout`
                 ns     = `uxap`
                 t_prop = temp103 ).
  ENDMETHOD.


  METHOD object_page_section.
    DATA temp105 TYPE ty_t_name_value.
    CLEAR temp105.
    DATA temp106 LIKE LINE OF temp105.
    temp106-n = `titleUppercase`.
    temp106-v = lcl_utility=>get_json_boolean( titleUppercase ).
    INSERT temp106 INTO TABLE temp105.
    temp106-n = `title`.
    temp106-v = title.
    INSERT temp106 INTO TABLE temp105.
    temp106-n = `id`.
    temp106-v = id.
    INSERT temp106 INTO TABLE temp105.
    temp106-n = `importance`.
    temp106-v = importance.
    INSERT temp106 INTO TABLE temp105.
    result = _generic( name   = `ObjectPageSection`
                       ns     = `uxap`
                       t_prop = temp105 ).
  ENDMETHOD.


  METHOD object_page_sub_section.
    DATA temp107 TYPE ty_t_name_value.
    CLEAR temp107.
    DATA temp108 LIKE LINE OF temp107.
    temp108-n = `id`.
    temp108-v = id.
    INSERT temp108 INTO TABLE temp107.
    temp108-n = `title`.
    temp108-v = title.
    INSERT temp108 INTO TABLE temp107.
    result = _generic( name   = `ObjectPageSubSection`
                       ns     = `uxap`
                       t_prop = temp107 ).
  ENDMETHOD.


  METHOD overflow_toolbar.
    result = _generic( `OverflowToolbar` ).
  ENDMETHOD.


  METHOD overflow_toolbar_button.
    result = me.
    DATA temp109 TYPE ty_t_name_value.
    CLEAR temp109.
    DATA temp110 LIKE LINE OF temp109.
    temp110-n = `press`.
    temp110-v = press.
    INSERT temp110 INTO TABLE temp109.
    temp110-n = `text`.
    temp110-v = text.
    INSERT temp110 INTO TABLE temp109.
    temp110-n = `enabled`.
    temp110-v = lcl_utility=>get_json_boolean( enabled ).
    INSERT temp110 INTO TABLE temp109.
    temp110-n = `icon`.
    temp110-v = icon.
    INSERT temp110 INTO TABLE temp109.
    temp110-n = `type`.
    temp110-v = type.
    INSERT temp110 INTO TABLE temp109.
    temp110-n = `tooltip`.
    temp110-v = tooltip.
    INSERT temp110 INTO TABLE temp109.
    _generic( name   = `OverflowToolbarButton`
              t_prop = temp109 ).
  ENDMETHOD.


  METHOD overflow_toolbar_menu_button.
    DATA temp111 TYPE ty_t_name_value.
    CLEAR temp111.
    DATA temp112 LIKE LINE OF temp111.
    temp112-n = `buttonMode`.
    temp112-v = buttonMode.
    INSERT temp112 INTO TABLE temp111.
    temp112-n = `defaultAction`.
    temp112-v = defaultAction.
    INSERT temp112 INTO TABLE temp111.
    temp112-n = `text`.
    temp112-v = text.
    INSERT temp112 INTO TABLE temp111.
    temp112-n = `enabled`.
    temp112-v = lcl_utility=>get_json_boolean( enabled ).
    INSERT temp112 INTO TABLE temp111.
    temp112-n = `icon`.
    temp112-v = icon.
    INSERT temp112 INTO TABLE temp111.
    temp112-n = `type`.
    temp112-v = type.
    INSERT temp112 INTO TABLE temp111.
    temp112-n = `tooltip`.
    temp112-v = tooltip.
    INSERT temp112 INTO TABLE temp111.
    result = _generic( name   = `OverflowToolbarMenuButton`
                       t_prop = temp111 ).
  ENDMETHOD.


  METHOD overflow_toolbar_toggle_button.
    result = me.
    DATA temp113 TYPE ty_t_name_value.
    CLEAR temp113.
    DATA temp114 LIKE LINE OF temp113.
    temp114-n = `press`.
    temp114-v = press.
    INSERT temp114 INTO TABLE temp113.
    temp114-n = `text`.
    temp114-v = text.
    INSERT temp114 INTO TABLE temp113.
    temp114-n = `enabled`.
    temp114-v = lcl_utility=>get_json_boolean( enabled ).
    INSERT temp114 INTO TABLE temp113.
    temp114-n = `icon`.
    temp114-v = icon.
    INSERT temp114 INTO TABLE temp113.
    temp114-n = `type`.
    temp114-v = type.
    INSERT temp114 INTO TABLE temp113.
    temp114-n = `tooltip`.
    temp114-v = tooltip.
    INSERT temp114 INTO TABLE temp113.
    _generic( name   = `OverflowToolbarToggleButton`
              t_prop = temp113 ).
  ENDMETHOD.


  METHOD page.
    DATA temp115 TYPE ty_t_name_value.
    CLEAR temp115.
    DATA temp116 LIKE LINE OF temp115.
    temp116-n = `title`.
    temp116-v = title.
    INSERT temp116 INTO TABLE temp115.
    temp116-n = `showNavButton`.
    temp116-v = lcl_utility=>get_json_boolean( shownavbutton ).
    INSERT temp116 INTO TABLE temp115.
    temp116-n = `navButtonPress`.
    temp116-v = navbuttonpress.
    INSERT temp116 INTO TABLE temp115.
    temp116-n = `class`.
    temp116-v = class.
    INSERT temp116 INTO TABLE temp115.
    temp116-n = `id`.
    temp116-v = id.
    INSERT temp116 INTO TABLE temp115.
    result = _generic( name   = `Page`
                       ns     = ns
                       t_prop = temp115 ).
  ENDMETHOD.


  METHOD panel.
    DATA temp117 TYPE ty_t_name_value.
    CLEAR temp117.
    DATA temp118 LIKE LINE OF temp117.
    temp118-n = `expandable`.
    temp118-v = expandable.
    INSERT temp118 INTO TABLE temp117.
    temp118-n = `expanded`.
    temp118-v = expanded.
    INSERT temp118 INTO TABLE temp117.
    temp118-n = `headerText`.
    temp118-v = headertext.
    INSERT temp118 INTO TABLE temp117.
    result = _generic( name   = `Panel`
                       t_prop = temp117 ).
  ENDMETHOD.


  METHOD points.
    result = _generic( name = `points`
                       ns   = `mchart` ).
  ENDMETHOD.


  METHOD popover.
    DATA temp119 TYPE ty_t_name_value.
    CLEAR temp119.
    DATA temp120 LIKE LINE OF temp119.
    temp120-n = `title`.
    temp120-v = title.
    INSERT temp120 INTO TABLE temp119.
    temp120-n = `class`.
    temp120-v = class.
    INSERT temp120 INTO TABLE temp119.
    temp120-n = `placement`.
    temp120-v = placement.
    INSERT temp120 INTO TABLE temp119.
    temp120-n = `initialFocus`.
    temp120-v = initialFocus.
    INSERT temp120 INTO TABLE temp119.
    temp120-n = `contentHeight`.
    temp120-v = contentheight.
    INSERT temp120 INTO TABLE temp119.
    temp120-n = `contentWidth`.
    temp120-v = contentwidth.
    INSERT temp120 INTO TABLE temp119.
    result = _generic( name   = `Popover`
                       t_prop = temp119 ).
  ENDMETHOD.


  METHOD progress_indicator.
    result = me.
    DATA temp121 TYPE ty_t_name_value.
    CLEAR temp121.
    DATA temp122 LIKE LINE OF temp121.
    temp122-n = `percentValue`.
    temp122-v = percentvalue.
    INSERT temp122 INTO TABLE temp121.
    temp122-n = `displayValue`.
    temp122-v = displayvalue.
    INSERT temp122 INTO TABLE temp121.
    temp122-n = `showValue`.
    temp122-v = lcl_utility=>get_json_boolean( showvalue ).
    INSERT temp122 INTO TABLE temp121.
    temp122-n = `state`.
    temp122-v = state.
    INSERT temp122 INTO TABLE temp121.
    _generic( name   = `ProgressIndicator`
              t_prop = temp121 ).
  ENDMETHOD.


  METHOD radial_micro_chart.
    result = me.
    DATA temp123 TYPE ty_t_name_value.
    CLEAR temp123.
    DATA temp124 LIKE LINE OF temp123.
    temp124-n = `percentage`.
    temp124-v = percentage.
    INSERT temp124 INTO TABLE temp123.
    temp124-n = `press`.
    temp124-v = press.
    INSERT temp124 INTO TABLE temp123.
    temp124-n = `sice`.
    temp124-v = sice.
    INSERT temp124 INTO TABLE temp123.
    temp124-n = `valueColor`.
    temp124-v = valuecolor.
    INSERT temp124 INTO TABLE temp123.
    _generic( name   = `RadialMicroChart`
              ns     = `mchart`
              t_prop = temp123 ).
  ENDMETHOD.


  METHOD range_slider.
    result = me.
    DATA temp125 TYPE ty_t_name_value.
    CLEAR temp125.
    DATA temp126 LIKE LINE OF temp125.
    temp126-n = `class`.
    temp126-v = class.
    INSERT temp126 INTO TABLE temp125.
    temp126-n = `endValue`.
    temp126-v = endvalue.
    INSERT temp126 INTO TABLE temp125.
    temp126-n = `id`.
    temp126-v = id.
    INSERT temp126 INTO TABLE temp125.
    temp126-n = `labelInterval`.
    temp126-v = labelinterval.
    INSERT temp126 INTO TABLE temp125.
    temp126-n = `max`.
    temp126-v = max.
    INSERT temp126 INTO TABLE temp125.
    temp126-n = `min`.
    temp126-v = min.
    INSERT temp126 INTO TABLE temp125.
    temp126-n = `showTickmarks`.
    temp126-v = lcl_utility=>get_json_boolean( showtickmarks ).
    INSERT temp126 INTO TABLE temp125.
    temp126-n = `startValue`.
    temp126-v = startvalue.
    INSERT temp126 INTO TABLE temp125.
    temp126-n = `step`.
    temp126-v = step.
    INSERT temp126 INTO TABLE temp125.
    temp126-n = `width`.
    temp126-v = width.
    INSERT temp126 INTO TABLE temp125.
    _generic( name   = `RangeSlider`
              ns     = `webc`
              t_prop = temp125 ).
  ENDMETHOD.


  METHOD scroll_container.
    DATA temp127 TYPE ty_t_name_value.
    CLEAR temp127.
    DATA temp128 LIKE LINE OF temp127.
    temp128-n = `height`.
    temp128-v = height.
    INSERT temp128 INTO TABLE temp127.
    temp128-n = `width`.
    temp128-v = width.
    INSERT temp128 INTO TABLE temp127.
    temp128-n = `vertical`.
    temp128-v = lcl_utility=>get_json_boolean( vertical ).
    INSERT temp128 INTO TABLE temp127.
    temp128-n = `horizontal`.
    temp128-v = lcl_utility=>get_json_boolean( horizontal ).
    INSERT temp128 INTO TABLE temp127.
    temp128-n = `focusable`.
    temp128-v = lcl_utility=>get_json_boolean( focusable ).
    INSERT temp128 INTO TABLE temp127.
    result = _generic( name   = `ScrollContainer`
                       t_prop = temp127 ).
  ENDMETHOD.


  METHOD search_field.
    result = me.
    DATA temp129 TYPE ty_t_name_value.
    CLEAR temp129.
    DATA temp130 LIKE LINE OF temp129.
    temp130-n = `width`.
    temp130-v = width.
    INSERT temp130 INTO TABLE temp129.
    temp130-n = `search`.
    temp130-v = search.
    INSERT temp130 INTO TABLE temp129.
    temp130-n = `value`.
    temp130-v = value.
    INSERT temp130 INTO TABLE temp129.
    temp130-n = `id`.
    temp130-v = id.
    INSERT temp130 INTO TABLE temp129.
    temp130-n = `change`.
    temp130-v = change.
    INSERT temp130 INTO TABLE temp129.
    temp130-n = `liveChange`.
    temp130-v = liveChange.
    INSERT temp130 INTO TABLE temp129.
    _generic( name   = `SearchField`
              t_prop = temp129 ).
  ENDMETHOD.


  METHOD sections.
    result = _generic( name = `sections`
                       ns   = `uxap` ).
  ENDMETHOD.


  METHOD segmented_button.
    DATA temp131 TYPE ty_t_name_value.
    CLEAR temp131.
    DATA temp132 LIKE LINE OF temp131.
    temp132-n = `selectedKey`.
    temp132-v = selected_key.
    INSERT temp132 INTO TABLE temp131.
    temp132-n = `selectionChange`.
    temp132-v = selection_change.
    INSERT temp132 INTO TABLE temp131.
    result = _generic( name   = `SegmentedButton`
                       t_prop = temp131 ).
  ENDMETHOD.


  METHOD segmented_button_item.
    result = me.
    DATA temp133 TYPE ty_t_name_value.
    CLEAR temp133.
    DATA temp134 LIKE LINE OF temp133.
    temp134-n = `icon`.
    temp134-v = icon.
    INSERT temp134 INTO TABLE temp133.
    temp134-n = `key`.
    temp134-v = key.
    INSERT temp134 INTO TABLE temp133.
    temp134-n = `text`.
    temp134-v = text.
    INSERT temp134 INTO TABLE temp133.
    _generic( name   = `SegmentedButtonItem`
              t_prop = temp133 ).
  ENDMETHOD.


  METHOD segments.
    result = _generic( name = `segments`
                       ns   = `mchart` ).
  ENDMETHOD.


  METHOD shell.
    result = _generic( name = `Shell`
                       ns   = ns ).
  ENDMETHOD.


  METHOD simple_form.
    DATA temp135 TYPE ty_t_name_value.
    CLEAR temp135.
    DATA temp136 LIKE LINE OF temp135.
    temp136-n = `title`.
    temp136-v = title.
    INSERT temp136 INTO TABLE temp135.
    temp136-n = `layout`.
    temp136-v = layout.
    INSERT temp136 INTO TABLE temp135.
    temp136-n = `columnsXL`.
    temp136-v = columnsXL.
    INSERT temp136 INTO TABLE temp135.
    temp136-n = `columnsL`.
    temp136-v = columnsL.
    INSERT temp136 INTO TABLE temp135.
    temp136-n = `columnsM`.
    temp136-v = columnsm.
    INSERT temp136 INTO TABLE temp135.
    temp136-n = `editable`.
    temp136-v = lcl_utility=>get_json_boolean( editable ).
    INSERT temp136 INTO TABLE temp135.
    result = _generic( name   = `SimpleForm`
                       ns     = `form`
                       t_prop = temp135 ).
  ENDMETHOD.


  METHOD snapped_content.
    result = _generic( name = `snappedContent`
                       ns   = ns ).
  ENDMETHOD.


  METHOD snapped_heading.
    result = me.
    result = _generic( name = `snappedHeading`
                       ns   = `uxap` ).
  ENDMETHOD.


  METHOD snapped_title_on_mobile.
    result = _generic( name = `snappedTitleOnMobile`
                       ns   = `uxap` ).
  ENDMETHOD.


  METHOD standard_list_item.
    result = me.
    DATA temp137 TYPE ty_t_name_value.
    CLEAR temp137.
    DATA temp138 LIKE LINE OF temp137.
    temp138-n = `title`.
    temp138-v = title.
    INSERT temp138 INTO TABLE temp137.
    temp138-n = `description`.
    temp138-v = description.
    INSERT temp138 INTO TABLE temp137.
    temp138-n = `icon`.
    temp138-v = icon.
    INSERT temp138 INTO TABLE temp137.
    temp138-n = `info`.
    temp138-v = info.
    INSERT temp138 INTO TABLE temp137.
    temp138-n = `press`.
    temp138-v = press.
    INSERT temp138 INTO TABLE temp137.
    temp138-n = `type`.
    temp138-v = type.
    INSERT temp138 INTO TABLE temp137.
    temp138-n = `selected`.
    temp138-v = selected.
    INSERT temp138 INTO TABLE temp137.
    _generic( name   = `StandardListItem`
              t_prop = temp137 ).
  ENDMETHOD.


  METHOD step_input.
    result = me.
    DATA temp139 TYPE ty_t_name_value.
    CLEAR temp139.
    DATA temp140 LIKE LINE OF temp139.
    temp140-n = `max`.
    temp140-v = max.
    INSERT temp140 INTO TABLE temp139.
    temp140-n = `min`.
    temp140-v = min.
    INSERT temp140 INTO TABLE temp139.
    temp140-n = `step`.
    temp140-v = step.
    INSERT temp140 INTO TABLE temp139.
    temp140-n = `value`.
    temp140-v = value.
    INSERT temp140 INTO TABLE temp139.
    _generic( name   = `StepInput`
              t_prop = temp139 ).
  ENDMETHOD.


  METHOD sub_header.
    result = _generic( `subHeader` ).
  ENDMETHOD.


  METHOD sub_sections.
    result = me.
    result = _generic( name = `subSections`
                       ns   = `uxap` ).
  ENDMETHOD.


  METHOD suggestion_items.
    result = _generic( `suggestionItems` ).
  ENDMETHOD.


  METHOD switch.
    result = me.
    DATA temp141 TYPE ty_t_name_value.
    CLEAR temp141.
    DATA temp142 LIKE LINE OF temp141.
    temp142-n = `type`.
    temp142-v = type.
    INSERT temp142 INTO TABLE temp141.
    temp142-n = `enabled`.
    temp142-v = lcl_utility=>get_json_boolean( enabled ).
    INSERT temp142 INTO TABLE temp141.
    temp142-n = `state`.
    temp142-v = state.
    INSERT temp142 INTO TABLE temp141.
    temp142-n = `customTextOff`.
    temp142-v = customtextoff.
    INSERT temp142 INTO TABLE temp141.
    temp142-n = `customTextOn`.
    temp142-v = customtexton.
    INSERT temp142 INTO TABLE temp141.
    _generic( name   = `Switch`
              t_prop = temp141 ).
  ENDMETHOD.


  METHOD tab.
    DATA temp143 TYPE ty_t_name_value.
    CLEAR temp143.
    DATA temp144 LIKE LINE OF temp143.
    temp144-n = `text`.
    temp144-v = text.
    INSERT temp144 INTO TABLE temp143.
    temp144-n = `selected`.
    temp144-v = selected.
    INSERT temp144 INTO TABLE temp143.
    result = _generic( name   = `Tab`
                       ns     = `webc`
                       t_prop = temp143 ).
  ENDMETHOD.


  METHOD table.
    DATA temp145 TYPE ty_t_name_value.
    CLEAR temp145.
    DATA temp146 LIKE LINE OF temp145.
    temp146-n = `items`.
    temp146-v = items.
    INSERT temp146 INTO TABLE temp145.
    temp146-n = `headerText`.
    temp146-v = headertext.
    INSERT temp146 INTO TABLE temp145.
    temp146-n = `growing`.
    temp146-v = growing.
    INSERT temp146 INTO TABLE temp145.
    temp146-n = `growingThreshold`.
    temp146-v = growingthreshold.
    INSERT temp146 INTO TABLE temp145.
    temp146-n = `growingScrollToLoad`.
    temp146-v = growingscrolltoload.
    INSERT temp146 INTO TABLE temp145.
    temp146-n = `sticky`.
    temp146-v = sticky.
    INSERT temp146 INTO TABLE temp145.
    temp146-n = `mode`.
    temp146-v = mode.
    INSERT temp146 INTO TABLE temp145.
    temp146-n = `width`.
    temp146-v = width.
    INSERT temp146 INTO TABLE temp145.
    temp146-n = `selectionChange`.
    temp146-v = selectionchange.
    INSERT temp146 INTO TABLE temp145.
    temp146-n = `alternateRowColors`.
    temp146-v = lcl_utility=>get_json_boolean( alternateRowColors ).
    INSERT temp146 INTO TABLE temp145.
    temp146-n = `autoPopinMode`.
    temp146-v = lcl_utility=>get_json_boolean( autoPopinMode ).
    INSERT temp146 INTO TABLE temp145.
    result = _generic( name   = `Table`
                       t_prop = temp145 ).
  ENDMETHOD.


  METHOD tab_container.
    result = _generic( name = `TabContainer`
                       ns   = `webc` ).
  ENDMETHOD.


  METHOD text.
    result = me.
    DATA temp147 TYPE ty_t_name_value.
    CLEAR temp147.
    DATA temp148 LIKE LINE OF temp147.
    temp148-n = `text`.
    temp148-v = text.
    INSERT temp148 INTO TABLE temp147.
    temp148-n = `class`.
    temp148-v = class.
    INSERT temp148 INTO TABLE temp147.
    _generic( name   = `Text`
              ns     = ns
              t_prop = temp147 ).
  ENDMETHOD.


  METHOD text_area.
    result = me.
    DATA temp149 TYPE ty_t_name_value.
    CLEAR temp149.
    DATA temp150 LIKE LINE OF temp149.
    temp150-n = `value`.
    temp150-v = value.
    INSERT temp150 INTO TABLE temp149.
    temp150-n = `rows`.
    temp150-v = rows.
    INSERT temp150 INTO TABLE temp149.
    temp150-n = `height`.
    temp150-v = height.
    INSERT temp150 INTO TABLE temp149.
    temp150-n = `width`.
    temp150-v = width.
    INSERT temp150 INTO TABLE temp149.
    temp150-n = `editable`.
    temp150-v = lcl_utility=>get_json_boolean( editable ).
    INSERT temp150 INTO TABLE temp149.
    temp150-n = `enabled`.
    temp150-v = lcl_utility=>get_json_boolean( enabled ).
    INSERT temp150 INTO TABLE temp149.
    temp150-n = `id`.
    temp150-v = id.
    INSERT temp150 INTO TABLE temp149.
    temp150-n = `growing`.
    temp150-v = lcl_utility=>get_json_boolean( growing ).
    INSERT temp150 INTO TABLE temp149.
    temp150-n = `growingMaxLines`.
    temp150-v = growingmaxlines.
    INSERT temp150 INTO TABLE temp149.
    _generic( name   = `TextArea`
              t_prop = temp149 ).
  ENDMETHOD.


  METHOD time_picker.
    result = me.
    DATA temp151 TYPE ty_t_name_value.
    CLEAR temp151.
    DATA temp152 LIKE LINE OF temp151.
    temp152-n = `value`.
    temp152-v = value.
    INSERT temp152 INTO TABLE temp151.
    temp152-n = `placeholder`.
    temp152-v = placeholder.
    INSERT temp152 INTO TABLE temp151.
    _generic( name   = `TimePicker`
              t_prop = temp151 ).
  ENDMETHOD.


  METHOD title.
    DATA lv_name TYPE c LENGTH 5.
    DATA temp3 LIKE lv_name.
    IF ns = 'f'.
      temp3 = 'title'.
    ELSE.
      temp3 = `Title`.
    ENDIF.
    lv_name = temp3.

    result = me.
    DATA temp154 TYPE ty_t_name_value.
    CLEAR temp154.
    DATA temp155 LIKE LINE OF temp154.
    temp155-n = `text`.
    temp155-v = text.
    INSERT temp155 INTO TABLE temp154.
    temp155-n = `wrapping`.
    temp155-v = lcl_utility=>get_json_boolean( wrapping ).
    INSERT temp155 INTO TABLE temp154.
    temp155-n = `level`.
    temp155-v = level.
    INSERT temp155 INTO TABLE temp154.
    _generic( ns     = ns
              name   = lv_name
              t_prop = temp154 ).
  ENDMETHOD.


  METHOD toggle_button.
    result = me.
    DATA temp156 TYPE ty_t_name_value.
    CLEAR temp156.
    DATA temp157 LIKE LINE OF temp156.
    temp157-n = `press`.
    temp157-v = press.
    INSERT temp157 INTO TABLE temp156.
    temp157-n = `text`.
    temp157-v = text.
    INSERT temp157 INTO TABLE temp156.
    temp157-n = `enabled`.
    temp157-v = lcl_utility=>get_json_boolean( enabled ).
    INSERT temp157 INTO TABLE temp156.
    temp157-n = `icon`.
    temp157-v = icon.
    INSERT temp157 INTO TABLE temp156.
    temp157-n = `type`.
    temp157-v = type.
    INSERT temp157 INTO TABLE temp156.
    temp157-n = `class`.
    temp157-v = class.
    INSERT temp157 INTO TABLE temp156.
    _generic( name   = `ToggleButton`
              t_prop = temp156 ).
  ENDMETHOD.


  METHOD token.
    result = me.
    DATA temp158 TYPE ty_t_name_value.
    CLEAR temp158.
    DATA temp159 LIKE LINE OF temp158.
    temp159-n = `key`.
    temp159-v = key.
    INSERT temp159 INTO TABLE temp158.
    temp159-n = `text`.
    temp159-v = text.
    INSERT temp159 INTO TABLE temp158.
    temp159-n = `selected`.
    temp159-v = selected.
    INSERT temp159 INTO TABLE temp158.
    temp159-n = `visible`.
    temp159-v = visible.
    INSERT temp159 INTO TABLE temp158.
    temp159-n = `editable`.
    temp159-v = editable.
    INSERT temp159 INTO TABLE temp158.
    _generic( name   = `Token`
              t_prop = temp158 ).
  ENDMETHOD.


  METHOD tokens.
    result = _generic( `tokens` ).
  ENDMETHOD.


  METHOD toolbar.
    result = _generic( `Toolbar` ).
  ENDMETHOD.


  METHOD toolbar_spacer.
    result = me.
    _generic( name = `ToolbarSpacer`
              ns   = ns ).
  ENDMETHOD.


  METHOD vbox.
    DATA temp160 TYPE ty_t_name_value.
    CLEAR temp160.
    DATA temp161 LIKE LINE OF temp160.
    temp161-n = `height`.
    temp161-v = height.
    INSERT temp161 INTO TABLE temp160.
    temp161-n = `justifyContent`.
    temp161-v = justifyContent.
    INSERT temp161 INTO TABLE temp160.
    temp161-n = `class`.
    temp161-v = class.
    INSERT temp161 INTO TABLE temp160.
    result = _generic( name   = `VBox`
                       t_prop = temp160 ).
  ENDMETHOD.


  METHOD vertical_layout.
    DATA temp162 TYPE ty_t_name_value.
    CLEAR temp162.
    DATA temp163 LIKE LINE OF temp162.
    temp163-n = `class`.
    temp163-v = class.
    INSERT temp163 INTO TABLE temp162.
    temp163-n = `width`.
    temp163-v = width.
    INSERT temp163 INTO TABLE temp162.
    result = _generic( name   = `VerticalLayout`
                       ns     = `layout`
                       t_prop = temp162 ).
  ENDMETHOD.


  METHOD xml_get.
    CASE m_name.
      WHEN `ZZPLAIN`.
        DATA temp164 LIKE LINE OF mt_prop.
        DATA temp165 LIKE sy-tabix.
        temp165 = sy-tabix.
        READ TABLE mt_prop WITH KEY n = `VALUE` INTO temp164.
        sy-tabix = temp165.
        IF sy-subrc <> 0.
          RAISE EXCEPTION TYPE cx_sy_itab_line_not_found.
        ENDIF.
        result = temp164-v.
        RETURN.
    ENDCASE.

    DATA temp166 TYPE string.
    IF m_ns <> ``.
      temp166 = |{ m_ns }:|.
    ELSE.
      CLEAR temp166.
    ENDIF.
    DATA lv_tmp2 LIKE temp166.
    lv_tmp2 = temp166.
    DATA temp167 TYPE string.
    DATA val TYPE string.
    val = ``.
    DATA row LIKE LINE OF mt_prop.
    LOOP AT mt_prop INTO row WHERE v <> ``.
      DATA temp4 TYPE string.
      IF row-v = abap_true.
        temp4 = `true`.
      ELSE.
        temp4 = row-v.
      ENDIF.
      val = |{ val } { row-n }="{ escape( val = temp4 format = cl_abap_format=>e_xml_attr ) }" \n |.
    ENDLOOP.
    temp167 = val.
    DATA lv_tmp3 LIKE temp167.
    lv_tmp3 = temp167.

    result = |{ result } <{ lv_tmp2 }{ m_name } \n { lv_tmp3 }|.

    IF t_child IS INITIAL.
      result = |{ result }/>|.
      RETURN.
    ENDIF.

    result = |{ result }>|.

    DATA lr_child LIKE LINE OF t_child.
    LOOP AT t_child INTO lr_child.
      DATA temp168 TYPE REF TO z2ui5_cl_xml_view.
      temp168 ?= lr_child.
      result = result && temp168->xml_get( ).
    ENDLOOP.

    DATA temp169 TYPE string.
    IF m_ns <> ||.
      temp169 = |{ m_ns }:|.
    ELSE.
      CLEAR temp169.
    ENDIF.
    DATA lv_ns LIKE temp169.
    lv_ns = temp169.
    result = |{ result }</{ lv_ns }{ m_name }>|.
  ENDMETHOD.


  METHOD zz_plain.
    result = me.
    DATA temp170 TYPE ty_t_name_value.
    CLEAR temp170.
    DATA temp171 LIKE LINE OF temp170.
    temp171-n = `VALUE`.
    temp171-v = val.
    INSERT temp171 INTO TABLE temp170.
    _generic( name   = `ZZPLAIN`
              t_prop = temp170 ).
  ENDMETHOD.


  METHOD _generic.
    DATA result2 TYPE REF TO z2ui5_cl_xml_view.
    CREATE OBJECT result2 TYPE z2ui5_cl_xml_view.
    result2->m_name   = name.
    result2->m_ns     = ns.
    result2->mt_prop  = t_prop.
    result2->m_parent = me.
    result2->m_root   = m_root.
    INSERT result2 INTO TABLE t_child.

    m_root->m_last = result2.
    result = result2.
  ENDMETHOD.
ENDCLASS.
