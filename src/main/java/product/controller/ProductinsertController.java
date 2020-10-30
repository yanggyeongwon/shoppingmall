package product.controller;


import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import product.model.Product;
import product.model.ProductDAO;

@Controller
public class ProductinsertController {
	
	final String command = "productinsert.prd";
	final String getPage = "productinsert";
	
	
	@Autowired
	ProductDAO dao;
	
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction( HttpSession session ) {
		System.out.println("get방식");
		/*
		 * System.out.println("loginInfo : " + session.getAttribute("loginInfo")); //
		 * null
		 * 
		 * if(session.getAttribute("loginInfo") == null) {
		 * session.setAttribute("destination", "redirect:/productinsert.prd"); return
		 * "redirect:/loginForm.me"; }else { return getPage; }
		 */
		return null;
		
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public ModelAndView doAction(Product product) throws IllegalStateException, IOException {
		/*,MultipartHttpServletRequest Multipartrequest*/
		
		System.out.println("post방식");
		
		dao.GetInsertProduct(product);
		ModelAndView mav = new ModelAndView();
		
		/*
		 * if(result.hasErrors()) { mav.setViewName(getPage); return mav; }
		 */
		MultipartFile multi = product.getUpload();
		MultipartFile multi1 = product.getUpload1();
		MultipartFile multi2 = product.getUpload2();
		MultipartFile multi3 = product.getUpload3();
		
		servletContext.getRealPath("/");

		String uploadPath = servletContext.getRealPath("/resources")+"/";

		
		File file = new File(uploadPath+product.getPimage());
		File file1 = new File(uploadPath+product.getPimage1());
		File file2 = new File(uploadPath+product.getPimage2());
		File file3 = new File(uploadPath+product.getPimage3());
		System.out.println(file);
		
		multi.transferTo(file);
		multi1.transferTo(file1);
		multi2.transferTo(file2);
		multi3.transferTo(file3);
		
		mav.setViewName(getPage);
		/*
		 * ModelAndView mav = new ModelAndView();
		 * 
		 * servletContext.getRealPath("/"); String path =
		 * servletContext.getRealPath("/resources")+"/"; String fileName = "";
		 * 
		 * File dir = new File(path); if(!dir.isDirectory()) { dir.mkdir(); }
		 * Iterator<String> files = Multipartrequest.getFileNames(); MultipartFile mf =
		 * Multipartrequest.getFile(files.next());
		 * 
		 * if(mf == null || mf.getSize() <= 0) { System.out.println("파일용량 xx");
		 * mav.setViewName(getPage); return mav; }
		 * 
		 * List<MultipartFile> fileList = Multipartrequest.getFiles("upload");
		 * 
		 * for(MultipartFile filePart : fileList) {
		 * 
		 * fileName = filePart.getOriginalFilename(); System.out.println("실제 파일이름 : "+
		 * fileName); long fileSize = filePart.getSize();
		 * System.out.println("실제 파일사이즈 : "+fileSize); if(!fileName.equals("")) {
		 * FileOutputStream fs = new FileOutputStream(path+fileName);
		 * fs.write(filePart.getBytes()); fs.close(); } } mav.setViewName(getPage);
		 * 
		 */
		return mav;
		
	}
}
