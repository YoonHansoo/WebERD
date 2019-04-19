package kr.or.ddit.erd.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.erd.model.DomainVo;

@Repository("erdDrawingDao")
public class ErdDrawingDaoImpl implements IErdDrawingDao{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<DomainVo> domainList(int erdNo){
		return sqlSession.selectList("erdDrawing.domainList", erdNo);
	}
	
	@Override
	public int domainDelete(int domainNo){
		return sqlSession.delete("erdDrawing.domainDelete", domainNo);
	}
	
	@Override
	public int domainModify(DomainVo domainVo){
		return sqlSession.update("erdDrawing.domainModify", domainVo);
	}
	
	@Override
	public int domainInsert(DomainVo domainVo){
		return sqlSession.insert("erdDrawing.domainInsert", domainVo);
	}
	
	@Override
	public List<DomainVo> domainSearch(DomainVo domainVo){
		return sqlSession.selectList("erdDrawing.domainSearch", domainVo);
	}
	
	
}
