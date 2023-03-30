<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String nickname = request.getParameter("nickname");
	String id = request.getParameter("id");
	String pw = request.getParameter("password");
	String path = request.getParameter("path");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	%>
	작성자 : <%=nickname%><br>
  게시판 : <%=path%><br>
  제목 : <%=title%><br>
  내용 : <%=content%>