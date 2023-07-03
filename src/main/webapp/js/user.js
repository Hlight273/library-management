$(document).ready(function (){
    let $navs = $('.select-menu ul')
    let $nav_1 = $('ul.cansai')
    let $section =  $('.section>.container')
    let $section_matches = $section.eq(0).find('.user-row')

    //页面初始化
    //默认显示第一个section
    $section.eq(0).show().siblings().hide()
    $nav_1.children('li').hide();
    //隐藏下拉框
    $nav_1.children('li:first').show();
    //隐藏 空空如也
    updateInfo()

    //选择分类竞赛
    $nav_1.hover(function (){
        $(this).children('li').show(200);
    })
    $nav_1.mouseleave(function (){
        $(this).children('li').hide().eq(0).show().siblings().hide()
    })
    $nav_1.find('li').click(function (){
        let index = $(this).index()
        if(index===0) $section_matches.show()
        else $section_matches.eq(index-1).show().siblings().hide()
        updateInfo()
    })

    //选择功能
    $navs.click(function (){
        $section.eq($(this).index()).show().siblings().hide()
    })
    $navs.hover(function (){
        $(this).addClass('nav_orange').siblings().removeClass('nav_orange')
    })
    $navs.mouseleave( function (){
        $(this).removeClass('nav_orange')
    })

    //更新empty_info
    function updateInfo(){
        $section_matches.each(function (){
            if($(this).find('.match_box').length === 0) $(this).find('.empty_info').show()
            else $(this).find('.empty_info').hide()
        })
    }

})