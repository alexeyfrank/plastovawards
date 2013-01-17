$(document).ready(function(){
	initParallax();
	initMainMenu();
	initEvents();
	initPopUp();
	initFancybox();
	initPolozhenie();
	initLaureate();
	initFilter();
	initElementsForm();
	initForms();
	initReplaceCursorIphone();
});

initParallax = function() {
	$('.parallax').plaxify({"xRange":100,"yRange":0});
	$.plax.enable();

	var heightWrapper = $('#wrapper').height();
	var parallax2 = $('.parallax2');
	var heightParallax2 = parallax2.height() + parallax2.position().top;

	if(heightParallax2 >= heightWrapper) {
		parallax2.css('top','300px');
	}
};

initReplaceCursorIphone = function() {
	var deviceAgent = navigator.userAgent.toLowerCase();
	var agentID = deviceAgent.match(/(iphone|ipod|ipad)/);
	if (agentID) {
		var fl = 0;
		$('body').bind('tapone',function(el,ev){
			var pageX = ev.originalEvent.pageX;
			var pageY = ev.originalEvent.pageY;

			$('body').prepend('<div class="blot"></div>');
			var blot = $('.blot');
			if(fl == 1) {
				blot.addClass('yellow');
			}

			blot.css({
				'left' : pageX - blot.width()/2,
				'top' : pageY - blot.height()/2
			});

			setTimeout(function(){
				blot.remove();
				if(fl == 1) {
					fl = 0;
				}
				else {
					fl = 1;
				}
			}, 100)
		});
	}
};

initFilter = function() {
	$('.button-toggle-filter').click(function(){
		$(this).toggleClass('active');
		$('.filter-work').toggle();
		return false;
	});
};

initElementsForm = function() {
	var checkbox = $('input[type="checkbox"]');
	if(checkbox.length) {
		checkbox.ezMark();
	}

	var placeholder = $('input[placeholder], textarea[placeholder]');
	if(placeholder.length) {
		placeholder.placeholder();
	}
};

initForms = function() {
	if(!$('.web-form').length) {
		return false;
	}

	var select = $('.web-form select');
	if(select.length) {
		var params = {
			changedEl: ".web-form select",
			visRows: 10,
			scrollArrows: false
		}
		cuSel(params);
	}

	/* Form Register */
	initFormRegister();

	/* Form Load Pictures */
	initFormLoadPictures();
};

initFormRegister = function() {
	var formRegister = $('.web-form-register');
	if(!formRegister.length) {
		return false;
	}
	formRegister.find('.load-photo').fineUploader({
		request: {
			endpoint: '/uploads/success.html'
		},
		multiple: false,
		validation: {
			allowedExtensions: ['jpeg', 'jpg', 'gif', 'png'],
			sizeLimit: 51200
		},
		text: {
			uploadButton: 'Загрузить фото'
		},
		debug: false
	})
	.on('error', function(event, id, filename, reason) {
		alert('Ошибка загрузки!');
	})
	.on('complete', function(event, id, filename, responseJSON){
		if (responseJSON.success) {
			formRegister.find('.load-photo-preview').html('<img src="/img/picture/picture1.jpg" alt="' + filename + '"><span class="delete-photo"></span>');
		}
	});

	formRegister.find('.delete-photo').live('click',function(){
		$(this).parent().html('');
	});
};

