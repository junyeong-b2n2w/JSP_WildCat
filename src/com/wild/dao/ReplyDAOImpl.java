package com.wild.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.wild.dto.ReplyVO;
import com.wild.request.SearchCriteria;

public class ReplyDAOImpl implements ReplyDAO{
	private SqlSessionFactory sqlSessionFactory;
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}

	
	@Override
	public List<ReplyVO> selectReplyListPage(int bno, SearchCriteria cri) throws SQLException {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		int offset = cri.getPageStartNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		List<ReplyVO> replyList = 
				sqlSession.selectList("Reply-Mapper.selectReplyList",bno,rowBounds);
		
		sqlSession.close();
		
		return replyList;
	}
	
	

	@Override
	public int selectSeqNextValue() throws SQLException {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int seq_num=
				(Integer)sqlSession.selectOne("Reply-Mapper.selectSeqNextValue");
		sqlSession.close();
		return seq_num;
	}

	@Override
	public int countReply(int bno) throws SQLException {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int count = (Integer)sqlSession.selectOne("Reply-Mapper.countReply", bno);
		sqlSession.close();
		return count;
	}

	@Override
	public void insertReply(ReplyVO reply) throws SQLException {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		sqlSession.update("Reply-Mapper.insertReply", reply);
		sqlSession.close();
	}

	@Override
	public void updateReply(ReplyVO reply) throws SQLException {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		sqlSession.update("Reply-Mapper.updateReply", reply);
		sqlSession.close();		
	}

	@Override
	public void deleteReply(int rno) throws SQLException {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		sqlSession.update("Reply-Mapper.deleteReply", rno);
		sqlSession.close();	
		
	}

}
