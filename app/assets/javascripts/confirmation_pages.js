$(function(){

  $(".logo-image").hover(
    function(){
      $(this).css('opacity', '0.5');
    },
    function(){
      $(this).css('opacity', '');
    }
  )

  $(".change-link").hover(
    function(){
      $(this).css('text-decoration', 'underline');
      $(this).css('opacity', '0.8');
    },
    function(){
      $(this).css('text-decoration', '');
      $(this).css('opacity', '');
    }
  )

  $(".detail-footer__nav").find("li").hover(
    function(){
      $(this).css('text-decoration', 'underline');
      $(this).css('opacity', '0.8');
    },
    function(){
      $(this).css('text-decoration', '');
      $(this).css('opacity', '');
    }
  )

  $(".detail-footer-logo").hover(
    function(){
      $(this).css('opacity', '0.5');
    },
    function(){
      $(this).css('opacity', '');
    }
  )
  
})