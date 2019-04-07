package kr.or.ddit.post.dao;

import java.util.List;

import kr.or.ddit.post.model.CommentsVo;

public interface ICommentsDao {
	
	// 댓글 전체 조회
	List<CommentsVo> getAllComments(String postNo);

	// 댓글 특정 조회
	CommentsVo getSelectComments(String cmtNo);

	// 댓글 생성
	int insertComments(CommentsVo commentsVo);
	
	// 댓글 삭제
	int deleteComments(String cmtNo);

}
