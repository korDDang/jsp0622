<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="DBConn.jsp" %>
<%
try{
	String sql="update hobong0622 set salary=? where dunggub=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(2, request.getParameter("dunggub"));
	pstmt.setString(1, request.getParameter("salary"));
	pstmt.executeUpdate();
	%><script>
	  alert("수정성공");
	   history.back(-1);
	</script>
	<%
	System.out.println("수정성공");
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("수정실패");
}


%>
</body>
</html>