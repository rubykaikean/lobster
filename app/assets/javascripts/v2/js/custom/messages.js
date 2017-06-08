// Popup messages
//-----------------------------------------------------------------

if (typeof YREG_ESTATE_STORAGE == 'undefined') var YREG_ESTATE_STORAGE = {};
if (YREG_ESTATE_STORAGE['theme_font'] == '') YREG_ESTATE_STORAGE['theme_font'] = 'Open Sans';
YREG_ESTATE_STORAGE['theme_skin_color'] = '';
YREG_ESTATE_STORAGE['theme_skin_bg_color'] = '';
YREG_ESTATE_STORAGE['message_callback'] = null;
YREG_ESTATE_STORAGE['message_timeout'] = 5000;

if (typeof YREG_ESTATE_STORAGE == 'undefined') var YREG_ESTATE_STORAGE = {};
YREG_ESTATE_STORAGE["strings"] = {
	ajax_error: "Invalid server answer",
	bookmark_add: "Add the bookmark",
	bookmark_added: "Current page has been successfully added to the bookmarks. You can see it in the right panel on the tab &#039;Bookmarks&#039;",
	bookmark_del: "Delete this bookmark",
	bookmark_title: "Enter bookmark title",
	bookmark_exists: "Current page already exists in the bookmarks list",
	search_error: "Error occurs in AJAX search! Please, type your query and press search icon for the traditional search way.",
	email_confirm: "On the e-mail address &quot;%s&quot; we sent a confirmation email. Please, open it and click on the link.",
	reviews_vote: "Thanks for your vote! New average rating is:",
	reviews_error: "Error saving your vote! Please, try again later.",
	error_like: "Error saving your like! Please, try again later.",
	error_global: "Global error text",
	name_empty: "The name can&#039;t be empty",
	name_long: "Too long name",
	email_empty: "Too short (or empty) email address",
	email_long: "Too long email address",
	email_not_valid: "Invalid email address",
	subject_empty: "The subject can&#039;t be empty",
	subject_long: "Too long subject",
	text_empty: "The message text can&#039;t be empty",
	text_long: "Too long message text",
	send_complete: "Send message complete!",
	send_error: "Transmit failed!",
	login_empty: "The Login field can&#039;t be empty",
	login_long: "Too long login field",
	login_success: "Login success! The page will be reloaded in 3 sec.",
	login_failed: "Login failed!",
	password_empty: "The password can&#039;t be empty and shorter then 4 characters",
	password_long: "Too long password",
	password_not_equal: "The passwords in both fields are not equal",
	registration_success: "Registration success! Please log in!",
	registration_failed: "Registration failed!",
	geocode_error: "Geocode was not successful for the following reason:",
	googlemap_not_avail: "Google map API not available!",
	editor_save_success: "Post content saved!",
	editor_save_error: "Error saving post data!",
	editor_delete_post: "You really want to delete the current post?",
	editor_delete_post_header: "Delete post",
	editor_delete_success: "Post deleted!",
	editor_delete_error: "Error deleting post!",
	editor_caption_cancel: "Cancel",
	editor_caption_close: "Close"
};

