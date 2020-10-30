package orderdetails.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import orderdetails.model.Orderdetails;
import orderdetails.model.OrderdetailsDao;

@Controller
public class OrderPageSelect {
	
	final String command = "/orderpage.ord";
	final String getPage = "orderinsert";
	
	@Autowired
	OrderdetailsDao dao;
	
	
	@RequestMapping(command)
	public ModelAndView doAction() {
		
		List<Orderdetails> lists1 = dao.getSelectOrder();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("lists1",lists1);
		mav.setViewName(getPage);
		
		return mav;
	}
}
