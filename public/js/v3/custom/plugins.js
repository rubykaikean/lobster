// Global variable init

var mejsL10n = {
    "language": "en-US",
    "strings": {
        "Close": "Close",
        "Fullscreen": "Fullscreen",
        "Download File": "Download File",
        "Download Video": "Download Video",
        "Play\/Pause": "Play\/Pause",
        "Mute Toggle": "Mute Toggle",
        "None": "None",
        "Turn off Fullscreen": "Turn off Fullscreen",
        "Go Fullscreen": "Go Fullscreen",
        "Unmute": "Unmute",
        "Mute": "Mute",
        "Captions\/Subtitles": "Captions\/Subtitles"
    }
};

var _wpmejsSettings = {
    "pluginPath": ""
};

var profilePage = '';
var timeFormat = 'h:i A';
var timeInterval = 60;
var i18n_confirm_appt_delete = 'Are you sure you want to cancel this appointment?',
    i18n_please_wait = 'Please wait...',
    i18n_wrong_username_pass = 'Wrong username/password combination.',
    i18n_request_appointment = 'Request Appointment',
    i18n_fill_out_required_fields = 'Please fill out all required fields.',
    i18n_appt_required_fields = 'A first name and an email address are required fields.';


jQuery(document).ready(function() {
    "use strict";
    revSliderInit();
    if (jQuery(".esg-grid").length > 0)
        essGridInit();
});

// Revolution Slider Initialization

