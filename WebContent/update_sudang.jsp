<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function chk(){
	var doc=document.form;
	doc.submit();
}

function check() {
	var doc=document.form;
	if(doc.id.value==""){
		alert("사원번호를 입력하세요");
		doc.id.focus();
	}else{
	 form.action="update_sudangProcess.jsp";
	}
	}

</script>



</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<%
String name=request.getParameter("name");
if(name==null){name="";}
String id=request.getParameter("id");
if(id==null){id="";}
else{
try{
	String sql="select name from info0622 where id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs=pstmt.executeQuery();
	if(rs.next()){
		name=rs.getString(1);
	}else{
		%>
		<script>
		alert("등록되어 있지 않은 사원번호 입니다.");
		</script>
		<%
	}
}catch(SQLException e){
	e.printStackTrace();
}
}

try{
	String sql="select * from sudang0622 where id=?";
    pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs=pstmt.executeQuery();
	if(rs.next()){
		id=rs.getString(1);
		String gajok=rs.getString(2);
		String jikchak=rs.getString(3);
		String gunsok=rs.getString(4);
		String gitasudang=rs.getString(5);
	
%>
<section id="sec1">
<br>
<h2>수당 정보 수정</h2>
<br>
<form name="form" method="post" action="update_sudang.jsp">
<table border="1" id="tab1">
<tr>
<th class="th3">사원번호</th>
<td>
	<input type="text" name="id" onchange="chk()" value="<%=id%>" style="width: 80%;">
</td>
<th class="th3">이름</th>
<td>
	<input type="text" name="name" value="<%=name%>" style="width: 80%;">
</td>
</tr>
<tr>
<th class="th3">가족수당</th>
<td>
	<input type="text" name="gajok" value="<%=gajok %>" style="width: 80%;">
</td>
<th class="th3">직책수당</th>
<td>
	<input type="text" name="jikchak" value="<%=jikchak %>" style="width: 80%;">
</td>
</tr>
<tr>
<th class="th3">근속수당</th>
<td>
	<input type="text" name="gunsok" value="<%=gunsok %>" style="width: 80%;">
</td>
</tr>
<tr>
<th class="th3">기타수당</th>
<td colspan="3">
	<input type="text" name="gitasudang" value="<%=gitasudang %>" style="width: 70%;">
</td>
</tr>
<tr>
<td colspan="4" class="td1">
 	<input type="button" value="목록" onclick="location.href='index.jsp'" class="bt2"  >
 	<input type="submit" value="저장" onclick="check()" class="bt2">
</td>
</tr>
</table>
<%


}
}catch(Exception e){
e.printStackTrace();
}

	

	

%>
</form>
<hr>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>