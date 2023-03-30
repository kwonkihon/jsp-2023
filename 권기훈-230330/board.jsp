<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
<title>User Board</title>
</head>
<body>
	<form name="board" action="board-1.jsp" method="get">
		<table>
			<tr>
				<td>닉네임 :</td>
				<td><input type="text" name="nickname"></td>
			</tr>
			
			<tr>
				<td>아이디 :</td>
				<td><input type="text" name="id"></td>
			</tr>
			
			<tr>
				<td>비밀번호 :</td>
				<td><input type="password" name="pw"></td>
			</tr>
			
			<tr>
				<td>게시판 </td>
				<td>
					<select name="path">
						<option value="기본게시판" selected>기본게시판</option>
						<option value="토론게시판">토론게시판</option>
						<option value="팁 게시판">팁 게시판</option>
						<option value="QnA게시판">QnA게시판</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>제목 </td>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<td>내용 </td>
				<td><textarea name="content" cols="50"rows="20"></textarea></td>
			</tr>
		</table>
		<input type="submit" value="게시">
	</form>
</body>
</html>