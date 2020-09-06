<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">
a {
	text-decoration: none;
	color: #000000
}

a:hover {
	color: blue;
	text-decoration: none;
}
</style>
<ul class="pagination">
	<div class="btn-toolbar" role="toolbar"
		aria-label="Toolbar with button groups" style="margin: auto;">
		<div class="btn-group mr-2" role="group" aria-label="First group">
			<%
				if (startPage > 1) {
			%>
			&nbsp<a href="?cnum=1"><div
					style="width: 70px; text-align: center; border: 1px solid gray;">〈〈&nbsp처음</div></a>
			<%
				}
			if (Page > 1) {
			%>
			&nbsp<a href="?cnum=<%=Page - 1%>"><div
					style="width: 60px; text-align: center; border: 1px solid gray;">〈&nbsp이전</div></a>
			<%
				}
			for (int iCount = startPage; iCount <= endPage; iCount++) {
			if (iCount == Page) {
			%>
			&nbsp
			<div
				style="width: 20px; text-align: center; border: 1px solid black; color: red; font-weight: bold"><%=iCount%></div>
			<%
				} else {
			%>
			&nbsp<a href="?cnum=<%=iCount%>"><div
					style="width: 20px; text-align: center;"><%=iCount%></div></a>
			<%
				}
			}
			if (Page < totalPage) {
			%>
			&nbsp<a href="?cnum=<%=Page + 1%>"><div
					style="width: 60px; text-align: center; border: 1px solid gray;">다음&nbsp〉</div></a>
			<%
				}
			if (endPage < totalPage) {
			%>
			&nbsp<a href="?cnum=<%=totalPage%>"><div
					style="width: 90px; text-align: center; border: 1px solid gray;">마지막&nbsp〉〉</div></a>
			<%
				}
			%>
		</div>
	</div>
</ul>