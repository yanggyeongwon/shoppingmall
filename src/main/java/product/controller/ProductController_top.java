package product.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.ModelAndView;

import product.model.Product;
import product.model.ProductDAO;

@Controller
public class ProductController_top {

	final String command = "top.prd";
	final String getPage = "top";
	final String command2 = "top2.prd";
	final String gotoPage = "product";
	@Autowired
	ProductDAO dao;
	
	@RequestMapping(command)
	public ModelAndView doAction() {
		
		
		List<Product> lists =  new ArrayList<Product>();
		
		lists = dao.selectTop();
		ModelAndView mav = new ModelAndView();
		mav.addObject("lists",lists);
		
		mav.setViewName(getPage);
		
		return mav;
	}
	
	@RequestMapping(command2)
	public ModelAndView doAction(HttpServletRequest request) {
		
		int pnum = Integer.parseInt(request.getParameter("pnum"));
		
		System.out.println("pnum: "+ pnum);
		
		Product product = dao.getData(pnum);
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("product",product);
		mav.setViewName(gotoPage);
		
		return mav;
	}
}
