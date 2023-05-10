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
	String name = request.getParameter("name");
	String grade = request.getParameter("grade");
	InitialContext initCtx = new InitialContext();

	Context ctx = (Context)initCtx.lookup("java:comp/env");

	DataSource ds = (DataSource)ctx.lookup("jdbc/jspdb");

	Connection con = ds.getConnection();
	
	String sql = "SELECT * FROM prjmember where id like '%" +idnum+ "'";
	
	Statement stmt = con.createStatement();

	ResultSet rs = stmt.executeQuery(sql);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DIT Grade</title>
</head>
<body>
<h1>이름,학년,선택과목 수정</h1>

<form name="update_form-1.jsp" action="update_form-1.jsp" method="post">
		<table>
			<tr>
				<td>학번:</td>
				<td><input type="text" name="id" value=<%=idnum %>></td>
			</tr>
			<tr>
				<td>이름:</td>
				<td><input type="text" name="name" value=<%=name %>></td>
			</tr>
			<tr>
				<td>학년:</td>
				<td><input type="radio" name="grade" value="1학년">1학년
						<input type="radio" name="grade" value="2학년">2학년</td>
			</tr>
			<tr>
				<td>선택과목:</td>
				<td>
					<select name="path">
						<option value="JAVA" selected>JAVA</option>
						<option value="C" >C</option>
						<option value="JavaScript" >JavaScript</option>
						<option value="Python">Python</option>
					</select>
				</td>
			</tr>
		</table>
		<input type="submit" value="수정하기">
	</form>
</body>
</html>