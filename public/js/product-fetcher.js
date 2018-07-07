$(document).ready(function(){
  $('[data-product-fetcher').click(function(){
    $('#modal_error').hide();
    $('#modal_results').hide();
    $('#modal_spinner').show();

    var url = $('#url_to_fetch').val();
    $.ajax({
      url: '/fetch-product',
      data: {"url": url},
      dataType: 'json',
      success: function(data){
        $('#modal_product_image').attr('src', data.image_url);
        $('#modal_product_title').text(data.title);
        $('#cart_item_title').val(data.title);
        $('#cart_item_image_url').val(data.image_url);
        $('#cart_item_supplier_url').val(url);
        $('#cart_item_description').val(url);

        $('#modal_spinner').hide();
        $('#modal_results').show();
      },
      error: function(){ 
        $('#modal_spinner').hide();
        $('#modal_error').show();
        console.log('Error: product not found')
      }
    });
  });
});

$(document).ready(function(){
  $('[data-edit_product').click(function(){
    var product = $(this).parents('.checkout1_table_content');
    var product_image = product.find('.checkout_item img').attr('src');
    var title = product.find('.checkout_item span').text();
    var instructions = $.trim(product.find('.checkout_description').text());
    var quantity = product.find('input.quantity').val();
    var edit_url = $(this).data('edit_url');

    $('#modal_product_image').attr('src', product_image);
    $('#modal_product_title').text(title);
    $('#cart_item_instructions').val(instructions);
    $('#p_quantity').val(quantity);
    $('#product_modal .product_modal_footer .product_modal_add_btn').text('Update');
    $('#product_modal form').attr('action', edit_url);
    var form = $('#product_modal form');
    $('#product_modal form input[name=_method]').remove();
    $('#cart_item_title').remove();
    $('#cart_item_image_url').remove();
    $('#cart_item_supplier_url').remove();
    $('#cart_item_description').remove();
    $('<input class="method" type="hidden" name="_method" value="patch">').appendTo(form);

    $('#modal_spinner').hide();
    $('#modal_results').show();
  });
});
 
