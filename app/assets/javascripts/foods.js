
$(document).ready(function(){
	var expiredFoods = $(".food-about-to-expire").length
	$(".badge").text(expiredFoods);
})

$(document).on("click", ".delete-button", function(){
	var element = $(this);
	var foodId = element.parent().data("id");
	var userId = $('#foods-container').data("user-id");

	$.ajax({
		url: "/users/" + userId + "/foods/" + foodId,
		type: "DELETE",
		success: function(e){
			element.parent().remove();
		}
	})
});

$(document).on("submit", "#new-food-form", function(e){
	var userId = $('#foods-container').data("user-id");

	$.ajax({
		url: "/users/" + userId + "/foods",
		method: "POST",
		data: $(this).serialize(),
		success: function(data) {
			$(".food-list").append(data);
		}
	});
	e.preventDefault();
});

$(document).on("click", ".edit-button", function(){
	$(this).siblings(".edit-food-form").slideToggle();
});




$(document).on("submit", ".edit-food-form", function(e){
	var userId = $('#foods-container').data("user-id");
	var foodId = $(this).parent().data("id");
	var element = $(this).parent();
	$.ajax({
		url: "/users/" + userId + "/foods/"+ "1",
		type: "PUT",
		data: $(this).serialize(),
		success: function(data){
			element.fadeOut(function(){
				element.html(data);
				element.fadeIn();
			})
			
		}
	});
	e.preventDefault();
})



