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
<br>
<h2>인사관리 사원등록 화면</h2>
<hr>
<%
int ma=0;
try{
	String sql="select max(id) from info0622";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		ma=rs.getInt(1);
	}
}catch(SQLException e){
	e.printStackTrace();
}
%>
<form name="form" method="post" action="insert_infoProcess.jsp">
<table border="1" id="tab1">
<tr>
<th>사원번호(자동생성)</th>
<td class="td2">
	<input type="text" name="id" value="<%=ma %>">
</td>
</tr>
<tr>
<th>성명</th>
<td class="td2">
	<input type="text" name="name">
</td>
</tr>
<tr>
<th>소속부서</th>
<td class="td2">
 <select name="dept">
 	<option value="">선택하세요</option>
 	<option value="10">인사부</option>
 	<option value="20">기획부</option>
 	<option value="30">홍보부</option>
 	<option value="40">영업부</option>
 	<option value="50">경리부</option>
 </select>
</td>
</tr>
<tr>
<th>직급</th>
<td class="td2">
 <select name="position">
 	<option value="1">1급</option>
 	<option value="2">2급</option>
 	<option value="3">3급</option>
 	<option value="4">4급</option>
 	<option value="5">5급</option>
 </select>
</td>
</tr>
<tr>
<th>직책</th>
<td class="td2">
	<input type="text" name="duty">
</td>
</tr>
<tr>
<th>연락처</th>
<td class="td2">
	<input type="text" name="phone">
</td>
</tr>
<tr>
<th>주소</th>
<td class="td2">
	<input type="text" name="address">
</td >
</tr>
<tr>
<td colspan="2" class="td1">
	<input type="button" value="등록" onclick="check()" class="bt1">
	<input type="button" value="취소" onclick="location.href='index.jsp'" class="bt1">
</td>
</tr>
</table>
</form>
<hr>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>