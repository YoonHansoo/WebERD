package kr.or.ddit.message.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.or.ddit.message.dao.IMessageDao;
import kr.or.ddit.message.model.MessageVo;
import kr.or.ddit.team.dao.ITeamDao;
import kr.or.ddit.team.model.TeamListVo;

@Service("messageService")
public class MessageServiceImpl implements IMessageService{
	
	private Logger logger = LoggerFactory.getLogger(MessageServiceImpl.class);
	
	@Resource(name="messageDao")
	private IMessageDao messageDao;
	@Resource(name="teamDao")
	private ITeamDao teamDao;
	
	@Override
	public List<MessageVo> getAllMsg(String memId) {
		return messageDao.getAllMsg(memId);
	}

	@Override
	public int insertMsg(Map<String, Object> memberMap) {
		return messageDao.insertMsg(memberMap);
	}

	@Override
	public int insertAplyMsg(MessageVo messageVo, TeamListVo teamListVo) {
		messageDao.insertAplyMsg(messageVo);	// 회신 알림 전송
		int cnt = teamDao.updateAgreeFlag(teamListVo);	// 팀 동의여부 수정
		return cnt;
	}

	@Override
	public int delMsg(int msgNo) {
		return messageDao.delMsg(msgNo);
	}

	@Override
	public int delMsgAll(String memId) {
		return messageDao.delMsgAll(memId);
	}

}
