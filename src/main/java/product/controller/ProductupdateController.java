package product.controller;
import java.io.File;
import java.io.IOException;
import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import product.model.Product;
import product.model.ProductDAO;

@Controller
public class ProductupdateController {
	final String command = "productupdate.prd";
	final String getPage = "productupdate";
	final String gotoPage = "redirect:/productselect.prd";
	
	@Autowired
	ProductDAO dao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value=command , method=RequestMethod.GET)
	public String doAction(@RequestParam(value="pnum" , required=true) int pnum,
							Model model){
		Product product = dao.getData(pnum);
		
		model.addAttribute("product",product);
		
		return getPage;
	}
	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView doAction(Product product) {
		/*if(product.getPimage().isEmpty()) {
			file = new File(uploadPath + "/" + product.getUploadOld());
			System.out.println("getpimage있음");
		}else {
			System.out.println("getpimage없음");
			file = new File(uploadPath + "/" + product.getPimage());
			File delFile = new File(uploadPath + "/" + product.getUploadOld());
			delFile.delete();
		}*/

		ModelAndView mav = new ModelAndView();
		String uploadPath = servletContext.getRealPath("/resources");
		
		File file = new File(uploadPath + "/" + product.getPimage());
		File file1 = new File(uploadPath + "/" + product.getPimage1());
		File file2 = new File(uploadPath + "/" + product.getPimage2());
		File file3 = new File(uploadPath + "/" + product.getPimage3());
		
		File delFile = new File(uploadPath + "/" + product.getUploadOld());
		File delFile1 = new File(uploadPath + "/" + product.getUploadOld1());
		File delFile2 = new File(uploadPath + "/" + product.getUploadOld2());
		File delFile3 = new File(uploadPath + "/" + product.getUploadOld3());
		
		delFile.delete();
		delFile1.delete();
		delFile2.delete();
		delFile3.delete();
		
		MultipartFile multi = product.getUpload();
		
		try {
			multi.transferTo(file);
			multi.transferTo(file1);
			multi.transferTo(file2);
			multi.transferTo(file3);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dao.updateProduct(product);
		mav.setViewName(gotoPage);
		return mav;
	}
}
