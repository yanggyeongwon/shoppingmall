package board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import board.model.BoardBean;
import board.model.BoardDao;

@Controller
public class BoardContentController {
	
	final String command = "/content.bd";
	final String getPage = "contentForm";
	
	@Autowired
	private BoardDao boardDao;
	
	@RequestMapping(value=command, method = RequestMethod.GET)
	public ModelAndView doAction(@RequestParam(value = "num") int num) {
	    	System.out.println("content.bd요청1 : " +num);
		BoardBean bean = boardDao.getOneBoard(num);
		System.out.println("content.bd요청2 : " +num);
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("bean", bean);
		mav.setViewName(getPage);
		return mav; 
	}
	
	
	
	
	
}