if (typeof YREG_ESTATE_STORAGE == 'undefined') var YREG_ESTATE_STORAGE = {};
YREG_ESTATE_STORAGE['ajax_url'] = 'http://estate.axiomthemes.com/wp-admin/admin-ajax.php';
YREG_ESTATE_STORAGE['ajax_nonce'] = '93f8041a0c';
YREG_ESTATE_STORAGE['site_url'] = 'http://estate.axiomthemes.com';
YREG_ESTATE_STORAGE['vc_edit_mode'] = false;
YREG_ESTATE_STORAGE['theme_font'] = 'Open Sans';
YREG_ESTATE_STORAGE['theme_skin'] = 'no_less';
YREG_ESTATE_STORAGE['theme_skin_color'] = '';
YREG_ESTATE_STORAGE['theme_skin_bg_color'] = '';
YREG_ESTATE_STORAGE['slider_height'] = 728;
YREG_ESTATE_STORAGE['system_message'] = {
	message: '',
	status: '',
	header: ''
};
YREG_ESTATE_STORAGE['user_logged_in'] = false;
YREG_ESTATE_STORAGE['toc_menu'] = '';
YREG_ESTATE_STORAGE['toc_menu_home'] = false;
YREG_ESTATE_STORAGE['toc_menu_top'] = false;
YREG_ESTATE_STORAGE['menu_fixed'] = false;
YREG_ESTATE_STORAGE['menu_relayout'] = 960;
YREG_ESTATE_STORAGE['menu_responsive'] = 641;
YREG_ESTATE_STORAGE['menu_slider'] = false;
YREG_ESTATE_STORAGE['menu_cache'] = false;
YREG_ESTATE_STORAGE['demo_time'] = 0;
YREG_ESTATE_STORAGE['media_elements_enabled'] = true;
YREG_ESTATE_STORAGE['ajax_search_enabled'] = true;
YREG_ESTATE_STORAGE['ajax_search_min_length'] = 3;
YREG_ESTATE_STORAGE['ajax_search_delay'] = 200;
YREG_ESTATE_STORAGE['css_animation'] = true;
YREG_ESTATE_STORAGE['menu_animation_in'] = 'fadeIn';
YREG_ESTATE_STORAGE['menu_animation_out'] = 'fadeOut';
YREG_ESTATE_STORAGE['popup_engine'] = 'magnific';
YREG_ESTATE_STORAGE['email_mask'] = '^([a-zA-Z0-9_\-]+\.)*[a-zA-Z0-9_\-]+@[a-z0-9_\-]+(\.[a-z0-9_\-]+)*\.[a-z]{2,6}$';
YREG_ESTATE_STORAGE['contacts_maxlength'] = 1000;
YREG_ESTATE_STORAGE['comments_maxlength'] = 1000;
YREG_ESTATE_STORAGE['remember_visitors_settings'] = false;
YREG_ESTATE_STORAGE['admin_mode'] = false;
YREG_ESTATE_STORAGE['isotope_resize_delta'] = 0.3;
YREG_ESTATE_STORAGE['error_message_box'] = null;
YREG_ESTATE_STORAGE['viewmore_busy'] = false;
YREG_ESTATE_STORAGE['video_resize_inited'] = false;
YREG_ESTATE_STORAGE['top_panel_height'] = 0;

jQuery(document).ready(function(){
	"use strict";
	
	jQuery('body').on('click', '#yreg_estate_modal_bg,.yreg_estate_message .yreg_estate_message_close', function (e) {
		"use strict";
		yreg_estate_message_destroy();
		if (YREG_ESTATE_STORAGE['message_callback']) {
			YREG_ESTATE_STORAGE['message_callback'](0);
			YREG_ESTATE_STORAGE['message_callback'] = null;
		}
		e.preventDefault();
		return false;
	});
});


// Warning
function yreg_estate_message_warning(msg) {
	"use strict";
	var hdr  = arguments[1] ? arguments[1] : '';
	var icon = arguments[2] ? arguments[2] : 'cancel';
	var delay = arguments[3] ? arguments[3] : YREG_ESTATE_STORAGE['message_timeout'];
	return yreg_estate_message({
		msg: msg,
		hdr: hdr,
		icon: icon,
		type: 'warning',
		delay: delay,
		buttons: [],
		callback: null
	});
}

// Success
function yreg_estate_message_success(msg) {
	"use strict";
	var hdr  = arguments[1] ? arguments[1] : '';
	var icon = arguments[2] ? arguments[2] : 'check';
	var delay = arguments[3] ? arguments[3] : YREG_ESTATE_STORAGE['message_timeout'];
	return yreg_estate_message({
		msg: msg,
		hdr: hdr,
		icon: icon,
		type: 'success',
		delay: delay,
		buttons: [],
		callback: null
	});
}

// Info
function yreg_estate_message_info(msg) {
	"use strict";
	var hdr  = arguments[1] ? arguments[1] : '';
	var icon = arguments[2] ? arguments[2] : 'info';
	var delay = arguments[3] ? arguments[3] : YREG_ESTATE_STORAGE['message_timeout'];
	return yreg_estate_message({
		msg: msg,
		hdr: hdr,
		icon: icon,
		type: 'info',
		delay: delay,
		buttons: [],
		callback: null
	});
}

// Regular
function yreg_estate_message_regular(msg) {
	"use strict";
	var hdr  = arguments[1] ? arguments[1] : '';
	var icon = arguments[2] ? arguments[2] : 'quote';
	var delay = arguments[3] ? arguments[3] : YREG_ESTATE_STORAGE['message_timeout'];
	return yreg_estate_message({
		msg: msg,
		hdr: hdr,
		icon: icon,
		type: 'regular',
		delay: delay,
		buttons: [],
		callback: null
	});
}

