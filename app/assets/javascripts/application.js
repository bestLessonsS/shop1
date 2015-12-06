// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .




$(document).on('page:change', function(){
	$('.add-to-cart-btn').on('click', function(e){
		var parent = $(this).parents('.add-to-cart-wrp')
		var number = parent.find('input[type="text"]').val();
		var productId = $(this).attr('data-product-id')
		var customerId = parent.find('select').val();

		$.ajax({
			url: $(this).attr('href'),
			type: "POST",
			dataType: "json",
			data: {order: { customer_id: customerId, status: 'placed' } , number: number, product_id: productId },
			success: function(data){
				if(data.status == "ok"){
					console.log(data)
					$('#modal-added-to-cart').find('.modal-body p').html("<h3>Product <strong><em>'"+data.order_product_name+"'</em></strong> added to cart.</h3>");
					$('#modal-added-to-cart').find('.modal-footer').prepend(data.link_to_cart)
					$('#modal-added-to-cart').modal('show')
				}
			},
			error: function(){
				alert("Ajax error")
			} 
		})

		e.preventDefault();
	})



	$('.order-status-form select').on('change', function(){
		$('.order-status-form').submit()
	})

	$('.show_unavailable_products_form input[type="checkbox"]').on('change', function(){
		$('.show_unavailable_products_form').submit()
	})


	
})