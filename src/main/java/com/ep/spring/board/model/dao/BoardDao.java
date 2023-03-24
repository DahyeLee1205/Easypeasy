package com.ep.spring.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ep.spring.board.model.vo.Board;
import com.ep.spring.board.model.vo.BoardCate;
import com.ep.spring.board.model.vo.BoardReply;
import com.ep.spring.common.model.vo.Attachment;
import com.ep.spring.common.model.vo.PageInfo;

@Repository
public class BoardDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectListCount");
	}
	
	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);	
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectList", null, rowBounds); 	
	}
	
	public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertBoard", b);
	}
	
	public int insertAttachment(SqlSessionTemplate sqlSession, ArrayList<Attachment> atList) {
		int result = 0;
		for(Attachment at : atList) {
			result += sqlSession.insert("boardMapper.insertAttachment", at);
		}
		return result;
	}
	
	public int increaseCount(SqlSessionTemplate sqlSession, int no) {
		return sqlSession.update("boardMapper.increaseCount", no);
	}
	
	public Board selectBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.selectOne("boardMapper.selectBoard", b);
	}
	
	
	public ArrayList<Attachment> selectAttachmentList(SqlSessionTemplate sqlSession, Board b){ 
		return (ArrayList)sqlSession.selectList("boardMapper.selectAttachmentList", b); 
	}
	
	public int deleteBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("boardMapper.deleteBoard", boardNo);
	}
	
	public ArrayList<Attachment> selectAttList(SqlSessionTemplate sqlSession, Board b){
		return (ArrayList)sqlSession.selectList("boardMapper.selectAttList", b);
	}
	
	public int updateBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("boardMapper.updateBoard", b);
	}
	
	public int updateAttachment(SqlSessionTemplate sqlSession, ArrayList<Attachment> atList) {
		int result = 0;
		for(Attachment at : atList) {
			result += sqlSession.insert("boardMapper.updateAttachment", at);
		}
		return result;
	}
	
	public ArrayList<BoardReply> selectReplyList(SqlSessionTemplate sqlSession, int boardNo){
		return (ArrayList)sqlSession.selectList("boardMapper.selectReplyList", boardNo);	
	}
	
	public int insertReply(SqlSessionTemplate sqlSession, BoardReply r) {
		return sqlSession.insert("boardMapper.insertReply", r);
	}
	
	public int deleteReply(SqlSessionTemplate sqlSession) {
		return sqlSession.delete("boardMapper.deleteReply");
	}
	
	public int selectSettings(SqlSessionTemplate sqlSession, BoardCate bc){
		return sqlSession.selectOne("boardMapper.selectSettings", bc);
	}
	
	public int insertCate(SqlSessionTemplate sqlSession, BoardCate bc) {
		return sqlSession.insert("boardMapper.insertCate", bc);
	}
	
	public int updateCate(SqlSessionTemplate sqlSession, BoardCate bc) {
		return sqlSession.update("boardMapper.updateCate", bc);
	}
	
	
	
	
	
	
}
