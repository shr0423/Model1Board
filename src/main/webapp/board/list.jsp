<%@page import="java.util.List"%>
<%@page import="org.sp.model1board.domain.Board"%>
<%@page import="org.sp.model1board.model.BoardDAO"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%!
	//이 jsp가 고양이에 의해 서블릿으로 변경될때
	//스클립틀릿 영역은 ()메서드영역이다.
	//따라서 인스턴스 생성에 신중해야한다.
	BoardDAO boardDAO=new BoardDAO();
%>
<%
	List<Board> boardList=boardDAO.selectAll();
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
table {
	border-collapse: collapse;
	border-spacing: 0;
	width: 100%;
	border: 1px solid #ddd;
}

th, td {
	text-align: left;
	padding: 16px;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	//버튼에 이벤트 연결
	$("button").click(function(){
		$(location).attr("href","/board/registform.jsp");
	});
});
</script>
</head>
<body>


	<table>
		<tr>
			<th>No</th>
			<th>제목</th>
			<th>작성자</th>
			<th>등록일</th>
			<th>조회수</th>
		</tr>
		<%for(int i=0;i<boardList.size();i++){ %>
		<%Board board=boardList.get(i); %>
		<tr>
			<td>Jill</td>
			<td><%=board.getTitle() %></td>
			<td><%=board.getWriter() %></td>
			<td><%=board.getRegdate() %></td>
			<td><%=board.getHit() %></td>
		</tr>
		<%} %>
		<tr>
			<td colspan="5" align="center">
				[1][2][3][4]
			</td>
		</tr>
		
		<tr>
			<td colspan="5"">
				<button>글쓰기</button>
			</td>
		</tr>

	</table>

</body>
</html>
