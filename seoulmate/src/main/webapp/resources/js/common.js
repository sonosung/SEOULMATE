$(document).ready(function() {
   
    const popupBtnAll = document.querySelectorAll('[aria-haspopup="dialog"]');
    if (popupBtnAll) {
    let currentTarget, focusEl = [], popupDepth = 0, popupDimmed, keyEscapeEvt, KeyEvtEl;
    const _$this = this,
    popupAll = document.querySelectorAll('[role="dialog"]'),
    popupCloseBtnAll = document.querySelectorAll('[data-popup-close]');
    // ESC �꾨쫫 媛먯�
    const keyEvent = {
        get keyEscape() {
        return this._state;
        },
        set keyEscape(state) {
        this._state = state;
        if (state) escKeyEvt(KeyEvtEl, keyEscapeEvt);
        },
    };
    keyEvent;
    // popup dimmed �앹꽦
    const createdDimmed = () => {
        const createDiv = document.createElement('div');
        createDiv.classList.add('popup-dimmed');
        document.querySelector('body').appendChild(createDiv);
    };
    // popup dimmed click �� �앹뾽 �リ린
    const dimmedClick = (e) => {
        if (e.target.classList.contains('wrap-layer-popup')) {
        popupCloseAll();
        keyEvent.keyEscape = false;
        }
    };
    // popup open
        // popup open
        const popupOpen = (e) => {
            currentTarget = e.target.tagName;
            currentTarget === 'BUTTON' || currentTarget === 'A' ? currentTarget = e.target : currentTarget = e.target.closest('button') || e.target.closest('a');
            $('.scroll_wrap').css('z-index','99');
            popupDimmed = document.querySelectorAll('.popup-dimmed');
            if (popupDimmed.length === 0) createdDimmed();

            popupAll.forEach((popupEl) => {
                if (popupEl.getAttribute('data-popup') === currentTarget.getAttribute('data-popup')) {
                    popupDepth += 1; // popup depth ����
                    focusEl.splice((popupDepth - 1), 0, currentTarget); // popup focus Element ����
                    popupEl.classList.add('popup-open'); // open class add
                    popupEl.setAttribute('popup-depth', popupDepth); // popup depth �ㅼ젙

                    // dimmed click �대깽�� �좊떦
                    popupEl.removeEventListener('click', dimmedClick);
                    popupEl.addEventListener('click', dimmedClick);

                    document.body.classList.add('scroll-lock'); // popup scroll lock

                    // ���댄� �붿냼媛� �덈뒗吏� �뺤씤 �� �ъ빱�� �ㅼ젙
                    const titleEl = popupEl.querySelector('.wrap-layer-popup-title');
                    if (titleEl) {
                        titleEl.focus(); // popup �ㅽ뵂 �� ���댄��� �ъ빱��
                        // shift+tab �먮뒗 <- �붿궡�� �� �ㅻ낫�� �숈옉 �� �앹뾽 諛뽰쑝濡� �ъ빱�� �대룞 諛⑹� �대깽�� �좊떦
                        titleEl.removeEventListener('keydown', titleKeyDown);
                        titleEl.addEventListener('keydown', titleKeyDown);
                    }

                    // popup �� �앹뾽 耳��댁뒪 dimmed �섏젙
                    if (popupDepth > 1) document.querySelector(`[popup-depth='${popupDepth - 1}']`).classList.add('prev-popup');

                    KeyEvtEl = popupEl; // ESC �� �숈옉�� �꾪븳 �꾩옱 �쒖꽦�� �� popup element ����
                };
            });
        };

        // popup close
    const popupClose = (e) => {
        $('.scroll_wrap').css('z-index','19');
        // �ㅻ낫�� �대깽�� ESC �� 寃쎌슦 currentTarget �ㅼ젙
        if (e.key == 'Escape' || e.key == 'Esc') currentTarget = KeyEvtEl.querySelector('.btn-layer-close');
        // �쇰컲�곸씤 �대┃, �ㅻ낫�� �대깽�� �� 寃쎌슦 currentTarget �ㅼ젙
        else {
        currentTarget = e.target.tagName;
        currentTarget === 'BUTTON' || currentTarget === 'A' ? currentTarget = e.target : currentTarget = e.target.closest('button') || e.target.closest('a');
        let popupId = currentTarget.getAttribute('data-popup-close');
        if (currentTarget.getAttribute('popup-close-all') === 'true') return popupCloseAll();
        if (currentTarget.getAttribute('popup-confirm')) confirmEvt[popupId]();
        else if (currentTarget.getAttribute('popup-cancel')) cancelEvt[popupId]();
        }
        popupAll.forEach((popupEl) => {
        if (popupEl.getAttribute('data-popup') === currentTarget.getAttribute('data-popup-close')) {
            popupEl.classList.remove('popup-open');
            // ���λ맂 focus element 媛� �덉쓣 ��
            if (focusEl.length > 0) {
            focusEl[popupDepth - 1].focus(); // focus �곹깭 �ъ꽕��
            focusEl.splice((popupDepth - 1), 1); // popup focus Element ��젣
            popupDepth -= 1; // popup depth �ъ꽕��
            KeyEvtEl = document.querySelector(`.wrap-layer-popup[popup-depth='${popupDepth}']`); // ESC �� �숈옉�� �꾪븳 �꾩옱 �쒖꽦�� �� popup element ����
            } else { // ���λ맂 focus element 媛� �놁쓣 ��
            document.body.setAttribute('tabindex', '0');
            document.body.focus();
            KeyEvtEl = null;
            }
        };
        });
        // �ㅽ뵂 �� popup�� �덈뒗 吏� �뺤씤
        const openPopups = document.querySelectorAll(`.popup-open`);
        if (openPopups.length === 0) popupCloseAll('none');
        else if (openPopups.length > 0) { // �ㅽ뵂�� popup�� �덉쓣 寃쎌슦 popup dimmed �섏젙
        const getPopupValue = currentTarget.getAttribute('data-popup-close') || currentTarget.getAttribute('data-popup');
        const getPopupDepth = Number(document.querySelector(`.wrap-layer-popup[data-popup='${getPopupValue}']`).getAttribute('popup-depth'));
        document.querySelector(`.wrap-layer-popup[popup-depth='${getPopupDepth - 1}']`).classList.remove('prev-popup');
        document.querySelector(`.wrap-layer-popup[data-popup='${getPopupValue}']`).removeAttribute('popup-depth');
        };
    };
    // popup close All
    const popupCloseAll = (focusActionNone) => {
        // dimmed ��젣
        const popupDimmed = document.querySelector('.popup-dimmed');
        popupDimmed.style.opacity = 0;
        popupDimmed.addEventListener('transitionend', function() {
        if (popupDimmed.parentNode !== null) popupDimmed.parentNode.removeChild(popupDimmed);
        });
        // popup depth �ㅼ젙 ��젣
        popupAll.forEach((popupEl) => {
        popupEl.classList.remove('prev-popup');
        popupEl.removeAttribute('popup-depth');
        });
        // scroll lock �댁�
        document.body.classList.remove('scroll-lock');
        // popupClose Event �듯빐�� focus �ㅼ젙�� �섏� �딆븯�� 寃쎌슦 (popupCloseAll �⑤룆 �ㅽ뻾�� 寃쎌슦)
        if (focusActionNone !== 'none') {
        if (focusEl.length > 0) focusEl[0].focus();  // ���λ맂 focus element 媛� �덉쓣 ��
        else { // ���λ맂 focus element 媛� �놁쓣 ��
            document.body.setAttribute('tabindex', '0');
            document.body.focus();
        };
        focusEl = []; // focus reset
        }
        popupAll.forEach((popupEl) => popupEl.classList.remove('popup-open')); // open class ��젣
        popupDepth = 0; // popup depth reset
        KeyEvtEl = null; // KeyEvtEl reset
    };
    // ESC �ㅻ낫�� �대깽��
    const escKeyEvt = (El, e) => {
        const openPopups = document.querySelectorAll(`.popup-open`);
        // �앹뾽 �대┛ �곹깭�먯꽌 �ㅻ낫�� ESC �� �대깽�� �ㅽ뻾 
        if (openPopups.length > 0) popupClose(e);
    };
    // popup �リ린 �ㅻ낫�� �대깽��
    const closeBtnKeyDown = (El) => {
        if ((e.key == 'Tab' && !e.shiftKey) || e.key == 'ArrowRight') {
        e.preventDefault();
        popupAll.forEach((popupEl) => {
            if (popupEl.getAttribute('data-popup') === e.target.getAttribute('data-popup-close')) {
                popupEl.querySelector('.wrap-layer-popup-title').focus();
            };
        });
        };
    };
    // popup title �ㅻ낫�� �대깽��
    const titleKeyDown = (e) => {
        if ((e.key == 'Tab' && e.shiftKey) || e.key == 'ArrowLeft') {
        e.preventDefault();
        popupAll.forEach((popupEl) => {
            if (popupEl.getAttribute('data-popup') === e.target.closest('.wrap-layer-popup').getAttribute('data-popup')) {
            popupEl.querySelector('.btn-layer-close').focus();
            };
        });
        };
    };

    // �ㅻ낫�� ESC �� �꾨쫫 媛먯� �대깽��
    const escKeyDown = (e) => {
        if (e.key == 'Escape' || e.key == 'Esc') {
        keyEscapeEvt = e;
        keyEvent.keyEscape = true;
        };
    };

    // �대┃/�ㅻ낫�� �앹뾽 �대깽�� �쒓굅/�좊떦
    // �앹뾽 �닿린
    popupBtnAll.forEach((popupBtn) => {
        popupBtn.removeEventListener('click', popupOpen);
        popupBtn.addEventListener('click', popupOpen);
    });
    // �앹뾽 �リ린 
    popupCloseBtnAll.forEach((popupCloseBtn) => {
        popupCloseBtn.removeEventListener('click', popupClose);
        popupCloseBtn.addEventListener('click', popupClose);
        if (popupCloseBtn.classList.contains('btn-layer-close')) {
        popupCloseBtn.removeEventListener('keydown', closeBtnKeyDown);
        popupCloseBtn.addEventListener('keydown', closeBtnKeyDown);
        }
    });
    // ESC �ㅻ줈 �앹뾽 �リ린
    window.removeEventListener('keydown', escKeyDown);
    window.addEventListener('keydown', escKeyDown);
    }
    

    // 留덉슦�� hover , button �대┃
    $('.main_search').click(function(){
        var searchBox = $(this).siblings('.search_box')
        searchBox.show();
        gsap.fromTo( searchBox, {y: -30}, {duration: 0.4, y: 0} );
    });

    $('.search_box_close').click(function(){
        $('.selectBox2').removeClass('active');
        $('.search_box').fadeOut();
    })
    $('.search_box').keydown(function(e){
                
            if(e.keyCode == "9" && e.shiftKey){
            }else{
                $('.search_box_close').focusout(function() {
                    $('.search_box').fadeOut();
                    $('.main_search').focus();
                });
            }
    });

    $('.link_btn').click(function() {
        if($(this).hasClass('off')){
            $(this).removeClass('off');
            $(this).addClass('on');
        }
    })
    $('.m_img_fst').after().click(function(){
       $('.m_more').slideDown();
       $('.slide_content.fst').css('height','auto');
       $(this).addClass('down');
    });
    $('.more_pc_btn').click(function(){
        $('.m_more').slideDown();
        $('.slide_content.fst').css('height','auto');
        $(this).parent('.slide_content.fst').addClass('down');
        $(this).hide();
     });

     $('.slide_content.fst').click(function(){
        $('.m_more').slideDown();
        $(this).css('height','auto');
        $(this).addClass('down');
        $('.more_pc_btn').hide();
     });
    
    $('.slick-arrow').mouseenter(function() {
        $(this).addClass('on').fadeIn();
    }).mouseleave(function() {
        $(this).removeClass('on');
    });
    $('.slick-arrow').focus(function() {
        $(this).addClass('on').fadeIn();
    }).focusout(function() {
        $(this).removeClass('on');
    });
    $('.arrow_ico').focus(function() {
        gsap.to( $('.on', this), {duration: 0.3, opacity: 1} );
        $(this).find('.off').attr('opacity', 0);
    }).focusout(function() {
        gsap.to( $('.on', this), {duration: 0.3, opacity: 0} );
    });
    $('.related_ul li a').mouseenter(function() {
        gsap.to( $('span img.on', this), {duration: 0.3, opacity: 1} );
        gsap.to( $('span img.off', this), {duration: 0.3, opacity: 0} );
    }).mouseleave(function() {
        gsap.to( $('span img.on', this), {duration: 0.3, opacity: 0} );
        gsap.to( $('span img.off', this), {duration: 0.3, opacity: 1} );
    });
    $('.related_ul li a').focus(function() {
        gsap.to( $('span img.on', this), {duration: 0.3, opacity: 1} );
        gsap.to( $('span img.off', this), {duration: 0.3, opacity: 0} );
    }).focusout(function() {
        gsap.to( $('span img.on', this), {duration: 0.3, opacity: 0} );
        gsap.to( $('span img.off', this), {duration: 0.3, opacity: 1} );
    });
    // 留덉슦�� hover , button �대┃

    // select box custom
    if($('.label').length){
        const label = document.querySelector('.label');
        const options = document.querySelectorAll('.optionItem');
        const handleSelect = function(item) {
        label.innerHTML = item.textContent;
        label.parentNode.classList.remove('active');
        }
        options.forEach(function(option){
        option.addEventListener('click', function(e){
            e.preventDefault();
            handleSelect(option)})
        })
        label.addEventListener('click', function(e){
            e.preventDefault();
        if(label.parentNode.classList.contains('active')) {
            label.parentNode.classList.remove('active');
        } else {
            label.parentNode.classList.add('active');
        }
        });
    }    
    // select box custom
    
    // poster height �ㅽ겕由쏀듃 異붽� 2023.02.06
    $(window).resize(function(){
        var wd = $(window).innerWidth();
        var mainPoster = $('.top_bannr').innerHeight();
        if(wd<1970){
            $('.slide_wd_poster').css('width','928px');
            // $('.top_bannr').css('padding','0');  // 2023.05.02 紐⑤컮�� �붾컮�댁뒪�먯꽌 �섏씠吏� �덈줈怨좎묠�� 諛곕꼫�대깽�� 媛�濡쒖쁺�� �뺣젹�덈릺�� �댁뒋濡� 二쇱꽍泥섎━
            $('.slide_wd_poster').css('padding','0');
        }else{
            $('.slide_wd_poster').css('width','100%');
            $('.top_bannr').css('padding','0 27%');
        }
        
    })
    var wd = $(window).innerWidth();
    var mainPoster = $('.top_bannr').innerHeight();
    if(wd<1970){
        $('.slide_wd_poster').css('width','928px');
        // $('.top_bannr').css('padding','0');  // 2023.05.02 紐⑤컮�� �붾컮�댁뒪�먯꽌 �섏씠吏� �덈줈怨좎묠�� 諛곕꼫�대깽�� 媛�濡쒖쁺�� �뺣젹�덈릺�� �댁뒋濡� 二쇱꽍泥섎━
        $('.slide_wd_poster').css('padding','0');
    }else{
        $('.slide_wd_poster').css('width','100%');
        $('.top_bannr').css('padding','0 27%');
    }
    // poster height �ㅽ겕由쏀듃 異붽� 2023.02.06
    
    
   
});