initFormLoadPictures = function() {
	var formLoadPictures = $('.web-form-load-pictures');
	if(!formLoadPictures.length) {
		return false;
	}
	var addedFiles = 0;
	var fileCount = 3;
	var fileLimit = 10;

	widthScrollPane = function() {
		formLoadPictures.find('.form-line-photo').width(
			(formLoadPictures.find('.load-photo-preview').length*90)-5
		);
	};
	widthScrollPane();
	var scroll_pane = formLoadPictures.find('.scroll-pane');
	var scroll = scroll_pane.jScrollPane({
		showArrows: false,
		horizontalDragMaxWidth: 23,
		autoReinitialise: true,
		autoReinitialiseDelay: 100
	}).data('jsp');
	setInterval(function() {
		widthScrollPane();
		scroll.reinitialise();
	}, 100);

	formLoadPictures.find('.load-photo').fineUploader({
		request: {
			endpoint: '/uploads/success.html'
		},
		multiple: false,
		validation: {
			allowedExtensions: ['jpeg', 'jpg', 'gif', 'png'],
			sizeLimit: 51200
		},
		text: {
			uploadButton: 'Выбрать картину'
		},
		debug: false
	})
	.on('error', function(event, id, filename, reason) {
		alert('Ошибка загрузки!');
	})
	.on('complete', function(event, id, filename, responseJSON){
		if (responseJSON.success) {
			addedFiles ++;

			var photo_active = formLoadPictures.find('.load-photo-preview.active');
			if(addedFiles >= fileCount) {
				photo_active.after('<span class="load-photo-preview"></span>');
				//scroll.getContentPane().find('form-line-photo').append('<span class="load-photo-preview"></span>');
			}

			photo_active
				.html('<img src="/img/picture/picture1.jpg" alt="' + filename + '"><span class="delete-photo"></span>')
				.removeClass('active')
				.next()
				.addClass('active');
		}
	});

	formLoadPictures.find('.delete-photo').live('click',function(){
		$(this)
			.parent()
			.remove();
		if(addedFiles < fileCount) {
			formLoadPictures.find('.load-photo-preview.active').after('<span class="load-photo-preview"></span>');
			//scroll.getContentPane().append('<span class="load-photo-preview"></span>');
		}
		addedFiles --;
	});
};

initLaureate = function() {
	var laureate = $('.b-wrap-laureate-item');
	if(!laureate.length) {
		return false;
	}

	laureate.width($('.b-laureate-item').length * 978);
	var scroll = $('.scroll-pane').jScrollPane({
		showArrows: false,
		horizontalDragMaxWidth: 190,
		animateScroll: true,
		clickOnTrack: true
	}).bind(
		'jsp-scroll-x',
		function() {
			setTimeout(function(){
				$('.jspTrackColor').width($('.jspDrag').css('left'));
			},50);
		}
	).data('jsp');

	$('.prev-laureate').bind('click', function(){
		scroll.scrollByX(-100);
		return false;
	});

	$('.next-laureate').bind('click', function(){
		scroll.scrollByX(100);
		return false;
	});

	$('.jspTrack').prepend('<div class="jspTrackColor"></div>');

	$('.b-laureate-frame').hover(function(){
		$(this).find('.b-laureate-desc').toggle();
	});
};

initFancybox = function() {
	var fancybox = $(".fancybox");
	if(!fancybox.length) {
		return false;
	}

	fancybox.fancybox({
		padding: 20,
		tpl: {
			closeBtn : '<a title="Закрыть" class="fancybox-item fancybox-close" href="javascript:;"></a>',
			next     : '<a title="Вперед" class="fancybox-nav fancybox-next" href="javascript:;"><span></span></a>',
			prev     : '<a title="Назад" class="fancybox-nav fancybox-prev" href="javascript:;"><span></span></a>'
		}
	});

	$('.b-laureate-desc').click(function(){
		$(this).prev().click();
		return false;
	});
};

initPopUp = function() {
	var open_pop_up = $('.open-pop-up');

	if(!open_pop_up.length) {
		return false;
	}

	var shadow = $('.shadow');
	var pop_up = $('.pop-up');

	open_pop_up.mouseenter(function(){
		shadow.show();
		var offset = $(this).offset();
		pop_up
			.show()
			.css({
				'left' : offset.left,
				'top'  : offset.top - pop_up.outerHeight() - 20
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

	$('.next-top.active,.next-bottom.active,.prev-top.active,.prev-bottom.active').click(function(){
		$('html, body').animate({scrollTop:0},'slow');
	});

	polozhenie.carouFredSel({
		auto: false,
		scroll : {
			fx: 'crossfade'
		},
		next : {
			button: $('.next-top.active,.next-bottom.active')
		},
		prev : {
			button: $('.prev-top.active,.prev-bottom.active')
		}
	});
};


