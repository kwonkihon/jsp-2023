<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"%>
<!doctype html>
<html>
<head>
	<meta charset="UTF-8">
<title>신상정보 입력폼</title>
</head>
<body>
	<form name="project-1.jsp" action="project-1.jsp" method="get">
		<table>
			<tr>
				<td>학번:</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>이름:</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>학년:</td>
				<td><input type="radio" name="grade" value="1학년" checked>1학년
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
		<input type="submit" value="등록하기">
	</form>
</body>
</html>