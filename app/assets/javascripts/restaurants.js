//Low-level interface AJAX GET request on click Link "Load Reviews" in Restaurant show page
$(function() {
  $(".load_reviews").on("click", function(e) {
    $.ajax({
      method: "GET",
      url: this.href
    }).done(function(response) {
       $(".reviews").html(response)
    });
    e.preventDefault();
  });
});
