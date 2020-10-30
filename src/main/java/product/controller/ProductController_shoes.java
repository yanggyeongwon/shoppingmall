package product.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import product.model.Product;
import product.model.ProductDAO;

@Controller
public class ProductController_shoes {

	final String command = "shoes.prd";
	final String getPage = "shoes";
	
	@Autowired
	ProductDAO dao;
	
	@RequestMapping(command)
	public ModelAndView doAction() {
		
		List<Product> lists =  new ArrayList<Product>();
		
		lists = dao.selectShose();
		ModelAndView mav = new ModelAndView();
		mav.addObject("lists",lists);
		
		mav.setViewName(getPage);
		
		return mav;
	}
}
