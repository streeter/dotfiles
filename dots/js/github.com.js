$('div.alert.issues_comment').hide()

var color = '#eee';
var classes = 'div.alert.watch_started, div.alert.follow, div.alert.create, div.alert.gist, div.alert.fork';

$(classes).css('background-color', color);

$('.ajax_paginate a').live('click', function() {
	setTimeout(function() {
		$(classes).css('background-color', color);
		$('div.alert.issues_comment').hide()
	}, 700);
});
