

<%@page import="com.service.SpentService"%>
<%@page import="java.text.DecimalFormat"%>

<%
	
	int head_id = Integer.parseInt(request.getParameter("sadfjshakhfdsakj")== null ? "0" : request.getParameter("sadfjshakhfdsakj"));
	

	
   
	SpentService service = new SpentService();
	boolean b= service.deleteSpentHead(head_id,request,config);
	response.sendRedirect("Add_Spent_Head.jsp?msg="+"Record Delete");
	  
	

	
	//System.out.println("days_diff");
	
	// 2 type ki price lenge AK sale price second pref vali
	
 

	
%>

