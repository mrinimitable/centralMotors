
<%
	session.removeAttribute("role");
	session.removeAttribute("user_id");
	session.removeAttribute("branch_id");
	session.removeAttribute("session_year");
	System.out.println(session.getAttribute("role"));
	session.invalidate();

	response.sendRedirect("login.jsp");
%>
