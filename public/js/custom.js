

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

var quantitiy=0;
   $('.quantity-right-plus').click(function(e){
        
        // Stop acting like a button
        e.preventDefault();
        // Get the field name
        var quantity = parseInt($('#quantity').val());
        
        // If is not undefined
            
            $('#quantity').val(quantity + 1);

          
            // Increment
        
    });

     $('.quantity-left-minus').click(function(e){
        // Stop acting like a button
        e.preventDefault();
        // Get the field name
        var quantity = parseInt($('#quantity').val());
        
        // If is not undefined
      
            // Increment
            if(quantity>0){
            $('#quantity').val(quantity - 1);
            }
    });
    
});




$(document).ready(function(){

var quantitiy=0;
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

var quantitiy=0;
   $('.quantity-right-plus3').click(function(e){
        
        // Stop acting like a button
        e.preventDefault();
        // Get the field name
        var quantity = parseInt($('#quantity3').val());
        
        // If is not undefined
            
            $('#quantity3').val(quantity + 1);

          
            // Increment
        
    });

     $('.quantity-left-minus3').click(function(e){
        // Stop acting like a button
        e.preventDefault();
        // Get the field name
        var quantity = parseInt($('#quantity3').val());
        
        // If is not undefined
      
            // Increment
            if(quantity>0){
            $('#quantity3').val(quantity - 1);
            }
    });
    
});


$(document).ready(function(){

var quantitiy=0;
   $('.quantity-right-plus4').click(function(e){
        
        // Stop acting like a button
        e.preventDefault();
        // Get the field name
        var quantity = parseInt($('#quantity4').val());
        
        // If is not undefined
            
            $('#quantity4').val(quantity + 1);

          
            // Increment
        
    });

     $('.quantity-left-minus4').click(function(e){
        // Stop acting like a button
        e.preventDefault();
        // Get the field name
        var quantity = parseInt($('#quantity4').val());
        
        // If is not undefined
      
            // Increment
            if(quantity>0){
            $('#quantity4').val(quantity - 1);
            }
    });
    
});





$(document).ready(function(){

var quantitiy=0;
   $('.quantity-right-plus5').click(function(e){
        
        // Stop acting like a button
        e.preventDefault();
        // Get the field name
        var quantity = parseInt($('#quantity5').val());
        
        // If is not undefined
            
            $('#quantity5').val(quantity + 1);

          
            // Increment
        
    });

     $('.quantity-left-minus5').click(function(e){
        // Stop acting like a button
        e.preventDefault();
        // Get the field name
        var quantity = parseInt($('#quantity5').val());
        
        // If is not undefined
      
            // Increment
            if(quantity>0){
            $('#quantity5').val(quantity - 1);
            }
    });
    
});










$(document).ready(function(){

var quantitiy=0;
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
            if(quantity>0){
            $('#p_quantity').val(quantity - 1);
            }
    });
    
});


















