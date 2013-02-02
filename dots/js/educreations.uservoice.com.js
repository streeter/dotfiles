var cKey = 67,
    iKey = 73,
    rKey = 83,
    retKey = 13,
    shiftKey = 16,
    escKey = 27;

var hidePopover = function(e) {
    var popover = $('.uv-popover');
    if (popover && parseInt(popover.css('left')) > 0) {
        console.log('Hiding the popover.');
        $(document.body).click();
    }
};

var showPopover = function(e) {
    console.log('Showing the popover.');
    console.log('popover link', $('a[data-popover]'));
    $('a[data-popover], a.ticket-canned-response').click();
};


$(document).keydown(function(e) {
    switch (e.keyCode) {
        case escKey:
            hidePopover(e);
            break;
        case iKey:
            console.log('I key was pressed!');
            if (e.ctrlKey || e.metaKey) {
                showPopover(e);
            }
            break;
        case rKey:
            if (e.ctlKey || e.metaKey) {
                console.log('R key pressed.');
                e.preventDefault();
                $('button.console-search-refresh').click();
            }
            break;
        case retKey:
            if (e.shiftKey) {
                e.preventDefault();
                $('button.ticket-message-form-button').click();
            }
            break;
        default:
            break;
    }
});

