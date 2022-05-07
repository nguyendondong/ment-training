// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
// global.toastr = require("toastr")
// app/asssets/javascripts/application.js
//= require jquery
//= require jquery_ujs
//= require toastr


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
	$("#micropost_picture").bind("change", function(){
    	var size_in_megabytes = this.files(0).size/1024/1024;
        if (size_in_megabytes > 1) {
        	alert("Maximum file size is 1MB. Please choose an other file!");
        }
    });

    $(document).ready(function(){

        console.log("hgahahahahah")
        // Chuẩn hóa code js
        /*
        1.Chức năng tăng giảm số lượng:
            + Layout theo dạng button giảm => input số lượng => button tăng
            + Button giảm có class "quantity-left-minus"
            + Button tăng có class "quantity-right-plus"
        */
        $(document).on("click", ".quantity-left-minus", function(){
            console.log("avc")
            var value = parseInt($(this).next().val(), 10);
            value = isNaN(value) ? 0 : value;
            value < 1 ? value = 1 : '';
            value--;
            $(this).next().val(value);
            //sau khi giảm làm cái gì đó
        })
        $(document).on("click", ".quantity-right-plus", function(){
            var value = parseInt($(this).prev().val(), 10);
            value = isNaN(value) ? 0 : value;
            value++;
            $(this).prev().val(value);
            //sau khi tăng làm cái gì đó
        })
    
        /*
        2. Chức năng thêm vào giỏ hàng, button thêm vào giỏ hàng phải có class "btn-add-cart" và bao gồm:
            + data-modal là tên class modal của riêng sản phẩm đó.
            + data-id là id của product đó.
            + các input radio để chọn variant phải có class "choose-variant".
            + input nhập số lượng phải có class "choose-quantity".
        */
        $(document).on("click", ".btn-add-cart", function(){
            var productId = $(this).data("id");
            var modalClass = $(this).data("modal");
            var variant = $(this).closest('.' + modalClass).find('input[type="radio"].choose-variant:checked').val();
            var quantity = $(this).closest('.' + modalClass).find('input.choose-quantity').val();
            $.ajax({
                data: {product_id: productId, variant_id: variant, quantity: quantity },
                dataType: 'json',
                type: 'POST',
                url: '/orders/populate'
            }).done(function(data) {
                //Thêm vào giỏ hàng thành công
                //Thay đổi số lượng
                $(".number-product").text(data.order.item_count);
                $(this).closest('.' + modalClass).removeClass("active");
                $(".add-to-cart-success").addClass("active");
    
            }).fail(function(jqXHR, textStatus, errorThrown) {
                //Thêm vào giỏ hàng thất bại
                console.log(textStatus + ': ' + errorThrown);
            });
        });
    
    
    })