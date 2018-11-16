   $(function () {
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