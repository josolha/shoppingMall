package com.web.jomaltwo.service;

import javax.servlet.http.HttpServletRequest;

import com.web.jomaltwo.model.AdminDTO;

public interface AdminService {
	
	boolean adminLogin(AdminDTO dto, HttpServletRequest req);

}
