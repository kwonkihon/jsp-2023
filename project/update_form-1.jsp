<%@ page import="java.sql.*" %>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.sql.DataSource"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");
String name = request.getParameter("name");
String grade = request.getParameter("grade");
String path = request.getParameter("path");
	
InitialContext initCtx = new InitialContext();

Context ctx = (Context)initCtx.lookup("java:comp/env");

DataSource ds = (DataSource)ctx.lookup("jdbc/jspdb");
	
	try(Connection con = ds.getConnection()
			){
		
	String sql = "update prjmember set name = ?, grade = ?, path = ? where id = ?";

	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setString(2, grade);
	pstmt.setString(3, path);
	pstmt.setString(4, id);
	
	
	int i = pstmt.executeUpdate();
	
	if(i==1){
		out.println("수정성공!");
	}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<br>
학번 : <%=id%><br>
수정한 이름 : <%=name%><br>
수정한 학년 : <%=grade%><br>
수정한 과목 : <%=path%>