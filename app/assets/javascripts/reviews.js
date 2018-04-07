//Click 'More' link to show full Review content from previous truncated on Index Page
$(function () {
  $(".js-more").on('click', function() {
    var id = $(this).data("id");
    $.get("/reviews/" + id + ".json", function(data) { //High-level interface AJAX GET request
      $("#body-" + id).html("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + "Comments: " + '"' + data["content"] + '"');
    });
  });
});

//Click 'Next' button in Review show page to render next newest review on the same page
$(function () {
  $(".js-next").on("click", function() {
    var nextId = parseInt($(".js-next").attr("data-id")) + 1;
    $.get("/reviews/" + nextId + ".json", function(data) { //High-level interface AJAX GET request
      var review = data;
      var rname = review["restaurant"]["name"];
      $(".restName").html("<a href='/restaurants/"+data['id'].toString()+"'>"+rname+"</a>");
      $(".reviewBody").html(review["content"]);
      var cuisineType = review["cuisines"][0]["name"];
      $(".reviewCuisines").html(cuisineType + ".");
      $('.reviewRating').css({ 'font-weight': 'bold' });
      $(".reviewRating").html(review["rating"]);
      var visitDate = review["date_visited"];
      var date = new Date(visitDate);
      var newDate = date.toLocaleDateString();
      $(".reviewDateVisited").html(newDate);
      $(".reviewUpdatedAt").html(review["updated_at"]);
      $('.userEmail').css({ 'font-weight': 'bold' });
      $(".userEmail").html(review["user"]["email"]);
      $("a[href$='.com']").html(review["restaurant"]["name"]);
      $(".load_more").css({ 'font-weight': 'bold' });
      $(".load_more").html(review["restaurant"]["name"]);
      $(".js-next").attr("data-id", review["id"]); // re-set the Review id to current on button click
    });
  });
});

//Click Link "Load More Reviews" in Review show page
$(function() {
  $(".load_more_reviews").on("click", function(e) {
    $.get( this.href).done(function( response ) { //High-level interface AJAX GET request
      $(".reviews").html(response)
    })
    e.preventDefault();
  });
});

/*class Review {
  constructor(review) {
    this.id = id;
    this.restaurant_name = review.restaurant_name;
    this.content = review.content;
    this.rating = review.rating;
    this.date_visited = review.date_visited;
    this.user = review.user;
    this.user_id = review.user_id;
    this.restaurant_id = review.restaurant_id;
  }
   reviewComments() {
    return "You commented about <b>"+this.restaurant_name+': "'+this.content+'."</b>';
   }
};
*/
