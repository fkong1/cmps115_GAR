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
       $('#accept1').click(function() {
            alert( "Handler for .click() called." );
        });
            

   });
    $(document).ready(function(){
        $('.main_btn_width1').click(function (event) {
            // var aaa = 'html_type_id' + 1;
            // var tdobj = document.getElementById(aaa);
            // alert(tdobj.innerText);

            connedtDB();
            /*
            alert($(this).parent("td").parent("tr").find("td").eq(0).text());
            alert($(this).parent("td").parent("tr").find("td").eq(1).text());
            alert($(this).parent("td").parent("tr").find("td").eq(2).text());
            alert($(this).parent("td").parent("tr").find("td").eq(3).text());
            alert($(this).parent("td").parent("tr").find("td").eq(4).text());
            alert($(this).parent("td").parent("tr").find("td").eq(5).text());
            alert($(this).parent("td").parent("tr").find("td").eq(6).text());
            alert(this.id);*/
    });
});

    function connedtDB() {
        var mysql = require("mysql");
        var con = mysql.createConnection({
            host: "localhost",
            user: "root",
            password: "mypassword"
        });
        con.connect(function(err) {
            if (err) throw err;
            console.log("Connected!");
        });
    }


