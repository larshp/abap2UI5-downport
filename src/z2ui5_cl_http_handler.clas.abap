CLASS z2ui5_cl_http_handler DEFINITION
  PUBLIC
  CREATE PUBLIC.

  PUBLIC SECTION.

    CLASS-METHODS http_get
      IMPORTING
        t_config                TYPE z2ui5_if_client=>ty_t_name_value OPTIONAL
        content_security_policy TYPE clike                            OPTIONAL
        check_logging           TYPE abap_bool                        OPTIONAL
          PREFERRED PARAMETER t_config
      RETURNING
        VALUE(r_result)         TYPE string.

    CLASS-METHODS http_post
      IMPORTING
        body          TYPE string
        path_info     TYPE string OPTIONAL
      RETURNING
        VALUE(result) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS z2ui5_cl_http_handler IMPLEMENTATION.


  METHOD http_get.

    DATA lt_Config LIKE t_config.
      DATA temp1 TYPE z2ui5_if_client=>ty_t_name_value.
      DATA temp2 LIKE LINE OF temp1.
      DATA lv_sec_policy TYPE string.
    DATA temp3 LIKE LINE OF lt_config.
    DATA lr_config LIKE REF TO temp3.
    lt_Config = t_config.

    IF lt_config IS INITIAL.
      
      CLEAR temp1.
      
      temp2-n = `data-sap-ui-theme`.
      temp2-v = `sap_horizon`.
      INSERT temp2 INTO TABLE temp1.
      temp2-n = `src`.
      temp2-v = `https://sdk.openui5.org/resources/sap-ui-cachebuster/sap-ui-core.js`.
      INSERT temp2 INTO TABLE temp1.
      temp2-n = `data-sap-ui-libs`.
      temp2-v = `sap.m`.
      INSERT temp2 INTO TABLE temp1.
      temp2-n = `data-sap-ui-bindingSyntax`.
      temp2-v = `complex`.
      INSERT temp2 INTO TABLE temp1.
      temp2-n = `data-sap-ui-frameOptions`.
      temp2-v = `trusted`.
      INSERT temp2 INTO TABLE temp1.
      temp2-n = `data-sap-ui-compatVersion`.
      temp2-v = `edge`.
      INSERT temp2 INTO TABLE temp1.
      lt_config = temp1.
    ENDIF.

    IF content_security_policy IS NOT SUPPLIED.
      
      lv_sec_policy = `<meta http-equiv="Content-Security-Policy" content="default-src 'self' 'unsafe-inline' 'unsafe-eval' data: ` &&
        `ui5.sap.com *.ui5.sap.com sapui5.hana.ondemand.com *.sapui5.hana.ondemand.com sdk.openui5.org *.sdk.openui5.org cdn.jsdelivr.net *.cdn.jsdelivr.net"/>`.
    ELSE.
      lv_sec_policy = content_security_policy.
    ENDIF.
    z2ui5_lcl_fw_db=>cleanup( ).

    r_result = `<html>` && |\n| &&
               `<head>` && |\n| &&
                  lv_sec_policy && |\n| &&
               `    <meta charset="UTF-8">` && |\n| &&
               `    <meta name="viewport" content="width=device-width, initial-scale=1.0">` && |\n| &&
               `    <meta http-equiv="X-UA-Compatible" content="IE=edge">` && |\n| &&
               `    <title>abap2UI5</title>` && |\n| &&
               `    <style>` && |\n| &&
               `        html, body, body > div, #container, #container-uiarea {` && |\n| &&
               `            height: 100%;` && |\n| &&
               `        }` && |\n| &&
               `    </style> ` &&
               `    <script id="sap-ui-bootstrap"`.

    
    
    LOOP AT lt_config REFERENCE INTO lr_config.
      r_result = r_result && | { lr_config->n }="{ lr_config->v }"|.
    ENDLOOP.

    r_result = r_result &&
        ` ></script></head>` && |\n| &&
        `<body class="sapUiBody sapUiSizeCompact" >` && |\n| &&
        `    <div id="content"  data-handle-validation="true" ></div>` && |\n| &&
        `</body>` && |\n| &&
        `</html>` && |\n|.
    r_result = r_result && `<script>` && |\n|  &&
                           `    sap.ui.getCore().attachInit(function () {` && |\n|  &&
                           `        "use strict";` && |\n|  &&
                           |\n|  &&
                           `        sap.ui.controller("z2ui5_controller", {` && |\n|  &&
                           |\n|  &&
                           `            onAfterRendering: function () {` && |\n|  &&
                           |\n|  &&
                           `                if (sap.z2ui5.oResponse.PARAMS.TITLE != "") {` && |\n|  &&
                           `                    document.title = sap.z2ui5.oResponse.PARAMS.TITLE;` && |\n|  &&
                           `                }` && |\n|  &&
                           `                if (sap.z2ui5.oResponse.PARAMS.S_MSG_TOAST.TEXT !== '') {` && |\n|  &&
                           `                    sap.m.MessageToast.show(sap.z2ui5.oResponse.PARAMS.S_MSG_TOAST.TEXT);` && |\n|  &&
                           `                }` && |\n|  &&
                           `                if (sap.z2ui5.oResponse.PARAMS.S_MSG_BOX.TEXT !== '') {` && |\n|  &&
                           `                    sap.m.MessageBox[sap.z2ui5.oResponse.PARAMS.S_MSG_BOX.TYPE](sap.z2ui5.oResponse.PARAMS.S_MSG_BOX.TEXT);` && |\n|  &&
                           `                }` && |\n|  &&
                           `                if (sap.z2ui5.oResponse.PARAMS.PATH != "") {` && |\n|  &&
                           `                    //    window.history.replaceState("", "", window.location.origin + sap.z2ui5.oResponse.PARAMS.PATH + window.location.search);` && |\n|  &&
                           `                }` && |\n|  &&
                           `                if (sap.z2ui5.oResponse.PARAMS.S_CURSOR.ID !== '') {` && |\n|  &&
                           `                    jQuery.sap.delayedCall(50, this, function () {` && |\n|  &&
                           `                        var ofocus = sap.z2ui5.oView.byId(sap.z2ui5.oResponse.PARAMS.S_CURSOR.ID).getFocusInfo();` && |\n|  &&
                           `                        ofocus.selectionStart = parseInt(sap.z2ui5.oResponse.PARAMS.S_CURSOR.SELECTIONSTART);` && |\n|  &&
                           `                        ofocus.selectionEnd = parseInt(sap.z2ui5.oResponse.PARAMS.S_CURSOR.SELECTIONEND);` && |\n|  &&
                           `                        sap.z2ui5.oView.byId(sap.z2ui5.oResponse.PARAMS.S_CURSOR.ID).applyFocusInfo(ofocus);` && |\n|  &&
                           `                    });` && |\n|  &&
                           `                }` && |\n|  &&
                           `                if (sap.z2ui5.oResponse.PARAMS.T_SCROLL) {` && |\n|  &&
                           `                    sap.z2ui5.oResponse.PARAMS.T_SCROLL.forEach(item => {` && |\n|  &&
                           `                        try {` && |\n|  &&
                           `                            sap.z2ui5.oView.byId(item.NAME).scrollTo(parseInt(item.VALUE));` && |\n|  &&
                           `                        } catch (e) {` && |\n|  &&
                           `                            try {` && |\n|  &&
                           `                                var ele = '#' + sap.z2ui5.oView.byId(item.NAME).getId() + '-inner';` && |\n|  &&
                           `                                $(ele).scrollTop(item.VALUE);` && |\n|  &&
                           `                            } catch (e) { }` && |\n|  &&
                           `                        }` && |\n|  &&
                           `                    }` && |\n|  &&
                           `                    );` && |\n|  &&
                           `                }` && |\n|  &&
                           `                if (sap.z2ui5.oResponse.PARAMS.S_POPUP.CHECK_CLOSE == true) {` && |\n|  &&
                           `                    sap.z2ui5.oController.PopupClose();` && |\n|  &&
                           `                }` && |\n|  &&
                           `                if (sap.z2ui5.oResponse.PARAMS.S_POPUP.XML) {` && |\n|  &&
                           `                    sap.z2ui5.oController.PopupClose();` && |\n|  &&
                           `                    sap.ui.core.Fragment.load({` && |\n|  &&
                           `                        definition: sap.z2ui5.oResponse.PARAMS.S_POPUP.XML,` && |\n|  &&
                           `                        controller: sap.z2ui5.oController,` && |\n|  &&
                           `                    }).then(function (oFragment) {` && |\n|  &&
                           `                        oFragment.setModel(new sap.ui.model.json.JSONModel(sap.z2ui5.oResponse.OVIEWMODEL))` && |\n|  &&
                           `                        sap.z2ui5.oView.addDependent(oFragment);` && |\n|  &&
                           `                        oFragment.open();` && |\n|  &&
                           `                        sap.z2ui5.oViewPopup = oFragment;` && |\n|  &&
                           `                    }.bind(this));` && |\n|  &&
                           `                }` && |\n|  &&
                           `                if (sap.z2ui5.oResponse.PARAMS.S_POPOVER.CHECK_CLOSE == true) {` && |\n|  &&
                           `                    sap.z2ui5.oController.PopoverClose();` && |\n|  &&
                           `                }` && |\n|  &&
                           `                if (sap.z2ui5.oResponse.PARAMS.S_POPOVER.XML) {` && |\n|  &&
                           `                    sap.z2ui5.oController.PopoverClose();` && |\n|  &&
                           `                    sap.ui.core.Fragment.load({` && |\n|  &&
                           `                        definition: sap.z2ui5.oResponse.PARAMS.S_POPOVER.XML,` && |\n|  &&
                           `                        controller: sap.z2ui5.oController,` && |\n|  &&
                           `                    }).then(function (oFragment) {` && |\n|  &&
                           `                        oFragment.setModel(new sap.ui.model.json.JSONModel(sap.z2ui5.oResponse.OVIEWMODEL))` && |\n|  &&
                           `                        sap.z2ui5.oView.addDependent(oFragment);` && |\n|  &&
                           `                        var oControl = sap.ui.getCore().byId(sap.z2ui5.oResponse.PARAMS.S_POPOVER.OPEN_BY_ID);` && |\n|  &&
                           `                        if (oControl === undefined) {` && |\n|  &&
                           `                            oControl = sap.z2ui5.oView.byId(sap.z2ui5.oResponse.PARAMS.S_POPOVER.OPEN_BY_ID);` && |\n|  &&
                           `                        }` && |\n|  &&
                           `                        oFragment.openBy(oControl);` && |\n|  &&
                           `                        sap.z2ui5.oViewPopover = oFragment;` && |\n|  &&
                           `                    }.bind(this));` && |\n|  &&
                           `                }` && |\n|  &&
                           `                if (sap.z2ui5.oResponse.PARAMS.S_TIMER.INTERVAL_MS !== '') {` && |\n|  &&
                           `                    var oEvent = { 'EVENT': 'BUTTON_CHECK', 'METHOD': 'UPDATE' };` && |\n|  &&
                           `                    oEvent.EVENT = sap.z2ui5.oResponse.PARAMS.S_TIMER.EVENT_FINISHED;` && |\n|  &&
                           `                    sap.z2ui5.checkTimerActive = true;` && |\n|  &&
                           `                    setTimeout(() => {` && |\n|  &&
                           `                        if (sap.z2ui5.checkTimerActive) {` && |\n|  &&
                           `                            sap.z2ui5.oController.onEvent(oEvent);` && |\n|  &&
                           `                        }` && |\n|  &&
                           `                    }, parseInt(sap.z2ui5.oResponse.PARAMS.S_TIMER.INTERVAL_MS), oEvent);` && |\n|  &&
                           `                }` && |\n|  &&
                           `                sap.ui.core.BusyIndicator.hide();` && |\n|  &&
                           `            },` && |\n|  &&
                           `            PopupClose: function () {` && |\n|  &&
                           `                if (!sap.z2ui5.oViewPopup) {` && |\n|  &&
                           `                    return;` && |\n|  &&
                           `                }` && |\n|  &&
                           `                if (sap.z2ui5.oViewPopup.close) {` && |\n|  &&
                           `                    try { sap.z2ui5.oViewPopup.close(); } catch (e) { }` && |\n|  &&
                           `                }` && |\n|  &&
                           `                sap.z2ui5.oViewPopup.destroy();` && |\n|  &&
                           `            },` && |\n|  &&
                           `            PopoverClose: function () {` && |\n|  &&
                           `                if (!sap.z2ui5.oViewPopover) {` && |\n|  &&
                           `                    return;` && |\n|  &&
                           `                }` && |\n|  &&
                           `                if (sap.z2ui5.oViewPopover.close) {` && |\n|  &&
                           `                    try { sap.z2ui5.oViewPopover.close(); } catch (e) { }` && |\n|  &&
                           `                }` && |\n|  &&
                           `                sap.z2ui5.oViewPopover.destroy();` && |\n|  &&
                           `            },` && |\n|  &&
                           `            ViewClose: function () {` && |\n|  &&
                           `                if (!sap.z2ui5.oView) {` && |\n|  &&
                           `                    return;` && |\n|  &&
                           `                }` && |\n|  &&
                           `                sap.z2ui5.oView.destroy();` && |\n|  &&
                           `            },` && |\n|  &&
                           `            onEventFrontend: function (oEvent) {` && |\n|  &&
                           |\n|  &&
                           `                switch (oEvent.EVENT) {` && |\n|  &&
                           |\n|  &&
                           `                    case 'LEAVE_HOME':` && |\n|  &&
                           `                        if (sap.z2ui5.oResponse.PARAMS.PATH != '') {` && |\n|  &&
                           `                            window.location = window.location.href.split(sap.z2ui5.oResponse.PARAMS.PATH)[0];` && |\n|  &&
                           `                        } else { window.location.reload(); }` && |\n|  &&
                           `                        break;` && |\n|  &&
                           `                    case 'LEAVE_RESTART':` && |\n|  &&
                           `                        window.location.reload();` && |\n|  &&
                           `                        break;` && |\n|  &&
                           `                    case 'POPUP_CLOSE':` && |\n|  &&
                           `                        sap.z2ui5.oController.PopupClose();` && |\n|  &&
                           `                        break;` && |\n|  &&
                           `                    case 'POPOVER_CLOSE':` && |\n|  &&
                           `                        sap.z2ui5.oController.PopoverClose();` && |\n|  &&
                           `                        break;` && |\n|  &&
                           `                }` && |\n|  &&
                           `            },` && |\n|  &&
                           `            onEventPromise: function (Promise) {` && |\n|  &&
                           `               ` && |\n|  &&
                           `            },` && |\n|  &&
                           `            onEvent: function (oEvent) {` && |\n|  &&
                           |\n|  &&
                           `                if (!window.navigator.onLine) {` && |\n|  &&
                           `                    sap.m.MessageBox.alert('No internet connection! Please reconnect to the server and try again.');` && |\n|  &&
                           `                    return;` && |\n|  &&
                           `                }` && |\n|  &&
                           |\n|  &&
                           `                sap.ui.core.BusyIndicator.show();` && |\n|  &&
                           `                this.oBody = {};` && |\n|  &&
                           `                this.oBody.oUpdate = sap.z2ui5.oView.getModel().getData().oUpdate;` && |\n|  &&
                           `                if (oEvent.CHECK_VIEW_DESTROY) {` && |\n|  &&
                           `                    sap.z2ui5.oController.ViewClose();` && |\n|  &&
                           `                }` && |\n|  &&
                           `                if (sap.z2ui5.oResponse.PARAMS.T_SCROLL) {` && |\n|  &&
                           `                    this.oBody.oScroll = sap.z2ui5.oResponse.PARAMS.T_SCROLL;` && |\n|  &&
                           `                    this.oBody.oScroll.forEach(item => {` && |\n|  &&
                           `                        try {` && |\n|  &&
                           `                            item.VALUE = this.getView().byId(item.NAME).getScrollDelegate().getScrollTop();` && |\n|  &&
                           `                        } catch (e) {` && |\n|  &&
                           `                            try {` && |\n|  &&
                           `                                var ele = '#' + this.getView().byId(item.NAME).getId() + '-inner';` && |\n|  &&
                           `                                item.VALUE = $(ele).scrollTop();` && |\n|  &&
                           `                            } catch (e) { }` && |\n|  &&
                           `                        }` && |\n|  &&
                           `                    });` && |\n|  &&
                           `                }` && |\n|  &&
                           `                this.oBody.ID = sap.z2ui5.oResponse.ID;` && |\n|  &&
                           `                this.oBody.CHECKLAUNCHPADACTIVE = sap.z2ui5.checkLaunchpadActive;` && |\n|  &&
                           `                this.oBody.ARGUMENTS = arguments;` && |\n|  &&
                           `                try { this.oBody.OCURSOR = sap.ui.getCore().byId(sap.ui.getCore().getCurrentFocusedControlId()).getFocusInfo(); } catch (e) { }` && |\n|  &&
                           |\n|  &&
                           `                if (sap.z2ui5.checkLogActive) {` && |\n|  &&
                           `                    console.log('Request Object:');` && |\n|  &&
                           `                    console.log(this.oBody);` && |\n|  &&
                           `                }` && |\n|  &&
                           `                sap.z2ui5.oResponseOld = sap.z2ui5.oResponse;` && |\n|  &&
                           `                sap.z2ui5.oResponse = {};` && |\n|  &&
                           `                sap.z2ui5.oBody = this.oBody;` && |\n|  &&
                           `                sap.z2ui5.isHoldView = oEvent.isHoldView;` && |\n|  &&
                           `                sap.z2ui5.oController.Roundtrip(oEvent.isHoldView);` && |\n|  &&
                           `            },` && |\n|  &&
                           `            responseError: function (response) {` && |\n|  &&
                           `                document.write(response);` && |\n|  &&
                           `            },` && |\n|  &&
                           `            responseSuccess: function (response) {` && |\n|  &&
                           |\n|  &&
                           `                sap.z2ui5.oResponse = JSON.parse(response);` && |\n|  &&
                           |\n|  &&
                           `                if (sap.z2ui5.checkLogActive) {` && |\n|  &&
                           `                    console.log('Response Object:');` && |\n|  &&
                           `                    console.log(sap.z2ui5.oResponse);` && |\n|  &&
                           `                    if (sap.z2ui5.oResponse.PARAMS.S_VIEW.XML !== '') {` && |\n|  &&
                           `                        console.log('UI5-XML-View:');` && |\n|  &&
                           `                        console.log(sap.z2ui5.oResponse.PARAMS.S_VIEW.XML);` && |\n|  &&
                           `                    }` && |\n|  &&
                           `                    if (sap.z2ui5.oResponse.PARAMS.S_POPUP.XML !== '') {` && |\n|  &&
                           `                        console.log('UI5-XML-Popup:');` && |\n|  &&
                           `                        console.log(sap.z2ui5.oResponse.PARAMS.S_POPUP.XML);` && |\n|  &&
                           `                    }` && |\n|  &&
                           `                }` && |\n|  &&
                           |\n|  &&
                           `                var oModel = new sap.ui.model.json.JSONModel(sap.z2ui5.oResponse.OVIEWMODEL);` && |\n|  &&
                           `                if (sap.z2ui5.oResponse.PARAMS.S_VIEW.CHECK_DESTROY == true) { if (sap.z2ui5.oView) { sap.z2ui5.oView.destroy(); } }` && |\n|  &&
                           `                if (sap.z2ui5.oResponse.PARAMS.S_VIEW.XML !== '') {` && |\n|  &&
                           `                    sap.z2ui5.oController.ViewClose();` && |\n|  &&
                           `                    new sap.ui.core.mvc.XMLView.create({` && |\n|  &&
                           `                        definition: sap.z2ui5.oResponse.PARAMS.S_VIEW.XML,` && |\n|  &&
                           `                    }).then(oView => {` && |\n|  &&
                           `                        oView.setModel(oModel);` && |\n|  &&
                           `                        if (sap.z2ui5.oParent) {` && |\n|  &&
                           `                            sap.z2ui5.oParent.removeAllPages();` && |\n|  &&
                           `                            sap.z2ui5.oParent.insertPage(oView);` && |\n|  &&
                           `                        } else {` && |\n|  &&
                           `                            oView.placeAt("content")` && |\n|  &&
                           `                        };` && |\n|  &&
                           `                        sap.z2ui5.oView = oView;` && |\n|  &&
                           `                    },` && |\n|  &&
                           `                    );` && |\n|  &&
                           `                } else {` && |\n|  &&
                           `                    if (sap.z2ui5.oView) {` && |\n|  &&
                           `                        sap.z2ui5.oView.setModel(oModel);` && |\n|  &&
                           `                    }` && |\n|  &&
                           `                    sap.z2ui5.oController.onAfterRendering();` && |\n|  &&
                           `                }` && |\n|  &&
                           `            },` && |\n|  &&
                           `            readHttp: function () {` && |\n|  &&
                           |\n|  &&
                           `                var xhr = new XMLHttpRequest();` && |\n|  &&
                           `                xhr.open("POST", sap.z2ui5.pathname, true);` && |\n|  &&
                           `                xhr.onload = function (that) {` && |\n|  &&
                           |\n|  &&
                           `                    if (that.target.status !== 200) {` && |\n|  &&
                           `                        sap.z2ui5.oController.responseError(that.target.response);` && |\n|  &&
                           `                    } else {` && |\n|  &&
                           `                        sap.z2ui5.oController.responseSuccess(that.target.response);` && |\n|  &&
                           `                    }` && |\n|  &&
                           `                }` && |\n|  &&
                           `                xhr.send(JSON.stringify(sap.z2ui5.oBody));` && |\n|  &&
                           `            },` && |\n|  &&
                           `            Roundtrip: function () {` && |\n|  &&
                           |\n|  &&
                           `                sap.z2ui5.checkTimerActive = false;` && |\n|  &&
                           |\n|  &&
                           `                sap.z2ui5.oBody.OLOCATION = {};` && |\n|  &&
                           `                sap.z2ui5.oBody.OLOCATION.ORIGIN = window.location.origin;` && |\n|  &&
                           `                sap.z2ui5.oBody.OLOCATION.PATHNAME = sap.z2ui5.pathname;` && |\n|  &&
                           `                sap.z2ui5.oBody.OLOCATION.SEARCH = window.location.search;` && |\n|  &&
                           `                sap.z2ui5.oBody.OLOCATION.VERSION = sap.ui.getVersionInfo().gav;` && |\n|  &&
                           |\n|  &&
                           `                if (sap.z2ui5.readOData) {` && |\n|  &&
                           `                    sap.z2ui5.readOData();` && |\n|  &&
                           `                } else {` && |\n|  &&
                           `                    sap.z2ui5.oController.readHttp();` && |\n|  &&
                           `                }` && |\n|  &&
                           `            },` && |\n|  &&
                           `        });` && |\n|  &&
                           |\n|  &&
                           `        if (!sap.z2ui5) {` && |\n|  &&
                           `            sap.z2ui5 = {};` && |\n|  &&
                           `        }` && |\n|  &&
                           `        if (!sap.z2ui5.pathname) {` && |\n|  &&
                           `            sap.z2ui5.pathname = window.location.pathname;` && |\n|  &&
                           `          //  sap.z2ui5.pathname = "/sap/bc/http/sap/y2ui5_http_handler/";` && |\n|  &&
                           `        }` && |\n|  &&
                           `        if (!sap.z2ui5.checkLaunchpadActive) {` && |\n|  &&
                           `            sap.z2ui5.checkLaunchpadActive = false;` && |\n|  &&
                           `        }` && |\n|  &&
                           |\n|  &&
                           `        jQuery.sap.require("sap.ui.core.Fragment");` && |\n|  &&
                           `        jQuery.sap.require("sap.m.MessageToast");` && |\n|  &&
                           `        jQuery.sap.require("sap.m.MessageBox");` && |\n|  &&
                           `        jQuery.sap.require("sap.ui.model.json.JSONModel");` && |\n|  &&
                           |\n|  &&
                           `        var xml = atob('PA==') + 'mvc:View controllerName="z2ui5_controller" xmlns:mvc="sap.ui.core.mvc" /' + atob('Pg==');` && |\n|  &&
                           `        var oView = sap.ui.xmlview({ viewContent: xml });` && |\n|  &&
                           `        sap.z2ui5.oController = oView.getController();` && |\n|  &&
                           `        sap.z2ui5.checkLogActive = ` && z2ui5_lcl_utility=>get_json_boolean( check_logging ) && `;` && |\n| &&
                           `        sap.z2ui5.oBody = {};` && |\n|  &&
                           `        sap.z2ui5.oController.Roundtrip();` && |\n|  &&
                           |\n|  &&
                           `    });` && |\n|  &&
                           `</script>` && |\n| &&
                           `</html>`.

