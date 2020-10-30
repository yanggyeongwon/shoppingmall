package member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberLogoutController {

	final String command = "logout.me";
	final String getPage = "redirect:/index.ad";
	@RequestMapping(command)
	public String doAction(HttpSession session) {
		session.invalidate();
		return getPage;
	}
}
