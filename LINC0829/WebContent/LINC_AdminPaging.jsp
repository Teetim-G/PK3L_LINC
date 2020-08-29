<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
								if (startPage > 1) {
								out.print("<a href=\"?cnum=1\">&nbsp처음&nbsp</a>");
							}
							if (Page > 1) {
								out.println("<a href=\"?cnum=" + (Page - 1) + "\">&nbsp이전&nbsp</a>");
							}
							for (int iCount = startPage; iCount <= endPage; iCount++) {
								if (iCount == Page) {
									out.print(" <b>" + iCount + "</b>");
								} else {

									out.println("&nbsp<a href=\"?cnum=" + iCount + "\">" + iCount + "</a>&nbsp");

								}
							}
							if (Page < totalPage) {
								out.println("<a href=\"?cnum=" + (Page + 1) + "\">&nbsp다음&nbsp</a>");
							}
							if (endPage < totalPage) {
								out.print("<a href=\"?cnum=" + totalPage + "\">&nbsp끝&nbsp</a>");
							}
							%>