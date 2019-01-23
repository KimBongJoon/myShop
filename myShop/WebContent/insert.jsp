<%@page import="java.io.PrintWriter"%>
<%@page import="product.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
</head>
<body>
<%
	String productId = request.getParameter("productId");
	String productName = request.getParameter("productName");
	String productContent = request.getParameter("productContent");
	String price = request.getParameter("price");
	
	if(productId.equals("") || productName.equals("")) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('아이디와 이름을 입력하세요')");
		script.println("history.back()");
		script.println("</script>");
	}
	else {
		ProductDAO dao = new ProductDAO();
		dao.insert(productId, productName, productContent, Integer.parseInt(price));
	}
%>

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="main.jsp">Product</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="main.jsp">Home</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="insert.html">Insert</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="update.jsp">Update</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="delete.html">Delete</a></li>

			</ul>
			<form class="form-inline my-2 my-lg-0" action="select.jsp">
			<input class="form-control mr-sm-2" type="search"
				placeholder="Search" aria-label="Search" name="search">
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
		</form>
		</div>
	</nav>
상품아이디 : <%=productId%><br>
이름 : <%=productName%><br>
설명 : <%=productContent%><br>
가격 : <%=price%><br>
<a href="insert.html">상품추가하기</a>

</body>
</html>