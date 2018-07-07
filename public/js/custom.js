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

$(document).ready(function(){
  $('#calculate-button').click(function(){

    var price = parseFloat( $('#price').val() );
    price = isNaN(price) ? 0 : price;
    var us_shipping_cost = parseFloat( $('#cost').val() );
    us_shipping_cost = isNaN(us_shipping_cost) ? 0 : us_shipping_cost;
    var quantity = parseInt( $('#quantity').val() );
    quantity = isNaN(quantity) ? 0 : quantity;
    var item_weight = parseFloat( $('#weight').val() );
    item_weight = isNaN(item_weight) ? 0 : item_weight;
    var items_cost = price * quantity;
    var customs_and_taxes = 0;
    if(items_cost < 60){
      customs_and_taxes = 0;
    } else if(items_cost < 150){
      customs_and_taxes = items_cost * 0.16;
    }
    else{
      customs_and_taxes = items_cost * 0.25;
    }

    var international_shipping_cost = Math.ceil(item_weight * quantity / 0.25)*6.5;
    if(international_shipping_cost > 0){ international_shipping_cost = international_shipping_cost + 2.5; }

    var subtotal = items_cost + us_shipping_cost + international_shipping_cost;
    var fees = subtotal * 0.15;
    var total = subtotal + fees + customs_and_taxes;
    var jod = total * 0.73;
    fees = fees.toFixed(2);
    total = total.toFixed(2);
    jod = jod.toFixed(2);
    var total_text = total + ' <span>(JOD '+ jod + ')</span>';



    $('#calculated_item_price').text('$ '+ price);
    $('#calculated_quantity').text(quantity);
    $('#calculated_us_shipping_cost').text('$ '+ us_shipping_cost);
    $('#calculated_item_weight').text(item_weight + ' KG');
    $('#calculated_customs_and_taxes').text('$ '+ customs_and_taxes);
    $('#calculated_international_shipping').text('$ '+international_shipping_cost);
    $('#calculated_fees').text('$ '+ fees);
    $('#calculated_total_price').html('$ '+ total_text);
  });
});
