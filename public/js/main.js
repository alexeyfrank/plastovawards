$(document).ready(function(){
	initMainMenu();
	initEvents();
});

initMainMenu = function() {
	var sub_menu = $('.wrap-sub-menu');
	var offset,pos_left;

	$('.main-menu li').mouseenter(function(){
		clearMenu();
	});

	sub_menu.mouseleave(function() {
		clearMenu();
	});

	$('.main-menu .sub-menu').mouseenter(function() {
		$(this)
			.addClass('hover')
			.find('ul')
			.clone()
			.appendTo(sub_menu);

		offset = 35;
		if($(this).index()+1 == $('.main-menu > ul > li').length) {
			offset = 120;
		}

		pos_left = $(this).position().left - offset;
		sub_menu.css('left',pos_left);
	});

	clearMenu = function() {
		$('.main-menu li').removeClass('hover');
		sub_menu.html('');
	}
};

initEvents = function() {
	$(".b-events").carouFredSel({
		auto: false,
		next : {
			button: $('.b-event2-arrow-right')
		},
		prev : {
			button: $('.b-event3-arrow-left')
		}
	});
};


