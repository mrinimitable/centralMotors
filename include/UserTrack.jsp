
<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);

	//System.out.println(session.getAttribute("role"));

	String role = (String) (session.getAttribute("role") == null ? ""
			: session.getAttribute("role"));

	String creator_id = (String) (session.getAttribute("user_id") == null ? "0"
			: session.getAttribute("user_id"));

	String branch_id = (String) (session.getAttribute("branch_id") == null ? "0"
			: session.getAttribute("branch_id"));

	String session_year = (String) (session
			.getAttribute("session_year") == null ? "" : session
			.getAttribute("session_year"));

	String branch_name = (String) (session.getAttribute("branch_name") == null ? ""
			: session.getAttribute("branch_name"));

	if (creator_id.equalsIgnoreCase("0")) {

		response.sendRedirect("login.jsp?msg=Session TimeOut");
	}
%>


