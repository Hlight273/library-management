
$(function() {
    $(document).ready(function (){
        $('.cansai').children('li').hide();
        $('.cansai').children('li:first').show();
        $('.container').hide();
        $('.container:eq(1)').show();
        $('.pwd-msg').hide();
    })

    $('.colorchange').hover(function (){
        $(this).addClass('colorchange1');
    })
    $('.colorchange').mouseleave(function (){
        $(this).removeClass('colorchange1');
    })
    $('.cansai').hover(function (){
        $('.cansai').children('li').show(200);
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

    $('.team').click(function (){
        $('.container').hide();
        $('.container:eq(4)').show();
    })
    $('.newpwd2').change(function (){
        var pwd1=$('.newpwd').val()
        var pwd2=$('.newpwd2').val()
        if(pwd1!=pwd2){
            $('.pwd-msg').show();
        }
        else {
            $('.pwd-msg').hide();
        }
    })
});