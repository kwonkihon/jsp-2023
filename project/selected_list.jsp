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

	String idnum = request.getParameter("idnum");
	
	InitialContext initCtx = new InitialContext();

	Context ctx = (Context)initCtx.lookup("java:comp/env");

	DataSource ds = (DataSource)ctx.lookup("jdbc/jspdb");

	Connection con = ds.getConnection();
	
	String sql = "SELECT * FROM prjmember where id like '%" +idnum+ "'";
	
	Statement stmt = con.createStatement();

	ResultSet rs = stmt.executeQuery(sql);
%>
<title>search</title>
<head>
<body>
	<table border="1">
		<tr>
			<th>학번</th>
			<th>이름</th>
			<th>학년</th>
			<th>전공과목</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<%while(rs.next()){ %>
		<tr>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4) %></td>
			
			<td><form action="update_form.jsp" method="get">
				<input type="hidden" name="idnum" value=<%=rs.getString(1) %>>
				<input type="hidden" name="name" value=<%=rs.getString(2) %>>		
				<input type="hidden" name="grade" value=<%=rs.getString(3) %>>
				<input type="hidden" name="path" value=<%=rs.getString(4) %>>		
				<input type="submit" value="수정"></form></td>
			<td><form action="delete_form.jsp" method="get">
				<input type="hidden" name="num" value=<%=rs.getString(1) %>>
				<input type="submit" value="삭제"></form></td>
		</tr>
		<%} 
		
		%>
	</table>
</body>
</head>