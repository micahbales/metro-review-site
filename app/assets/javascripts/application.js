// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function() {

  function ajaxPost(review_id, value) {
    var request = $.ajax({
      method: "POST",
      url: "/api/v1/votes",
      data: {
        vote: { review_id: review_id, value: value }
      }
    });

    request.done(function(data) {
      console.log(data);
      $("#vote-total-" + data.reviewID).text(data.voteTotal);
      $("#flash-container").text(data.voteMessage);
    });
  }

  $('.upvote').on('click', function(e) {
    e.preventDefault();

    var reviewID = this.id.split('-')[1];
    ajaxPost(reviewID, 1);
  });

  $('.downvote').on('click', function(e) {
    e.preventDefault();

    var reviewID = this.id.split('-')[1];
    ajaxPost(reviewID, -1);

  });
});
