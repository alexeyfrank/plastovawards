$(document).ready(function(){
	initParallax();
	initMainMenu();
	initEvents();
	initPopUp();
	initPolozhenie();
	initLaureate();
	initFilter();
	initElementsForm();



});

initParallax = function() {
	$('.parallax1,.parallax2,.parallax3').parallax({
		mouseport: jQuery('body'),
		yparallax: false,
		mouseResponse: false
	});
};

initFilter = function() {
	$('.button-toggle-filter').click(function(){
		$(this).toggleClass('active');
		$('.filter-work').toggle();
		return false;
	});
};

initElementsForm = function() {
	$('input[type="checkbox"]').ezMark();
};

initLaureate = function() {
	var scroll_pane = $('.scroll-pane');
	if(!scroll_pane.length) {
		return false;
	}

	$('.b-wrap-laureate-item').width($('.b-laureate-item').length*978);
	var scroll = scroll_pane.jScrollPane({
		showArrows: false,
		horizontalDragMinWidth: 23,
		horizontalDragMaxWidth: 23,
		animateScroll: true,
		clickOnTrack: true
	}).data('jsp');

	$('.prev-laureate').bind('click', function(){
		scroll.scrollByX(-100);
		return false;
	});
	$('.next-laureate').bind('click', function(){
		scroll.scrollByX(100);
		return false;
	});

	$('.b-laureate img').mouseenter(function(){
		$(this)
			.next()
			.show()
			.mouseleave(function(){
				$(this).hide();
			});
	});
};

initPopUp = function() {
	var open_pop_up = $('.open-pop-up');

	if(!open_pop_up.length) {
		return false;
	}

	var shadow = $('.shadow');
	var pop_up = $('.pop-up');

	open_pop_up.click(function(){
		shadow.show();
		var offset = $(this).offset();
		pop_up
			.show()
			.css({
				'left' : offset.left,
				'top'  : offset.top - pop_up.outerHeight() + 10
			});
		return false;
	});

	$('.pop-up .pop-up-close,.shadow').click(function(){
		popUpHide();
	});

	popUpHide = function() {
		shadow.hide();
		pop_up.hide();
	}
};

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
	events = $('.b-events');

	if(!events.length) {
		return false;
	}

	events.carouFredSel({
		auto: false,
		next : {
			button: $('.b-event2-arrow-right')
		},
		prev : {
			button: $('.b-event3-arrow-left')
		}
	});
};

initPolozhenie = function() {
	polozhenie = $('.polozhenie');

	if(!polozhenie.length) {
		return false;
	}

	$('.next-top,.next-bottom,.prev-top,.prev-bottom').click(function(){
		$('html, body').animate({scrollTop:0},'slow');
	});

	polozhenie.carouFredSel({
		auto: false,
		scroll : {
			fx: 'crossfade'
		},
		next : {
			button: $('.next-top,.next-bottom')
		},
		prev : {
			button: $('.prev-top,.prev-bottom')
		}
	});
};


