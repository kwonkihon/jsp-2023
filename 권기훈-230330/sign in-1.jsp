<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String pws = request.getParameter("pws");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String year = request.getParameter("year");
	String path = request.getParameter("path");
	String date = request.getParameter("date");
	String reason = request.getParameter("reason");
	String phone = request.getParameter("phone");
	%>
	아이디 : <%=id%><br>
	비밀번호 : <%=pw%><br>
	이름 : <%=name%><br>
	성별 : <%=gender%><br>
	생년월일 : <%=year%>년 <%=path%> <%=date%>일<br>
	가입사유 : <%=reason%><br>
	전화번호 : <%=phone%>
