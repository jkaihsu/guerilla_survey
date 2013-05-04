$(document).ready(function() {
    $("form").on("submit",function(){
        console.log($(this).serialize());
        // $.post()
    });


    // $("form").on('submit', function(e){

    //     $.post('/submit-survey')




        // // e.preventDefault();
        // console.log($(this).attr("value"))
        // if ($(this).attr("checked") === "checked" ) {
        //     console.log("yes")
        //     // var allCheckBox = $("form checkbox")
        //     // allCheckBox.attr("checked", false);
        //     // $(this).attr("checked", true);
        // } else {
        //     console.log("wrong");
        //     // $(this).attr("checked", false);
        // }
        
        // var checkbox =  $(":checkbox[name=choice\\[\\]]");
        // checkbox.checked = checkbox.checked ? false : true;
    // });
});

