$(function() {
    $(document).ready(function (){
        // var b1=  $('#a1').css('background-color','#D84508');
       // $('#a1').each(function (){
       //     if($($(this))[0].href==String(window.location)) {
       //         $('#a4').removeClass("color")
       //         $('#a2').removeClass("color")
       //         $('#a3').removeClass("color")
       //         $('#a1').addClass("color")
       //     }
       //  });
       // //  // var b2=  $('#a2').css('background-color','#D84508');
       //  $('#a2 a').each(function (){
       //      if($($(this))[0].href==String(window.location)) {
       //          $('#a1').removeClass("color")
       //          $('#a4').removeClass("color")
       //          $('#a3').removeClass("color")
       //          $('#a2').addClass("color")
       //      }
       //  })
       // //  // var b3=  $('#a3').css('background-color','#D84508');
       //  $('#a3 a').each(function (){
       //      if($($(this))[0].href==String(window.location)) {
       //          $('#a1').removeClass("color")
       //          $('#a2').removeClass("color")
       //          $('#a4').removeClass("color")
       //          $('#a3').addClass("color")
       //      }
       //  })
        // var b4=  $('#a4').css('background-color','#D84508');

        $('.nav>li').each(function (){
            // $this=$(this);
            // if($($(this))[0].href==String(window.location)){
            // //     $('#a1').removeClass("color")
            // // $('#a2').removeClass("color")
            // $('.dropdown').removeClass("color")
            //     $(this).addClass("color");
            // }

            // console.log($this[0].href);
            // console.log(1);
            // console.log(String(window.location));
            // console.log(2);

            // if($this[0].href==String(window.location)){
            //     $(".navUl li").removeClass("color");
            //     $this.parent().addClass("color");  //active表示被选中效果的类名
            // }
            if("http://localhost:8080/Poster/IndexServlet"==String(window.location)){
                $(".nav li").removeClass("color");
                $(".nav li a").removeClass("font-color1");
                $(".nav li a").addClass("font-color2");
                $(".nav li:eq(0)").addClass("color");
                $(".nav li a").removeClass("font-color2");
                $(".nav li:eq(0) a").addClass("font-color1");
            }
            if("http://localhost:8080/Poster/MatchListServlet?sort=1"==String(window.location)){
                $(".nav li").removeClass("color");
                $(".nav li a").removeClass("font-color1");
                $(".nav li a").addClass("font-color2");
                $(".nav li:eq(1)").addClass("color");
                $(".nav li a").removeClass("font-color2");
                $(".nav li:eq(1) a").addClass("font-color1");
            }

            // if("http://localhost:8080/Poster/MatchListServlet"==String(window.location)){
            //     $(".nav li").removeClass("color");
            //     $(".nav li a").removeClass("font-color1");
            //     $(".nav li a").addClass("font-color2");
            //     $(".nav li:eq(2)").addClass("color");
            //     $(".nav li a").removeClass("font-color2");
            //     $(".nav li:eq(2) a").addClass("font-color1");
            // }
            if("http://localhost:8080/Poster/user.jsp"==String(window.location)){
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
