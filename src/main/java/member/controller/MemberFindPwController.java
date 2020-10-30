package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import member.model.Member;
import member.model.MemberDao;


@Controller
public class MemberFindPwController {

	final String command = "/findPw.me";
	final String getPage = "findPw";
	final String gotoPage = "/login";
	
	@Autowired
	MemberDao memberDao;
	
	@RequestMapping(value=command , method=RequestMethod.GET)
	public String doAction() {
		return getPage;
	}

	@RequestMapping(value=command , method=RequestMethod.POST)
	public ModelAndView doAction(Member member, 
							HttpServletResponse response) throws IOException{
		
		System.out.println(member.getMid());
		System.out.println(member.getMname());
		System.out.println(member.getMemail());
		Member dbMember = memberDao.getDataMember(member.getMname()); 
		
		PrintWriter pw = response.getWriter();
		
		response.setContentType("text/html;charset=UTF-8");
		
		if(dbMember == null) {
			
			pw.println("<script type='text/javascript'>");
			pw.println("alert('존재하지않는 비밀번호입니다.');");
			pw.println("</script>");
			pw.flush();
			return new ModelAndView(getPage);		
		}
		
		else {
			
			if(member.getMname().equals(dbMember.getMname())&&member.getMid().equals(dbMember.getMid()) && member.getMemail().equals(dbMember.getMemail())) {
				
				
				pw.println("<script type='text/javascript'>");
				pw.println("alert('비밀번호는 "+dbMember.getMpw()+" 입니다.');");				
				pw.println("</script>");
				pw.flush();
				
				return new ModelAndView(gotoPage); 
			}
			else {
				
				return new ModelAndView(getPage);
			}
		}
		
	}
}







