<%@page import="java.io.PrintWriter"%>
<%@page import="product.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
</head>
<body>
	<%
		String productId = request.getParameter("productId");

		ProductDAO dao = new ProductDAO();
		dao.delete(productId);

		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('삭제되었습니다')");
		script.println("location.href = 'main.jsp'");
		script.println("</script>");
	%>


</body>
</html>