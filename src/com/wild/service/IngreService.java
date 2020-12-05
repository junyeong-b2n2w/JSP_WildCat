package com.wild.service;

import java.sql.SQLException;
import java.util.List;


import com.wild.dto.IngreVO;

public interface IngreService {
	
	IngreVO selectIngreByIngNo(int ingNo) throws SQLException ;
	
	List<IngreVO> selectIngreList() throws SQLException ;
	
}
