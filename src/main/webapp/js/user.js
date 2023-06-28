
$(function() {
    $(document).ready(function (){
        $('.cansai').children('li').hide();
        $('.cansai').children('li:first').show();
        $('.container').hide();
        $('.container:eq(0)').show();
        $('.container:eq(1)').show();
    })

    $('.colorchange').hover(function (){
        $(this).addClass('colorchange1');
    })
    $('.colorchange').mouseleave(function (){
        $(this).removeClass('colorchange1');
    })
    $('.cansai').hover(function (){
        $('.cansai').children('li').show();
    })
    $('.cansai').mouseleave(function (){
        $('.cansai').children('li').hide();
        $('.cansai').children('li:first').show();
    })
    $('.cansai').children('li:eq(0)').click(function (){
        $('.container').hide();
        $('.container:eq(0)').show();
        $('.container:eq(1)').show();

    })
    $('.cansai').children('li:eq(1)').click(function (){
        $('.container').hide();
        $('.container:eq(0)').show();

    })
    $('.cansai').children('li:eq(2)').click(function (){
        $('.container').hide();
        $('.container:eq(1)').show();
    })

    $('.yonghu').click(function (){
        $('.container').hide();
        $('.container:eq(2)').show();
    })

    $('.mima').click(function (){
        $('.container').hide();
        $('.container:eq(3)').show();
    })

    $('.input2').hover(function (){
        $(this).addClass('colorchange1');
        console.log(1)
    })
});