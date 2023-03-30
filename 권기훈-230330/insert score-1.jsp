<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		request.setCharacterEncoding("utf-8");

		String name = request.getParameter("name");
	    int kor = Integer.parseInt(request.getParameter("kor"));
	    int eng = Integer.parseInt(request.getParameter("eng"));
	    int math = Integer.parseInt(request.getParameter("math"));
	    int sum = kor + eng + math;
	    String sumr = Integer.toString(sum);
	    float reg = Float.parseFloat(sumr) / 3;
			%>
			국어 : <%=kor%><br>
			수학 : <%=math%><br>
			영어 : <%=eng%><br>
			합계 : <%=sum%><br>
		  평균 : <%=String.format("%.2f", reg)%>