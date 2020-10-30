package orderdetails.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import orderdetails.model.Orderdetails;
import orderdetails.model.OrderdetailsDao;

@Controller
public class deliveryInsertController {
	
	final String command = "/orderinsert.ord";
	final String gotoPage = "orderinsert";
	
	@Autowired
	OrderdetailsDao dao;
	
	
	@RequestMapping(value = command , method = RequestMethod.GET)
	public ModelAndView doAction(Orderdetails orderdetails) {
		
		dao.getInsertOrderdetails(orderdetails);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(gotoPage);
		return mav; 
		
	}

}
