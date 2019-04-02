package kr.or.ddit.member.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.model.MemberVo;

@Service("memberService")
public class MemberServiceImpl implements IMemberService{

	@Resource(name="memberDao")
	private IMemberDao memberDao;
	
	@Override
	public List<MemberVo> getAllMember() {
		return memberDao.getAllMember();
	}

	@Override
	public MemberVo selectMember(String memId) {
		return memberDao.selectMember(memId);
	}

	@Override
	public int insertMember(MemberVo vo) {
		return memberDao.insertMember(vo);
	}

	@Override
	public List<MemberVo> getAutoFindMem(String memId) {
		return memberDao.getAutoFindMem(memId);
	}

	@Override
	public int updateMemPw(MemberVo vo) {
		return memberDao.updateMemPw(vo);
	}

	@Override
	public List<MemberVo> getMemId(MemberVo vo) {
		return memberDao.getMemId(vo);
	}
	
	
	
}
