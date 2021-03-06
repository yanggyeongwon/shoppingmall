package orderdetails.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import orderdetails.model.Orderdetails;
import orderdetails.model.OrderdetailsDao;
import utility.Paging;

@Controller
public class OrderListController {
	
	final String command = "/orderlist.ord";
	final String getPage = "orderlist";
	
	@Autowired
	OrderdetailsDao dao;
	
	
	@RequestMapping(command)
	public ModelAndView doAction(
			@RequestParam(value="whatColumn", required = false) String whatColumn,
			@RequestParam(value="keyword", required = false) String keyword,
			@RequestParam(value="pageNumber", required = false) String pageNumber,
			@RequestParam(value="pageSize", required = false) String pageSize,
			HttpServletRequest request) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		int totalCount = dao.getTotalCount(map);
		String url = request.getContextPath() + command;
		Paging pageInfo = new Paging(pageNumber,pageSize,totalCount,url,whatColumn,keyword);
		
		List<Orderdetails> lists = dao.getSelectdelivery(pageInfo,map);
		
		System.out.println("lists : " + lists);
	
		ModelAndView mav = new ModelAndView();
		mav.addObject("lists",lists);
		mav.addObject("pageInfo", pageInfo);
		mav.setViewName(getPage);
		return mav;
		
	}
}
