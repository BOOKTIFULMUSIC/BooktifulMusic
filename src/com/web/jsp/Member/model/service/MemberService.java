package com.web.jsp.Member.model.service;

import static com.web.jsp.common.JDBCTemplate.close;
import static com.web.jsp.common.JDBCTemplate.commit;
import static com.web.jsp.common.JDBCTemplate.getConnection;
import static com.web.jsp.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.web.jsp.Member.exception.MemberException;
import com.web.jsp.Member.model.dao.MemberDao;
import com.web.jsp.Member.model.vo.Member;

public class MemberService {
	private Connection con;
	private MemberDao mDao = new MemberDao();
	
	public int insertMember(Member m) throws MemberException {
		con = getConnection();
		
		int result = mDao.insertMember(con, m);
		if(result > 0) commit(con);
		else rollback(con);
		close(con);
		return result;
	}

	public int idDupCheck(String userId) {
		con = getConnection();
		int result = mDao.idDupCheck(con, userId);
		close(con);
		return result;
	}

	public Member selectMember(Member m) throws MemberException {
		con = getConnection();
		Member mem = mDao.selectMember(con, m);
		
		close(con);
		
		if(mem == null) {
			throw new MemberException("회원 아이디나 비밀번호가 올바르지 않습니다.");
		}
		return mem;
	}

}