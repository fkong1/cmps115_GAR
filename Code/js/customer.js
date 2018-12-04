$(function () {
	$("#profile_password1").click(function () {
		$('#profile_4').show("slow");
		$('#profile_assword2').show("slow");
	});

	$("#profile_email1").click(function () {
		$('#profile_6').show("slow");
		$('#profile_email2').show("slow");
	});
	$("#request_btn").click(function(){
		$('#riderType').hide("slow");
	})

	$('#datetimepicker1').datetimepicker();
	$('#datetimepicker2').datetimepicker();
	$('#rider_type_id').change(function () {
		var a = $("#rider_type_id option:selected").val();
		if (a == "Single Ride") {
			$('#riderType').hide("slow");
		} else {
			$('#riderType').show("slow");
		}
	});
});

$(document).ready(function () {
	$('.main_btn_width1').click(function (event) {
		// alert($(this).parent("td").parent("tr").find("td").eq(0).text());
		// alert($(this).parent("td").parent("tr").find("td").eq(1).text());
		// alert($(this).parent("td").parent("tr").find("td").eq(2).text());
		// alert($(this).parent("td").parent("tr").find("td").eq(3).text());
		// alert($(this).parent("td").parent("tr").find("td").eq(4).text());
		// alert($(this).parent("td").parent("tr").find("td").eq(5).text());
		// alert($(this).parent("td").parent("tr").find("td").eq(6).text());
		 //alert($(this).parent("td").parent("tr").find("td").eq(7).text());
		// alert(this.id);
		var request_id_send = $(this).parent("td").parent("tr").find("td").eq(6).text();
		$.ajax({
			url: "/feedback",
			type: "POST",
			data: JSON.stringify(request_id_send),
			contentType: "application/json"
			// success: function() {
			//     alert("Feedback successfully stored in the server!");
			// },
			// error: function() {
			//     alert("Feedback failed to store back in the server!");
			// },
		});
		window.location.reload();
	});
	$('.main_btn_width').click(function (event) {
		var request_id_send = $(this).parent("td").parent("tr").find("td").eq(6).text();
		$.ajax({
			url: "/feedback_acc",
			type: "POST",
			data: JSON.stringify(request_id_send),
			contentType: "application/json"
		});
		window.location.reload();
	});
	$('.main_btn_width2').click(function (event) {

		var request_id_send = $(this).parent("td").parent("tr").find("td").eq(5).text();
		$.ajax({
			url: "/feedback_req",
			type: "POST",
			data: JSON.stringify(request_id_send),
			contentType: "application/json"

		});
		window.location.reload();
	});
		$('.view_btn').click(function (event) {

		var request_id_send = $(this).parent("td").parent("tr").find("td").eq(6).text();
		// alert(request_id_send);
		$.ajax({
			url: "/feedback_view",
			type: "POST",
			data: JSON.stringify(request_id_send),
			contentType: "application/json"

		});
		window.location.href = "view_detail";
	});
		$('.view_accept').click(function (event) {
		var request_id_send =document.getElementById('request_id').innerText;
		$.ajax({
			url: "/feedback_view_accept",
			type: "POST",
			data: JSON.stringify(request_id_send),
			contentType: "application/json"

		});
		window.location.href = "main";
    });
		$('.view_cancel').click(function (event) {
		var request_id_send =document.getElementById('request_id').innerText;
		$.ajax({
			url: "/feedback_view_cancel",
			type: "POST",
			data: JSON.stringify(request_id_send),
			contentType: "application/json"

		});
		window.location.href = "main";
    });

});
