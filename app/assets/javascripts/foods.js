
$(document).ready(function(){
	var expiredFoods = $(".food-about-to-expire").length
	$(".badge").text(expiredFoods);
})

$(document).on("click", ".delete-button", function(){
	var foodId = $(this).parents("tr").data("id");
	var userId = $('#foods-container').data("user-id");
	var formTr = $(this).parents("tr");
	var rowTr = formTr.siblings("tr[data-id=" + foodId + "]");

	$.ajax({
		url: "/users/" + userId + "/foods/" + foodId,
		type: "DELETE",
		success: function(e){
			formTr.remove();
			rowTr.remove();
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
			$("#food-name-input").val("");
			$("#food-quantity-input").val("");
			$("#food-expiration-input").val("");
		}

	});
	e.preventDefault();

});

$(document).on("click", ".edit-button", function(){
	var parentTr = $(this).parents("tr");
	var foodId = parentTr.data("id");
	var formTr = parentTr.siblings("tr[data-id=" + foodId + "]");
	formTr.fadeToggle();
});

$(document).on("submit", ".edit-food-form", function(e){
	var userId = $('#foods-container').data("user-id");
	var foodId = $(this).parents("tr").data("id");
	var formTr = $(this).parents("tr");
	var rowTr = formTr.siblings("tr[data-id=" + foodId + "]");
	$.ajax({
		url: "/users/" + userId + "/foods/"+ foodId,
		type: "PUT",
		data: $(this).serialize(),
		success: function(data){
			rowTr.remove();
			formTr.replaceWith(data);
		}
	});
	e.preventDefault();
})





