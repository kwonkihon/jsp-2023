<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.sql.DataSource"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%
	//1. 한글 처리
	request.setCharacterEncoding("utf-8");

	String num = request.getParameter("num");
	InitialContext initCtx = new InitialContext();

	Context ctx = (Context)initCtx.lookup("java:comp/env");

	DataSource ds = (DataSource)ctx.lookup("jdbc/jspdb");

	Connection con = ds.getConnection();
	
	String sql = "SELECT * FROM prjmember";
	
	Statement stmt = con.createStatement();

	ResultSet rs = stmt.executeQuery(sql);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 목록</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<br>
		<h1 class="text-center font-weight-bold">사용자 정보</h1>
		<br>
		<table class="table table-hover">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>학년</th>
				<th>전공</th>
			</tr>
			<%
			//5. 결과집합 처리 
			while (rs.next()) {
				String id = rs.getString("id");
				String name = rs.getString("name");
				String pwd = rs.getString("grade");
				String path = rs.getString("path");
			%>
			<tr>
				<td><a href="updateForm.jsp?id=<%=id%>"><%=id%></a></td>

				<td><%=name%></td>
				<td><%=pwd%></td>
				<td><%=path%><td>
			</tr>
			<%}
			 
			%>
		</table>
	</div>
</body>
</html>