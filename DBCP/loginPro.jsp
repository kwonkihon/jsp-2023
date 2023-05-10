<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.sql.DataSource"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*" %>
    
<%
	//1. 한글처리하기
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	InitialContext initCtx = new InitialContext();

	Context ctx = (Context)initCtx.lookup("java:comp/env");

	DataSource ds = (DataSource)ctx.lookup("jdbc/jspdb");

	Connection con = ds.getConnection();

	String sql = "select id from login where id=? and pwd=?";
	
	//6. 질의 결과 확인
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, pwd);
	
	ResultSet rs = pstmt.executeQuery();
	
	//7. 사용자가 유효한 경우 session객체에 저장
	if(rs.next()){
		session.setAttribute("id", id);
		response.sendRedirect("welcome.jsp");
	}
	//8. 아닌 경우는 insertForm으로 보내거나 javascript로 '존재하지 않는 사용자입니다'라는 매세지를 띄웁니다.
	else{%>
		
		<script>
		if(confirm("존재하지않는 사용자입니다. 등록하시겠습니까?")==true){
			location.href="insertForm.jsp";
		}else{
			history.back();}
		</script>
		<% } %>