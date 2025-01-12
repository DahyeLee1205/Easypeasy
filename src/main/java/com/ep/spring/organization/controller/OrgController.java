package com.ep.spring.organization.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ep.spring.common.model.vo.AlertMsg;
import com.ep.spring.common.model.vo.PageInfo;
import com.ep.spring.common.template.Pagination;
import com.ep.spring.login.model.vo.Department;
import com.ep.spring.login.model.vo.Employee;
import com.ep.spring.login.model.vo.Job;
import com.ep.spring.organization.model.service.OrgService;
import com.ep.spring.schedule.model.service.ScheduleService;

@Controller
public class OrgController {

	@Autowired
	private OrgService oService;
	
	@Autowired
	private ScheduleService scService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	@RequestMapping("list.org")
	public String selectOrgList(HttpSession session, Model model) {
		
		int no = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		
		ArrayList<Employee> list = oService.selectOrgList(no);
		ArrayList<Department> deptList = oService.selectDept();
		ArrayList<Job> jList = oService.selectJob();
		
		model.addAttribute("jList", jList);
		model.addAttribute("deptList", deptList);
		model.addAttribute("list", list);
		
		return "organization/orgMain";
	}
	
	
	@RequestMapping("adminList.org")
	public ModelAndView selectList(@RequestParam(value="cpage", defaultValue="1")int currentPage, ModelAndView mv) {
		
		int listCount = oService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Employee> list = oService.selectList(pi);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("organization/orgMainAdmin");
		
		return mv;
		
	}
	
	@RequestMapping("memberEnroll.org")
	public String memberEnroll() {
		return "organization/memberInsertForm";
	}
	
	@RequestMapping("insert.org")
	public String insertMember(Employee e, Model model, HttpSession session) {
		
		String encPwd = bcryptPasswordEncoder.encode(e.getEmpPwd());
		//System.out.println("암호문 : " + encPwd);
		
		e.setEmpPwd(encPwd);
		
		int result = oService.insertMember(e);
		
		if(result > 0) {
			int calResult = scService.insertDefaultCalendar();
			AlertMsg msg = new AlertMsg("사원 등록", "성공적으로 사원정보가 등록되었습니다.");
			session.setAttribute("successMsg", msg);
			return "redirect:adminList.org";
		}else {
			model.addAttribute("errorMsg", "실패");
			return "common/errorPage";
		}
		
	}
	
	// ajax
	@ResponseBody
	@RequestMapping("noCheck.me")
	public String ajaxIdCheck(String checkNo) {
		int count = oService.noCheck(checkNo);
			
		return count > 0 ? "NNNNN" : "NNNNY"; 			
	}	
	
	
	@RequestMapping("detailForm.org")
	public ModelAndView selectDetailForm(int no, ModelAndView mv) {
		
		Employee emp = oService.selectDetailForm(no);
		
		mv.addObject("e", emp).setViewName("organization/memberUpdateForm");
		
		return mv;
				
	}
	
	@RequestMapping("update.org")
	public String updateMember(Employee e, HttpSession session, Model model) {
		
		int result = oService.updateMember(e);
		//System.out.println(result);
		if(result>0) {
			AlertMsg msg = new AlertMsg("사원 수정", "성공적으로 사원정보가 수정되었습니다.");
			session.setAttribute("successMsg", msg);
			return "redirect:adminList.org";
		}else {
			model.addAttribute("errorMsg", "사원정보 수정 실패");
			return "common/errorPage";	
		}
	}
	
	@RequestMapping("deleteMember.org")
	public String deleteMember(HttpSession session, Model model) {
		int result = oService.deleteMember();
		
		if(result>0) {
			AlertMsg msg = new AlertMsg("사원 삭제", "성공적으로 사원정보가 삭제되었습니다.");
			session.setAttribute("successMsg", msg);
			return "redirect:adminList.org";
		}else {
			model.addAttribute("errorMsg", "사원정보 삭제 실패");
			return "common/errorPage";	
		}
	}
	
