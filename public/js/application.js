$(document).ready(function() {
    $(".add_choice").on("click", function(e){
        e.preventDefault();
        var numC = $('#choice :input').length + 1;
        $("#counter").attr("value", numC);
        $("#choice").append("<input type='text' name=question[choices][] placeholder='Choice " + numC + "'>");
    });

    



});

