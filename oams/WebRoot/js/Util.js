var globalVar = $.extend({}, globalVar);
/**
 * 换肤功能
 */
globalVar.changeTheme = function(themeName) {
	var $easyuiTheme = $('#easyuiTheme');
	var url = $easyuiTheme.attr('href');
	var href = url.substring(0, url.indexOf('themes')) + 'themes/' + themeName + '/easyui.css';
	$easyuiTheme.attr('href', href);

	var $iframe = $('iframe');
	if ($iframe.length > 0) {
		for ( var i = 0; i < $iframe.length; i++) {
			var ifr = $iframe[i];
			$(ifr).contents().find('#easyuiTheme').attr('href', href);
		}
	}

	$.cookie('easyuiThemeName', themeName, {
		expires : 365
	});
};

function formatCombobox(value) {
	for ( var i = 0; i < arguments.length - 1; i++) {
		value = value.replace("{" + i + "}", arguments[i + 1]);
	}
	return value;
}