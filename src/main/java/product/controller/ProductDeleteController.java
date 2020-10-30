
package product.controller;

import java.io.File;
import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import product.model.Product;
import product.model.ProductDAO;

@Controller
public class ProductDeleteController {
	final String command = "productdelete.prd";
	final String gotoPage = "redirect:/productselect.prd";
	
	@Autowired
	ProductDAO dao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(command)
	public String doAction(@RequestParam(value="pnum", required=true) int pnum) {
		Product product = dao.getData(pnum);
		System.out.println(product.getPimage());
		String uploadPath = servletContext.getRealPath("/resources");
		
		File delFile = new File(uploadPath + File.separator + product.getPimage());
		File delFile1 = new File(uploadPath + File.separator + product.getPimage1());
		File delFile2 = new File(uploadPath + File.separator + product.getPimage2());
		File delFile3 = new File(uploadPath + File.separator + product.getPimage3());
		
		delFile.delete();
		delFile1.delete();
		delFile2.delete();
		delFile3.delete();
		
		dao.deleteProduct(pnum);
		return gotoPage;
	}
}