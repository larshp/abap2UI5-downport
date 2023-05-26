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

    DATA m_name  TYPE string.
    DATA m_ns    TYPE string.
    DATA mt_prop TYPE ty_t_name_value.

    DATA m_root    TYPE REF TO z2ui5_cl_xml_view.
    DATA m_last    TYPE REF TO z2ui5_cl_xml_view.
    DATA m_parent  TYPE REF TO z2ui5_cl_xml_view.
    DATA t_child TYPE STANDARD TABLE OF REF TO z2ui5_cl_xml_view WITH DEFAULT KEY.

    CLASS-METHODS factory
      IMPORTING
        t_ns          TYPE ty_t_name_value OPTIONAL
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    CLASS-METHODS factory_popup
      IMPORTING
        t_ns          TYPE ty_t_name_value OPTIONAL
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    CLASS-METHODS hlp_get_source_code_url
      IMPORTING
        app           TYPE REF TO z2ui5_if_app
        get           TYPE z2ui5_if_client=>ty_s_get
      RETURNING
        VALUE(result) TYPE string.

    CLASS-METHODS hlp_replace_controller_name
      IMPORTING
        xml           TYPE string
      RETURNING
        VALUE(result) TYPE string.

    METHODS constructor.

    METHODS horizontal_layout
      IMPORTING
        class         TYPE clike OPTIONAL
        width         TYPE clike OPTIONAL
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS Dynamic_Page
      IMPORTING
        headerExpanded           TYPE clike OPTIONAL
        headerPinned             TYPE clike OPTIONAL
        toggleHeaderOnTitleClick TYPE clike OPTIONAL
      RETURNING
        VALUE(result)            TYPE REF TO z2ui5_cl_xml_view.

    METHODS Dynamic_Page_Title
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS Dynamic_Page_Header
      IMPORTING
        pinnable      TYPE clike OPTIONAL
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS Illustrated_Message
      IMPORTING
        enableVerticalResponsiveness TYPE clike OPTIONAL
        illustrationType             TYPE clike OPTIONAL
      RETURNING
        VALUE(result)                TYPE REF TO z2ui5_cl_xml_view.

    METHODS additional_Content
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS flex_box
      IMPORTING
        class          TYPE clike OPTIONAL
        rendertype     TYPE clike OPTIONAL
        width          TYPE clike OPTIONAL
        fitContainer   TYPE clike OPTIONAL
        height         TYPE clike OPTIONAL
        alignitems     TYPE clike OPTIONAL
        justifycontent TYPE clike OPTIONAL
        wrap           TYPE clike OPTIONAL
      RETURNING
        VALUE(result)  TYPE REF TO z2ui5_cl_xml_view.

    METHODS popover
      IMPORTING
        title         TYPE clike OPTIONAL
        class         TYPE clike OPTIONAL
        placement     TYPE clike OPTIONAL
        initialFocus  TYPE clike OPTIONAL
        contentwidth  TYPE clike OPTIONAL
        contentheight TYPE clike OPTIONAL
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS list_item
      IMPORTING
        text           TYPE clike OPTIONAL
        additionaltext TYPE clike OPTIONAL
      RETURNING
        VALUE(result)  TYPE REF TO z2ui5_cl_xml_view.

    METHODS table
      IMPORTING
        items               TYPE clike OPTIONAL
        growing             TYPE clike OPTIONAL
        growingthreshold    TYPE clike OPTIONAL
        growingscrolltoload TYPE clike OPTIONAL
        headertext          TYPE clike OPTIONAL
        sticky              TYPE clike OPTIONAL
        mode                TYPE clike OPTIONAL
        width               TYPE clike OPTIONAL
        selectionchange     TYPE clike OPTIONAL
        alternateRowColors  TYPE clike OPTIONAL
        autoPopinMode    TYPE clike OPTIONAL
          PREFERRED PARAMETER items
      RETURNING
        VALUE(result)       TYPE REF TO z2ui5_cl_xml_view.

    METHODS message_strip
      IMPORTING
        text          TYPE clike OPTIONAL
        type          TYPE clike OPTIONAL
        showicon      TYPE clike OPTIONAL
        class         TYPE clike OPTIONAL
          PREFERRED PARAMETER text
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS footer
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS message_page
      IMPORTING
        show_header         TYPE clike OPTIONAL
        text                TYPE clike OPTIONAL
        enableformattedtext TYPE clike OPTIONAL
        description         TYPE clike OPTIONAL
        icon                TYPE clike OPTIONAL
      RETURNING
        VALUE(result)       TYPE REF TO z2ui5_cl_xml_view.

    METHODS object_page_layout
      IMPORTING
        showTitleInHeaderContent TYPE clike OPTIONAL
        showEditHeaderButton     TYPE clike OPTIONAL
        editHeaderButtonPress    TYPE clike OPTIONAL
        upperCaseAnchorBar       TYPE clike OPTIONAL
      RETURNING
        VALUE(result)            TYPE REF TO z2ui5_cl_xml_view.

    METHODS Object_Page_Dyn_Header_Title
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS expanded_heading
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS snapped_heading
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS expanded_content
      IMPORTING
        ns            TYPE clike
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS snapped_content
      IMPORTING
        ns            TYPE clike
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS heading
      IMPORTING
        ns            TYPE clike
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS actions
      IMPORTING
        ns            TYPE clike
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS snapped_Title_On_Mobile
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS header
        importing
        ns type clike default `f`
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS navigation_actions
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS avatar
      IMPORTING
        src           TYPE clike OPTIONAL
        class         TYPE clike OPTIONAL
        displaysize   TYPE clike OPTIONAL
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS header_title
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS sections
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS Object_Page_Section
      IMPORTING
        titleUppercase TYPE clike OPTIONAL
        title          TYPE clike OPTIONAL
        importance     TYPE clike OPTIONAL
        id             TYPE clike OPTIONAL
      RETURNING
        VALUE(result)  TYPE REF TO z2ui5_cl_xml_view.

    METHODS sub_sections
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS Object_page_Sub_Section
      IMPORTING
        id            TYPE clike OPTIONAL
        title         TYPE clike OPTIONAL
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS shell
      IMPORTING
        ns            TYPE clike OPTIONAL
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.
    METHODS blocks
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS layout_data
      IMPORTING
        ns            TYPE clike OPTIONAL
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS flex_item_data
      IMPORTING
        growfactor       TYPE clike OPTIONAL
        basesize         TYPE clike OPTIONAL
        backgrounddesign TYPE clike OPTIONAL
        styleclass       TYPE clike OPTIONAL
      RETURNING
        VALUE(result)    TYPE REF TO z2ui5_cl_xml_view.

    METHODS code_editor
      IMPORTING
        value         TYPE clike OPTIONAL
        type          TYPE clike OPTIONAL
        height        TYPE clike OPTIONAL
        width         TYPE clike OPTIONAL
        editable      TYPE clike OPTIONAL
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS suggestion_items
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS vertical_layout
      IMPORTING
        class         TYPE clike OPTIONAL
        width         TYPE clike OPTIONAL
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS multi_input
      IMPORTING
        showclearicon   TYPE clike OPTIONAL
        showValueHelp   TYPE clike OPTIONAL
        suggestionitems TYPE clike OPTIONAL
        width           TYPE clike OPTIONAL
        tokens          TYPE clike OPTIONAL
      RETURNING
        VALUE(result)   TYPE REF TO z2ui5_cl_xml_view.

    METHODS tokens
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS token
      IMPORTING
        key           TYPE clike OPTIONAL
        text          TYPE clike OPTIONAL
        selected      TYPE clike OPTIONAL
        visible       TYPE clike OPTIONAL
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS input
      IMPORTING
        id               TYPE clike OPTIONAL
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
          PREFERRED PARAMETER value
      RETURNING
        VALUE(result)    TYPE REF TO z2ui5_cl_xml_view.

    METHODS dialog
      IMPORTING
        title         TYPE clike OPTIONAL
        icon          TYPE clike OPTIONAL
        showheader    TYPE clike OPTIONAL
        stretch       TYPE clike OPTIONAL
        contentheight TYPE clike OPTIONAL
        contentwidth  TYPE clike OPTIONAL
        resizable     TYPE clike OPTIONAL
          PREFERRED PARAMETER title
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS buttons
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS get_root
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS get_parent
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS get
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS get_child
      IMPORTING
        index         TYPE i DEFAULT 1
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS columns
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS column
      IMPORTING
        width          TYPE clike OPTIONAL
        minScreenWidth TYPE clike OPTIONAL
        demandPopin    TYPE clike OPTIONAL
        PREFERRED PARAMETER width
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS items
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS interact_donut_chart
      IMPORTING
        selectionchanged  TYPE clike OPTIONAL
        errormessage      TYPE clike OPTIONAL
        errormessagetitle TYPE clike OPTIONAL
        showerror         TYPE clike OPTIONAL
        displayedsegments TYPE clike OPTIONAL
        press             TYPE clike OPTIONAL
      RETURNING
        VALUE(result)     TYPE REF TO z2ui5_cl_xml_view.

    METHODS segments
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS interact_donut_chart_segment
      IMPORTING
        label          TYPE clike OPTIONAL
        value          TYPE clike OPTIONAL
        displayedvalue TYPE clike OPTIONAL
        selected       TYPE clike OPTIONAL
      RETURNING
        VALUE(result)  TYPE REF TO z2ui5_cl_xml_view.

    METHODS interact_bar_chart
      IMPORTING
        selectionchanged  TYPE clike OPTIONAL
        press             TYPE clike OPTIONAL
        labelwidth        TYPE clike OPTIONAL
        errormessage      TYPE clike OPTIONAL
        errormessagetitle TYPE clike OPTIONAL
        showerror         TYPE clike OPTIONAL
      RETURNING
        VALUE(result)     TYPE REF TO z2ui5_cl_xml_view.

    METHODS bars
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS interact_bar_chart_bar
      IMPORTING
        label          TYPE clike OPTIONAL
        value          TYPE clike OPTIONAL
        displayedvalue TYPE clike OPTIONAL
        selected       TYPE clike OPTIONAL
      RETURNING
        VALUE(result)  TYPE REF TO z2ui5_cl_xml_view.

    METHODS interact_line_chart
      IMPORTING
        selectionchanged  TYPE clike OPTIONAL
        press             TYPE clike OPTIONAL
        precedingpoint    TYPE clike OPTIONAL
        succeddingpoint   TYPE clike OPTIONAL
        errormessage      TYPE clike OPTIONAL
        errormessagetitle TYPE clike OPTIONAL
        showerror         TYPE clike OPTIONAL
      RETURNING
        VALUE(result)     TYPE REF TO z2ui5_cl_xml_view.

    METHODS points
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS interact_line_chart_point
      IMPORTING
        label          TYPE clike OPTIONAL
        value          TYPE clike OPTIONAL
        secondarylabel TYPE clike OPTIONAL
        displayedvalue TYPE clike OPTIONAL
        selected       TYPE clike OPTIONAL
      RETURNING
        VALUE(result)  TYPE REF TO z2ui5_cl_xml_view.

    METHODS radial_micro_chart
      IMPORTING
        sice          TYPE clike OPTIONAL
        percentage    TYPE clike OPTIONAL
        press         TYPE clike OPTIONAL
        valuecolor    TYPE clike OPTIONAL
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS column_list_item
      IMPORTING
        valign        TYPE clike OPTIONAL
        selected      TYPE clike OPTIONAL
        type          TYPE clike OPTIONAL
        press         TYPE clike OPTIONAL
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS cells
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS bar
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS content_left
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS content_middle
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS content_right
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS custom_header
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS header_content
      IMPORTING
        ns            TYPE clike OPTIONAL
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS sub_header
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS custom_data
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS badge_custom_data
      IMPORTING
        key           TYPE clike OPTIONAL
        value         TYPE clike OPTIONAL
        visible       TYPE clike OPTIONAL
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS toggle_button
      IMPORTING
        text          TYPE clike OPTIONAL
        icon          TYPE clike OPTIONAL
        type          TYPE clike OPTIONAL
        enabled       TYPE clike OPTIONAL
        press         TYPE clike OPTIONAL
        class         TYPE clike OPTIONAL
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS button
      IMPORTING
        text          TYPE clike OPTIONAL
        icon          TYPE clike OPTIONAL
        type          TYPE clike OPTIONAL
        enabled       TYPE clike OPTIONAL
        press         TYPE clike OPTIONAL
        class         TYPE clike OPTIONAL
        id            TYPE clike OPTIONAL
        ns            TYPE clike OPTIONAL
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS search_field
      IMPORTING
        search         TYPE clike OPTIONAL
        width          TYPE clike OPTIONAL
        value          TYPE clike OPTIONAL
        id             TYPE clike OPTIONAL
        change         TYPE clike OPTIONAL
        liveChange     TYPE clike OPTIONAL
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS message_view
      IMPORTING
        items         TYPE clike OPTIONAL
        groupItems    TYPE clike OPTIONAL
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS message_popover
      IMPORTING
        items         TYPE clike OPTIONAL
        groupItems    TYPE clike OPTIONAL
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS message_item
      IMPORTING
        type          TYPE clike OPTIONAL
        title         TYPE clike OPTIONAL
        subtitle      TYPE clike OPTIONAL
        description   TYPE clike OPTIONAL
        groupName     TYPE clike OPTIONAL
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS page
      IMPORTING
        title          TYPE clike OPTIONAL
        navbuttonpress TYPE clike OPTIONAL
        shownavbutton  TYPE clike OPTIONAL
        id             TYPE clike OPTIONAL
        class          TYPE clike OPTIONAL
        ns             TYPE clike OPTIONAL
          PREFERRED PARAMETER title
      RETURNING
        VALUE(result)  TYPE REF TO z2ui5_cl_xml_view.

    METHODS vbox
      IMPORTING
        height        TYPE clike OPTIONAL
        class         TYPE clike OPTIONAL
          PREFERRED PARAMETER class
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS hbox
      IMPORTING
        class          TYPE clike OPTIONAL
        justifycontent TYPE clike OPTIONAL
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS scroll_container
      IMPORTING
        height        TYPE clike OPTIONAL
        width         TYPE clike OPTIONAL
        vertical      TYPE clike OPTIONAL
        horizontal    TYPE clike OPTIONAL
        focusable     TYPE clike OPTIONAL
          PREFERRED PARAMETER height
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS simple_form
      IMPORTING
        title         TYPE clike OPTIONAL
        layout        TYPE clike OPTIONAL
        editable      TYPE clike OPTIONAL
        columnsXL     TYPE clike OPTIONAL
        columnsL      TYPE clike OPTIONAL
        columnsM      TYPE clike OPTIONAL
          PREFERRED PARAMETER title
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS zz_plain
      IMPORTING
        val           TYPE clike OPTIONAL
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS content
      IMPORTING
        ns            TYPE clike OPTIONAL
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS title
      IMPORTING
        ns            TYPE clike OPTIONAL
        text          TYPE clike OPTIONAL
        wrapping      TYPE clike OPTIONAL
        level         type clike optional
          PREFERRED PARAMETER text
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS tab_container
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS tab
      IMPORTING
        text          TYPE clike OPTIONAL
        selected      TYPE clike OPTIONAL
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS overflow_toolbar
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS overflow_toolbar_toggle_button
      IMPORTING
        text          TYPE clike OPTIONAL
        icon          TYPE clike OPTIONAL
        type          TYPE clike OPTIONAL
        enabled       TYPE clike OPTIONAL
        press         TYPE clike OPTIONAL
        tooltip       TYPE clike OPTIONAL
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS overflow_toolbar_button
      IMPORTING
        text          TYPE clike OPTIONAL
        icon          TYPE clike OPTIONAL
        type          TYPE clike OPTIONAL
        enabled       TYPE clike OPTIONAL
        press         TYPE clike OPTIONAL
        tooltip       TYPE clike OPTIONAL
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS overflow_toolbar_menu_button
      IMPORTING
        text          TYPE clike OPTIONAL
        icon          TYPE clike OPTIONAL
        buttonmode    type clike optional
        type          TYPE clike OPTIONAL
        enabled       TYPE clike OPTIONAL
        tooltip       TYPE clike OPTIONAl
        defaultaction type clike optional
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS menu_item
      IMPORTING
        press         TYPE clike OPTIONAL
        text          TYPE clike OPTIONAL
        icon          TYPE clike OPTIONAL
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS toolbar_spacer
      IMPORTING
        ns            TYPE clike OPTIONAL
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS label
      IMPORTING
        text          TYPE clike OPTIONAL
        labelfor          TYPE clike OPTIONAL
        PREFERRED PARAMETER text
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS image
      IMPORTING
        src           TYPE clike OPTIONAL
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS date_picker
      IMPORTING
        value         TYPE clike OPTIONAL
        placeholder   TYPE clike OPTIONAL
          PREFERRED PARAMETER value
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS time_picker
      IMPORTING
        value         TYPE clike OPTIONAL
        placeholder   TYPE clike OPTIONAL
          PREFERRED PARAMETER value
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS date_time_picker
      IMPORTING
        value         TYPE clike OPTIONAL
        placeholder   TYPE clike OPTIONAL
          PREFERRED PARAMETER value
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS link
      IMPORTING
        text          TYPE clike OPTIONAL
        href          TYPE clike OPTIONAL
        target        TYPE clike OPTIONAL
        enabled       TYPE clike OPTIONAL
        press         TYPE clike OPTIONAL
        id            TYPE clike OPTIONAL
        ns            TYPE clike OPTIONAL
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS list
      IMPORTING
        headertext      TYPE clike OPTIONAL
        items           TYPE clike OPTIONAL
        mode            TYPE clike OPTIONAL
        selectionChange TYPE clike OPTIONAL
      RETURNING
        VALUE(result)   TYPE REF TO  z2ui5_cl_xml_view.

    METHODS custom_list_item
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS input_list_item
      IMPORTING
        label         TYPE clike OPTIONAL
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS standard_list_item
      IMPORTING
        title         TYPE clike OPTIONAL
        description   TYPE clike OPTIONAL
        icon          TYPE clike OPTIONAL
        info          TYPE clike OPTIONAL
        press         TYPE clike OPTIONAL
        type          TYPE clike OPTIONAL
        selected      TYPE clike OPTIONAL
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS item
      IMPORTING
        key           TYPE clike OPTIONAL
        text          TYPE clike OPTIONAL
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS segmented_button_item
      IMPORTING
        icon          TYPE clike OPTIONAL
        key           TYPE clike OPTIONAL
        text          TYPE clike OPTIONAL
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS combobox
      IMPORTING
        selectedkey   TYPE clike OPTIONAL
        showclearicon TYPE clike OPTIONAL
        label         TYPE clike OPTIONAL
        items         TYPE clike OPTIONAL
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS grid
      IMPORTING
        class         TYPE clike OPTIONAL
        default_span  TYPE clike OPTIONAL
          PREFERRED PARAMETER default_span
      RETURNING
        VALUE(result) TYPE REF TO  z2ui5_cl_xml_view.

    METHODS grid_data
      IMPORTING
        span          TYPE clike OPTIONAL
          PREFERRED PARAMETER span
      RETURNING
        VALUE(result) TYPE REF TO  z2ui5_cl_xml_view.

    METHODS text_area
      IMPORTING
        value           TYPE clike OPTIONAL
        rows            TYPE clike OPTIONAL
        height          TYPE clike OPTIONAL
        width           TYPE clike OPTIONAL
        editable        TYPE clike OPTIONAL
        enabled         TYPE clike OPTIONAL
        growing         TYPE clike OPTIONAL
        growingmaxlines TYPE clike OPTIONAL
        id              TYPE clike OPTIONAL
          PREFERRED PARAMETER value
      RETURNING
        VALUE(result)   TYPE REF TO  z2ui5_cl_xml_view.

    METHODS range_slider
      IMPORTING
        max           TYPE clike OPTIONAL
        min           TYPE clike OPTIONAL
        step          TYPE clike OPTIONAL
        startvalue    TYPE clike OPTIONAL
        endvalue      TYPE clike OPTIONAL
        showtickmarks TYPE clike OPTIONAL
        labelinterval TYPE clike OPTIONAL
        width         TYPE clike OPTIONAL
        class         TYPE clike OPTIONAL
        id            TYPE clike OPTIONAL
      RETURNING
        VALUE(result) TYPE REF TO  z2ui5_cl_xml_view.

    METHODS generic_tag
      IMPORTING
        arialabelledby TYPE clike OPTIONAL
        text           TYPE clike OPTIONAL
        design         TYPE clike OPTIONAL
        status         TYPE clike OPTIONAL
        class          TYPE clike OPTIONAL
      RETURNING
        VALUE(result)  TYPE REF TO z2ui5_cl_xml_view.

    METHODS object_attribute
      IMPORTING
        title         TYPE clike OPTIONAL
        text          TYPE clike OPTIONAL
      RETURNING
        VALUE(result) TYPE REF TO  z2ui5_cl_xml_view.

    METHODS object_number
      IMPORTING
        state         TYPE clike OPTIONAL
        emphasized    TYPE clike OPTIONAL
        number        TYPE clike OPTIONAL
        unit          TYPE clike OPTIONAL
      RETURNING
        VALUE(result) TYPE REF TO  z2ui5_cl_xml_view.

    METHODS switch
      IMPORTING
        state         TYPE clike OPTIONAL
        customtexton  TYPE clike OPTIONAL
        customtextoff TYPE clike OPTIONAL
        enabled       TYPE clike OPTIONAL
        type          TYPE clike OPTIONAL
      RETURNING
        VALUE(result) TYPE REF TO  z2ui5_cl_xml_view.

    METHODS step_input
      IMPORTING
        value         TYPE clike
        min           TYPE clike
        max           TYPE clike
        step          TYPE clike
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS progress_indicator
      IMPORTING
        percentvalue  TYPE clike OPTIONAL
        displayvalue  TYPE clike OPTIONAL
        showvalue     TYPE clike OPTIONAL
        state         TYPE clike OPTIONAL
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS segmented_button
      IMPORTING
        selected_key     TYPE clike
        selection_change TYPE clike OPTIONAL
      RETURNING
        VALUE(result)    TYPE REF TO z2ui5_cl_xml_view.

    METHODS checkbox
      IMPORTING
        text          TYPE clike OPTIONAL
        selected      TYPE clike OPTIONAL
        enabled       TYPE clike OPTIONAL
          PREFERRED PARAMETER selected
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS header_toolbar
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS toolbar
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS text
      IMPORTING
        text          TYPE clike OPTIONAL
        class         TYPE clike OPTIONAL
        ns            TYPE clike OPTIONAL
          PREFERRED PARAMETER text
      RETURNING
        VALUE(result) TYPE REF TO  z2ui5_cl_xml_view.

    METHODS formatted_text
      IMPORTING
        htmltext      TYPE clike OPTIONAL
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS _generic
      IMPORTING
        name          TYPE clike
        ns            TYPE clike OPTIONAL
        t_prop        TYPE ty_t_name_value OPTIONAL
      RETURNING
        VALUE(result) TYPE REF TO z2ui5_cl_xml_view.

    METHODS cc_file_uploader
      IMPORTING
        value         TYPE clike OPTIONAL
        path          TYPE clike OPTIONAL
        placeholder   TYPE clike OPTIONAL
        upload        TYPE clike OPTIONAL
      RETURNING
        VALUE(result) TYPE REF TO  z2ui5_cl_xml_view.

  class-METHODS cc_file_uploader_get_js
      RETURNING
        VALUE(result) TYPE string.

    METHODS xml_get
      RETURNING
        VALUE(result) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS Z2UI5_CL_XML_VIEW IMPLEMENTATION.


  METHOD actions.

    result = _generic(
        name   = `actions`
        ns     = ns
      ).

  ENDMETHOD.


  METHOD additional_content.

    result = _generic(
         name  = `additionalContent`
    ).

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
    _generic(
        name   = `Avatar`
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
    _generic(
       name   = `BadgeCustomData`
       t_prop = temp3 ).

  ENDMETHOD.


  METHOD bar.

    result = _generic(
        name = `Bar`
         ).

  ENDMETHOD.


  METHOD bars.

    result = _generic(
        name = `bars`
        ns   = `mchart` ).

  ENDMETHOD.


  METHOD blocks.

    result = _generic(
        name = `blocks`
        ns   = `uxap`
     ).

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
    _generic(
       name   = `Button`
       ns     = ns
       t_prop = temp5 ).

  ENDMETHOD.


  METHOD buttons.

    result = _generic( `buttons` ).

  ENDMETHOD.


  METHOD cc_file_uploader.

    result = me.
    DATA temp7 TYPE ty_t_name_value.
    CLEAR temp7.
    DATA temp8 LIKE LINE OF temp7.
    temp8-n = `placeholder`.
    temp8-v = placeholder.
    INSERT temp8 INTO TABLE temp7.
    temp8-n = `upload`.
    temp8-v = upload.
    INSERT temp8 INTO TABLE temp7.
    temp8-n = `path`.
    temp8-v = path.
    INSERT temp8 INTO TABLE temp7.
    temp8-n = `value`.
    temp8-v = value.
    INSERT temp8 INTO TABLE temp7.
    _generic(
      name   = `FileUploader`
      ns     = `z2ui5`
      t_prop = temp7 ).

  ENDMETHOD.


  METHOD cc_file_uploader_get_js.

   result = ` jQuery.sap.declare("z2ui5.FileUploader");` && |\n|  &&
                         |\n|  &&
                         `        sap.ui.define([` && |\n|  &&
                         `            "sap/ui/core/Control",` && |\n|  &&
                         `            "sap/m/Button",` && |\n|  &&
                         `            "sap/ui/unified/FileUploader"` && |\n|  &&
                         `        ], function (Control, Button, FileUploader) {` && |\n|  &&
                         `            "use strict";` && |\n|  &&
                         |\n|  &&
                         `            return Control.extend("z2ui5.FileUploader", {` && |\n|  &&
                         |\n|  &&
                         `                metadata: {` && |\n|  &&
                         `                    properties: {` && |\n|  &&
                         `                        value: {` && |\n|  &&
                         `                            type: "string",` && |\n|  &&
                         `                            defaultValue: ""` && |\n|  &&
                         `                        },` && |\n|  &&
                         `                        path: {` && |\n|  &&
                         `                            type: "string",` && |\n|  &&
                         `                            defaultValue: ""` && |\n|  &&
                         `                        },` && |\n|  &&
                         `                        tooltip: {` && |\n|  &&
                         `                            type: "string",` && |\n|  &&
                         `                            defaultValue: ""` && |\n|  &&
                         `                        },` && |\n|  &&
                         `                        fileType: {` && |\n|  &&
                         `                            type: "string",` && |\n|  &&
                         `                            defaultValue: ""` && |\n|  &&
                         `                        },` && |\n|  &&
                         `                        placeholder: {` && |\n|  &&
                         `                            type: "string",` && |\n|  &&
                         `                            defaultValue: ""` && |\n|  &&
                         `                        },` && |\n|  &&
                         `                        buttonText: {` && |\n|  &&
                         `                            type: "string",` && |\n|  &&
                         `                            defaultValue: "Upload"` && |\n|  &&
                         `                        },` && |\n|  &&
                         `                        enabled: {` && |\n|  &&
                         `                            type: "boolean",` && |\n|  &&
                         `                            defaultValue: true` && |\n|  &&
                         `                        },` && |\n|  &&
                         `                        multiple: {` && |\n|  &&
                         `                            type: "boolean",` && |\n|  &&
                         `                            defaultValue: false` && |\n|  &&
                         `                        }` && |\n|  &&
                         `                    },` && |\n|  &&
                         |\n|  &&
                         |\n|  &&
                         `                    aggregations: {` && |\n|  &&
                         `                    },` && |\n|  &&
                         `                    events: {` && |\n|  &&
                         `                        "upload": {` && |\n|  &&
                         `                            allowPreventDefault: true,` && |\n|  &&
                         `                            parameters: {}` && |\n|  &&
                         `                        }` && |\n|  &&
                         `                    },` && |\n|  &&
                         `                    renderer: null` && |\n|  &&
                         `                },` && |\n|  &&
                         |\n|  &&
                         `                renderer: function (oRm, oControl) {` && |\n|  &&
                         |\n|  &&
                         `                    oControl.oUploadButton = new Button({` && |\n|  &&
                         `                        text: oControl.getProperty("buttonText"),` && |\n|  &&
                         `                        enabled: oControl.getProperty("path") !== "",` && |\n|  &&
                         `                        press: function (oEvent) {` && |\n|  &&
                         |\n|  &&
                         `                            this.setProperty("path", this.oFileUploader.getProperty("value"));` && |\n|  &&
                         |\n|  &&
                         `                            var file = this.oFileUploader.oFileUpload.files[0];` && |\n|  &&
                         `                            var reader = new FileReader();` && |\n|  &&
                         |\n|  &&
                         `                            reader.onload = function (evt) {` && |\n|  &&
                         `                                var vContent = evt.currentTarget.result;` && |\n|  &&
                         `                                this.setProperty("value", vContent);` && |\n|  &&
                         `                                this.fireUpload();` && |\n|  &&
                         `                                //this.getView().byId('picture' ).getDomRef().src = vContent;` && |\n|  &&
                         `                            }.bind(this)` && |\n|  &&
                         |\n|  &&
                         `                            reader.readAsDataURL(file);` && |\n|  &&
                         `                        }.bind(oControl)` && |\n|  &&
                         `                    });` && |\n|  &&
                         |\n|  &&
                         `                    oControl.oFileUploader = new FileUploader({` && |\n|  &&
                         `                        icon: "sap-icon://browse-folder",` && |\n|  &&
                         `                        iconOnly: true,` && |\n|  &&
                         `                        value: oControl.getProperty("path"),` && |\n|  &&
                         `                        placeholder: oControl.getProperty("placeholder"),` && |\n|  &&
                         `                        change: function (oEvent) {` && |\n|  &&
                         `                            var value = oEvent.getSource().getProperty("value");` && |\n|  &&
                         `                            this.setProperty("path", value);` && |\n|  &&
                         `                            if (value) {` && |\n|  &&
                         `                                this.oUploadButton.setEnabled();` && |\n|  &&
                         `                            } else {` && |\n|  &&
                         `                                this.oUploadButton.setEnabled(false);` && |\n|  &&
                         `                            }` && |\n|  &&
                         `                            this.oUploadButton.rerender();` && |\n|  &&
                         `                        }.bind(oControl)` && |\n|  &&
                         `                    });` && |\n|  &&
                         |\n|  &&
                         `                    var hbox = new sap.m.HBox();` && |\n|  &&
                         `                    hbox.addItem(oControl.oFileUploader);` && |\n|  &&
                         `                    hbox.addItem(oControl.oUploadButton);` && |\n|  &&
                         `                    oRm.renderControl(hbox);` && |\n|  &&
                         `                }` && |\n|  &&
                         `            });` && |\n|  &&
                         `        });`.

  ENDMETHOD.


  METHOD cells.

    result = _generic( `cells` ).

  ENDMETHOD.


  METHOD checkbox.

    result = me.
    DATA temp9 TYPE ty_t_name_value.
    CLEAR temp9.
    DATA temp10 LIKE LINE OF temp9.
    temp10-n = `text`.
    temp10-v = text.
    INSERT temp10 INTO TABLE temp9.
    temp10-n = `selected`.
    temp10-v = selected.
    INSERT temp10 INTO TABLE temp9.
    temp10-n = `enabled`.
    temp10-v = lcl_utility=>get_json_boolean( enabled ).
    INSERT temp10 INTO TABLE temp9.
    _generic(
       name  = `CheckBox`
       t_prop = temp9 ).

  ENDMETHOD.


  METHOD code_editor.

    result = me.
    DATA temp11 TYPE ty_t_name_value.
    CLEAR temp11.
    DATA temp12 LIKE LINE OF temp11.
    temp12-n = `value`.
    temp12-v = value.
    INSERT temp12 INTO TABLE temp11.
    temp12-n = `type`.
    temp12-v = type.
    INSERT temp12 INTO TABLE temp11.
    temp12-n = `editable`.
    temp12-v = lcl_utility=>get_json_boolean( editable ).
    INSERT temp12 INTO TABLE temp11.
    temp12-n = `height`.
    temp12-v = height.
    INSERT temp12 INTO TABLE temp11.
    temp12-n = `width`.
    temp12-v = width.
    INSERT temp12 INTO TABLE temp11.
    _generic(
        name  = `CodeEditor`
        ns = `editor`
        t_prop = temp11 ).

  ENDMETHOD.


  METHOD column.

    DATA temp13 TYPE ty_t_name_value.
    CLEAR temp13.
    DATA temp14 LIKE LINE OF temp13.
    temp14-n = `width`.
    temp14-v = width.
    INSERT temp14 INTO TABLE temp13.
    temp14-n = `minScreenWidth`.
    temp14-v = minScreenWidth.
    INSERT temp14 INTO TABLE temp13.
    temp14-n = `demandPopin`.
    temp14-v = Lcl_utility=>get_json_boolean( demandPopin ).
    INSERT temp14 INTO TABLE temp13.
    result = _generic(
        name  = `Column`
          t_prop = temp13 ).

  ENDMETHOD.


  METHOD columns.

    result = _generic( `columns` ).

  ENDMETHOD.


  METHOD column_list_item.

    DATA temp15 TYPE ty_t_name_value.
    CLEAR temp15.
    DATA temp16 LIKE LINE OF temp15.
    temp16-n = `vAlign`.
    temp16-v = valign.
    INSERT temp16 INTO TABLE temp15.
    temp16-n = `selected`.
    temp16-v = selected.
    INSERT temp16 INTO TABLE temp15.
    temp16-n = `type`.
    temp16-v = type.
    INSERT temp16 INTO TABLE temp15.
    temp16-n = `press`.
    temp16-v = press.
    INSERT temp16 INTO TABLE temp15.
    result = _generic(
        name = `ColumnListItem`
        t_prop = temp15 ).

  ENDMETHOD.


  METHOD combobox.

    DATA temp17 TYPE ty_t_name_value.
    CLEAR temp17.
    DATA temp18 LIKE LINE OF temp17.
    temp18-n = `showClearIcon`.
    temp18-v = lcl_utility=>get_json_boolean( showclearicon ).
    INSERT temp18 INTO TABLE temp17.
    temp18-n = `selectedKey`.
    temp18-v = selectedkey.
    INSERT temp18 INTO TABLE temp17.
    temp18-n = `items`.
    temp18-v = items.
    INSERT temp18 INTO TABLE temp17.
    temp18-n = `label`.
    temp18-v = label.
    INSERT temp18 INTO TABLE temp17.
    result = _generic(
       name  = `ComboBox`
       t_prop = temp17 ).

  ENDMETHOD.


  METHOD constructor.

    DATA temp19 TYPE ty_t_name_value.
    CLEAR temp19.
    DATA temp20 LIKE LINE OF temp19.
    temp20-n = `xmlns`.
    temp20-v = `sap.m`.
    INSERT temp20 INTO TABLE temp19.
    temp20-n = `xmlns:z2ui5`.
    temp20-v = `z2ui5`.
    INSERT temp20 INTO TABLE temp19.
    temp20-n = `xmlns:core`.
    temp20-v = `sap.ui.core`.
    INSERT temp20 INTO TABLE temp19.
    temp20-n = `xmlns:mvc`.
    temp20-v = `sap.ui.core.mvc`.
    INSERT temp20 INTO TABLE temp19.
    temp20-n = `xmlns:layout`.
    temp20-v = `sap.ui.layout`.
    INSERT temp20 INTO TABLE temp19.
    temp20-n = `xmlns:f`.
    temp20-v = `sap.f`.
    INSERT temp20 INTO TABLE temp19.
    temp20-n = `xmlns:form`.
    temp20-v = `sap.ui.layout.form`.
    INSERT temp20 INTO TABLE temp19.
    temp20-n = `xmlns:editor`.
    temp20-v = `sap.ui.codeeditor`.
    INSERT temp20 INTO TABLE temp19.
    temp20-n = `xmlns:mchart`.
    temp20-v = `sap.suite.ui.microchart`.
    INSERT temp20 INTO TABLE temp19.
    temp20-n = `xmlns:webc`.
    temp20-v = `sap.ui.webc.main`.
    INSERT temp20 INTO TABLE temp19.
    temp20-n = `xmlns:uxap`.
    temp20-v = `sap.uxap`.
    INSERT temp20 INTO TABLE temp19.
    temp20-n = `xmlns:sap`.
    temp20-v = `sap`.
    INSERT temp20 INTO TABLE temp19.
    temp20-n = `xmlns:text`.
    temp20-v = `sap.ui.richtextedito`.
    INSERT temp20 INTO TABLE temp19.
    temp20-n = `xmlns:html`.
    temp20-v = `http://www.w3.org/1999/xhtml`.
    INSERT temp20 INTO TABLE temp19.
    mt_prop = temp19.

  ENDMETHOD.


  METHOD content.

    result = _generic( ns = ns name = `content` ).

  ENDMETHOD.


  METHOD content_left.

    result = _generic(
        name = `contentLeft`
         ).

  ENDMETHOD.


  METHOD content_middle.

    result = _generic(
        name = `contentMiddle`
         ).

  ENDMETHOD.


  METHOD content_right.

    result = _generic(
        name = `contentRight`
         ).

  ENDMETHOD.


  METHOD custom_data.

    result = _generic(
       `customData`
    ).

  ENDMETHOD.


  METHOD custom_Header.

    result = _generic(
        name = `customHeader`
         ).

  ENDMETHOD.


  METHOD custom_list_item.

    result = _generic(
        name = `CustomListItem`
     ).

  ENDMETHOD.


  METHOD date_picker.

    result = me.
    DATA temp21 TYPE ty_t_name_value.
    CLEAR temp21.
    DATA temp22 LIKE LINE OF temp21.
    temp22-n = `value`.
    temp22-v = value.
    INSERT temp22 INTO TABLE temp21.
    temp22-n = `placeholder`.
    temp22-v = placeholder.
    INSERT temp22 INTO TABLE temp21.
    _generic(
      name       = `DatePicker`
      t_prop = temp21 ).

  ENDMETHOD.


  METHOD date_time_picker.

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
    _generic(
        name  = `DateTimePicker`
        t_prop = temp23 ).

  ENDMETHOD.


  METHOD dialog.

    DATA temp25 TYPE ty_t_name_value.
    CLEAR temp25.
    DATA temp26 LIKE LINE OF temp25.
    temp26-n = `title`.
    temp26-v = title.
    INSERT temp26 INTO TABLE temp25.
    temp26-n = `icon`.
    temp26-v = icon.
    INSERT temp26 INTO TABLE temp25.
    temp26-n = `stretch`.
    temp26-v = stretch.
    INSERT temp26 INTO TABLE temp25.
    temp26-n = `showHeader`.
    temp26-v = showheader.
    INSERT temp26 INTO TABLE temp25.
    temp26-n = `contentWidth`.
    temp26-v = contentwidth.
    INSERT temp26 INTO TABLE temp25.
    temp26-n = `contentHeight`.
    temp26-v = contentheight.
    INSERT temp26 INTO TABLE temp25.
    temp26-n = `resizable`.
    temp26-v = lcl_utility=>get_json_boolean( resizable ).
    INSERT temp26 INTO TABLE temp25.
    result = _generic(
         name = `Dialog`
        t_prop = temp25 ).

  ENDMETHOD.


  METHOD dynamic_page.

    DATA temp27 TYPE ty_t_name_value.
    CLEAR temp27.
    DATA temp28 LIKE LINE OF temp27.
    temp28-n = `headerExpanded`.
    temp28-v = lcl_utility=>get_json_boolean( headerexpanded ).
    INSERT temp28 INTO TABLE temp27.
    temp28-n = `headerPinned`.
    temp28-v = lcl_utility=>get_json_boolean( headerPinned ).
    INSERT temp28 INTO TABLE temp27.
    temp28-n = `toggleHeaderOnTitleClick`.
    temp28-v = toggleHeaderOnTitleClick.
    INSERT temp28 INTO TABLE temp27.
    result = _generic(
      name   = `DynamicPage`
      ns     = `f`
      t_prop = temp27 ).

  ENDMETHOD.


  METHOD dynamic_page_header.

    DATA temp29 TYPE ty_t_name_value.
    CLEAR temp29.
    DATA temp30 LIKE LINE OF temp29.
    temp30-n = `pinnable`.
    temp30-v = lcl_utility=>get_json_boolean( pinnable ).
    INSERT temp30 INTO TABLE temp29.
    result = _generic(
      name   = `DynamicPageHeader`
      ns     = `f`
      t_prop = temp29 ).

  ENDMETHOD.


  METHOD dynamic_page_title.

    result = _generic(
       name   = `DynamicPageTitle`
       ns     = `f`
       ).

  ENDMETHOD.


  METHOD expanded_content.

    result = _generic(
         name   = `expandedContent`
         ns     = ns
      ).

  ENDMETHOD.


  METHOD expanded_heading.

    result = _generic(
        name   = `expandedHeading`
        ns     = `uxap`
    ).

  ENDMETHOD.


  METHOD factory.

    CREATE OBJECT result.

    IF t_ns IS NOT INITIAL.
      result->mt_prop = t_ns.
    ENDIF.

    DATA temp31 TYPE ty_t_name_value.
    CLEAR temp31.
    temp31 = result->mt_prop.
    DATA temp32 LIKE LINE OF temp31.
    temp32-n = 'displayBlock'.
    temp32-v = 'true'.
    INSERT temp32 INTO TABLE temp31.
    temp32-n = 'height'.
    temp32-v = '100%'.
    INSERT temp32 INTO TABLE temp31.
    temp32-n = 'controllerName'.
    temp32-v = z2ui5_cl_http_handler=>config-controller_name.
    INSERT temp32 INTO TABLE temp31.
    result->mt_prop = temp31.

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

    result->m_name = `FragmentDefinition`.
    result->m_ns = `core`.
    result->m_root = result.
    result->m_parent = result.

  ENDMETHOD.


  METHOD flex_box.

    DATA temp33 TYPE ty_t_name_value.
    CLEAR temp33.
    DATA temp34 LIKE LINE OF temp33.
    temp34-n = `class`.
    temp34-v = class.
    INSERT temp34 INTO TABLE temp33.
    temp34-n = `renderType`.
    temp34-v = rendertype.
    INSERT temp34 INTO TABLE temp33.
    temp34-n = `width`.
    temp34-v = width.
    INSERT temp34 INTO TABLE temp33.
    temp34-n = `height`.
    temp34-v = height.
    INSERT temp34 INTO TABLE temp33.
    temp34-n = `alignItems`.
    temp34-v = alignitems.
    INSERT temp34 INTO TABLE temp33.
    temp34-n = `fitContainer`.
    temp34-v = lcl_utility=>get_json_boolean( fitContainer ).
    INSERT temp34 INTO TABLE temp33.
    temp34-n = `justifyContent`.
    temp34-v = justifycontent.
    INSERT temp34 INTO TABLE temp33.
    temp34-n = `wrap`.
    temp34-v = wrap.
    INSERT temp34 INTO TABLE temp33.
    result = _generic(
          name   = `FlexBox`
          t_prop = temp33 ).


  ENDMETHOD.


  METHOD flex_item_data.

    result = me.

    DATA temp35 TYPE ty_t_name_value.
    CLEAR temp35.
    DATA temp36 LIKE LINE OF temp35.
    temp36-n = `growFactor`.
    temp36-v = growfactor.
    INSERT temp36 INTO TABLE temp35.
    temp36-n = `baseSize`.
    temp36-v = basesize.
    INSERT temp36 INTO TABLE temp35.
    temp36-n = `backgroundDesign`.
    temp36-v = backgrounddesign.
    INSERT temp36 INTO TABLE temp35.
    temp36-n = `styleClass`.
    temp36-v = styleclass.
    INSERT temp36 INTO TABLE temp35.
    _generic(
          name = `FlexItemData`
        t_prop = temp35 ).

  ENDMETHOD.


  METHOD footer.

    result = _generic( `footer` ).

  ENDMETHOD.


  METHOD formatted_text.

    result = me.
    DATA temp37 TYPE ty_t_name_value.
    CLEAR temp37.
    DATA temp38 LIKE LINE OF temp37.
    temp38-n = `htmlText`.
    temp38-v = htmltext.
    INSERT temp38 INTO TABLE temp37.
    _generic(
       name   = `FormattedText`
       t_prop = temp37 ).

  ENDMETHOD.


  METHOD generic_tag.

    DATA temp39 TYPE ty_t_name_value.
    CLEAR temp39.
    DATA temp40 LIKE LINE OF temp39.
    temp40-n = `ariaLabelledBy`.
    temp40-v = arialabelledby.
    INSERT temp40 INTO TABLE temp39.
    temp40-n = `class`.
    temp40-v = class.
    INSERT temp40 INTO TABLE temp39.
    temp40-n = `design`.
    temp40-v = design.
    INSERT temp40 INTO TABLE temp39.
    temp40-n = `status`.
    temp40-v = status.
    INSERT temp40 INTO TABLE temp39.
    temp40-n = `text`.
    temp40-v = text.
    INSERT temp40 INTO TABLE temp39.
    result = _generic(
           name  = `GenericTag`
           t_prop = temp39 ).

  ENDMETHOD.


  METHOD get.

    result = m_root->m_last.

  ENDMETHOD.


  METHOD get_child.

    DATA temp41 LIKE LINE OF t_child.
    DATA temp42 LIKE sy-tabix.
    temp42 = sy-tabix.
    READ TABLE t_child INDEX index INTO temp41.
    sy-tabix = temp42.
    IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE cx_sy_itab_line_not_found.
    ENDIF.
    result = temp41.

  ENDMETHOD.


  METHOD get_parent.
    result = m_parent.
  ENDMETHOD.


  METHOD get_root.

    result = m_root.

  ENDMETHOD.


  METHOD grid.

    DATA temp43 TYPE ty_t_name_value.
    CLEAR temp43.
    DATA temp44 LIKE LINE OF temp43.
    temp44-n = `defaultSpan`.
    temp44-v = default_span.
    INSERT temp44 INTO TABLE temp43.
    temp44-n = `class`.
    temp44-v = class.
    INSERT temp44 INTO TABLE temp43.
    result = _generic(
        name = `Grid`
        ns   = `layout`
        t_prop = temp43 ).

  ENDMETHOD.


  METHOD grid_data.

    result = me.
    DATA temp45 TYPE ty_t_name_value.
    CLEAR temp45.
    DATA temp46 LIKE LINE OF temp45.
    temp46-n = `span`.
    temp46-v = span.
    INSERT temp46 INTO TABLE temp45.
    _generic(
           name = `GridData`
           ns = `layout`
        t_prop = temp45 ).

  ENDMETHOD.


  METHOD hbox.

    DATA temp47 TYPE ty_t_name_value.
    CLEAR temp47.
    DATA temp48 LIKE LINE OF temp47.
    temp48-n = `class`.
    temp48-v = class.
    INSERT temp48 INTO TABLE temp47.
    temp48-n = `justifyContent`.
    temp48-v = justifycontent.
    INSERT temp48 INTO TABLE temp47.
    result = _generic(
          name   = `HBox`
          t_prop = temp47 ).

  ENDMETHOD.


  METHOD header.

    result = _generic(
        name   = `header`
        ns     = ns
      ).

  ENDMETHOD.


  METHOD header_content.

    result = _generic(
        name = `headerContent`
        ns   = ns
         ).

  ENDMETHOD.


  METHOD header_title.

    result = _generic(
        name   = `headerTitle`
        ns     = `uxap`
     ).

  ENDMETHOD.


  METHOD header_toolbar.

    result = _generic( `headerToolbar` ).

  ENDMETHOD.


  METHOD heading.

    result = me.
    result = _generic(
        name   = `heading`
        ns     = ns
    ).

  ENDMETHOD.


  METHOD hlp_get_source_code_url.

    DATA lv_url TYPE z2ui5_if_client=>ty_s_name_value-value.
    DATA temp1 LIKE LINE OF get-t_req_header.
    DATA temp2 LIKE sy-tabix.
    temp2 = sy-tabix.
    READ TABLE get-t_req_header WITH KEY name = `referer` INTO temp1.
    sy-tabix = temp2.
    IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE cx_sy_itab_line_not_found.
    ENDIF.
    lv_url = temp1-value.
    DATA lv_dummy TYPE string.
    SPLIT lv_url AT '?' INTO lv_url lv_dummy.

    DATA temp49 LIKE LINE OF z2ui5_cl_http_handler=>client-t_header.
    DATA temp50 LIKE sy-tabix.
    temp50 = sy-tabix.
    READ TABLE z2ui5_cl_http_handler=>client-t_header WITH KEY name = `origin` INTO temp49.
    sy-tabix = temp50.
    IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE cx_sy_itab_line_not_found.
    ENDIF.
    result  = temp49-value  && `/sap/bc/adt/oo/classes/` && lcl_utility=>get_classname_by_ref( app ) && `/source/main`.

  ENDMETHOD.


  METHOD hlp_replace_controller_name.

    result  = lcl_utility=>get_replace( iv_val = xml
    iv_begin = 'controllerName="' iv_end = '"' iv_replace = `controllerName="` && z2ui5_cl_http_handler=>config-controller_name && `"` ).

  ENDMETHOD.


  METHOD horizontal_layout.

    DATA temp51 TYPE ty_t_name_value.
    CLEAR temp51.
    DATA temp52 LIKE LINE OF temp51.
    temp52-n = `class`.
    temp52-v = class.
    INSERT temp52 INTO TABLE temp51.
    temp52-n = `width`.
    temp52-v = width.
    INSERT temp52 INTO TABLE temp51.
    result = _generic(
        name   = `HorizontalLayout`
        ns     = `layout`
        t_prop = temp51 ).

  ENDMETHOD.


  METHOD illustrated_message.

    DATA temp53 TYPE ty_t_name_value.
    CLEAR temp53.
    DATA temp54 LIKE LINE OF temp53.
    temp54-n = `enableVerticalResponsiveness`.
    temp54-v = enableVerticalResponsiveness.
    INSERT temp54 INTO TABLE temp53.
    temp54-n = `illustrationType`.
    temp54-v = illustrationType.
    INSERT temp54 INTO TABLE temp53.
    result = _generic(
         name  = `IllustratedMessage`
         t_prop = temp53 ).

  ENDMETHOD.


  METHOD image.

    result = me.
    DATA temp55 TYPE ty_t_name_value.
    CLEAR temp55.
    DATA temp56 LIKE LINE OF temp55.
    temp56-n = `src`.
    temp56-v = src.
    INSERT temp56 INTO TABLE temp55.
    _generic(
       name  = `Image`
       t_prop = temp55 ).

  ENDMETHOD.


  METHOD input.

    result = me.
    DATA temp57 TYPE ty_t_name_value.
    CLEAR temp57.
    DATA temp58 LIKE LINE OF temp57.
    temp58-n = `id`.
    temp58-v = id.
    INSERT temp58 INTO TABLE temp57.
    temp58-n = `placeholder`.
    temp58-v = placeholder.
    INSERT temp58 INTO TABLE temp57.
    temp58-n = `type`.
    temp58-v = type.
    INSERT temp58 INTO TABLE temp57.
    temp58-n = `showClearIcon`.
    temp58-v = lcl_utility=>get_json_boolean( showclearicon ).
    INSERT temp58 INTO TABLE temp57.
    temp58-n = `description`.
    temp58-v = description.
    INSERT temp58 INTO TABLE temp57.
    temp58-n = `editable`.
    temp58-v = lcl_utility=>get_json_boolean( editable ).
    INSERT temp58 INTO TABLE temp57.
    temp58-n = `enabled`.
    temp58-v = lcl_utility=>get_json_boolean( enabled ).
    INSERT temp58 INTO TABLE temp57.
    temp58-n = `valueState`.
    temp58-v = valuestate.
    INSERT temp58 INTO TABLE temp57.
    temp58-n = `valueStateText`.
    temp58-v = valuestatetext.
    INSERT temp58 INTO TABLE temp57.
    temp58-n = `value`.
    temp58-v = value.
    INSERT temp58 INTO TABLE temp57.
    temp58-n = `suggestionItems`.
    temp58-v = suggestionitems.
    INSERT temp58 INTO TABLE temp57.
    temp58-n = `showSuggestion`.
    temp58-v = lcl_utility=>get_json_boolean( showsuggestion ).
    INSERT temp58 INTO TABLE temp57.
    temp58-n = `valueHelpRequest`.
    temp58-v = valuehelprequest.
    INSERT temp58 INTO TABLE temp57.
    temp58-n = `showValueHelp`.
    temp58-v = lcl_utility=>get_json_boolean( showvaluehelp ).
    INSERT temp58 INTO TABLE temp57.
    temp58-n = `class`.
    temp58-v = class.
    INSERT temp58 INTO TABLE temp57.
    _generic(
       name   = `Input`
       t_prop = temp57 ).

  ENDMETHOD.


  METHOD input_list_item.

    DATA temp59 TYPE ty_t_name_value.
    CLEAR temp59.
    DATA temp60 LIKE LINE OF temp59.
    temp60-n = `label`.
    temp60-v = label.
    INSERT temp60 INTO TABLE temp59.
    result = _generic(
        name = `InputListItem`
        t_prop = temp59 ).

  ENDMETHOD.


  METHOD interact_bar_chart.

    DATA temp61 TYPE ty_t_name_value.
    CLEAR temp61.
    DATA temp62 LIKE LINE OF temp61.
    temp62-n = `selectionChanged`.
    temp62-v = selectionchanged.
    INSERT temp62 INTO TABLE temp61.
    temp62-n = `showError`.
    temp62-v = showerror.
    INSERT temp62 INTO TABLE temp61.
    temp62-n = `press`.
    temp62-v = press.
    INSERT temp62 INTO TABLE temp61.
    temp62-n = `labelWidth`.
    temp62-v = labelwidth.
    INSERT temp62 INTO TABLE temp61.
    temp62-n = `errorMessageTitle`.
    temp62-v = errormessagetitle.
    INSERT temp62 INTO TABLE temp61.
    temp62-n = `errorMessage`.
    temp62-v = errormessage.
    INSERT temp62 INTO TABLE temp61.
    result = _generic(
        name = `InteractiveBarChart`
        ns   = `mchart`
        t_prop = temp61 ).

  ENDMETHOD.


  METHOD interact_bar_chart_bar.

    DATA temp63 TYPE ty_t_name_value.
    CLEAR temp63.
    DATA temp64 LIKE LINE OF temp63.
    temp64-n = `label`.
    temp64-v = label.
    INSERT temp64 INTO TABLE temp63.
    temp64-n = `displayedValue`.
    temp64-v = displayedvalue.
    INSERT temp64 INTO TABLE temp63.
    temp64-n = `value`.
    temp64-v = value.
    INSERT temp64 INTO TABLE temp63.
    temp64-n = `selected`.
    temp64-v = selected.
    INSERT temp64 INTO TABLE temp63.
    result = _generic(
         name = `InteractiveBarChartBar`
         ns = `mchart`
         t_prop = temp63 ).

  ENDMETHOD.


  METHOD interact_donut_chart.

    DATA temp65 TYPE ty_t_name_value.
    CLEAR temp65.
    DATA temp66 LIKE LINE OF temp65.
    temp66-n = `selectionChanged`.
    temp66-v = selectionchanged.
    INSERT temp66 INTO TABLE temp65.
    temp66-n = `showError`.
    temp66-v = lcl_utility=>get_json_boolean( showerror ).
    INSERT temp66 INTO TABLE temp65.
    temp66-n = `errorMessageTitle`.
    temp66-v = errormessagetitle.
    INSERT temp66 INTO TABLE temp65.
    temp66-n = `errorMessage`.
    temp66-v = errormessage.
    INSERT temp66 INTO TABLE temp65.
    temp66-n = `displayedSegments`.
    temp66-v = displayedsegments.
    INSERT temp66 INTO TABLE temp65.
    temp66-n = `press`.
    temp66-v = press.
    INSERT temp66 INTO TABLE temp65.
    result = _generic(
         name = `InteractiveDonutChart`
         ns   = `mchart`
         t_prop = temp65 ).

  ENDMETHOD.


  METHOD interact_donut_chart_segment.

    DATA temp67 TYPE ty_t_name_value.
    CLEAR temp67.
    DATA temp68 LIKE LINE OF temp67.
    temp68-n = `label`.
    temp68-v = label.
    INSERT temp68 INTO TABLE temp67.
    temp68-n = `displayedValue`.
    temp68-v = displayedvalue.
    INSERT temp68 INTO TABLE temp67.
    temp68-n = `value`.
    temp68-v = value.
    INSERT temp68 INTO TABLE temp67.
    temp68-n = `selected`.
    temp68-v = selected.
    INSERT temp68 INTO TABLE temp67.
    result = _generic(
         name = `InteractiveDonutChartSegment`
         ns   = `mchart`
         t_prop = temp67 ).

  ENDMETHOD.


  METHOD interact_line_chart.

    DATA temp69 TYPE ty_t_name_value.
    CLEAR temp69.
    DATA temp70 LIKE LINE OF temp69.
    temp70-n = `selectionChanged`.
    temp70-v = selectionchanged.
    INSERT temp70 INTO TABLE temp69.
    temp70-n = `showError`.
    temp70-v = lcl_utility=>get_json_boolean( showerror ).
    INSERT temp70 INTO TABLE temp69.
    temp70-n = `press`.
    temp70-v = press.
    INSERT temp70 INTO TABLE temp69.
    temp70-n = `errorMessageTitle`.
    temp70-v = errormessagetitle.
    INSERT temp70 INTO TABLE temp69.
    temp70-n = `errorMessage`.
    temp70-v = errormessage.
    INSERT temp70 INTO TABLE temp69.
    temp70-n = `precedingPoint`.
    temp70-v = precedingpoint.
    INSERT temp70 INTO TABLE temp69.
    temp70-n = `succeedingPoint`.
    temp70-v = succeddingpoint.
    INSERT temp70 INTO TABLE temp69.
    result = _generic(
         name = `InteractiveLineChart`
         ns = `mchart`
         t_prop = temp69 ).

  ENDMETHOD.


  METHOD interact_line_chart_point.

    DATA temp71 TYPE ty_t_name_value.
    CLEAR temp71.
    DATA temp72 LIKE LINE OF temp71.
    temp72-n = `label`.
    temp72-v = label.
    INSERT temp72 INTO TABLE temp71.
    temp72-n = `secondaryLabel`.
    temp72-v = secondarylabel.
    INSERT temp72 INTO TABLE temp71.
    temp72-n = `value`.
    temp72-v = value.
    INSERT temp72 INTO TABLE temp71.
    temp72-n = `displayedValue`.
    temp72-v = displayedvalue.
    INSERT temp72 INTO TABLE temp71.
    temp72-n = `selected`.
    temp72-v = lcl_utility=>get_json_boolean( selected ).
    INSERT temp72 INTO TABLE temp71.
    result = _generic(
         name   = `InteractiveLineChartPoint`
         ns     = `mchart`
         t_prop = temp71 ).

  ENDMETHOD.


  METHOD item.

    result = me.
    DATA temp73 TYPE ty_t_name_value.
    CLEAR temp73.
    DATA temp74 LIKE LINE OF temp73.
    temp74-n = `key`.
    temp74-v = key.
    INSERT temp74 INTO TABLE temp73.
    temp74-n = `text`.
    temp74-v = text.
    INSERT temp74 INTO TABLE temp73.
    _generic(
       name = `Item`
       ns = `core`
       t_prop = temp73 ).

  ENDMETHOD.


  METHOD items.

    result = _generic( `items` ).

  ENDMETHOD.


  METHOD label.

    result = me.
    DATA temp75 TYPE ty_t_name_value.
    CLEAR temp75.
    DATA temp76 LIKE LINE OF temp75.
    temp76-n = `text`.
    temp76-v = text.
    INSERT temp76 INTO TABLE temp75.
    temp76-n = `labelFor`.
    temp76-v = labelfor.
    INSERT temp76 INTO TABLE temp75.
    _generic(
       name  = `Label`
       t_prop = temp75 ).

  ENDMETHOD.


  METHOD layout_data.

    result = _generic(
            ns = ns
           name = `layoutData`
       ).

  ENDMETHOD.


  METHOD link.

    result = me.
    DATA temp77 TYPE ty_t_name_value.
    CLEAR temp77.
    DATA temp78 LIKE LINE OF temp77.
    temp78-n = `text`.
    temp78-v = text.
    INSERT temp78 INTO TABLE temp77.
    temp78-n = `target`.
    temp78-v = target.
    INSERT temp78 INTO TABLE temp77.
    temp78-n = `href`.
    temp78-v = href.
    INSERT temp78 INTO TABLE temp77.
    temp78-n = `press`.
    temp78-v = press.
    INSERT temp78 INTO TABLE temp77.
    temp78-n = `id`.
    temp78-v = id.
    INSERT temp78 INTO TABLE temp77.
    temp78-n = `enabled`.
    temp78-v = lcl_utility=>get_json_boolean( enabled ).
    INSERT temp78 INTO TABLE temp77.
    _generic(
     name  = `Link`
     ns    = ns
       t_prop = temp77 ).

  ENDMETHOD.


  METHOD list.

    DATA temp79 TYPE ty_t_name_value.
    CLEAR temp79.
    DATA temp80 LIKE LINE OF temp79.
    temp80-n = `headerText`.
    temp80-v = headertext.
    INSERT temp80 INTO TABLE temp79.
    temp80-n = `items`.
    temp80-v = items.
    INSERT temp80 INTO TABLE temp79.
    temp80-n = `mode`.
    temp80-v = mode.
    INSERT temp80 INTO TABLE temp79.
    temp80-n = `selectionChange`.
    temp80-v = selectionchange.
    INSERT temp80 INTO TABLE temp79.
    result = _generic(
        name = `List`
        t_prop = temp79 ).

  ENDMETHOD.


  METHOD list_item.

    result = me.
    DATA temp81 TYPE ty_t_name_value.
    CLEAR temp81.
    DATA temp82 LIKE LINE OF temp81.
    temp82-n = `text`.
    temp82-v = text.
    INSERT temp82 INTO TABLE temp81.
    temp82-n = `additionalText`.
    temp82-v = additionaltext.
    INSERT temp82 INTO TABLE temp81.
    _generic(
        name   = `ListItem`
        ns     = `core`
        t_prop = temp81 ).

  ENDMETHOD.


  METHOD MENU_ITEM.

    result = me.
    DATA temp83 TYPE ty_t_name_value.
    CLEAR temp83.
    DATA temp84 LIKE LINE OF temp83.
    temp84-n = `press`.
    temp84-v = press.
    INSERT temp84 INTO TABLE temp83.
    temp84-n = `text`.
    temp84-v = text.
    INSERT temp84 INTO TABLE temp83.
    temp84-n = `icon`.
    temp84-v = icon.
    INSERT temp84 INTO TABLE temp83.
    _generic(
       name   = `MenuItem`
       t_prop = temp83 ).

  ENDMETHOD.


  METHOD message_item.

    DATA temp85 TYPE ty_t_name_value.
    CLEAR temp85.
    DATA temp86 LIKE LINE OF temp85.
    temp86-n = `type`.
    temp86-v = type.
    INSERT temp86 INTO TABLE temp85.
    temp86-n = `title`.
    temp86-v = title.
    INSERT temp86 INTO TABLE temp85.
    temp86-n = `subtitle`.
    temp86-v = subtitle.
    INSERT temp86 INTO TABLE temp85.
    temp86-n = `description`.
    temp86-v = description.
    INSERT temp86 INTO TABLE temp85.
    temp86-n = `groupName`.
    temp86-v = groupName.
    INSERT temp86 INTO TABLE temp85.
    result = _generic(
         name  = `MessageItem`
         t_prop = temp85 ).

  ENDMETHOD.


  METHOD message_page.

    DATA temp87 TYPE ty_t_name_value.
    CLEAR temp87.
    DATA temp88 LIKE LINE OF temp87.
    temp88-n = `showHeader`.
    temp88-v = lcl_utility=>get_json_boolean( show_header ).
    INSERT temp88 INTO TABLE temp87.
    temp88-n = `description`.
    temp88-v = description.
    INSERT temp88 INTO TABLE temp87.
    temp88-n = `icon`.
    temp88-v = icon.
    INSERT temp88 INTO TABLE temp87.
    temp88-n = `text`.
    temp88-v = text.
    INSERT temp88 INTO TABLE temp87.
    temp88-n = `enableFormattedText`.
    temp88-v = lcl_utility=>get_json_boolean( enableformattedtext ).
    INSERT temp88 INTO TABLE temp87.
    result = _generic(
        name   = `MessagePage`
        t_prop = temp87 ).

  ENDMETHOD.


  METHOD message_popover.

    DATA temp89 TYPE ty_t_name_value.
    CLEAR temp89.
    DATA temp90 LIKE LINE OF temp89.
    temp90-n = `items`.
    temp90-v = items.
    INSERT temp90 INTO TABLE temp89.
    temp90-n = `groupItems`.
    temp90-v = lcl_utility=>get_json_boolean( groupItems ).
    INSERT temp90 INTO TABLE temp89.
    result = _generic(
         name  = `MessagePopover`
         t_prop = temp89 ).

  ENDMETHOD.


  METHOD message_strip.

    result = me.
    DATA temp91 TYPE ty_t_name_value.
    CLEAR temp91.
    DATA temp92 LIKE LINE OF temp91.
    temp92-n = `text`.
    temp92-v = text.
    INSERT temp92 INTO TABLE temp91.
    temp92-n = `type`.
    temp92-v = type.
    INSERT temp92 INTO TABLE temp91.
    temp92-n = `showIcon`.
    temp92-v = lcl_utility=>get_json_boolean( showicon ).
    INSERT temp92 INTO TABLE temp91.
    temp92-n = `class`.
    temp92-v = class.
    INSERT temp92 INTO TABLE temp91.
    _generic(
        name   = `MessageStrip`
        t_prop = temp91 ).

  ENDMETHOD.


  METHOD message_view.

    DATA temp93 TYPE ty_t_name_value.
    CLEAR temp93.
    DATA temp94 LIKE LINE OF temp93.
    temp94-n = `items`.
    temp94-v = items.
    INSERT temp94 INTO TABLE temp93.
    temp94-n = `groupItems`.
    temp94-v = lcl_utility=>get_json_boolean( groupItems ).
    INSERT temp94 INTO TABLE temp93.
    result = _generic(
         name  = `MessageView`
         t_prop = temp93 ).

  ENDMETHOD.


  METHOD multi_input.

    DATA temp95 TYPE ty_t_name_value.
    CLEAR temp95.
    DATA temp96 LIKE LINE OF temp95.
    temp96-n = `tokens`.
    temp96-v = tokens.
    INSERT temp96 INTO TABLE temp95.
    temp96-n = `showClearIcon`.
    temp96-v = lcl_utility=>get_json_boolean( showclearicon ).
    INSERT temp96 INTO TABLE temp95.
    temp96-n = `showValueHelp`.
    temp96-v = lcl_utility=>get_json_boolean( showvaluehelp ).
    INSERT temp96 INTO TABLE temp95.
    temp96-n = `suggestionItems`.
    temp96-v = suggestionitems.
    INSERT temp96 INTO TABLE temp95.
    temp96-n = `width`.
    temp96-v = width.
    INSERT temp96 INTO TABLE temp95.
    result = _generic(
        name   = `MultiInput`
        t_prop = temp95 ).

  ENDMETHOD.


  METHOD navigation_actions.

    result = _generic(
        name   = `navigationActions`
        ns     = `f`
      ).

  ENDMETHOD.


  METHOD object_attribute.

    result = me.

    DATA temp97 TYPE ty_t_name_value.
    CLEAR temp97.
    DATA temp98 LIKE LINE OF temp97.
    temp98-n = `title`.
    temp98-v = title.
    INSERT temp98 INTO TABLE temp97.
    temp98-n = `text`.
    temp98-v = text.
    INSERT temp98 INTO TABLE temp97.
    _generic(
       name   = `ObjectAttribute`
       t_prop = temp97 ).

  ENDMETHOD.


  METHOD object_number.

    result = me.
    DATA temp99 TYPE ty_t_name_value.
    CLEAR temp99.
    DATA temp100 LIKE LINE OF temp99.
    temp100-n = `emphasized`.
    temp100-v = lcl_utility=>get_json_boolean( emphasized ).
    INSERT temp100 INTO TABLE temp99.
    temp100-n = `number`.
    temp100-v = number.
    INSERT temp100 INTO TABLE temp99.
    temp100-n = `state`.
    temp100-v = state.
    INSERT temp100 INTO TABLE temp99.
    temp100-n = `unit`.
    temp100-v = unit.
    INSERT temp100 INTO TABLE temp99.
    _generic(
        name  = `ObjectNumber`
        t_prop = temp99 ).

  ENDMETHOD.


  METHOD object_page_dyn_header_title.

    result = _generic(
        name   = `ObjectPageDynamicHeaderTitle`
        ns     = `uxap`
    ).

  ENDMETHOD.


  METHOD object_page_layout.

    DATA temp101 TYPE ty_t_name_value.
    CLEAR temp101.
    DATA temp102 LIKE LINE OF temp101.
    temp102-n = `showTitleInHeaderContent`.
    temp102-v = lcl_utility=>get_json_boolean( showTitleInHeaderContent ).
    INSERT temp102 INTO TABLE temp101.
    temp102-n = `showEditHeaderButton`.
    temp102-v = lcl_utility=>get_json_boolean( showEditHeaderButton ).
    INSERT temp102 INTO TABLE temp101.
    temp102-n = `editHeaderButtonPress`.
    temp102-v = editHeaderButtonPress.
    INSERT temp102 INTO TABLE temp101.
    temp102-n = `upperCaseAnchorBar`.
    temp102-v = upperCaseAnchorBar.
    INSERT temp102 INTO TABLE temp101.
    result = _generic(
        name   = `ObjectPageLayout`
        ns     = `uxap`
        t_prop = temp101 ).

  ENDMETHOD.


  METHOD object_page_section.

    DATA temp103 TYPE ty_t_name_value.
    CLEAR temp103.
    DATA temp104 LIKE LINE OF temp103.
    temp104-n = `titleUppercase`.
    temp104-v = lcl_utility=>get_json_boolean( titleUppercase ).
    INSERT temp104 INTO TABLE temp103.
    temp104-n = `title`.
    temp104-v = title.
    INSERT temp104 INTO TABLE temp103.
    temp104-n = `id`.
    temp104-v = id.
    INSERT temp104 INTO TABLE temp103.
    temp104-n = `importance`.
    temp104-v = importance.
    INSERT temp104 INTO TABLE temp103.
    result = _generic(
        name   = `ObjectPageSection`
        ns     = `uxap`
        t_prop = temp103 ).

  ENDMETHOD.


  METHOD object_page_sub_section.

    DATA temp105 TYPE ty_t_name_value.
    CLEAR temp105.
    DATA temp106 LIKE LINE OF temp105.
    temp106-n = `id`.
    temp106-v = id.
    INSERT temp106 INTO TABLE temp105.
    temp106-n = `title`.
    temp106-v = title.
    INSERT temp106 INTO TABLE temp105.
    result = _generic(
        name   = `ObjectPageSubSection`
        ns     = `uxap`
      t_prop = temp105 ).

  ENDMETHOD.


  METHOD overflow_toolbar.

    result = _generic( `OverflowToolbar` ).

  ENDMETHOD.


  METHOD overflow_toolbar_button.

    result = me.
    DATA temp107 TYPE ty_t_name_value.
    CLEAR temp107.
    DATA temp108 LIKE LINE OF temp107.
    temp108-n = `press`.
    temp108-v = press.
    INSERT temp108 INTO TABLE temp107.
    temp108-n = `text`.
    temp108-v = text.
    INSERT temp108 INTO TABLE temp107.
    temp108-n = `enabled`.
    temp108-v = lcl_utility=>get_json_boolean( enabled ).
    INSERT temp108 INTO TABLE temp107.
    temp108-n = `icon`.
    temp108-v = icon.
    INSERT temp108 INTO TABLE temp107.
    temp108-n = `type`.
    temp108-v = type.
    INSERT temp108 INTO TABLE temp107.
    temp108-n = `tooltip`.
    temp108-v = tooltip.
    INSERT temp108 INTO TABLE temp107.
    _generic(
       name   = `OverflowToolbarButton`
       t_prop = temp107 ).

  ENDMETHOD.


METHOD overflow_toolbar_menu_button.

    DATA temp109 TYPE ty_t_name_value.
    CLEAR temp109.
    DATA temp110 LIKE LINE OF temp109.
    temp110-n = `buttonMode`.
    temp110-v = buttonMode.
    INSERT temp110 INTO TABLE temp109.
    temp110-n = `defaultAction`.
    temp110-v = defaultAction.
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
    result = _generic(
       name   = `OverflowToolbarMenuButton`
       t_prop = temp109 ).

  ENDMETHOD.


  METHOD overflow_toolbar_toggle_button.

    result = me.
    DATA temp111 TYPE ty_t_name_value.
    CLEAR temp111.
    DATA temp112 LIKE LINE OF temp111.
    temp112-n = `press`.
    temp112-v = press.
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
    _generic(
       name   = `OverflowToolbarToggleButton`
       t_prop = temp111 ).

  ENDMETHOD.


  METHOD page.

    DATA temp113 TYPE ty_t_name_value.
    CLEAR temp113.
    DATA temp114 LIKE LINE OF temp113.
    temp114-n = `title`.
    temp114-v = title.
    INSERT temp114 INTO TABLE temp113.
    temp114-n = `showNavButton`.
    temp114-v = lcl_utility=>get_json_boolean( shownavbutton ).
    INSERT temp114 INTO TABLE temp113.
    temp114-n = `navButtonPress`.
    temp114-v = navbuttonpress.
    INSERT temp114 INTO TABLE temp113.
    temp114-n = `class`.
    temp114-v = class.
    INSERT temp114 INTO TABLE temp113.
    temp114-n = `id`.
    temp114-v = id.
    INSERT temp114 INTO TABLE temp113.
    result = _generic(
        name   = `Page`
        ns     = ns
         t_prop = temp113 ).

  ENDMETHOD.


  METHOD points.

    result = _generic(
         name = `points`
         ns   = `mchart` ).

  ENDMETHOD.


  METHOD popover.

    DATA temp115 TYPE ty_t_name_value.
    CLEAR temp115.
    DATA temp116 LIKE LINE OF temp115.
    temp116-n = `title`.
    temp116-v = title.
    INSERT temp116 INTO TABLE temp115.
    temp116-n = `class`.
    temp116-v = class.
    INSERT temp116 INTO TABLE temp115.
    temp116-n = `placement`.
    temp116-v = placement.
    INSERT temp116 INTO TABLE temp115.
    temp116-n = `initialFocus`.
    temp116-v = initialFocus.
    INSERT temp116 INTO TABLE temp115.
    temp116-n = `contentHeight`.
    temp116-v = contentheight.
    INSERT temp116 INTO TABLE temp115.
    temp116-n = `contentWidth`.
    temp116-v = contentwidth.
    INSERT temp116 INTO TABLE temp115.
    result = _generic(
          name   = `Popover`
          t_prop = temp115 ).

  ENDMETHOD.


  METHOD progress_indicator.

    result = me.
    DATA temp117 TYPE ty_t_name_value.
    CLEAR temp117.
    DATA temp118 LIKE LINE OF temp117.
    temp118-n = `percentValue`.
    temp118-v = percentvalue.
    INSERT temp118 INTO TABLE temp117.
    temp118-n = `displayValue`.
    temp118-v = displayvalue.
    INSERT temp118 INTO TABLE temp117.
    temp118-n = `showValue`.
    temp118-v = lcl_utility=>get_json_boolean( showvalue ).
    INSERT temp118 INTO TABLE temp117.
    temp118-n = `state`.
    temp118-v = state.
    INSERT temp118 INTO TABLE temp117.
    _generic(
         name  = `ProgressIndicator`
         t_prop = temp117 ).

  ENDMETHOD.


  METHOD radial_micro_chart.

    result = me.
    DATA temp119 TYPE ty_t_name_value.
    CLEAR temp119.
    DATA temp120 LIKE LINE OF temp119.
    temp120-n = `percentage`.
    temp120-v = percentage.
    INSERT temp120 INTO TABLE temp119.
    temp120-n = `press`.
    temp120-v = press.
    INSERT temp120 INTO TABLE temp119.
    temp120-n = `sice`.
    temp120-v = sice.
    INSERT temp120 INTO TABLE temp119.
    temp120-n = `valueColor`.
    temp120-v = valuecolor.
    INSERT temp120 INTO TABLE temp119.
    _generic(
        name   = `RadialMicroChart`
        ns     = `mchart`
        t_prop = temp119 ).

  ENDMETHOD.


  METHOD range_slider.

    result = me.
    DATA temp121 TYPE ty_t_name_value.
    CLEAR temp121.
    DATA temp122 LIKE LINE OF temp121.
    temp122-n = `class`.
    temp122-v = class.
    INSERT temp122 INTO TABLE temp121.
    temp122-n = `endValue`.
    temp122-v = endvalue.
    INSERT temp122 INTO TABLE temp121.
    temp122-n = `id`.
    temp122-v = id.
    INSERT temp122 INTO TABLE temp121.
    temp122-n = `labelInterval`.
    temp122-v = labelinterval.
    INSERT temp122 INTO TABLE temp121.
    temp122-n = `max`.
    temp122-v = max.
    INSERT temp122 INTO TABLE temp121.
    temp122-n = `min`.
    temp122-v = min.
    INSERT temp122 INTO TABLE temp121.
    temp122-n = `showTickmarks`.
    temp122-v = lcl_utility=>get_json_boolean( showtickmarks ).
    INSERT temp122 INTO TABLE temp121.
    temp122-n = `startValue`.
    temp122-v = startvalue.
    INSERT temp122 INTO TABLE temp121.
    temp122-n = `step`.
    temp122-v = step.
    INSERT temp122 INTO TABLE temp121.
    temp122-n = `width`.
    temp122-v = width.
    INSERT temp122 INTO TABLE temp121.
    _generic(
          name  = `RangeSlider`
          ns    = `webc`
          t_prop = temp121 ).

  ENDMETHOD.


  METHOD scroll_container.

    DATA temp123 TYPE ty_t_name_value.
    CLEAR temp123.
    DATA temp124 LIKE LINE OF temp123.
    temp124-n = `height`.
    temp124-v = height.
    INSERT temp124 INTO TABLE temp123.
    temp124-n = `width`.
    temp124-v = width.
    INSERT temp124 INTO TABLE temp123.
    temp124-n = `vertical`.
    temp124-v = lcl_utility=>get_json_boolean( vertical ).
    INSERT temp124 INTO TABLE temp123.
    temp124-n = `horizontal`.
    temp124-v = lcl_utility=>get_json_boolean( horizontal ).
    INSERT temp124 INTO TABLE temp123.
    temp124-n = `focusable`.
    temp124-v = lcl_utility=>get_json_boolean( focusable ).
    INSERT temp124 INTO TABLE temp123.
    result = _generic(
        name = `ScrollContainer`
        t_prop = temp123 ).

  ENDMETHOD.


  METHOD search_field.

    result = me.
    DATA temp125 TYPE ty_t_name_value.
    CLEAR temp125.
    DATA temp126 LIKE LINE OF temp125.
    temp126-n = `width`.
    temp126-v = width.
    INSERT temp126 INTO TABLE temp125.
    temp126-n = `search`.
    temp126-v = search.
    INSERT temp126 INTO TABLE temp125.
    temp126-n = `value`.
    temp126-v = value.
    INSERT temp126 INTO TABLE temp125.
    temp126-n = `id`.
    temp126-v = id.
    INSERT temp126 INTO TABLE temp125.
    temp126-n = `change`.
    temp126-v = change.
    INSERT temp126 INTO TABLE temp125.
    temp126-n = `liveChange`.
    temp126-v = liveChange.
    INSERT temp126 INTO TABLE temp125.
    _generic(
         name  = `SearchField`
         t_prop = temp125 ).

  ENDMETHOD.


  METHOD sections.

    result = _generic(
        name   = `sections`
        ns     = `uxap`
     ).

  ENDMETHOD.


  METHOD segmented_button.

    DATA temp127 TYPE ty_t_name_value.
    CLEAR temp127.
    DATA temp128 LIKE LINE OF temp127.
    temp128-n = `selectedKey`.
    temp128-v = selected_key.
    INSERT temp128 INTO TABLE temp127.
    temp128-n = `selectionChange`.
    temp128-v = selection_change.
    INSERT temp128 INTO TABLE temp127.
    result = _generic(
       name  = `SegmentedButton`
       t_prop = temp127 ).

  ENDMETHOD.


  METHOD segmented_button_item.

    result = me.
    DATA temp129 TYPE ty_t_name_value.
    CLEAR temp129.
    DATA temp130 LIKE LINE OF temp129.
    temp130-n = `icon`.
    temp130-v = icon.
    INSERT temp130 INTO TABLE temp129.
    temp130-n = `key`.
    temp130-v = key.
    INSERT temp130 INTO TABLE temp129.
    temp130-n = `text`.
    temp130-v = text.
    INSERT temp130 INTO TABLE temp129.
    _generic(
        name = `SegmentedButtonItem`
        t_prop = temp129 ).

  ENDMETHOD.


  METHOD segments.

    result = _generic(
        name = `segments`
        ns   = `mchart` ).

  ENDMETHOD.


  METHOD shell.

    result = _generic(
        name   = `Shell`
        ns     = ns
      ).

  ENDMETHOD.


  METHOD simple_form.

    DATA temp131 TYPE ty_t_name_value.
    CLEAR temp131.
    DATA temp132 LIKE LINE OF temp131.
    temp132-n = `title`.
    temp132-v = title.
    INSERT temp132 INTO TABLE temp131.
    temp132-n = `layout`.
    temp132-v = layout.
    INSERT temp132 INTO TABLE temp131.
    temp132-n = `columnsXL`.
    temp132-v = columnsXL.
    INSERT temp132 INTO TABLE temp131.
    temp132-n = `columnsL`.
    temp132-v = columnsL.
    INSERT temp132 INTO TABLE temp131.
    temp132-n = `columnsM`.
    temp132-v = columnsm.
    INSERT temp132 INTO TABLE temp131.
    temp132-n = `editable`.
    temp132-v = lcl_utility=>get_json_boolean( editable ).
    INSERT temp132 INTO TABLE temp131.
    result = _generic(
      name   = `SimpleForm`
      ns     = `form`
      t_prop = temp131 ).

  ENDMETHOD.


  METHOD snapped_content.

    result = _generic(
         name   = `snappedContent`
         ns     = ns
      ).

  ENDMETHOD.


  METHOD snapped_heading.

    result = me.
    result = _generic(
        name   = `snappedHeading`
        ns     = `uxap`
     ).

  ENDMETHOD.


  METHOD snapped_title_on_mobile.

    result = _generic(
         name   = `snappedTitleOnMobile`
         ns     = `uxap`
      ).

  ENDMETHOD.


  METHOD standard_list_item.

    result = me.
    DATA temp133 TYPE ty_t_name_value.
    CLEAR temp133.
    DATA temp134 LIKE LINE OF temp133.
    temp134-n = `title`.
    temp134-v = title.
    INSERT temp134 INTO TABLE temp133.
    temp134-n = `description`.
    temp134-v = description.
    INSERT temp134 INTO TABLE temp133.
    temp134-n = `icon`.
    temp134-v = icon.
    INSERT temp134 INTO TABLE temp133.
    temp134-n = `info`.
    temp134-v = info.
    INSERT temp134 INTO TABLE temp133.
    temp134-n = `press`.
    temp134-v = press.
    INSERT temp134 INTO TABLE temp133.
    temp134-n = `type`.
    temp134-v = type.
    INSERT temp134 INTO TABLE temp133.
    temp134-n = `selected`.
    temp134-v = selected.
    INSERT temp134 INTO TABLE temp133.
    _generic(
        name = `StandardListItem`
        t_prop = temp133 ).

  ENDMETHOD.


  METHOD step_input.

    result = me.
    DATA temp135 TYPE ty_t_name_value.
    CLEAR temp135.
    DATA temp136 LIKE LINE OF temp135.
    temp136-n = `max`.
    temp136-v = max.
    INSERT temp136 INTO TABLE temp135.
    temp136-n = `min`.
    temp136-v = min.
    INSERT temp136 INTO TABLE temp135.
    temp136-n = `step`.
    temp136-v = step.
    INSERT temp136 INTO TABLE temp135.
    temp136-n = `value`.
    temp136-v = value.
    INSERT temp136 INTO TABLE temp135.
    _generic(
         name  = `StepInput`
         t_prop = temp135 ).

  ENDMETHOD.


  METHOD sub_header.

    result = _generic( `subHeader` ).

  ENDMETHOD.


  METHOD sub_sections.

    result = me.
    result = _generic(
        name   = `subSections`
        ns     = `uxap`
     ).

  ENDMETHOD.


  METHOD suggestion_items.

    result = _generic( `suggestionItems` ).

  ENDMETHOD.


  METHOD switch.

    result = me.
    DATA temp137 TYPE ty_t_name_value.
    CLEAR temp137.
    DATA temp138 LIKE LINE OF temp137.
    temp138-n = `type`.
    temp138-v = type.
    INSERT temp138 INTO TABLE temp137.
    temp138-n = `enabled`.
    temp138-v = lcl_utility=>get_json_boolean( enabled ).
    INSERT temp138 INTO TABLE temp137.
    temp138-n = `state`.
    temp138-v = state.
    INSERT temp138 INTO TABLE temp137.
    temp138-n = `customTextOff`.
    temp138-v = customtextoff.
    INSERT temp138 INTO TABLE temp137.
    temp138-n = `customTextOn`.
    temp138-v = customtexton.
    INSERT temp138 INTO TABLE temp137.
    _generic(
          name  = `Switch`
          t_prop = temp137 ).

  ENDMETHOD.


  METHOD tab.

    DATA temp139 TYPE ty_t_name_value.
    CLEAR temp139.
    DATA temp140 LIKE LINE OF temp139.
    temp140-n = `text`.
    temp140-v = text.
    INSERT temp140 INTO TABLE temp139.
    temp140-n = `selected`.
    temp140-v = selected.
    INSERT temp140 INTO TABLE temp139.
    result = _generic(
         name = `Tab`
         ns = `webc`
         t_prop = temp139 ).

  ENDMETHOD.


  METHOD table.

    DATA temp141 TYPE ty_t_name_value.
    CLEAR temp141.
    DATA temp142 LIKE LINE OF temp141.
    temp142-n = `items`.
    temp142-v = items.
    INSERT temp142 INTO TABLE temp141.
    temp142-n = `headerText`.
    temp142-v = headertext.
    INSERT temp142 INTO TABLE temp141.
    temp142-n = `growing`.
    temp142-v = growing.
    INSERT temp142 INTO TABLE temp141.
    temp142-n = `growingThreshold`.
    temp142-v = growingthreshold.
    INSERT temp142 INTO TABLE temp141.
    temp142-n = `growingScrollToLoad`.
    temp142-v = growingscrolltoload.
    INSERT temp142 INTO TABLE temp141.
    temp142-n = `sticky`.
    temp142-v = sticky.
    INSERT temp142 INTO TABLE temp141.
    temp142-n = `mode`.
    temp142-v = mode.
    INSERT temp142 INTO TABLE temp141.
    temp142-n = `width`.
    temp142-v = width.
    INSERT temp142 INTO TABLE temp141.
    temp142-n = `selectionChange`.
    temp142-v = selectionchange.
    INSERT temp142 INTO TABLE temp141.
    temp142-n = `alternateRowColors`.
    temp142-v = lcl_utility=>get_json_boolean( alternateRowColors ).
    INSERT temp142 INTO TABLE temp141.
    temp142-n = `autoPopinMode`.
    temp142-v = lcl_utility=>get_json_boolean( autoPopinMode ).
    INSERT temp142 INTO TABLE temp141.
    result = _generic(
        name  = `Table`
        t_prop = temp141 ).

  ENDMETHOD.


  METHOD tab_container.

    result = _generic(
        name = `TabContainer`
        ns   = `webc` ).

  ENDMETHOD.


  METHOD text.

    result = me.
    DATA temp143 TYPE ty_t_name_value.
    CLEAR temp143.
    DATA temp144 LIKE LINE OF temp143.
    temp144-n = `text`.
    temp144-v = text.
    INSERT temp144 INTO TABLE temp143.
    temp144-n = `class`.
    temp144-v = class.
    INSERT temp144 INTO TABLE temp143.
    _generic(
      name  = `Text`
      ns    = ns
      t_prop = temp143 ).

  ENDMETHOD.


  METHOD text_area.

    result = me.
    DATA temp145 TYPE ty_t_name_value.
    CLEAR temp145.
    DATA temp146 LIKE LINE OF temp145.
    temp146-n = `value`.
    temp146-v = value.
    INSERT temp146 INTO TABLE temp145.
    temp146-n = `rows`.
    temp146-v = rows.
    INSERT temp146 INTO TABLE temp145.
    temp146-n = `height`.
    temp146-v = height.
    INSERT temp146 INTO TABLE temp145.
    temp146-n = `width`.
    temp146-v = width.
    INSERT temp146 INTO TABLE temp145.
    temp146-n = `editable`.
    temp146-v = lcl_utility=>get_json_boolean( editable ).
    INSERT temp146 INTO TABLE temp145.
    temp146-n = `enabled`.
    temp146-v = lcl_utility=>get_json_boolean( enabled ).
    INSERT temp146 INTO TABLE temp145.
    temp146-n = `id`.
    temp146-v = id.
    INSERT temp146 INTO TABLE temp145.
    temp146-n = `growing`.
    temp146-v = lcl_utility=>get_json_boolean( growing ).
    INSERT temp146 INTO TABLE temp145.
    temp146-n = `growingMaxLines`.
    temp146-v = growingmaxlines.
    INSERT temp146 INTO TABLE temp145.
    _generic(
          name  = `TextArea`
            t_prop = temp145 ).

  ENDMETHOD.


  METHOD time_picker.

    result = me.
    DATA temp147 TYPE ty_t_name_value.
    CLEAR temp147.
    DATA temp148 LIKE LINE OF temp147.
    temp148-n = `value`.
    temp148-v = value.
    INSERT temp148 INTO TABLE temp147.
    temp148-n = `placeholder`.
    temp148-v = placeholder.
    INSERT temp148 INTO TABLE temp147.
    _generic(
     name   = `TimePicker`
     t_prop = temp147 ).

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
    DATA temp150 TYPE ty_t_name_value.
    CLEAR temp150.
    DATA temp151 LIKE LINE OF temp150.
    temp151-n = `text`.
    temp151-v = text.
    INSERT temp151 INTO TABLE temp150.
    temp151-n = `wrapping`.
    temp151-v = lcl_utility=>get_json_boolean( wrapping ).
    INSERT temp151 INTO TABLE temp150.
    temp151-n = `level`.
    temp151-v = level.
    INSERT temp151 INTO TABLE temp150.
    _generic(
         ns = ns
         name  = lv_name
         t_prop = temp150 ).

  ENDMETHOD.


  METHOD toggle_button.

    result = me.
    DATA temp152 TYPE ty_t_name_value.
    CLEAR temp152.
    DATA temp153 LIKE LINE OF temp152.
    temp153-n = `press`.
    temp153-v = press.
    INSERT temp153 INTO TABLE temp152.
    temp153-n = `text`.
    temp153-v = text.
    INSERT temp153 INTO TABLE temp152.
    temp153-n = `enabled`.
    temp153-v = lcl_utility=>get_json_boolean( enabled ).
    INSERT temp153 INTO TABLE temp152.
    temp153-n = `icon`.
    temp153-v = icon.
    INSERT temp153 INTO TABLE temp152.
    temp153-n = `type`.
    temp153-v = type.
    INSERT temp153 INTO TABLE temp152.
    temp153-n = `class`.
    temp153-v = class.
    INSERT temp153 INTO TABLE temp152.
    _generic(
       name   = `ToggleButton`
       t_prop = temp152 ).

  ENDMETHOD.


  METHOD token.

    result = me.
    DATA temp154 TYPE ty_t_name_value.
    CLEAR temp154.
    DATA temp155 LIKE LINE OF temp154.
    temp155-n = `key`.
    temp155-v = key.
    INSERT temp155 INTO TABLE temp154.
    temp155-n = `text`.
    temp155-v = text.
    INSERT temp155 INTO TABLE temp154.
    temp155-n = `selected`.
    temp155-v = selected.
    INSERT temp155 INTO TABLE temp154.
    temp155-n = `visible`.
    temp155-v = visible.
    INSERT temp155 INTO TABLE temp154.
    _generic(
        name   = `Token`
        t_prop = temp154 ).

  ENDMETHOD.


  METHOD tokens.

    result = _generic( `tokens` ).

  ENDMETHOD.


  METHOD toolbar.

    result = _generic( `Toolbar` ).

  ENDMETHOD.


  METHOD toolbar_spacer.

    result = me.
    _generic(
        name = `ToolbarSpacer`
        ns   = ns
        ).

  ENDMETHOD.


  METHOD vbox.

    DATA temp156 TYPE ty_t_name_value.
    CLEAR temp156.
    DATA temp157 LIKE LINE OF temp156.
    temp157-n = `height`.
    temp157-v = height.
    INSERT temp157 INTO TABLE temp156.
    temp157-n = `class`.
    temp157-v = class.
    INSERT temp157 INTO TABLE temp156.
    result = _generic(
         name   = `VBox`
         t_prop = temp156 ).

  ENDMETHOD.


  METHOD vertical_layout.

    DATA temp158 TYPE ty_t_name_value.
    CLEAR temp158.
    DATA temp159 LIKE LINE OF temp158.
    temp159-n = `class`.
    temp159-v = class.
    INSERT temp159 INTO TABLE temp158.
    temp159-n = `width`.
    temp159-v = width.
    INSERT temp159 INTO TABLE temp158.
    result = _generic(
        name   = `VerticalLayout`
        ns     = `layout`
        t_prop = temp158 ).

  ENDMETHOD.


  METHOD xml_get.

    CASE m_name.
      WHEN `ZZPLAIN`.
        DATA temp160 LIKE LINE OF mt_prop.
        DATA temp161 LIKE sy-tabix.
        temp161 = sy-tabix.
        READ TABLE mt_prop WITH KEY n = `VALUE` INTO temp160.
        sy-tabix = temp161.
        IF sy-subrc <> 0.
          RAISE EXCEPTION TYPE cx_sy_itab_line_not_found.
        ENDIF.
        result = temp160-v.
        RETURN.
    ENDCASE.

    DATA temp162 TYPE string.
    IF m_ns <> ``.
      temp162 = |{ m_ns }:|.
    ELSE.
      CLEAR temp162.
    ENDIF.
    DATA lv_tmp2 LIKE temp162.
    lv_tmp2 = temp162.
    DATA temp163 TYPE string.
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
    temp163 = val.
    DATA lv_tmp3 LIKE temp163.
    lv_tmp3 = temp163.

    result = |{ result } <{ lv_tmp2 }{ m_name } \n { lv_tmp3 }|.

    IF t_child IS INITIAL.
      result = |{ result }/>|.
      RETURN.
    ENDIF.

    result = |{ result }>|.

    DATA lr_child LIKE LINE OF t_child.
    LOOP AT t_child INTO lr_child.
      DATA temp164 TYPE REF TO z2ui5_cl_xml_view.
      temp164 ?= lr_child.
      result = result && temp164->xml_get( ).
    ENDLOOP.

    DATA temp165 TYPE string.
    IF m_ns <> ||.
      temp165 = |{ m_ns }:|.
    ELSE.
      CLEAR temp165.
    ENDIF.
    DATA lv_ns LIKE temp165.
    lv_ns = temp165.
    result = |{ result }</{ lv_ns }{ m_name }>|.

  ENDMETHOD.


  METHOD zz_plain.

    result = me.
    DATA temp166 TYPE ty_t_name_value.
    CLEAR temp166.
    DATA temp167 LIKE LINE OF temp166.
    temp167-n = `VALUE`.
    temp167-v = val.
    INSERT temp167 INTO TABLE temp166.
    _generic(
         name  = `ZZPLAIN`
         t_prop = temp166
    ).

  ENDMETHOD.


  METHOD _generic.

    DATA result2 TYPE REF TO z2ui5_cl_xml_view.
    CREATE OBJECT result2 TYPE z2ui5_cl_xml_view.
    result2->m_name = name.
    result2->m_ns = ns.
    result2->mt_prop = t_prop.
    result2->m_parent = me.
    result2->m_root   = m_root.
    INSERT result2 INTO TABLE t_child.

    m_root->m_last = result2.
    result = result2.

  ENDMETHOD.
ENDCLASS.
