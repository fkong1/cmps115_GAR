   $(function () {
       $("#profile_password1").click(function() {
            $('#profile_4').show("slow");
            $('#profile_assword2').show("slow");
        });

       $("#profile_email1").click(function() {
            $('#profile_6').show("slow");
            $('#profile_email2').show("slow");
        });

       $('#datetimepicker1').datetimepicker();
       $('#datetimepicker2').datetimepicker();
       $('#rider_type_id').change(function() {
        var a = $("#rider_type_id option:selected").val();
            if (a == "Single Ride"){
                $('#riderType').hide("slow");
            }
            else{
                 $('#riderType').show("slow");
            }
        });
   });

    $(document).ready(function(){
        $('.main_btn_width1').click(function (event) {
            // alert($(this).parent("td").parent("tr").find("td").eq(0).text());
            // alert($(this).parent("td").parent("tr").find("td").eq(1).text());
            // alert($(this).parent("td").parent("tr").find("td").eq(2).text());
            // alert($(this).parent("td").parent("tr").find("td").eq(3).text());
            // alert($(this).parent("td").parent("tr").find("td").eq(4).text());
            // alert($(this).parent("td").parent("tr").find("td").eq(5).text());
            //alert($(this).parent("td").parent("tr").find("td").eq(5).text());
            // alert($(this).parent("td").parent("tr").find("td").eq(7).text());
            // alert(this.id);
            request_id_send = $(this).parent("td").parent("tr").find("td").eq(5).text();
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
});