	// ajax
	@RequestMapping("searchForm.org")
	public String selectSearchList(String keyword, @RequestParam(value="cpage", defaultValue="1")int currentPage, HttpSession session, Model model) {
		
		int searchCount = oService.selectSearchCount(keyword);
		
		PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, 5, 10);
		ArrayList<Employee> list = oService.selectSearchList(pi, keyword);
		
		model.addAttribute("keyword", keyword);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "organization/orgMain";
		
	}
	
	
	@RequestMapping("settings.org") 
	public ModelAndView selectSettingForm(Employee e, ModelAndView mv) {
		
		ArrayList<Department> dList = oService.selectSettingForm();
		ArrayList<Job> jList = oService.selectSettingJob();
		mv.addObject("dList", dList).addObject("jList", jList).setViewName("organization/orgSettings");
		return mv;
		
	}
	
	@RequestMapping("insertDept.org")
	public String insertDept(Department d, HttpSession session, Model model) {
		
		int result = oService.insertDept(d);
		
		if(result > 0) {
			AlertMsg msg = new AlertMsg("부서 등록", "성공적으로 부서 등록되었습니다.");
			session.setAttribute("successMsg", msg);
			return "redirect:settings.org";
		}else {
			model.addAttribute("errorMsg", "실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("updateDept.org")
	public String updateDept(Department d, HttpSession session, Model model) {
		
		int result = oService.updateDept(d);
		
		if(result > 0) {
			AlertMsg msg = new AlertMsg("부서 수정", "성공적으로 부서정보가 수정되었습니다.");
			session.setAttribute("successMsg", msg);
			return "redirect:settings.org";
		}else {
			model.addAttribute("errorMsg", "실패");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("deleteDept.org")
	public String deleteDept(Department d, HttpSession session, Model model) {
		
		int result = oService.deleteDept(d);
		
		//System.out.println(result);
		
		if(result>0) {
			AlertMsg msg = new AlertMsg("부서 삭제", "성공적으로 부서정보가 삭제되었습니다.");
			session.setAttribute("successMsg", msg);
			return "redirect:settings.org";
		}else {
			model.addAttribute("errorMsg", "부서정보 삭제 실패");
			return "common/errorPage";	
		}
	}
	
	
	@RequestMapping("insertJob.org")
	public String insertJob(Job j, HttpSession session, Model model) {
		
		int result = oService.insertJob(j);
		
		if(result > 0) {
			AlertMsg msg = new AlertMsg("직위 등록", "성공적으로 직위정보가 등록되었습니다.");
			session.setAttribute("successMsg", msg);
			return "redirect:settings.org";
		}else {
			model.addAttribute("errorMsg", "실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("updateJob.org")
	public String updateJob(Job j, HttpSession session, Model model) {
		
		int result = oService.updateJob(j);
		
		if(result > 0) {
			AlertMsg msg = new AlertMsg("직위 수정", "성공적으로 직위정보가 수정되었습니다.");
			session.setAttribute("successMsg", msg);
			return "redirect:settings.org";
		}else {
			model.addAttribute("errorMsg", "실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("deleteJob.org")
	public String deleteJob(Job j, HttpSession session, Model model) {
		
		int result = oService.deleteJob(j);
		
		if(result>0) {
			AlertMsg msg = new AlertMsg("직위 삭제", "성공적으로 직위정보가 삭제되었습니다.");
			session.setAttribute("successMsg", msg);
			return "redirect:settings.org";
		}else {
			model.addAttribute("errorMsg", "직위정보 삭제 실패");
			return "common/errorPage";	
		}
	}
	
	@RequestMapping("sideSettings.org") 
	public ModelAndView selectSideSettings(Employee e, ModelAndView mv) {
		
		ArrayList<Department> dList = oService.selectSettingForm();
		mv.addObject("dList", dList).setViewName("organization/orgSidebar");
		return mv;
		
	}
	
	
}
