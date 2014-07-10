$(document).ready(function () {

  // send an HTTP DELETE request for the sign-out link
  $('a#sign-out').on("click", function (e) {
    e.preventDefault();
    var request = $.ajax({ url: $(this).attr('href'), type: 'delete' });
    request.done(function () { window.location = "/"; });
  });

  $("ul").on("submit","#beerme", function(event){
    event.preventDefault();
    console.log("this is:" + $(this).attr("action"))
    var url = $(this).attr("action")
    $.ajax({
        type: "POST",
        url: url
      }).done(function(response){
        console.log("Got AJAX response. Response is: " + response["beers"]);
        $("#beer_count").text(response["beers"])
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
