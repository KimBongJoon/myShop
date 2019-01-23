<%@page import="product.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
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
	<nav class="navbar navbar-expand-lg navbar-light bg-light"> <a
		class="navbar-brand" href="main.jsp">Product</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="main.jsp">Home</a></li>
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
	
	
	<table class="table table-striped"
		style="text-align: center; 1px solid #dddddd">
		<thead>
			<tr>
				<th style="background-color: #eeeeee; text-align: center;">상품아이디</th>
				<th style="background-color: #eeeeee; text-align: center;">이름</th>
				<th style="background-color: #eeeeee; text-align: center;">설명</th>
				<th style="background-color: #eeeeee; text-align: center;">가격</th>
			</tr>
		</thead>
		<tbody>
			<%
				ProductDAO dao = new ProductDAO();
				ArrayList<ProductDTO> list = dao.selectAll();
				for (int i = 0; i < list.size(); i++) {
			%>
			<tr>
				<td><%=list.get(i).getProductId()%></td>
				<td><a href="updateAction.jsp?productId=<%=list.get(i).getProductId()%>&productName=<%=list.get(i).getProductName()%>&productContent=<%=list.get(i).getProductContent()%>&price=<%=list.get(i).getPrice()%>"><%=list.get(i).getProductName()%></a></td>
				<td><%=list.get(i).getProductContent()%></td>
				<td><%=list.get(i).getPrice()%></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
	
</body>
</html>