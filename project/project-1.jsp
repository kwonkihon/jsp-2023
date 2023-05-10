<%@page import="java.sql.PreparedStatement"%>
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

	//2. 데이터를 받아와 변수 저장하기
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String grade = request.getParameter("grade");
	String path = request.getParameter("path");
	
	InitialContext initCtx = new InitialContext();

	Context ctx = (Context)initCtx.lookup("java:comp/env");

	DataSource ds = (DataSource)ctx.lookup("jdbc/jspdb");
	
	//5. DB와 커넥션 생성(DriverManager객체 사용)
	try(Connection con = ds.getConnection()
			){
	//6. insert sql
	String sql = "insert ignore into prjmember(id, name, grade, path) values(?,?,?,?)";
	
	//7. PreparedStatement 객체 생성
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, name);
	pstmt.setString(3, grade);
	pstmt.setString(4, path);
	
	ResultSet rs = pstmt.executeQuery();
	
	//8. sql 실행
	int i = pstmt.executeUpdate();
	
	if(i==1){
		out.println("입력성공!");
	}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<br>
입력한 학번 : <%=id%><br>
입력한 이름 : <%=name%><br>
입력한 학년 : <%=grade%><br>
입력한 과목 : <%=path%>