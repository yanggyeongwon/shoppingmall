package productinq.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import productinq.model.ProductinqDAO;

@Controller
public class ProductselectController {

	
	final String command = "select.pro";

	@Autowired
	ProductinqDAO dao;
	
	@RequestMapping(command)
	public void doAction(HttpServletRequest request) {
		
		System.out.println("셀렉까지옴");
	}
}