function revSliderInit() {
    "use strict";
    // CUSTOM AJAX CONTENT LOADING FUNCTION
    var ajaxRevslider = function(obj) {
		"use strict";
        var content = "";
        data = {};
        data.action = 'revslider_ajax_call_front';
        data.client_action = 'get_slider_html';
        data.token = 'a8cb1e035a';
        data.type = obj.type;
        data.id = obj.id;
        data.aspectratio = obj.aspectratio;

        // SYNC AJAX REQUEST
        jQuery.ajax({
            type: "post",
            url: "",
            dataType: 'json',
            data: data,
            async: false,
            success: function(ret, textStatus, XMLHttpRequest) {
                if (ret.success == true)
                    content = ret.data;
            },
            error: function(e) {
                console.log(e);
            }
        });

        // FIRST RETURN THE CONTENT WHEN IT IS LOADED !!
        return content;
    };

    // CUSTOM AJAX FUNCTION TO REMOVE THE SLIDER
    var ajaxRemoveRevslider = function(obj) {
		"use strict";
        return jQuery(obj.selector + " .rev_slider").revkill();
    };

    // EXTEND THE AJAX CONTENT LOADING TYPES WITH TYPE AND FUNCTION
    var extendessential = setInterval(function() {
		"use strict";
        if (jQuery.fn.tpessential != undefined) {
            clearInterval(extendessential);
            if (typeof(jQuery.fn.tpessential.defaults) !== 'undefined') {
                jQuery.fn.tpessential.defaults.ajaxTypes.push({
                    type: "revslider",
                    func: ajaxRevslider,
                    killfunc: ajaxRemoveRevslider,
                    openAnimationSpeed: 0.3
                });
            }
        }
    }, 30);

    var htmlDiv = document.getElementById("rs-plugin-settings-inline-css");
    var htmlDivCss = ".tp-caption.Estate,.Estate{color:rgba(0,0,0,1.00);font-size:px;line-height:px;font-weight:900;font-style:normal;font-family:Raleway;padding:0px 0px 0px 0px;text-decoration:none;text-align:left;background-color:transparent;border-color:transparent;border-style:none;border-width:0px;border-radius:0px 0px 0px 0px}";
    var htmlDivCss = htmlDivCss + ".tp-caption.black,.black{color:#000}.tp-caption.Estate,.Estate{color:rgba(0,0,0,1.00);font-size:px;line-height:px;font-weight:900;font-style:normal;font-family:Raleway;padding:0px 0px 0px 0px;text-decoration:none;text-align:left;background-color:transparent;border-color:transparent;border-style:none;border-width:0px;border-radius:0px 0px 0px 0px}";
    if (htmlDiv) {
        htmlDiv.innerHTML = htmlDiv.innerHTML + htmlDivCss;
    } else {
        var htmlDiv = document.createElement("div");
        htmlDiv.innerHTML = "<style>" + htmlDivCss + "</style>";
        document.getElementsByTagName("head")[0].appendChild(htmlDiv.childNodes[0]);
    }

    /*************************************************************************/
    var setREVStartSize = function() {
		"use strict";
        try {
            var e = new Object,
                i = jQuery(window).width(),
                t = 9999,
                r = 0,
                n = 0,
                l = 0,
                f = 0,
                s = 0,
                h = 0;
            e.c = jQuery('#rev_slider_4_1');
            e.gridwidth = [170];
            e.gridheight = [728];

            e.sliderLayout = "fullwidth";
            if (e.responsiveLevels && (jQuery.each(e.responsiveLevels, function(e, f) {
				"use strict";
                    f > i && (t = r = f, l = e), i > f && f > r && (r = f, n = e)
                }), t > r && (l = n)), f = e.gridheight[l] || e.gridheight[0] || e.gridheight, s = e.gridwidth[l] || e.gridwidth[0] || e.gridwidth, h = i / s, h = h > 1 ? 1 : h, f = Math.round(h * f), "fullscreen" == e.sliderLayout) {
                var u = (e.c.width(), jQuery(window).height());
                if (void 0 != e.fullScreenOffsetContainer) {
                    var c = e.fullScreenOffsetContainer.split(",");
                    if (c) jQuery.each(c, function(e, i) {
						"use strict";
                        u = jQuery(i).length > 0 ? u - jQuery(i).outerHeight(!0) : u
                    }), e.fullScreenOffset.split("%").length > 1 && void 0 != e.fullScreenOffset && e.fullScreenOffset.length > 0 ? u -= jQuery(window).height() * parseInt(e.fullScreenOffset, 0) / 100 : void 0 != e.fullScreenOffset && e.fullScreenOffset.length > 0 && (u -= parseInt(e.fullScreenOffset, 0))
                }
                f = u
            } else void 0 != e.minHeight && f < e.minHeight && (f = e.minHeight);
            e.c.closest(".rev_slider_wrapper").css({
                height: f
            })

        } catch (d) {
            console.log("Failure at Presize of Slider:" + d)
        }
    };

    setREVStartSize();

    var tpj = jQuery;
    var revapi4;
    if (tpj("#rev_slider_4_1").revolution == undefined) {
        revslider_showDoubleJqueryError("#rev_slider_4_1");
    } else {
        revapi4 = tpj("#rev_slider_4_1").show().revolution({
            sliderType: "standard",
            jsFileLocation: "",
            sliderLayout: "fullwidth",
            dottedOverlay: "none",
            delay: 9000,
            navigation: {
                keyboardNavigation: "off",
                keyboard_direction: "horizontal",
                mouseScrollNavigation: "off",
                onHoverStop: "off",
                touch: {
                    touchenabled: "on",
                    swipe_threshold: 75,
                    swipe_min_touches: 50,
                    swipe_direction: "horizontal",
                    drag_block_vertical: false
                },
                arrows: {
                    style: "uranus",
                    enable: true,
                    hide_onmobile: true,
                    hide_under: 1024,
                    hide_onleave: true,
                    hide_delay: 200,
                    hide_delay_mobile: 1200,
                    tmp: '',
                    left: {
                        h_align: "left",
                        v_align: "center",
                        h_offset: 20,
                        v_offset: 0
                    },
                    right: {
                        h_align: "right",
                        v_align: "center",
                        h_offset: 20,
                        v_offset: 0
                    }
                },
                bullets: {
                    enable: true,
                    hide_onmobile: true,
                    hide_under: 1024,
                    style: "custom",
                    hide_onleave: true,
                    hide_delay: 200,
                    hide_delay_mobile: 1200,
                    direction: "horizontal",
                    h_align: "center",
                    v_align: "bottom",
                    h_offset: 0,
                    v_offset: 20,
                    space: 5,
                    tmp: ''
                }
            },
            visibilityLevels: [1240, 1024, 778, 480],
            gridwidth: 170,
            gridheight: 728,
            lazyType: "none",
            shadow: 0,
            spinner: "spinner0",
            stopLoop: "off",
            stopAfterLoops: -1,
            stopAtSlide: -1,
            shuffle: "off",
            autoHeight: "off",
            hideThumbsOnMobile: "off",
            hideSliderAtLimit: 0,
            hideCaptionAtLimit: 0,
            hideAllCaptionAtLilmit: 0,
            debugMode: false,
            fallbacks: {
                simplifyAll: "off",
                nextSlideOnWindowFocus: "off",
                disableFocusListener: false,
            }
        });
    }

    /*************************************************************************/
    var setREVStartSize = function() {
		"use strict";
        try {
            var e = new Object,
                i = jQuery(window).width(),
                t = 9999,
                r = 0,
                n = 0,
                l = 0,
                f = 0,
                s = 0,
                h = 0;
            e.c = jQuery('#rev_slider_5_1');
            e.gridwidth = [1170];
            e.gridheight = [632];

            e.sliderLayout = "fullwidth";
            e.minHeight = 368;
            if (e.responsiveLevels && (jQuery.each(e.responsiveLevels, function(e, f) {
				"use strict";
                    f > i && (t = r = f, l = e), i > f && f > r && (r = f, n = e)
                }), t > r && (l = n)), f = e.gridheight[l] || e.gridheight[0] || e.gridheight, s = e.gridwidth[l] || e.gridwidth[0] || e.gridwidth, h = i / s, h = h > 1 ? 1 : h, f = Math.round(h * f), "fullscreen" == e.sliderLayout) {
                var u = (e.c.width(), jQuery(window).height());
                if (void 0 != e.fullScreenOffsetContainer) {
                    var c = e.fullScreenOffsetContainer.split(",");
                    if (c) jQuery.each(c, function(e, i) {
						"use strict";
                        u = jQuery(i).length > 0 ? u - jQuery(i).outerHeight(!0) : u
                    }), e.fullScreenOffset.split("%").length > 1 && void 0 != e.fullScreenOffset && e.fullScreenOffset.length > 0 ? u -= jQuery(window).height() * parseInt(e.fullScreenOffset, 0) / 100 : void 0 != e.fullScreenOffset && e.fullScreenOffset.length > 0 && (u -= parseInt(e.fullScreenOffset, 0))
                }
                f = u
            } else void 0 != e.minHeight && f < e.minHeight && (f = e.minHeight);
            e.c.closest(".rev_slider_wrapper").css({
                height: f
            })

        } catch (d) {
            console.log("Failure at Presize of Slider:" + d)
        }
    };


    setREVStartSize();

    var tpj = jQuery;
    var revapi5;
    tpj(document).ready(function() {
		"use strict";
        if (tpj("#rev_slider_5_1").revolution == undefined) {
            revslider_showDoubleJqueryError("#rev_slider_5_1");
        } else {
            revapi5 = tpj("#rev_slider_5_1").show().revolution({
                sliderType: "standard",
                jsFileLocation: "",
                sliderLayout: "fullwidth",
                dottedOverlay: "none",
                delay: 9000,
                navigation: {
                    keyboardNavigation: "off",
                    keyboard_direction: "horizontal",
                    mouseScrollNavigation: "off",
                    onHoverStop: "off",
                    touch: {
                        touchenabled: "on",
                        swipe_threshold: 75,
                        swipe_min_touches: 50,
                        swipe_direction: "horizontal",
                        drag_block_vertical: false
                    },
                    arrows: {
                        style: "uranus",
                        enable: true,
                        hide_onmobile: true,
                        hide_under: 1024,
                        hide_onleave: true,
                        hide_delay: 200,
                        hide_delay_mobile: 1200,
                        tmp: '',
                        left: {
                            h_align: "left",
                            v_align: "center",
                            h_offset: 20,
                            v_offset: 0
                        },
                        right: {
                            h_align: "right",
                            v_align: "center",
                            h_offset: 20,
                            v_offset: 0
                        }
                    },
                    bullets: {
                        enable: true,
                        hide_onmobile: true,
                        hide_under: 1024,
                        style: "custom",
                        hide_onleave: true,
                        hide_delay: 200,
                        hide_delay_mobile: 1200,
                        direction: "horizontal",
                        h_align: "center",
                        v_align: "bottom",
                        h_offset: 0,
                        v_offset: 30,
                        space: 5,
                        tmp: ''
                    }
                },
                visibilityLevels: [1240, 1024, 778, 480],
                gridwidth: 1170,
                gridheight: 632,
                lazyType: "none",
                minHeight: 368,
                shadow: 0,
                spinner: "spinner0",
                stopLoop: "off",
                stopAfterLoops: -1,
                stopAtSlide: -1,
                shuffle: "off",
                autoHeight: "off",
                hideThumbsOnMobile: "off",
                hideSliderAtLimit: 0,
                hideCaptionAtLimit: 0,
                hideAllCaptionAtLilmit: 0,
                debugMode: false,
                fallbacks: {
                    simplifyAll: "off",
                    nextSlideOnWindowFocus: "off",
                    disableFocusListener: false,
                }
            });
        }
    });

    /*************************************************************************/

    var setREVStartSize = function() {
		"use strict";
        try {
            var e = new Object,
                i = jQuery(window).width(),
                t = 9999,
                r = 0,
                n = 0,
                l = 0,
                f = 0,
                s = 0,
                h = 0;
            e.c = jQuery('#rev_slider_6_1');
            e.gridwidth = [1170];
            e.gridheight = [865];

            e.sliderLayout = "fullwidth";
            e.minHeight = 568;
            if (e.responsiveLevels && (jQuery.each(e.responsiveLevels, function(e, f) {
				"use strict";
                    f > i && (t = r = f, l = e), i > f && f > r && (r = f, n = e)
                }), t > r && (l = n)), f = e.gridheight[l] || e.gridheight[0] || e.gridheight, s = e.gridwidth[l] || e.gridwidth[0] || e.gridwidth, h = i / s, h = h > 1 ? 1 : h, f = Math.round(h * f), "fullscreen" == e.sliderLayout) {
                var u = (e.c.width(), jQuery(window).height());
                if (void 0 != e.fullScreenOffsetContainer) {
                    var c = e.fullScreenOffsetContainer.split(",");
                    if (c) jQuery.each(c, function(e, i) {
						"use strict";
                        u = jQuery(i).length > 0 ? u - jQuery(i).outerHeight(!0) : u
                    }), e.fullScreenOffset.split("%").length > 1 && void 0 != e.fullScreenOffset && e.fullScreenOffset.length > 0 ? u -= jQuery(window).height() * parseInt(e.fullScreenOffset, 0) / 100 : void 0 != e.fullScreenOffset && e.fullScreenOffset.length > 0 && (u -= parseInt(e.fullScreenOffset, 0))
                }
                f = u
            } else void 0 != e.minHeight && f < e.minHeight && (f = e.minHeight);
            e.c.closest(".rev_slider_wrapper").css({
                height: f
            })

        } catch (d) {
            console.log("Failure at Presize of Slider:" + d)
        }
    };


    setREVStartSize();
    var tpj = jQuery;

    var revapi6;
    tpj(document).ready(function() {
		"use strict";
        if (tpj("#rev_slider_6_1").revolution == undefined) {
            revslider_showDoubleJqueryError("#rev_slider_6_1");
        } else {
            revapi6 = tpj("#rev_slider_6_1").show().revolution({
                sliderType: "standard",
                jsFileLocation: "",
                sliderLayout: "fullwidth",
                dottedOverlay: "none",
                delay: 9000,
                navigation: {
                    keyboardNavigation: "off",
                    keyboard_direction: "horizontal",
                    mouseScrollNavigation: "off",
                    onHoverStop: "off",
                    touch: {
                        touchenabled: "on",
                        swipe_threshold: 75,
                        swipe_min_touches: 50,
                        swipe_direction: "horizontal",
                        drag_block_vertical: false
                    },
                    arrows: {
                        style: "uranus",
                        enable: true,
                        hide_onmobile: true,
                        hide_under: 1024,
                        hide_onleave: true,
                        hide_delay: 200,
                        hide_delay_mobile: 1200,
                        tmp: '',
                        left: {
                            h_align: "left",
                            v_align: "center",
                            h_offset: 20,
                            v_offset: 0
                        },
                        right: {
                            h_align: "right",
                            v_align: "center",
                            h_offset: 20,
                            v_offset: 0
                        }
                    }
                },
                visibilityLevels: [1240, 1024, 778, 480],
                gridwidth: 1170,
                gridheight: 865,
                lazyType: "none",
                minHeight: 568,
                shadow: 0,
                spinner: "spinner0",
                stopLoop: "off",
                stopAfterLoops: -1,
                stopAtSlide: -1,
                shuffle: "off",
                autoHeight: "off",
                disableProgressBar: "on",
                hideThumbsOnMobile: "off",
                hideSliderAtLimit: 0,
                hideCaptionAtLimit: 0,
                hideAllCaptionAtLilmit: 0,
                debugMode: false,
                fallbacks: {
                    simplifyAll: "off",
                    nextSlideOnWindowFocus: "off",
                    disableFocusListener: false,
                }
            });
        }
    });


    var htmlDivCss = unescape(".uranus.tparrows%20%7B%0A%20%20width%3A50px%3B%0A%20%20height%3A50px%3B%0A%20%20background%3Atransparent%3B%0A%20%7D%0A%20.uranus.tparrows%3Abefore%20%7B%0A%20width%3A50px%3B%0A%20height%3A50px%3B%0A%20line-height%3A50px%3B%0A%20font-size%3A40px%3B%0A%20transition%3Aall%200.3s%3B%0A-webkit-transition%3Aall%200.3s%3B%0A%20%7D%0A%20%0A%20%20.uranus.tparrows%3Ahover%3Abefore%20%7B%0A%20%20%20%20opacity%3A0.75%3B%0A%20%20%7D%0A.custom.tp-bullets%20%7B%0A%7D%0A.custom.tp-bullets%3Abefore%20%7B%0A%09content%3A%22%20%22%3B%0A%09position%3Aabsolute%3B%0A%09width%3A100%25%3B%0A%09height%3A100%25%3B%0A%09background%3Atransparent%3B%0A%09padding%3A10px%3B%0A%09margin-left%3A-10px%3Bmargin-top%3A-10px%3B%0A%09box-sizing%3Acontent-box%3B%0A%7D%0A.custom%20.tp-bullet%20%7B%0A%09width%3A12px%3B%0A%09height%3A12px%3B%0A%09position%3Aabsolute%3B%0A%09background%3A%23aaa%3B%0A%20%20%20%20background%3Argba%28125%2C125%2C125%2C0.5%29%3B%0A%09cursor%3A%20pointer%3B%0A%09box-sizing%3Acontent-box%3B%0A%7D%0A.custom%20.tp-bullet%3Ahover%2C%0A.custom%20.tp-bullet.selected%20%7B%0A%09background%3Argb%28125%2C125%2C125%29%3B%0A%7D%0A.custom%20.tp-bullet-image%20%7B%0A%7D%0A.custom%20.tp-bullet-title%20%7B%0A%7D%0A%0A");
    var htmlDiv = document.getElementById('rs-plugin-settings-inline-css');
    if (htmlDiv) {
        htmlDiv.innerHTML = htmlDiv.innerHTML + htmlDivCss;
    } else {
        var htmlDiv = document.createElement('div');
        htmlDiv.innerHTML = '<style>' + htmlDivCss + '</style>';
        document.getElementsByTagName('head')[0].appendChild(htmlDiv.childNodes[0]);
    }
}

