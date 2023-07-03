$(function() {
    $(document).ready(function (){

        $('.nav>li').each(function (){
            if(String(window.location).includes('/IndexServlet')){
                $(".nav li").removeClass("color");
                $(".nav li a").removeClass("font-color1");
                $(".nav li a").addClass("font-color2");
                $(".nav li:eq(0)").addClass("color");
                $(".nav li a").removeClass("font-color2");
                $(".nav li:eq(0) a").addClass("font-color1");
            }
            if(String(window.location).includes('/MatchListServlet')||String(window.location).includes('/MatchServlet')){
                $(".nav li").removeClass("color");
                $(".nav li a").removeClass("font-color1");
                $(".nav li a").addClass("font-color2");
                $(".nav li:eq(1)").addClass("color");
                $(".nav li a").removeClass("font-color2");
                $(".nav li:eq(1) a").addClass("font-color1");
            }
            if(String(window.location).includes('/user.jsp')){
                $(".nav li").removeClass("color");
                $(".nav li a").removeClass("font-color1");
                $(".nav li a").addClass("font-color2");
                $(".nav li:eq(2)").addClass("color");
                $(".nav li a").removeClass("font-color2");
                $(".nav li:eq(2) a").addClass("font-color1");
            }
        })
    })
})
