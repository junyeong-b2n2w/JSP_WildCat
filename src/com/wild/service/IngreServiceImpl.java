package com.wild.service;

import java.sql.SQLException;
import java.util.List;

import com.wild.dao.IngreDAO;
import com.wild.dto.IngreVO;

public class IngreServiceImpl implements IngreService{

	private IngreDAO ingreDAO;
	
	 public void setIngreDAO(IngreDAO ingreDAO) {
		this.ingreDAO = ingreDAO;
	}
	
	@Override
	public IngreVO selectIngreByIngNo(int ingNo) throws SQLException {
		IngreVO ingreVO = ingreDAO.selectIngreByIngNo(ingNo);
		return ingreVO;
	}
	@Override
	public List<IngreVO> selectIngreList() throws SQLException {
		List<IngreVO> ingreList = ingreDAO.selectIngreList();
		return ingreList;
	}
}
