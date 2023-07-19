<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<script type="text/javascript">

$.ajax({
    type: "GET",
    url: "/api/weather?regionId=34",
    dataType: "json",
    success: function (result) {
//         $("#weatherSyncIcon").removeClass("bx-spin");

        var weather = result.weather;

        if(weather == null) {
            $("#weatherInfoText").text("������ �ҷ����� �� ������ �߻��߽��ϴ�.");
        } else {
            var lastUpdateTime = weather.lastUpdateTime;
            var temp = weather.temp;
            var humid = weather.humid;
            var rainAmount = weather.rainAmount;
            $("#weatherInfoText").text(" �µ�: " + temp + "��, ����: " + humid
                + "%, ������: " + rainAmount + "mm (���� ����: " + lastUpdateTime + "��)");
        }
    },
    error: function (xhr) {
        alert(xhr.responseText);
//         $("#weatherSyncIcon").removeClass("bx-spin");
    }
});

</script>
<body>

</body>
</html>