package member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberDao;

@Controller
public class MemberdeleteController {

	final String command ="/memberdelete.me";
	final String gotoPage = "redirect:/memberselect.me";
	
	@Autowired
	MemberDao dao;
	
	@RequestMapping(command)
	public String doAction(@RequestParam(value="mnum",required = true) int mnum) {
		dao.deleteMember(mnum);
		
		return gotoPage;
	}
	
	
	
	
}
