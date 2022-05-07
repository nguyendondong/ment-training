// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)


$(document).ready(function(){

    //init wow.js
    new WOW().init();
    //fadeOut Alert notice
    setTimeout(function(){
        $(".noti-error").fadeOut();
    },4000);
    $('.slide-categoies').slick({
        infinite: false,
        speed: 300,
        slidesToShow: 6,
        slidesToScroll: 6,
    });
    //modal add cart
    $(document).on("click", ".add-to-cart-btn", function(e){
        e.preventDefault()
        $(this).parent().parent().parent().next().addClass("active");
    });
    $(document).on("click", ".modal-bg", function(){
        $(this).parent().removeClass("active");
    });
    $(document).on("click", ".list-variant li .cart-variant label", function(){
        $(this).parent().parent().parent().find("label").removeClass("active");
        $(this).addClass("active");
    });
    $(document).on("click", ".close-modal", function(){
        $(this).parent().removeClass("active");
    });

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