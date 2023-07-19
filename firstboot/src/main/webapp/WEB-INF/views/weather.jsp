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
            $("#weatherInfoText").text("날씨를 불러오는 중 오류가 발생했습니다.");
        } else {
            var lastUpdateTime = weather.lastUpdateTime;
            var temp = weather.temp;
            var humid = weather.humid;
            var rainAmount = weather.rainAmount;
            $("#weatherInfoText").text(" 온도: " + temp + "℃, 습도: " + humid
                + "%, 강수량: " + rainAmount + "mm (기준 시점: " + lastUpdateTime + "시)");
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