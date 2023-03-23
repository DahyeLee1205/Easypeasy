package com.ep.spring.schedule.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ep.spring.schedule.model.vo.Attendee;
import com.ep.spring.schedule.model.vo.Calendar;
import com.ep.spring.schedule.model.vo.Schedule;

@Repository
public class ScheduleDao {

	public int insertDefaultCalendar(SqlSessionTemplate sqlSession) {
		return sqlSession.insert("scheduleMapper.insertDefaultCalendar");
	}
	
	public ArrayList<Calendar> selectMyCalendar(SqlSessionTemplate sqlSession, int empNo) {
		return (ArrayList)sqlSession.selectList("scheduleMapper.selectMyCalendar", empNo);
	}
	
	public int insertCalendar(SqlSessionTemplate sqlSession, Calendar c) {
		return sqlSession.insert("scheduleMapper.insertCalendar", c);
	}
	
	public int insertSchedule(SqlSessionTemplate sqlSession, Schedule s) {
		
		return sqlSession.insert("scheduleMapper.insertSchedule", s);
		
	}
	
	public int insertAttendee(SqlSessionTemplate sqlSession, ArrayList<Attendee> atList) {
		
		int result = 1;
		for(int i=0; i<atList.size(); i++) {
			result = result * sqlSession.insert("scheduleMapper.insertAttendee", atList.get(i));
		}
		
		return result;
		
	}
	
	
	public Calendar selectCalendar(SqlSessionTemplate sqlSession, int calNo) {
		return sqlSession.selectOne("scheduleMapper.selectCalendar", calNo);
	}
	
	public int updateCalendar(SqlSessionTemplate sqlSession, Calendar c) {
		return sqlSession.update("scheduleMapper.updateCalendar", c);
	}
	
	public int deleteSchedule(SqlSessionTemplate sqlSession, int calNo) {
		return sqlSession.delete("scheduleMapper.deleteSchedule", calNo);
	}
	
	public int deleteCalendar(SqlSessionTemplate sqlSession, int calNo) {
		return sqlSession.delete("scheduleMapper.deleteCalendar", calNo);
	}
}
