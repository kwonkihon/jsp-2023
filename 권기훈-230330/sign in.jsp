<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
<title>Sign in</title>
</head>
<body>
	<form name="sign in.jsp" action="sign in-1.jsp" method="get">
		<table>
			<tr>
				<td>아이디<br></td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>비밀번호<br></td>
				<td><input type="password" name="pw"></td>
			</tr>
			<tr>
				<td>비밀번호 재확인</td>
				<td><input type="password" name="pws"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" size="5"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<input name="gender" type="radio" value="남자" checked>남자
					<input name="gender" type="radio" value="여자">여자
				</td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="text" name="year" size="4">년</td>
				<td>
					<select name="path">
						<option value="월" selected>월</option>
						<option value="1월">1월</option>
						<option value="2월">2월</option>
						<option value="3월">3월</option>
						<option value="4월">4월</option>
						<option value="5월">5월</option>
						<option value="6월">6월</option>
						<option value="7월">7월</option>
						<option value="8월">8월</option>
						<option value="9월">9월</option>
						<option value="10월">10월</option>
						<option value="11월">11월</option>
						<option value="12월">12월</option>
					</select>
				</td>
				<td><input type="text" name="date" size="4">일</td>
			</tr>
			<tr>
				<td><input type="checkbox" name="reason" value="지인소개">지인소개</td>
				<td><input type="checkbox" name="reason" value="광고">광고</td>
				<td><input type="checkbox" name="reason" value="기타">기타</td>
			</tr>
			<tr>
				<td>전화번호 </td>
				<td><input type="text" name="phone"></td>
			</tr>
		</table>	
		<input type="submit" value="가입">
		<input type="reset" value="초기화">
	</form>
</body>
</html>