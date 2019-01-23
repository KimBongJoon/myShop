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
	dao.insert(productId, productName, productContent, Integer.parseInt(price));
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
<h3>상품수정</h3>
<form action="updateAction2.jsp">
	아이디<input type="text" name="productId" value="<%=productId %>"><br>
	이름<input type="text" name="productName" value="<%=productName %>"><br>
	설명<textarea rows="20" cols="50" name="productContent"><%=productContent %></textarea><br>
	가격<input type="text" name="price" value="<%=price %>"><br>
	<input type="submit" value="수정">
</form>
</body>
</html>