package com.wild.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.wild.dto.IngreVO;

public class IngreDAOImpl implements IngreDAO{
	private SqlSessionFactory sqlSessionFactory;
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}
	
	@Override
	public IngreVO selectIngreByIngNo(int ingNo) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();		
		IngreVO ingre =
				session.selectOne("Ingre-Mapper.selectIngreByIngNo",ingNo);
		session.close();
		return ingre;
		
	}
	
	@Override
	public List<IngreVO> selectIngreList() throws SQLException {
		
		SqlSession session = sqlSessionFactory.openSession();		
		List<IngreVO> ingreList =
				session.selectList("Ingre-Mapper.selectIngreList");
		session.close();
		return ingreList;
		
	}
}
