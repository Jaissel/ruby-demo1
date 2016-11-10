function submitEmailForm(){
  name_field = $("#contact-name");
  name_field_label = $("#contact-name-label");
  email_field = $("#contact-email");
  email_field_label = $("#contact-email-label");
  message_field = $("#contact-message");
  message_field_label = $("#contact-message-label");
  if (name_field.val() == "") {
    name_field.addClass("danger");
    name_field_label.removeClass("hidden");
  }
  if (email_field.val() == "") {
    email_field.addClass("danger");
    email_field_label.removeClass("hidden");
  }
  if (message_field.val() == "") {
    message_field.addClass("danger");
    message_field_label.removeClass("hidden");
  }
  if (name_field.val() != "" && email_field.val() != "" && message_field.val() != ""){

  }
}

$('.email-form-field').on('change', function() {
  if ($(this).val()!=""){
    $(this).removeClass("danger");
    $('.email-form-label').addClass("hidden");
  }else{
    $(this).addClass("danger");
  }
});

(function($) {
    "use strict"; // Start of use strict

    // jQuery for page scrolling feature - requires jQuery Easing plugin
    $('a.page-scroll').bind('click', function(event) {
        var $anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: ($($anchor.attr('href')).offset().top - 50)
        }, 1250, 'easeInOutExpo');
        event.preventDefault();
    });

    // Highlight the top nav as scrolling occurs
    $('body').scrollspy({
        target: '.navbar-fixed-top',
        offset: 100
    });

    // Closes the Responsive Menu on Menu Item Click
    $('.navbar-collapse ul li a').click(function() {
        $('.navbar-toggle:visible').click();
    });

    // Offset for Main Navigation
    $('#mainNav').affix({
        offset: {
            top: 50
        }
    })

})(jQuery); // End of use strict
