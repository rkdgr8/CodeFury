<%@page import="com.meetingRooms.utility.OrganizeMeetingServiceFactory"%>
<%@page import="com.meetingRooms.service.OrganizeMeetingServiceInterface"%>
<%@page import="com.meetingRooms.entity.User"%>
<%

//verifying session details and returning to login page if not manager

	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

	response.setHeader("Pragma", "no-cache");

	response.setHeader("Expires", "0");

if ( session.getAttribute ( "role" ) == null || !session.getAttribute ( "role" ).toString().equals ( "manager" )) {
	request.getRequestDispatcher("login.jsp").forward ( request, response ); 
}
else {
User user = new User();

user.setUserId(session.getAttribute("user_id").toString());

response.setContentType("text/html");

OrganizeMeetingServiceInterface service = OrganizeMeetingServiceFactory.createObject();

out.println(service.getCredits(user));
}
%>