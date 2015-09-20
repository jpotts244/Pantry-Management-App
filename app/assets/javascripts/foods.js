$(document).on("click", ".delete-button", function(){
	var element = $(this);
	var foodId = element.parent().data("id");

	$.ajax({
		url: "/users/<%= @user.id %>/foods/" + foodId,
		type: "DELETE",
		success: function(e){
			element.parent().remove();
		}
	})
});
	
var form = $("#new-food-form");
form.submit(function(e){
	$.ajax({
		url: "<%= user_foods_path(@user) %>",
		method: "POST",
		data: form.serialize(),
		success: function(data) {
			$(".food-list").append(data);
		}
	});
	e.preventDefault();
});

$(document).on("click", ".edit-button", function(){
	$(this).siblings(".edit-food-form").slideToggle();
});