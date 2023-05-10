<%@page import="javax.websocket.SendResult"%>
<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@ page import="java.sql.*" %>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.sql.DataSource"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");
	
InitialContext initCtx = new InitialContext();

Context ctx = (Context)initCtx.lookup("java:comp/env");

DataSource ds = (DataSource)ctx.lookup("jdbc/jspdb");
	
	try(Connection con = ds.getConnection()
			){
		
	String sql = "delete from prjmember where id = ?";

	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	
	
	int i = pstmt.executeUpdate();
	
	if(i==1){
		out.println("성공적으로 삭제되었습니다");
	}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
