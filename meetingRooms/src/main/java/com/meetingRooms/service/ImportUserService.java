package com.meetingRooms.service;

import com.meetingRooms.dao.ImportUserDaoInterface;
import com.meetingRooms.entity.ImportUser;
import com.meetingRooms.utility.ImportUserDaoFactory;



public class ImportUserService implements ImportUserServiceInterface {

private ImportUserDaoInterface di;
	
	public ImportUserService()
	{
		di=ImportUserDaoFactory.createobject("admindao");
	}
	
	
	@Override
	public int ServiceImport(ImportUser iu) {
		// TODO Auto-generated method stub
		
		
		int j= di.DaoImport(iu);
		return j;
		
	}

}