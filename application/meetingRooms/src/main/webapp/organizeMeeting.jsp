<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%@ page isELIgnored="false" %>
<%@page import="java.util.List"%>
<%@page import="com.meetingRooms.service.GetDataForAdminCreateRoomServiceInterface"%>
<%@page import="com.meetingRooms.service.GetDataForAdminCreateRoomService"%>
<%@page import="com.meetingRooms.utility.GetDataForAdminCreateRoomFactory"%>
<%@page import="com.meetingRooms.entity.MeetingTypes" %>

<% 
	//verifying session details and returning to login page if not manager
	
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

	response.setHeader("Pragma", "no-cache");

	response.setHeader("Expires", "0");

	
	if ( session.getAttribute ( "role" ) == null || !session.getAttribute ( "role" ).toString().equals ( "manager" )) {
		request.getRequestDispatcher("login.jsp").forward ( request, response ); 
	}
   
%>

<%
				
GetDataForAdminCreateRoomServiceInterface service = GetDataForAdminCreateRoomFactory.createObjectForService ();

List<MeetingTypes>  meetingTypesList= service.getMeetingTypes();
%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">

    <link href="css/animate.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">

    <link href="css/Footer-with-button-logo.css" rel="stylesheet">

    <script src="javaScript/jQuery_v3.5.1.js"></script>
    <script src="javaScript/bootstrap_v4.5.2.js"></script>


    <title>Organize meeting</title>
    <link rel="stylesheet" href="css/organizeMeeting.css">
    <script src="javaScript/organizeMeeting.js"></script>
</head>

<body>


    <!-- NAVBAR -->

    <div class="container">

        <nav class="navbar navbar-inverse navbar-fixed-top">

            <div class="container-fluid">

                <div class="navbar-header">

                    <a class="navbar-brand" href="ManagerHomePage.jsp"> <img src="images/logo/hsbc-logo-dark_navbar.png"
                            style=" height:20px; width:110px;" /> </a>

                </div>

                <ul class="nav navbar-nav">

                    <li> <a href="ManagerHomePage.jsp"> Manager Home </a> </li>

                    <li class="active"> <a href="organizeMeeting.jsp"> Organize Meeting </a> </li>


                    <li> <a href="Logout"> Logout </a> </li>

                </ul>

            </div>

        </nav>

    </div>

    <!-- NAVBAR -->
    <div class="row"> <br> <br> <br> </div>


    <div class='mycontainer'>
        <h1> Organize a meeting </h1>

        <div class='item-container'>
            <div class='title'> Select meeting type</div>
            <select class='userinput width100' id='meetingType' onchange="resetRooms()">
                <%
              		for(MeetingTypes m: meetingTypesList ) {
            	%>
                <option value="<%=m.getID()%>"> <%=m.getType()%> </option>
                <%
					}
				%>
            </select>
        </div>

        <div class='item-container'>
            <div class='title'> Select booking date(dd/mm/yyyy)</div>
            <input class='userinput width100' type="date" id='meetingDate'
                onChange="dateValidation();resetRooms();enableFilterBtn();">
            <div class='error' id='dateError'></div>
        </div>

        <div class='flex-row item-container'>
            <div class='flex-item'>
                <div class='title'> Select start time</div>
                <input class='userinput' type="time" id='startTime'
                    onChange="timeValidation();resetRooms();enableFilterBtn();">
            </div>

            <div class='flex-item'>
                <div class='title'> Select end time </div>
                <input class='userinput' type="time" id='endTime'
                    onChange="timeValidation();resetRooms();enableFilterBtn();">
            </div>
        </div>
        <div class='error' id='timeError'></div>
        <button onclick="getCreditsAndFilterRooms()" id='filterbtn'>Show Available Rooms</button>
        <div class='modal-container inactive'>
            <div class='modal-body'></div>
        </div>
        <div id='rooms'></div>

    </div>


    <!-- Footer -->

    <div class="content"> </div>

    <footer id="myFooter">

        <div class="container">

            <div class="row">

                <div class="col-sm-3">

                    <h2 class="logo"> <a href="ManagerHomePage.jsp"> <img src="images/logo/hsbc-logo-dark_2.png"
                                style=" height:70px; width:150px;" align="left" /> </a> </h2>

                </div>

                <div class="col-sm-2">

                    <h5> Get started </h5>

                    <ul>

                        <li> <a href="ManagerHomePage.jsp"> Home </a> </li>
                        <li> <a href="Logout"> Logout </a> </li>

                    </ul>

                </div>

                <div class="col-sm-2">

                    <h5>About us</h5>

                    <ul>

                        <li> <a href="about_us.jsp"> Information </a> </li>

                        <li> <a href="feedback.jsp"> Give Feedback </a> </li>

                    </ul>

                </div>

                <div class="col-sm-2">

                    <h5> Support </h5>

                    <ul>

                        <li> <a href="#"> FAQ </a> </li>

                        <li> <a href="#"> Help desk </a> </li>

                    </ul>

                </div>

                <div class="col-sm-3">

                    <br>

                    <a href="#"> <button type="button" class="btn"> Contact us </button> </a>

                </div>

            </div>

        </div>

        <div class="footer-copyright">

            <p> Developed By WFS BATCH-1 @ HSBC-CodeFury </p>

        </div>

    </footer>
</body>

</html>