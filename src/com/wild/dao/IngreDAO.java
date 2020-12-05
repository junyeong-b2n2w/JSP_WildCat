package com.wild.dao;

import java.sql.SQLException;
import java.util.List;

import com.wild.dto.IngreVO;
import com.wild.dto.ReplyVO;
import com.wild.request.SearchCriteria;

public interface IngreDAO {

	List<IngreVO> selectIngreList() throws SQLException;
	
	IngreVO selectIngreByIngNo(int ingNo) throws SQLException;
	
}
