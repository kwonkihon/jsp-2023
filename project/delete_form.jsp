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
	
	String sql = "SELECT * FROM prjmember where id like '%" +num+ "'";
	
	Statement stmt = con.createStatement();

	ResultSet rs = stmt.executeQuery(sql);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete</title>
</head>
<body>
<h1>정말 삭제하시겠습니까?</h1>
<form action="delete_form-1.jsp" name="delete" method="get">
학번 : <input type="text" name="id" value=<%=num %>><br>
		<input type="submit" value="삭제하기">
</form>
</body>
</html>