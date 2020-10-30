package member.controller;



import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.model.Member;
import member.model.MemberDao;

@Controller
public class MemberUpdateController {
	final String command="/update.me";
	final String getPage = "update";
	final String gotoPage = "redirect:/index.me";
	
	@Autowired
	MemberDao memberDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction(@RequestParam("mid") String mid,
			Model model,HttpSession session) {

		if(session.getAttribute("loginInfo") == null) {
			session.setAttribute("destination", "redirect:/update.me?mid="+mid);
			return "redirect:/login.me";
		}
Member member = memberDao.getDataMember(mid);
model.addAttribute("member", member);

return getPage;
}

@RequestMapping(value=command, method=RequestMethod.POST)
public ModelAndView doAction(
@ModelAttribute("member") @Valid Member member,			
BindingResult result) {

ModelAndView mav = new ModelAndView();
if(result.hasErrors()) {
	System.out.println("��ȿ�� �˻� ����");
mav.setViewName(getPage);
return mav;
}

int cnt = memberDao.updateData(member); 
if(cnt >= 1) {
mav.setViewName(gotoPage); 
}
else {
mav.setViewName(getPage);
}
return mav;
}
}