*        `        sap.z2ui5.checkLogActive = ` && z2ui5_lcl_utility=>get_json_boolean( check_logging ) && `;` && |\n| &&
  ENDMETHOD.


  METHOD http_post.

    DATA temp4 TYPE z2ui5_if_client=>ty_s_config.
    DATA lo_handler TYPE REF TO z2ui5_lcl_fw_handler.
          DATA temp5 TYPE REF TO z2ui5_if_app.
          DATA temp1 TYPE REF TO z2ui5_lcl_fw_client.
          DATA x TYPE REF TO cx_root.
    CLEAR temp4.
    temp4-controller_name = `z2ui5_controller`.
    temp4-path_info = path_info.
    temp4-body = body.
    z2ui5_lcl_fw_handler=>ss_config = temp4.

    
    lo_handler = z2ui5_lcl_fw_handler=>request_begin( ).

    DO.
      TRY.
          ROLLBACK WORK.
          
          temp5 ?= lo_handler->ms_db-o_app.
          
          CREATE OBJECT temp1 TYPE z2ui5_lcl_fw_client EXPORTING HANDLER = lo_handler.
          temp5->main( temp1 ).
          ROLLBACK WORK.

          IF lo_handler->ms_next-o_app_leave IS NOT INITIAL.
            lo_handler = lo_handler->set_app_leave( ).
            CONTINUE.
          ENDIF.

          IF lo_handler->ms_next-o_app_call IS NOT INITIAL.
            lo_handler = lo_handler->set_app_call( ).
            CONTINUE.
          ENDIF.

          result = lo_handler->request_end( ).

          
        CATCH cx_root INTO x.
          lo_handler = lo_handler->set_app_system( x ).
          CONTINUE.
      ENDTRY.

      EXIT.
    ENDDO.

  ENDMETHOD.
ENDCLASS.
