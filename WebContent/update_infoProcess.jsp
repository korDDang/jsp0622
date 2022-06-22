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
	String sql="update info0622 set name=?,dept=?,position=?,duty=?,phone=?,address=? where id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(7, request.getParameter("id"));
	pstmt.setString(1, request.getParameter("name"));
	pstmt.setString(2, request.getParameter("dept"));
	pstmt.setString(3, request.getParameter("position"));
	pstmt.setString(4, request.getParameter("duty"));
	pstmt.setString(5, request.getParameter("phone"));
	pstmt.setString(6, request.getParameter("address"));
	pstmt.executeUpdate();
	%><script>
	  alert("수정성공");
	   location.href="select_info.jsp";
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