/**
 * 
 */
package com.meetingRooms.entity;


/**
 * POJO Class for creating objects for Meeting Event
 * 
 * @author Mrunal Ahire
 * 
 */
public class Meeting {

	private int id, duration;
	private String title, organizedBy, meetingType, meetingRoomId;
	private String meetingDate, startTime, endTime;
	
	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}
	
	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}
	
	/**
	 * @return the duration
	 */
	public int getDuration() {
		return duration;
	}
	
	/**
	 * @param duration the duration to set
	 */
	public void setDuration(int duration) {
		this.duration = duration;
	}
	
	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}
	
	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}
	
	/**
	 * @return the organizedBy
	 */
	public String getOrganizedBy() {
		return organizedBy;
	}
	
	/**
	 * @param organizedBy the organizedBy to set
	 */
	public void setOrganizedBy(String organizedBy) {
		this.organizedBy = organizedBy;
	}
	
	/**
	 * @return the meetingType
	 */
	public String getMeetingType() {
		return meetingType;
	}
	
	/**
	 * @param meetingType the meetingType to set
	 */
	public void setMeetingType(String meetingType) {
		this.meetingType = meetingType;
	}
	
	/**
	 * @return the meetingDate
	 */
	public String getMeetingDate() {
		return meetingDate;
	}
	
	/**
	 * @param meetingDate the meetingDate to set
	 */
	public void setMeetingDate(String meetingDate) {
		this.meetingDate = meetingDate;
	}
	
	/**
	 * @return the startTime
	 */
	public String getStartTime() {
		return startTime;
	}
	
	/**
	 * @param startTime the startTime to set
	 */
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	/**
	 * @return the endTime
	 */
	public String getEndTime() {
		return endTime;
	}

	/**
	 * @param endTime the endTime to set
	 */
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	/**
	 * @return the meetingRoomId
	 */
	public String getMeetingRoomId() {
		return meetingRoomId;
	}

	/**
	 * @param meetingRoomId the meetingRoomId to set
	 */
	public void setMeetingRoomId(String meetingRoomId) {
		this.meetingRoomId = meetingRoomId;
	}
}