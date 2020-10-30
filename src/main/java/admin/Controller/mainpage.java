package admin.Controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import product.model.Product;
import product.model.ProductDAO;

@Controller
public class mainpage {
	
	final String command = "/index.ad";
	final String getPage = "index";
	
	@Autowired
	ProductDAO dao;
	
	@RequestMapping(command)
	public ModelAndView doAction() {
		List<Product> lists =  new ArrayList<Product>();
		
		lists = dao.selectMain();
		System.out.println(lists.size());
		ModelAndView mav = new ModelAndView();
		mav.addObject("lists",lists);
		mav.setViewName(getPage);
		
		return mav;
	}
}
