<%@ page import="java.text.DecimalFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<section id="sec1">
<br>
<h2>급여 정보 조회</h2>
<hr>
<table border="1" id="tab1">
<tr>
<th class="th1">no</th>
<th class="th1">사원번호</th>
<th class="th1">이름</th>
<th class="th1">급여</th>
<th class="th1">가족수당</th>
<th class="th1">직책수당</th>
<th class="th1">근속수당</th>
<th class="th1">기타수당</th>
<th class="th1">급여합계</th>
</tr>
<%
int total=0;
int no=0;
DecimalFormat fo=new DecimalFormat("###,###");
try{
	String sql="select i.id,i.name,h.salary,s.gajok,s.jikchak,s.gunsok,s.gitasudang from info0622 i, sudang0622 s,hobong0622 h where i.id=s.id and h.dunggub=i.position" ;
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String id=rs.getString(1);
		String name=rs.getString(2);
		int salary=rs.getInt(3);
		int gajok=rs.getInt(4);
		int jikchak=rs.getInt(5);
		int gunsok=rs.getInt(6);
		int gitasudang=rs.getInt(7);
		total=salary+gajok+jikchak+gunsok+gitasudang;
		no++;


%>
<tr>
<td style="text-align: center;"><%=no %></td>
<td style="text-align: center;"><%=id %></td>
<td style="text-align: center;"><%=name%></td>
<td style="text-align: right;"><%=fo.format(salary)%></td>
<td style="text-align: right;"><%=fo.format(gajok)%></td>
<td style="text-align: right: ;"><%=fo.format(jikchak)%></td>
<td style="text-align: right;"><%=fo.format(gunsok) %></td>
<td style="text-align: right;"><%=fo.format(gitasudang) %></td>
<td style="text-align: right;"><%=fo.format(total) %></td>
</tr>
<%
	}
	}catch(SQLException e){
		e.printStackTrace();
		System.out.println("조회실패");
	}
%>
</table>
<hr>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>