package member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import member.model.Member;
import member.model.MemberDao;

@Controller
public class MemberdetailController {
	final String command = "/memberdetail.me";
	final String getPage = "memberdetail";
	final String gotoPage = "redirect:/memberselect.me";
	
	@Autowired
	MemberDao dao;
	
	@RequestMapping(value= command , method = RequestMethod.GET)
	public String doAction(@RequestParam("mnum") int mnum,
						   Model model) {
		
		Member member = dao.getData(mnum);
		model.addAttribute("member", member);
		return getPage;
	}
	
	
}
