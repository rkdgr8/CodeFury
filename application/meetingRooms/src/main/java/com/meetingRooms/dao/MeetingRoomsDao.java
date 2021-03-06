package com.meetingRooms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.meetingRooms.entity.Meeting;
import com.meetingRooms.entity.User;
import com.meetingRooms.utility.ConnectionManager;


/**
 * Implementation for meeting rooms display
 * 
 * @author Akspreet Kaur
 * @author Mrunal Ahire
 *
 */
public class MeetingRoomsDao implements MeetingRoomsDaoInterface {
	
	private static final Logger LOGR = LoggerFactory.getLogger(MeetingRoomsDao.class);
	
	private static Connection con;
	
	//creating connection con for the whole class
	static {

			try {
				con = ConnectionManager.getConnection();
				
			} catch (Exception e) {
				
				LOGR.error(e.toString());
			}

	}
	
	/**
	 * get the info of manager
	 * 
	 * @param the user with his id
	 * @return the details of user in user object
	 * 
	 */
	@Override
	public User managerInfoDao(User u) {
		// TODO Auto-generated method stub
		
		User user=null;
		
		//getting manager information
		
		PreparedStatement ps;
		try {
			 ps = con.prepareStatement ( "select * from users where user_id=?" );
			
			ps.setString(1, u.getUserId());
			
			ResultSet res=ps.executeQuery();
			while(res.next()) {
				//i=true;
				user =new User();
				user.setName(res.getString("name"));
				user.setPhone(res.getString("Phone"));
				user.setRole(res.getString("role"));
				user.setUserId(res.getString("user_id"));
				user.setEmail(res.getString("email"));	
				user.setCredits(res.getInt("credits"));
			}
			
		} 
		catch (SQLException e) {

			LOGR.error(e.toString());
		}
					
		return user;
	
		}

	/**
	 * get the list of meetingas scheduled by the user
	 * 
	 * @param object of user
	 * @return list of meeting objects sceduled by the user
	 * 
	 */
	@Override
	public List<Meeting> listOfScheduledMeetingsDao(User u) {
		
		List<Meeting> meetingList=new ArrayList<Meeting>();
		//getting list of meetings scheduled by the manager 
		PreparedStatement ps;
		
			try {
				
				//meeting_types, meeting_room, meeting
				ps = con.prepareStatement("select a.id, title, organized_by, meeting_room_id, meeting_date, start_time, end_time, b.meeting_type from meeting a INNER JOIN MEETING_TYPES b ON a.meeting_type_id=b.id where organized_by=?");
				ps.setString(1, u.getUserId());
			
				
				ResultSet res= ps.executeQuery();
				Meeting m=null;
				
				while(res.next())
				{
					m=new Meeting();
					m.setId(res.getInt(1));
					m.setTitle(res.getString(2));
					m.setOrganizedBy(res.getString(3));
					m.setMeetingRoomId(res.getString(4));
					m.setMeetingDate(res.getString(5));
					m.setStartTime(res.getString(6));
					m.setEndTime(res.getString(7));
					m.setMeetingTypeName(res.getString(8));
					
					meetingList.add(m);
				}
			} 
			catch (SQLException e)
			{

				LOGR.error(e.toString());
			}
			
			return meetingList;
	
	
			
	}
	
	
	

	
	
	
}
