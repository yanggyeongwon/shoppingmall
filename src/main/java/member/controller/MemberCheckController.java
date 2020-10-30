package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import member.model.Member;
import member.model.MemberDao;


@Controller
public class MemberCheckController {

	final String command = "/check.me";
	final String getPage = "check";
	final String gotoPage = "/update";
	
	
	@Autowired
	MemberDao memberDao;
	
	@RequestMapping(value=command , method=RequestMethod.GET)
	public String doAction(HttpSession session) {
		
		if(session.getAttribute("loginInfo") == null) {
	
			
			return "redirect:/login.me";
		}
		else {
			return getPage;
		}
		
	}

	@RequestMapping(value=command , method=RequestMethod.POST)
	public ModelAndView doAction(Member member, 
							HttpServletResponse response) throws IOException{
		
		PrintWriter pw = response.getWriter();
		
		Member dbMember = memberDao.getDataMember(member.getMid()); 
		
		
		response.setContentType("text/html;charset=UTF-8");
		
		if(!member.getMpw().equals(dbMember.getMpw())) {
			
			pw.println("<script type='text/javascript'>");
			pw.println("alert('비밀번호가 일치하지 않습니다.');");
			pw.println("</script>");
			pw.flush();
			return new ModelAndView(getPage);
			
		}
		else {
		
				
				return new ModelAndView(gotoPage); 
			
		}
		
	}
}