// Confirm dialog
function yreg_estate_message_confirm(msg) {
	"use strict";
	var hdr  = arguments[1] ? arguments[1] : '';
	var callback = arguments[2] ? arguments[2] : null;
	return yreg_estate_message({
		msg: msg,
		hdr: hdr,
		icon: 'help',
		type: 'regular',
		delay: 0,
		buttons: ['Yes', 'No'],
		callback: callback
	});
}

// Modal dialog
function yreg_estate_message_dialog(content) {
	"use strict";
	var hdr  = arguments[1] ? arguments[1] : '';
	var init = arguments[2] ? arguments[2] : null;
	var callback = arguments[3] ? arguments[3] : null;
	return yreg_estate_message({
		msg: content,
		hdr: hdr,
		icon: '',
		type: 'regular',
		delay: 0,
		buttons: ['Apply', 'Cancel'],
		init: init,
		callback: callback
	});
}

// General message window
function yreg_estate_message(opt) {
	"use strict";
	var msg = opt.msg != undefined ? opt.msg : '';
	var hdr  = opt.hdr != undefined ? opt.hdr : '';
	var icon = opt.icon != undefined ? opt.icon : '';
	var type = opt.type != undefined ? opt.type : 'regular';
	var delay = opt.delay != undefined ? opt.delay : YREG_ESTATE_STORAGE['message_timeout'];
	var buttons = opt.buttons != undefined ? opt.buttons : [];
	var init = opt.init != undefined ? opt.init : null;
	var callback = opt.callback != undefined ? opt.callback : null;
	// Modal bg
	jQuery('#yreg_estate_modal_bg').remove();
	jQuery('body').append('<div id="yreg_estate_modal_bg"></div>');
	jQuery('#yreg_estate_modal_bg').fadeIn();
	// Popup window
	jQuery('.yreg_estate_message').remove();
	var html = '<div class="yreg_estate_message yreg_estate_message_' + type + (buttons.length > 0 ? ' yreg_estate_message_dialog' : '') + '">'
		+ '<span class="yreg_estate_message_close iconadmin-cancel icon-cancel"></span>'
		+ (icon ? '<span class="yreg_estate_message_icon iconadmin-'+icon+' icon-'+icon+'"></span>' : '')
		+ (hdr ? '<h2 class="yreg_estate_message_header">'+hdr+'</h2>' : '');
	html += '<div class="yreg_estate_message_body">' + msg + '</div>';
	if (buttons.length > 0) {
		html += '<div class="yreg_estate_message_buttons">';
		for (var i=0; i<buttons.length; i++) {
			html += '<span class="yreg_estate_message_button">'+buttons[i]+'</span>';
		}
		html += '</div>';
	}
	html += '</div>';
	// Add popup to body
	jQuery('body').append(html);
	var popup = jQuery('body .yreg_estate_message').eq(0);
	// Prepare callback on buttons click
	if (callback != null) {
		YREG_ESTATE_STORAGE['message_callback'] = callback;
		jQuery('.yreg_estate_message_button').on('click', function(e) {
			"use strict";
			var btn = jQuery(this).index();
			callback(btn+1, popup);
			YREG_ESTATE_STORAGE['message_callback'] = null;
			yreg_estate_message_destroy();
		});
	}
	// Call init function
	if (init != null) init(popup);
	// Show (animate) popup
	var top = jQuery(window).scrollTop();
	jQuery('body .yreg_estate_message').animate({top: top+Math.round((jQuery(window).height()-jQuery('.yreg_estate_message').height())/2), opacity: 1}, {complete: function () {
		// Call init function
		//if (init != null) init(popup);
	}});
	// Delayed destroy (if need)
	if (delay > 0) {
		setTimeout(function() { yreg_estate_message_destroy(); }, delay);
	}
	return popup;
}

// Destroy message window
function yreg_estate_message_destroy() {
	"use strict";
	var top = jQuery(window).scrollTop();
	jQuery('#yreg_estate_modal_bg').fadeOut();
	jQuery('.yreg_estate_message').animate({top: top-jQuery('.yreg_estate_message').height(), opacity: 0});
	setTimeout(function() { jQuery('#yreg_estate_modal_bg').remove(); jQuery('.yreg_estate_message').remove(); }, 500);
}
