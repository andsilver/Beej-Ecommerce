// Scrolls to the selected menu item on the page
$(function() {
  $('ul a[href*=#]:not([href=#])').click(function() {
    if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') || location.hostname == this.hostname) {
      var target = $(this.hash);
    target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
    if (target.length) {
      $('html,body').animate({
        scrollTop: target.offset().top
      }, 1000);
      return false;
    }
  }
  });
});

$(document).ready(function(){
  $('.quantity-right-plus').click(function(e){
    // Stop acting like a button
    e.preventDefault();
    // Get the field name
    var quantity_item = $(this).parents('.checkout1_table_content').find('.quantity');
    var quantity = parseInt(quantity_item.val());
    // If is not undefined
    quantity_item.val(quantity + 1);
    quantity_item.change();

    // Increment
  });

  $('.quantity-left-minus').click(function(e){
    // Stop acting like a button
    e.preventDefault();
    var quantity_item = $(this).parents('.checkout1_table_content').find('.quantity');
    var quantity = parseInt(quantity_item.val());
    // If is not undefined
    if(quantity>1){
      quantity_item.val(quantity - 1);
      quantity_item.change();
    }
  });

});

$(document).ready(function(){
  $('.quantity-right-plus2').click(function(e){
    // Stop acting like a button
    e.preventDefault();
    // Get the field name
    var quantity = parseInt($('#quantity2').val());

    // If is not undefined

    $('#quantity2').val(quantity + 1);


    // Increment

  });

  $('.quantity-left-minus2').click(function(e){
    // Stop acting like a button
    e.preventDefault();
    // Get the field name
    var quantity = parseInt($('#quantity2').val());

    // If is not undefined

    // Increment
    if(quantity>0){
      $('#quantity2').val(quantity - 1);
    }
  });

});


$(document).ready(function(){
  $('.p_quantity-right-plus').click(function(e){
    // Stop acting like a button
    e.preventDefault();
    // Get the field name
    var quantity = parseInt($('#p_quantity').val());

    // If is not undefined

    $('#p_quantity').val(quantity + 1);


    // Increment

  });

  $('.p_quantity-left-minus').click(function(e){
    // Stop acting like a button
    e.preventDefault();
    // Get the field name
    var quantity = parseInt($('#p_quantity').val());

    // If is not undefined

    // Increment
    if(quantity>1){
      $('#p_quantity').val(quantity - 1);
    }
  });
});