function revslider_showDoubleJqueryError(sliderID) {
    "use strict";
    var errorMessage = "Revolution Slider Error: You have some jquery.js library include that comes after the revolution files js include.";
    errorMessage += "<br> This includes make eliminates the revolution slider libraries, and make it not work.";
    errorMessage += "<br><br> To fix it you can:<br>&nbsp;&nbsp;&nbsp; 1. In the Slider Settings -> Troubleshooting set option:  <strong><b>Put JS Includes To Body</b></strong> option to true.";
    errorMessage += "<br>&nbsp;&nbsp;&nbsp; 2. Find the double jquery.js include and remove it.";
    errorMessage = "<span style='font-size:16px;color:#BC0C06;'>" + errorMessage + "</span>";
    jQuery(sliderID).show().html(errorMessage);
}


// Essential Grid Initialization

function essGridInit() {
    "use strict";
    if ("even" == "even") {
        var coh = 0,
            aratio = 0,
            container = jQuery("#esg-grid-5-1");
        var cwidth = container.width(),
            ar = "4:3",
            gbfc = eggbfc(jQuery(window).width(), "id"),
            row = 1;
        ar = ar.split(":");
        aratio = parseInt(ar[0], 0) / parseInt(ar[1], 0);
        coh = cwidth / aratio;
        coh = coh / gbfc.column * row;
        var ul = container.find("ul").first();
        ul.css({
            display: "block",
            height: coh + "px"
        });
    }
    var essapi_5;
    jQuery(document).ready(function() {
		"use strict";
        essapi_5 = jQuery("#esg-grid-5-1").tpessential({
            gridID: 5,
            layout: "even",
            forceFullWidth: "off",
            lazyLoad: "off",
            row: 1,
            loadMoreAjaxToken: "a1a4e2e6d4",
            loadMoreAjaxUrl: "",
            loadMoreAjaxAction: "Essential_Grid_Front_request_ajax",
            ajaxContentTarget: "ess-grid-ajax-container-",
            ajaxScrollToOffset: "0",
            ajaxCloseButton: "off",
            ajaxContentSliding: "on",
            ajaxScrollToOnLoad: "on",
            ajaxNavButton: "off",
            ajaxCloseType: "type1",
            ajaxCloseInner: "false",
            ajaxCloseStyle: "light",
            ajaxClosePosition: "tr",
            space: 0,
            pageAnimation: "fade",
            paginationScrollToTop: "off",
            spinner: "spinner0",
            forceFullWidth: "on",
            evenGridMasonrySkinPusher: "off",
            lightBoxMode: "single",
            animSpeed: 1000,
            delayBasic: 1,
            mainhoverdelay: 1,
            filterType: "single",
            showDropFilter: "hover",
            filterGroupClass: "esg-fgc-5",
            googleFonts: ['Open+Sans:300,400,600,700,800', 'Raleway:100,200,300,400,500,600,700,800,900', 'Droid+Serif:400,700'],
            aspectratio: "4:3",
            responsiveEntries: [{
                width: 1400,
                amount: 5
            }, {
                width: 1170,
                amount: 4
            }, {
                width: 1024,
                amount: 4
            }, {
                width: 960,
                amount: 3
            }, {
                width: 778,
                amount: 3
            }, {
                width: 640,
                amount: 3
            }, {
                width: 480,
                amount: 1
            }]
        });

        try {
            jQuery("#esg-grid-5-1 .esgbox").esgbox({
                padding: [0, 0, 0, 0],
                afterLoad: function() {
					"use strict";
                    if (this.element.hasClass("esgboxhtml5")) {
                        var mp = this.element.data("mp4"),
                            ogv = this.element.data("ogv"),
                            webm = this.element.data("webm");
                        this.content = '<div style="width:100%;height:100%;"><video autoplay="true" loop="" class="rowbgimage" poster="" width="100%" height="auto"><source src="' + mp + '" type="video/mp4"><source src="' + webm + '" type="video/webm"><source src="' + ogv + '" type="video/ogg"></video></div>';
                        var riint = setInterval(function() {
							"use strict";
                            jQuery(window).trigger("resize");
                        }, 100);
                        setTimeout(function() {
                            clearInterval(riint);
                        }, 2500);
                    };
                },
                beforeShow: function() {
					"use strict";
                    this.title = jQuery(this.element).attr('lgtitle');
                    if (this.title) {
                        this.title = "";
                        this.title = '<div style="padding:0px 0px 0px 0px">' + this.title + '</div>';
                    }
                },
                afterShow: function() {},
                openEffect: 'fade',
                closeEffect: 'fade',
                nextEffect: 'fade',
                prevEffect: 'fade',
                openSpeed: 'normal',
                closeSpeed: 'normal',
                nextSpeed: 'normal',
                prevSpeed: 'normal',
                helpers: {
                    media: {},
                    title: {
                        type: ""
                    }
                }
            });

        } catch (e) {}
    });



    if ("even" == "even") {
        var coh = 0,
            container = jQuery("#esg-grid-1-1");
        var cwidth = container.width(),
            ar = "4:4",
            gbfc = eggbfc(jQuery(window).width(), "id"),
            row = 3;
        ar = ar.split(":");
        aratio = parseInt(ar[0], 0) / parseInt(ar[1], 0);
        coh = cwidth / aratio;
        coh = coh / gbfc.column * row;
        var ul = container.find("ul").first();
        ul.css({
            display: "block",
            height: coh + "px"
        });
    }
    var essapi_1;
    jQuery(document).ready(function() {
		"use strict";
        essapi_1 = jQuery("#esg-grid-1-1").tpessential({
            gridID: 1,
            layout: "even",
            forceFullWidth: "off",
            lazyLoad: "off",
            row: 3,
            loadMoreAjaxToken: "a1a4e2e6d4",
            loadMoreAjaxUrl: "",
            loadMoreAjaxAction: "Essential_Grid_Front_request_ajax",
            ajaxContentTarget: "ess-grid-ajax-container-",
            ajaxScrollToOffset: "0",
            ajaxCloseButton: "off",
            ajaxContentSliding: "on",
            ajaxScrollToOnLoad: "on",
            ajaxNavButton: "off",
            ajaxCloseType: "type1",
            ajaxCloseInner: "false",
            ajaxCloseStyle: "light",
            ajaxClosePosition: "tr",
            space: 30,
            pageAnimation: "fade",
            paginationScrollToTop: "off",
            spinner: "spinner0",
            evenGridMasonrySkinPusher: "off",
            lightBoxMode: "single",
            animSpeed: 1000,
            delayBasic: 1,
            mainhoverdelay: 1,
            filterType: "single",
            showDropFilter: "hover",
            filterGroupClass: "esg-fgc-1",
            googleFonts: ['Open+Sans:300,400,600,700,800', 'Raleway:100,200,300,400,500,600,700,800,900', 'Droid+Serif:400,700'],
            aspectratio: "4:4",
            responsiveEntries: [{
                width: 1400,
                amount: 3
            }, {
                width: 1170,
                amount: 3
            }, {
                width: 1024,
                amount: 3
            }, {
                width: 960,
                amount: 3
            }, {
                width: 778,
                amount: 3
            }, {
                width: 640,
                amount: 3
            }, {
                width: 480,
                amount: 1
            }]
        });

        try {
            jQuery("#esg-grid-1-1 .esgbox").esgbox({
                padding: [0, 0, 0, 0],
                afterLoad: function() {
					"use strict";
                    if (this.element.hasClass("esgboxhtml5")) {
                        var mp = this.element.data("mp4"),
                            ogv = this.element.data("ogv"),
                            webm = this.element.data("webm");
                        this.content = '<div style="width:100%;height:100%;"><video autoplay="true" loop="" class="rowbgimage" poster="" width="100%" height="auto"><source src="' + mp + '" type="video/mp4"><source src="' + webm + '" type="video/webm"><source src="' + ogv + '" type="video/ogg"></video></div>';
                        var riint = setInterval(function() {
							"use strict";
                            jQuery(window).trigger("resize");
                        }, 100);
                        setTimeout(function() {
                            clearInterval(riint);
                        }, 2500);
                    };
                },
                beforeShow: function() {
					"use strict";
                    this.title = jQuery(this.element).attr('lgtitle');
                    if (this.title) {
                        this.title = "";
                        this.title = '<div style="padding:0px 0px 0px 0px">' + this.title + '</div>';
                    }
                },
                afterShow: function() {},
                openEffect: 'fade',
                closeEffect: 'fade',
                nextEffect: 'fade',
                prevEffect: 'fade',
                openSpeed: 'normal',
                closeSpeed: 'normal',
                nextSpeed: 'normal',
                prevSpeed: 'normal',
                helpers: {
                    media: {},
                    title: {
                        type: ""
                    }
                }
            });

        } catch (e) {}

    });

    if ("masonry" == "even") {
        var coh = 0,
            container = jQuery("#esg-grid-2-1");
        var cwidth = container.width(),
            ar = "4:3",
            gbfc = eggbfc(jQuery(window).width(), "id"),
            row = 3;
        ar = ar.split(":");
        aratio = parseInt(ar[0], 0) / parseInt(ar[1], 0);
        coh = cwidth / aratio;
        coh = coh / gbfc.column * row;
        var ul = container.find("ul").first();
        ul.css({
            display: "block",
            height: coh + "px"
        });
    }
    var essapi_2;
    jQuery(document).ready(function() {
		"use strict";
        essapi_2 = jQuery("#esg-grid-2-1").tpessential({
            gridID: 2,
            layout: "masonry",
            forceFullWidth: "off",
            lazyLoad: "off",
            row: 3,
            loadMoreAjaxToken: "df48057c19",
            loadMoreAjaxUrl: "",
            loadMoreAjaxAction: "Essential_Grid_Front_request_ajax",
            ajaxContentTarget: "ess-grid-ajax-container-",
            ajaxScrollToOffset: "0",
            ajaxCloseButton: "off",
            ajaxContentSliding: "on",
            ajaxScrollToOnLoad: "on",
            ajaxNavButton: "off",
            ajaxCloseType: "type1",
            ajaxCloseInner: "false",
            ajaxCloseStyle: "light",
            ajaxClosePosition: "tr",
            space: 30,
            pageAnimation: "fade",
            paginationScrollToTop: "off",
            spinner: "spinner0",
            lightBoxMode: "single",
            animSpeed: 1000,
            delayBasic: 1,
            mainhoverdelay: 1,
            filterType: "single",
            showDropFilter: "hover",
            filterGroupClass: "esg-fgc-2",
            googleFonts: ['Open+Sans:300,400,600,700,800', 'Raleway:100,200,300,400,500,600,700,800,900', 'Droid+Serif:400,700'],
            responsiveEntries: [{
                width: 1400,
                amount: 3
            }, {
                width: 1170,
                amount: 3
            }, {
                width: 1024,
                amount: 3
            }, {
                width: 960,
                amount: 3
            }, {
                width: 778,
                amount: 3
            }, {
                width: 640,
                amount: 3
            }, {
                width: 480,
                amount: 1
            }]
        });

        try {
            jQuery("#esg-grid-2-1 .esgbox").esgbox({
                padding: [0, 0, 0, 0],
                afterLoad: function() {
					"use strict";
                    if (this.element.hasClass("esgboxhtml5")) {
                        var mp = this.element.data("mp4"),
                            ogv = this.element.data("ogv"),
                            webm = this.element.data("webm");
                        this.content = '<div style="width:100%;height:100%;"><video autoplay="true" loop="" class="rowbgimage" poster="" width="100%" height="auto"><source src="' + mp + '" type="video/mp4"><source src="' + webm + '" type="video/webm"><source src="' + ogv + '" type="video/ogg"></video></div>';
                        var riint = setInterval(function() {
							"use strict";
                            jQuery(window).trigger("resize");
                        }, 100);
                        setTimeout(function() {
                            clearInterval(riint);
                        }, 2500);
                    };
                },
                beforeShow: function() {
					"use strict";
                    this.title = jQuery(this.element).attr('lgtitle');
                    if (this.title) {
                        this.title = "";
                        this.title = '<div style="padding:0px 0px 0px 0px">' + this.title + '</div>';
                    }
                },
                afterShow: function() {},
                openEffect: 'fade',
                closeEffect: 'fade',
                nextEffect: 'fade',
                prevEffect: 'fade',
                openSpeed: 'normal',
                closeSpeed: 'normal',
                nextSpeed: 'normal',
                prevSpeed: 'normal',
                helpers: {
                    media: {},
                    title: {
                        type: ""
                    }
                }
            });

        } catch (e) {}

    });

    if ("cobbles" == "even") {
        var coh = 0,
            container = jQuery("#esg-grid-3-1");
        var cwidth = container.width(),
            ar = "4:3",
            gbfc = eggbfc(jQuery(window).width(), "id"),
            row = 3;
        ar = ar.split(":");
        aratio = parseInt(ar[0], 0) / parseInt(ar[1], 0);
        coh = cwidth / aratio;
        coh = coh / gbfc.column * row;
        var ul = container.find("ul").first();
        ul.css({
            display: "block",
            height: coh + "px"
        });
    }
    var essapi_3;
    jQuery(document).ready(function() {
		"use strict";
        essapi_3 = jQuery("#esg-grid-3-1").tpessential({
            gridID: 3,
            layout: "cobbles",
            forceFullWidth: "off",
            lazyLoad: "off",
            row: 3,
            loadMoreAjaxToken: "df48057c19",
            loadMoreAjaxUrl: "",
            loadMoreAjaxAction: "Essential_Grid_Front_request_ajax",
            ajaxContentTarget: "ess-grid-ajax-container-",
            ajaxScrollToOffset: "0",
            ajaxCloseButton: "off",
            ajaxContentSliding: "on",
            ajaxScrollToOnLoad: "on",
            ajaxNavButton: "off",
            ajaxCloseType: "type1",
            ajaxCloseInner: "false",
            ajaxCloseStyle: "light",
            ajaxClosePosition: "tr",
            space: 30,
            pageAnimation: "fade",
            paginationScrollToTop: "off",
            spinner: "spinner0",
            lightBoxMode: "single",
            animSpeed: 1000,
            delayBasic: 1,
            mainhoverdelay: 1,
            filterType: "single",
            showDropFilter: "hover",
            filterGroupClass: "esg-fgc-3",
            googleFonts: ['Open+Sans:300,400,600,700,800', 'Raleway:100,200,300,400,500,600,700,800,900', 'Droid+Serif:400,700'],
            aspectratio: "4:3",
            responsiveEntries: [{
                width: 1400,
                amount: 3
            }, {
                width: 1170,
                amount: 3
            }, {
                width: 1024,
                amount: 3
            }, {
                width: 960,
                amount: 3
            }, {
                width: 778,
                amount: 3
            }, {
                width: 640,
                amount: 3
            }, {
                width: 480,
                amount: 1
            }]
        });

        try {
            jQuery("#esg-grid-3-1 .esgbox").esgbox({
                padding: [0, 0, 0, 0],
                afterLoad: function() {
					"use strict";
                    if (this.element.hasClass("esgboxhtml5")) {
                        var mp = this.element.data("mp4"),
                            ogv = this.element.data("ogv"),
                            webm = this.element.data("webm");
                        this.content = '<div style="width:100%;height:100%;"><video autoplay="true" loop="" class="rowbgimage" poster="" width="100%" height="auto"><source src="' + mp + '" type="video/mp4"><source src="' + webm + '" type="video/webm"><source src="' + ogv + '" type="video/ogg"></video></div>';
                        var riint = setInterval(function() {
							"use strict";
                            jQuery(window).trigger("resize");
                        }, 100);
                        setTimeout(function() {
                            clearInterval(riint);
                        }, 2500);
                    };
                },
                beforeShow: function() {
					"use strict";
                    this.title = jQuery(this.element).attr('lgtitle');
                    if (this.title) {
                        this.title = "";
                        this.title = '<div style="padding:0px 0px 0px 0px">' + this.title + '</div>';
                    }
                },
                afterShow: function() {},
                openEffect: 'fade',
                closeEffect: 'fade',
                nextEffect: 'fade',
                prevEffect: 'fade',
                openSpeed: 'normal',
                closeSpeed: 'normal',
                nextSpeed: 'normal',
                prevSpeed: 'normal',
                helpers: {
                    media: {},
                    title: {
                        type: ""
                    }
                }
            });

        } catch (e) {}

    });
}

