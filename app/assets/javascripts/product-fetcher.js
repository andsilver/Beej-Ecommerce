$(document).ready(function(){
  $('[data-product-fetcher').click(function(){
    var url = $('#url_to_fetch').val();
    $.ajax({
      url: '/fetch-product',
      data: {"url": url},
      dataType: 'json',
      success: function(data){
        $('#modal_product_image').attr('src', data.image_url);
        $('#modal_product_title').text(data.name);
        $('#cart_item_title').val(data.name);
        $('#cart_item_image_url').val(data.image_url);
        $('#cart_item_supplier_url').val(url);
        $('#cart_item_description').val(url);
      },
      error: function(){ console.log('Error: product not found')}
    });
  });
});
