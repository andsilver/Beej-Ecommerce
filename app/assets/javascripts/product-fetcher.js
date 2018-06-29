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
      },
      error: function(){ console.log('Error: product not found')}
    });
  });
});
