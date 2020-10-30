package member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberListController {
	
	final String command = "/index.me";
	final String getPage = "index";
	
	@RequestMapping(command)
	public String doAction() {
		return getPage;
	}
}
