package product.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class Product {
	private int pnum;
	private int pbest;
	private String pname;
	private String pcolor;
	private String psize;
	private String pssize;
	private int pprice;
	private int ppoint;
	private String pimage;
	private String pimage1;
	private String pimage2;
	private String pimage3;
	private int pcount;
	
	private Date pdate;
	
	
	
	
	private MultipartFile upload;
	private String uploadOld;
	
	private MultipartFile upload1;
	private String uploadOld1;
	
	private MultipartFile upload2;
	private String uploadOld2;
	
	private MultipartFile upload3;
	private String uploadOld3;
	
	

	public String getUploadOld() {
		return uploadOld;
	}
	public void setUploadOld(String uploadOld) {
		this.uploadOld = uploadOld;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
		System.out.println("upload:"+upload);
		if(upload != null) {
			System.out.println("upload.getName: "+upload.getName());
			System.out.println("getOriginalFilename: "+upload.getOriginalFilename());
			this.pimage = upload.getOriginalFilename();
		}else {
			this.pimage = uploadOld;
		}
		
	}
	
	
	
	public String getUploadOld1() {
		return uploadOld1;
	}
	public void setUploadOld1(String uploadOld1) {
		this.uploadOld1 = uploadOld1;
	}
	public MultipartFile getUpload1() {
		return upload1;
	}
	public void setUpload1(MultipartFile upload1) {
		this.upload1 = upload1;
		System.out.println("upload1:"+upload1);
		if(upload1 != null) {
			System.out.println("upload1.getName: "+upload1.getName());
			System.out.println("getOriginalFilename1: "+upload1.getOriginalFilename());
			this.pimage1 = upload1.getOriginalFilename();
		}else {
			this.pimage1 = uploadOld1;
		}
	}
	
	public String getUploadOld2() {
		return uploadOld2;
	}
	public void setUploadOld2(String uploadOld2) {
		this.uploadOld2 = uploadOld2;
	}
	public MultipartFile getUpload2() {
		return upload2;
	}
	public void setUpload2(MultipartFile upload2) {
		this.upload2 = upload2;
		System.out.println("upload2:"+upload2);
		if(upload2 != null) {
			System.out.println("upload2.getName: "+upload2.getName());
			System.out.println("getOriginalFilename2: "+upload2.getOriginalFilename());
			this.pimage2 = upload2.getOriginalFilename();
		}else {
			this.pimage2 = uploadOld2;
		}
	}
	
	
	public String getUploadOld3() {
		return uploadOld3;
	}
	public void setUploadOld3(String uploadOld3) {
		this.uploadOld3 = uploadOld3;
	}
	public MultipartFile getUpload3() {
		return upload3;
	}
	public void setUpload3(MultipartFile upload3) {
		this.upload3 = upload3;
		System.out.println("upload3:"+upload3);
		if(upload3 != null) {
			System.out.println("upload3.getName: "+upload3.getName());
			System.out.println("getOriginalFilename3: "+upload3.getOriginalFilename());
			this.pimage3 = upload3.getOriginalFilename();
		}else {
			this.pimage3 = uploadOld3;
		}
	}
	
	
	
	
	public String getPssize() {
		return pssize;
	}
	public void setPssize(String pssize) {
		this.pssize = pssize;
	}
	public int getPcount() {
		return pcount;
	}
	public void setPcount(int pcount) {
		this.pcount = pcount;
	}
	public String getPimage1() {
		return pimage1;
	}
	public void setPimage1(String pimage1) {
		this.pimage1 = pimage1;
	}
	public String getPimage2() {
		return pimage2;
	}
	public void setPimage2(String pimage2) {
		this.pimage2 = pimage2;
	}
	public String getPimage3() {
		return pimage3;
	}
	public void setPimage3(String pimage3) {
		this.pimage3 = pimage3;
	}
	public String getPcolor() {
		return pcolor;
	}
	public void setPcolor(String pcolor) {
		this.pcolor = pcolor;
	}
	public String getPimage() {
		return pimage;
	}
	public void setPimage(String pimage) {
		this.pimage = pimage;
	}
	public Date getPdate() {
		return pdate;
	}
	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public int getPbest() {
		return pbest;
	}
	public void setPbest(int pbest) {
		this.pbest = pbest;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPsize() {
		return psize;
	}
	public void setPsize(String psize) {
		this.psize = psize;
	}
	public int getPprice() {
		return pprice;
	}
	public void setPprice(int pprice) {
		this.pprice = pprice;
	}
	public int getPpoint() {
		return ppoint;
	}
	public void setPpoint(int ppoint) {
		this.ppoint = ppoint;
	}
	
	
}
