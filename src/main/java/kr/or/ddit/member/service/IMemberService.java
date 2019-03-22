package kr.or.ddit.member.service;

import java.util.List;

import kr.or.ddit.member.model.MemberVo;

public interface IMemberService {
	
	/**
	 * Method : getAllMember
	 * 작성자 : PC02
	 * 변경이력 :
	 * @return
	 * Method 설명 : 전체 사용자 조회
	 */
	List<MemberVo> getAllMember();
	
	/**
	 * Method : selectMember
	 * 작성자 : PC02
	 * 변경이력 :
	 * @param memId
	 * @return
	 * Method 설명 : 특정 사용자 조회
	 */
	MemberVo selectMember(String memId);
	
	int insertMember(MemberVo vo);

}