function eggbfc(winw, resultoption) {
    "use strict";
    var lasttop = winw,
        lastbottom = 0,
        smallest = 9999,
        largest = 0,
        samount = 0,
        lamoung = 0,
        lastamount = 0,
        resultid = 0,
        resultidb = 0,
        lamount = 0,
        responsiveEntries = [{
            width: 1400,
            amount: 5
        }, {
            width: 1170,
            amount: 4
        }, {
            width: 1024,
            amount: 4
        }, {
            width: 960,
            amount: 3
        }, {
            width: 778,
            amount: 3
        }, {
            width: 640,
            amount: 3
        }, {
            width: 480,
            amount: 1
        }];
    if (responsiveEntries != undefined && responsiveEntries.length > 0)
        jQuery.each(responsiveEntries, function(index, obj) {
			"use strict";
            var curw = obj.width != undefined ? obj.width : 0,
                cura = obj.amount != undefined ? obj.amount : 0;
            if (smallest > curw) {
                smallest = curw;
                samount = cura;
                resultidb = index;
            }
            if (largest < curw) {
                largest = curw;
                lamount = cura;
            }
            if (curw > lastbottom && curw <= lasttop) {
                lastbottom = curw;
                lastamount = cura;
                resultid = index;
            }
        })
    if (smallest > winw) {
        lastamount = samount;
        resultid = resultidb;
    }
    var obj = new Object;
    obj.index = resultid;
    obj.column = lastamount;
    if (resultoption == "id")
        return obj;
    else
        return lastamount;
}