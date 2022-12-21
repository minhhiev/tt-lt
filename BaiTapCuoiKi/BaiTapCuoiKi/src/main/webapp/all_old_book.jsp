<%@page import="com.DB.DBConnect" %>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.entity.BookDtls" %>
<%@page import="java.util.*" %>
<%@page import="java.util.ArrayList" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Recent Books</title>
<%@ include file="all_component/allCss.jsp"%>
<style type="text/css">


.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">
            <%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list = dao.getOldBooks();
			for (BookDtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="cart-body">
						<image alt="" src="book/<%=b.getPhotoName()%>"
							style="width:150px; height:150px"
							class="image-thumblin btn-sm ml-5">
						<p class="text-center text-danger ml-1"><%=b.getBookName()%></p>
						<p class="text-center text-danger ml-1"><%=b.getAuthor()%></p>
						<p class="text-center text-danger ml-1">
							Categories:
							<%=b.getBookCategory()%></p>
						<div class="row">
							 <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-5">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%>
								<i class="fa-solid fa-dollar-sign"></i></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
			</div>
		</div>
	
</body>
</html>