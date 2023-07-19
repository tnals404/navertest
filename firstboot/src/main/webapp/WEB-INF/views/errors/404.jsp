<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>요청 url 매핑 컨트롤러 메소드가 없거나 뷰가 없습니다.</h1>
<%=request.getAttribute(RequestDispatcher.ERROR_REQUEST_URI) %>
</body>
</html>