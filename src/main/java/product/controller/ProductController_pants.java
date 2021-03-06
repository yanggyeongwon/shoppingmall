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
public class ProductController_pants {

	final String command = "pants.prd";
	final String getPage = "pants";
	
	@Autowired
	ProductDAO dao;
	
	@RequestMapping(command)
	public ModelAndView doAction() {
		
		List<Product> lists =  new ArrayList<Product>();
		
		lists = dao.selectPants();
		ModelAndView mav = new ModelAndView();
		mav.addObject("lists",lists);
		
		mav.setViewName(getPage);
		
		return mav;
	}
}
