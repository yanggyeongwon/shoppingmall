package productinq.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;

import productinq.model.Productinq;
import productinq.model.ProductinqDAO;

@Controller
public class ProductinqinsertController {

	final String command = "insert.pro";
	final String command2 = "insert2.pro";
	final String getPage = "redirect:/list.bd";
	
	@Autowired
	ProductinqDAO dao;
	
	
	@RequestMapping(value=command)
	public String doAction(Productinq productinq, HttpServletRequest request) {
		int pinum = Integer.parseInt(request.getParameter("pinum"));
		System.out.println("pinum: "+pinum);
		
		List<Productinq> productinq_list = dao.inqselect(pinum);
		
		
		int size = productinq_list.size()+1;
		
		for(int i=0; i<size;i++) {
			if(productinq_list.size() != 0 ) {
				if(productinq_list.get(i).getNumnum() == pinum) {
					dao.inqUpdate(productinq);
					break;
				}
			}else {
				System.out.println(productinq.getPiwriter());
				System.out.println(productinq.getNumnum());
				dao.inqInsert(productinq); 	

			}
		}
		return getPage;
	}
	
	@RequestMapping(value=command2)
	@ResponseBody
	public List<Productinq> doAction(HttpServletRequest request) {
		int pinum = Integer.parseInt(request.getParameter("pinum"));
		
		List<Productinq> productinq = dao.inqselect(pinum); 
		if(productinq.size() == 0) {
			return null;
		}
		System.out.println("productinq.size(): "+productinq.size());

		return productinq;
	}

}
