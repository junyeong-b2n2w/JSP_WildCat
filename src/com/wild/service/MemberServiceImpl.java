package com.wild.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.wild.dao.MemberDAO;
import com.wild.dto.MemberVO;
import com.wild.exception.InvalidPasswordException;
import com.wild.exception.NotFoundIDException;
import com.wild.request.PageMaker;
import com.wild.request.SearchCriteria;

public class MemberServiceImpl implements MemberService {

	private MemberDAO memberDAO; // = MemberDAOImpl.getInsetance();
	
	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}
	
	@Override
	public void login(String id, String pwd , HttpSession session) throws SQLException, NotFoundIDException, InvalidPasswordException {
		MemberVO member = memberDAO.selectMemberById(id);
		
		if(member == null) throw new NotFoundIDException();
		if(!pwd.equals(member.getPwd())) throw new InvalidPasswordException();
		
		session.setAttribute("loginUser", member);
		session.setMaxInactiveInterval(6*60);
	}

	@Override
	public List<MemberVO> getMemberList(SearchCriteria cri) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> getSearchMemberList(SearchCriteria cri) throws SQLException {
		
		List<MemberVO> memberList = memberDAO.selectMemberList(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(memberDAO.selectMemberListCount(cri));
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("memberList", memberList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public MemberVO getMember(String id) throws SQLException {
		MemberVO member = memberDAO.selectMemberById(id);
		return member;
	}

	@Override
	public void regist(MemberVO member) throws SQLException {
		memberDAO.insertMember(member);

	}

	@Override
	public void modify(MemberVO member) throws SQLException {
		memberDAO.updateMemeber(member);
	}

	@Override
	public void remove(String id) throws SQLException {
		memberDAO.deleteMemeber(id);
	}

	@Override
	public void disabled(String id) throws SQLException {
		memberDAO.disabledMemeber(id);
	}

	@Override
	public void enabled(String id) throws SQLException {
		memberDAO.enabledMemeber(id);
	}

}
