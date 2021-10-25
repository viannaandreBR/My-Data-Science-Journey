function setupSmoothAnchorScolling() {
    // From http://css-tricks.com/snippets/jquery/smooth-scrolling/
    $('a[href*=#]:not([href=#])').click(function() {
        if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
            var target = $(this.hash);
            target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
            if (target.length) {
                $('html,body').animate({
                    scrollTop: target.offset().top
                }, 400);
                return false;
            }
        }
    });
}

function initTabBox(selector) {
    var tabBox = $(selector);
    tabBox.find('.tabs').children().click(function() {
        var contentId = $(this).data('content');
        //showTab($(this).data('content'));
        showTab(contentId);
    });
    function showTab(contentId) {
        var allContent = tabBox.find('.content').children(),
            allTabs = tabBox.find('.tabs').children();
        allContent.hide();
        allTabs.removeClass('tab-active');
        var content = allContent.filter('.' + contentId);
        var tabFilter = function(i, el) {
            var innerContent = $(el).data('content');
            return (innerContent === contentId);
            //return $(el).data('content') === contentId;
        };
        tab = allTabs.filter(tabFilter);
        if (!content.length) {
            content = allContent.first();
            tab = allTabs.first();
        }
        content.show();
        tab.addClass('tab-active');
    }
    showTab(null);
}

function initTabBoxIaca(selector) {
    var tabBox = $(selector);
    tabBox.find('.tabs-iaca').children().click(function() {
        var contentId = $(this).data('content-iaca');
        //showTab($(this).data('content'));
        showTab(contentId);
    });
    function showTab(contentId) {
        var allContent = tabBox.find('.content-iaca').children(),
            allTabs = tabBox.find('.tabs-iaca').children();
        allContent.hide();
        allTabs.removeClass('tab-active-iaca');
        var name = '.' + contentId;
        var content = allContent.filter(name);
        var tabFilter = function(i, el) {
            var innerContent = $(el).data('content-iaca');
            return (innerContent === contentId);
            //return $(el).data('content') === contentId;
        };
        tab = allTabs.filter(tabFilter);
        if (!content.length) {
            content = allContent.first();
            tab = allTabs.first();
        }
        content.show();
        tab.addClass('tab-active-iaca');
    }
    showTab(null);
}

function beginLanguageTicker() {
    var langs = $('.language-options > li').map(function(i, e) { return $(e).text() });
    var current = 0;
    setInterval(function() {
        $('.language-ticker').text(langs[current]);
        current++;
        if (current == langs.length) {
            current = 0;
        }
    }, 200);
}

function isLocalhost() {
    var result = (
        location.hostname == "localhost" ||
        location.hostname == "127.0.0.1" ||
        location.hostname == ""
    );
    return result;
}

function maybeRedirectToHttps() {
    if (isLocalhost() || location.protocol == "https:") {
        return;
    }

    location.href = location.href.replace(/^http:/, 'https:');
}

maybeRedirectToHttps();
