<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="product.ProductDAO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
</head>
<body>
<%
	String productId = request.getParameter("productId");
	String productName = request.getParameter("productName");
	String productContent = request.getParameter("productContent");
	String price = request.getParameter("price");
	
	ProductDAO dao = new ProductDAO();
	dao.update(productId, productName, productContent, Integer.parseInt(price));
	
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("location.href = 'update.jsp'");
	script.println("</script>");
%>
</body>
</html>