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
        $('.dropdown a').each(function (){
            // $this=$(this);
            if($($(this))[0].href==String(window.location)){
            //     $('#a1').removeClass("color")
            // $('#a2').removeClass("color")
            $('.dropdown').removeClass("color")
                $(this).addClass("color");
            }

        })
    })
    })
