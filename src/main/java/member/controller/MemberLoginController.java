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
public class MemberLoginController {

	final String command = "/login.me";
	final String getPage = "login";
	final String gotoPage = "redirect:/index.ad";
	
	@Autowired
	MemberDao memberDao;
	
	@RequestMapping(value=command , method=RequestMethod.GET)
	public String doAction() {
		return getPage;
	}

	@RequestMapping(value=command , method=RequestMethod.POST)
	public ModelAndView doAction(Member member, 
							HttpServletResponse response,
							HttpSession session) throws IOException{
		

		System.out.println(getClass() + " POST"); 
		
		System.out.println(" num:"+member.getMnum());
		System.out.println(" id:"+member.getMid());
		System.out.println(" password:" + member.getMpw());
		
		Member dbMember = memberDao.getDataMember2(member.getMid()); 
		
		PrintWriter pw = response.getWriter();
		
		response.setContentType("text/html;charset=UTF-8");
		
		if(dbMember == null) {
			
			pw.println("<script type='text/javascript'>");
			pw.println("alert('존재하지 않는 아이디입니다.');");
			pw.println("</script>");
			pw.flush();
			return new ModelAndView(getPage);
			
		}
		else {

				if(member.getMpw().equals(dbMember.getMpw())) {
					System.out.println("아이디세션만듬");
					session.setAttribute("loginInfo",dbMember);
					
					return new ModelAndView(gotoPage); 
				}
				else {
					pw.println("<script type='text/javascript'>");
					pw.println("alert('비밀번호가 일치하지 않습니다.');");
					pw.println("</script>");
					pw.flush();
	 
					return new ModelAndView(getPage);
				}
			}
	}
}







