<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function check() {
		var doc=document.form;
	 if(doc.id.value==""){
		 alert("사원번호를 입력하세요");
		 doc.id.focus();
	 }else if(doc.name.value==""){
		 alert("성명을 입력하세요");
		 doc.name.focus();
	 }else if(doc.dept.value==""){
		 alert("직급을 선택하세요");
		 doc.dept.focus();
	 }else{
		 doc.submit();
	 }
	}


</script>

</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section id="sec1">
<%@ include file="DBConn.jsp" %>
<%
try{
	String sql="select * from info0622 where id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("id"));
	rs=pstmt.executeQuery();
	if(rs.next()){
		String id=rs.getString("id");
		String name=rs.getString("name");
		String dept=rs.getString("dept");
		String position=rs.getString("position");
		String duty=rs.getString("duty");
		String phone=rs.getString("phone");
		String address=rs.getString("address");

%>
<br>
<h2>인사관리 사원변경 화면</h2>
<hr>
<form name="form" method="post" action="update_infoProcess.jsp">
<table border="1" id="tab1">
<tr>
<th>사원번호(자동생성)</th>
<td class="td2">
	<input type="text" name="id" value="<%=id %>">
</td>
</tr>
<tr>
<th>성명</th>
<td class="td2">
	<input type="text" name="name" value="<%=name %>">
</td>
</tr>
<tr>
<th>소속부서</th>
<td class="td2">
 <select name="dept">
 	<option value="" <%=dept.equals("")?"selected":"" %>>선택하세요</option>
 	<option value="10"  <%=dept.equals("10")?"selected":"" %>>인사부</option>
 	<option value="20"  <%=dept.equals("20")?"selected":"" %>>기획부</option>
 	<option value="30"  <%=dept.equals("30")?"selected":"" %>>홍보부</option>
 	<option value="40"  <%=dept.equals("40")?"selected":"" %>>영업부</option>
 	<option value="50"  <%=dept.equals("50")?"selected":"" %>>경리부</option>
 </select>
</td>
</tr>
<tr>
<th>직급</th>
<td class="td2">
 <select name="position">
 	<option value="1" <%=position.equals("1")?"selected":"" %>>1급</option>
 	<option value="2" <%=position.equals("2")?"selected":"" %>>2급</option>
 	<option value="3" <%=position.equals("3")?"selected":"" %>>3급</option>
 	<option value="4" <%=position.equals("4")?"selected":"" %>>4급</option>
 	<option value="5" <%=position.equals("5")?"selected":"" %>>5급</option>
 </select>
</td>
</tr>
<tr>
<th>직책</th>
<td class="td2">
	<input type="text" name="duty" value="<%=duty %>">
</td>
</tr>
<tr>
<th>연락처</th>
<td class="td2">
	<input type="text" name="phone" value="<%=phone %>">
</td>
</tr>
<tr>
<th>주소</th>
<td class="td2">
	<input type="text" name="address" value="<%=address %>">
</td >
</tr>
<tr>
<td colspan="2" class="td1">
	<input type="button" value="등록" onclick="check()" class="bt1">
	<input type="button" value="취소" onclick="location.href='index.jsp'" class="bt1">
</td>
</tr>
<%
	}
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("수정실패");
}

%>
</table>
</form>
<hr>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>