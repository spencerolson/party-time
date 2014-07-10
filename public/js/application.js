$(document).ready(function () {

  // send an HTTP DELETE request for the sign-out link
  $('a#sign-out').on("click", function (e) {
    e.preventDefault();
    var request = $.ajax({ url: $(this).attr('href'), type: 'delete' });
    request.done(function () { window.location = "/"; });
  });

  $("button").on("click", function(event){
    event.preventDefault();
    console.log("button was clicked")
    $.ajax({
        type: "POST",
        url: '/beerme'
      }).done(function(response){
        console.log("got response. it is: " + response)
        $("#partial").empty();
        $("#partial").append(response);
      });
  });


  $(".booty_booty_booty_booty_rockin_everywhere").on("click", function(event){
    event.preventDefault();
    console.log("in the booty clicker");
    var url = $(this).attr("href");
    var that=$(this)
    console.log(url)
    $.get(url, function(response){
      console.log("response is: " + response);
      that.parent().next().empty();
      that.parent().next().append(response);
    });
  });
});
