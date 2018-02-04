// // This is a manifest file that'll be compiled into application.js, which will include all the files
// // listed below.
// //
// // Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// // vendor/assets/javascripts directory can be referenced here using a relative path.
// //
// // It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// // compiled file. JavaScript code in this file should be added after the last require_* statement.
// //
// // Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// // about supported directives.
// //
// //= require rails-ujs
// //= require turbolinks
// //= require_tree .

function onBodyLoad() {
$(document).ready(function () {
    console.log('market');

    $(".buy-btn").on('click', function () {
        var aaya1 = $(this).parent().siblings().children()[0].value;
        var aaya2 = $(this).parent().siblings().children()[1].value;
        var aaya3 = $(this).parent().siblings().children()[2].value;
        var aaya4 = $(this).parent().siblings().children()[3].value;
        // console.log($("#companyBuy")[0].textContent);
        $("#companyBuy")[0].textContent = aaya1;
        $("#placePriceBuy")[0].textContent = aaya2;
        $("#LVBuy")[0].textContent = aaya3;
        $("#buyFormIdBuy")[0].value= aaya4;


        $('.ui.modal.buy').modal('show', function () {
            var curPrice = $(".curPriceBuy")[0].textContent;
            console.log(curPrice);
            $(".amount-input-buy").keydown(function (event) {
                setTimeout(() => {
                    var amount = event.currentTarget.value;
                    // console.log(amount);
                    var quantity = amount / curPrice;
                    console.log(quantity);
                    $(".change-value-buy")[0].textContent = quantity;
                }, 0002);
            });
        });
    });

    $(".sell-btn").on('click', function () {
        var aaya1 = $(this).parent().siblings().children()[0].value;
        var aaya2 = $(this).parent().siblings().children()[1].value;
        var aaya3 = $(this).parent().siblings().children()[2].value;
        var aaya4 = $(this).parent().siblings().children()[3].value;

        $("#companySell")[0].textContent = aaya1;
        $("#placePriceSell")[0].textContent = aaya2;
        $("#LVSell")[0].textContent = aaya3;
        $("#buyFormIdSell")[0].value= aaya4;

        $('.ui.modal.sell').modal('show', function () {
            var curPrice = $(".curPriceSell")[0].textContent;
            console.log(curPrice);
            $(".amount-input-sell").keydown(function (event) {
                setTimeout(() => {
                    var amount = event.currentTarget.value;
                    // console.log(amount);
                    var quantity = amount / curPrice;
                    console.log(quantity);
                    $(".change-value-sell")[0].textContent = quantity;
                }, 0002);
            });
        });
    });

    $(".short-btn").on('click', function () {
        var aaya1 = $(this).parent().siblings().children()[0].value;
        var aaya2 = $(this).parent().siblings().children()[1].value;
        var aaya3 = $(this).parent().siblings().children()[2].value;
        var aaya4 = $(this).parent().siblings().children()[3].value;

        $("#companyShort")[0].textContent = aaya1;
        $("#placePriceShort")[0].textContent = aaya2;
        $("#LVShort")[0].textContent = aaya3;
        $("#buyFormIdShort")[0].value= aaya4;

        $('.ui.modal.short').modal('show', function () {
            var curPrice = $(".curPriceShort")[0].textContent;
            console.log(curPrice);
            $(".amount-input-short").keydown(function (event) {
                setTimeout(() => {
                    var amount = event.currentTarget.value;
                    // console.log(amount);
                    var quantity = amount / curPrice;
                    console.log(quantity);
                    $(".change-value-short")[0].textContent = quantity;
                }, 0002);
            });
        });
    });

    $('.close1').click(()=>{
      return 0;
    })
    //nsit buy button in nsit coin section
    $(".nsit-buy-button").on('click', function () {
        $('.ui.modal.tiny.nsit-buy').modal('show', function () {
            var curPrice = $(".curPriceCoinBuy")[0].textContent;
            console.log(curPrice);
            $(".amount-input-coin-buy").keydown(function (event) {
                setTimeout(() => {
                    var amount = event.currentTarget.value;
                    // console.log(amount);
                    var quantity = amount / curPrice;
                    console.log(quantity);
                    $(".change-value-coin-buy")[0].textContent = quantity;
                }, 0002);
            });
        });
    });

    //nsit sell button in nsit coin section
    $(".nsit-sell-button").on('click', function () {
        $('.ui.modal.tiny.nsit-sell').modal('show', function () {
            var curPrice = $(".curPriceCoinSell")[0].textContent;
            console.log(curPrice);
            $(".amount-input-coin-sell").keydown(function (event) {
                setTimeout(() => {
                    var amount = event.currentTarget.value;
                    // console.log(amount);
                    var quantity = amount / curPrice;
                    console.log(quantity);
                    $(".change-value-coin-sell")[0].textContent = quantity;
                }, 0002);
            });
        });
    });
});

var currentValue = "AL";
a = $(".nsit-buy .field select");
// if(currentValue!=""){
    a.change(function(e){
        // e.preventDefault();
        let v=a.val()
        console.log(a.val()=="")
        if(a.val()!=""){
        console.log(v+currentValue);
        if(v=="1"){
            $('.icon-12').removeClass('dollar');
            $('.icon-12').removeClass('pound');
            $('.icon-12').removeClass('yen');
            $('.icon-12').removeClass('rupee');
            $(".icon-12").addClass("rupee");

            var rupee = $("#rupee-coin")[0].textContent;
            $('.curPriceCoinBuy')[0].textContent = rupee;

            var curPrice = $(".curPriceCoinBuy")[0].textContent;
            console.log(curPrice);
            $(".amount-input-coin-buy").keydown(function (event) {
                setTimeout(() => {
                    var amount = event.currentTarget.value;
                    // console.log(amount);
                    var quantity = amount / curPrice;
                    console.log(quantity);
                    $(".change-value-coin-buy")[0].textContent = quantity;
                }, 0002);
            });
        }
        else if (v=="2"){
            $('.icon-12').removeClass('dollar');
            $('.icon-12').removeClass('pound');
            $('.icon-12').removeClass('yen');
            $('.icon-12').removeClass('rupee');
            $(".icon-12").addClass("dollar");

            var dollar = $("#dollar-coin")[0].textContent;
            $('.curPriceCoinBuy')[0].textContent = dollar;

            var curPrice = $(".curPriceCoinBuy")[0].textContent;
            console.log(curPrice);
            $(".amount-input-coin-buy").keydown(function (event) {
                setTimeout(() => {
                    var amount = event.currentTarget.value;
                    // console.log(amount);
                    var quantity = amount / curPrice;
                    console.log(quantity);
                    $(".change-value-coin-buy")[0].textContent = quantity;
                }, 0002);
            });
        }
        else if (v=="3"){
            $('.icon-12').removeClass('dollar');
            $('.icon-12').removeClass('pound');
            $('.icon-12').removeClass('yen');
            $('.icon-12').removeClass('rupee');
            $(".icon-12").addClass("pound");

            var pound = $("#pound-coin")[0].textContent;
            $('.curPriceCoinBuy')[0].textContent = pound;

            var curPrice = $(".curPriceCoinBuy")[0].textContent;
            console.log(curPrice);
            $(".amount-input-coin-buy").keydown(function (event) {
                setTimeout(() => {
                    var amount = event.currentTarget.value;
                    // console.log(amount);
                    var quantity = amount / curPrice;
                    console.log(quantity);
                    $(".change-value-coin-buy")[0].textContent = quantity;
                }, 0002);
            });
        }
        else if (v=="4"){
            $('.icon-12').removeClass('dollar');
            $('.icon-12').removeClass('pound');
            $('.icon-12').removeClass('yen');
            $('.icon-12').removeClass('rupee');
            $(".icon-12").addClass("yen");

            var yen = $("#yen-coin")[0].textContent;
            $('.curPriceCoinBuy')[0].textContent = yen;

            var curPrice = $(".curPriceCoinBuy")[0].textContent;
            console.log(curPrice);
            $(".amount-input-coin-buy").keydown(function (event) {
                setTimeout(() => {
                    var amount = event.currentTarget.value;
                    // console.log(amount);
                    var quantity = amount / curPrice;
                    console.log(quantity);
                    $(".change-value-coin-buy")[0].textContent = quantity;
                }, 0002);
            });
        }

    }
        // console.log("hello");

    }
    )



    var currentValue = "1";
b = $(".nsit-sell .field select");
// if(currentValue!=""){
    b.change(function(e){
        // e.preventDefault();
        let v=b.val()
        // console.log(a.val()=="")
        if(b.val()!=""){
        // console.lo1g(v+currentValue);
        if(v=="1"){
            $('.icon-13').removeClass('dollar');
            $('.icon-13').removeClass('pound');
            $('.icon-13').removeClass('yen');
            $('.icon-13').removeClass('rupee');
            $(".icon-13").addClass("rupee");

            var rupee = $("#rupee-coin")[0].textContent;
            $('.curPriceCoinSell')[0].textContent = rupee;

            var curPrice = $(".curPriceCoinSell")[0].textContent;
            console.log(curPrice);
            $(".amount-input-coin-sell").keydown(function (event) {
                setTimeout(() => {
                    var amount = event.currentTarget.value;
                    // console.log(amount);
                    var quantity = amount / curPrice;
                    console.log(quantity);
                    $(".change-value-coin-sell")[0].textContent = quantity;
                }, 0002);
            });
        }
        else if (v=="2"){
            $('.icon-13').removeClass('dollar');
            $('.icon-13').removeClass('pound');
            $('.icon-13').removeClass('yen');
            $('.icon-13').removeClass('rupee');
            $(".icon-13").addClass("dollar");

            var dollar = $("#dollar-coin")[0].textContent;
            $('.curPriceCoinSell')[0].textContent = dollar;

            var curPrice = $(".curPriceCoinSell")[0].textContent;
            console.log(curPrice);
            $(".amount-input-coin-sell").keydown(function (event) {
                setTimeout(() => {
                    var amount = event.currentTarget.value;
                    // console.log(amount);
                    var quantity = amount / curPrice;
                    console.log(quantity);
                    $(".change-value-coin-sell")[0].textContent = quantity;
                }, 0002);
            });
        }
        else if (v=="3"){
            $('.icon-13').removeClass('dollar');
            $('.icon-13').removeClass('pound');
            $('.icon-13').removeClass('yen');
            $('.icon-13').removeClass('rupee');
            $(".icon-13").addClass("pound");

            var pound = $("#pound-coin")[0].textContent;
            $('.curPriceCoinSell')[0].textContent = pound;

            var curPrice = $(".curPriceCoinSell")[0].textContent;
            console.log(curPrice);
            $(".amount-input-coin-sell").keydown(function (event) {
                setTimeout(() => {
                    var amount = event.currentTarget.value;
                    // console.log(amount);
                    var quantity = amount / curPrice;
                    console.log(quantity);
                    $(".change-value-coin-sell")[0].textContent = quantity;
                }, 0002);
            });
        }
        else if (v=="4"){
            $('.icon-13').removeClass('dollar');
            $('.icon-13').removeClass('pound');
            $('.icon-13').removeClass('yen');
            $('.icon-13').removeClass('rupee');
            $(".icon-13").addClass("yen");

            var yen = $("#yen-coin")[0].textContent;
            $('.curPriceCoinSell')[0].textContent = yen;

            var curPrice = $(".curPriceCoinSell")[0].textContent;
            console.log(curPrice);
            $(".amount-input-coin-sell").keydown(function (event) {
                setTimeout(() => {
                    var amount = event.currentTarget.value;
                    // console.log(amount);
                    var quantity = amount / curPrice;
                    console.log(quantity);
                    $(".change-value-coin-sell")[0].textContent = quantity;
                }, 0002);
            });
        }

    }
        // console.log("hello");

    }
    )
}


window.addEventListener("load", function(event) {
    onBodyLoad();
});
