package orderdetails.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import orderdetails.model.Orderdetails;
import orderdetails.model.OrderdetailsDao;
import utility.Paging;

@Controller
public class deliverystate4 {
	
	final String command = "/deliverystate4.ord";
	final String getPage = "deliverystate4";
	final String gotoPage = "deliverystate4";
	
	@Autowired
	OrderdetailsDao dao;
	
	@RequestMapping(command)
	public ModelAndView doAction(
			@RequestParam(value="whatColumn", required = false) String whatColumn,
			@RequestParam(value="keyword", required = false) String keyword,
			@RequestParam(value="pageNumber", required = false) String pageNumber,
			@RequestParam(value="pageSize", required = false) String pageSize,
			HttpServletRequest request,
			@ModelAttribute("dto") Orderdetails dto) {
		
		ModelAndView mav = new ModelAndView();
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("state", 4);
		
		int totalCount = dao.getTotalCount(map);
		String url = request.getContextPath() + command;
		Paging pageInfo = new Paging(pageNumber,pageSize,totalCount,url,whatColumn,keyword);
		
		List<Orderdetails> lists = null;
		
		if(dto.getOnums() == null) {
			lists = dao.getSelectdelivery(pageInfo,map);
			mav.addObject("lists",lists);
			mav.addObject("pageInfo", pageInfo);
			mav.setViewName(gotoPage);
			return mav;
		}else {
			String[] onums = dto.getOnums().split("-");
			System.out.println("onums: "+onums.length);
			System.out.println("onums: "+onums);
			if(onums.length == 1) {
				dto.setOnum(Integer.parseInt(onums[0]));
				dto.setState(4);
				dao.updatedelivery(dto);
			} else {
				for(String onum: onums) {
					Orderdetails oDto = new Orderdetails();
					oDto.setOnum(Integer.parseInt(onum));
					oDto.setState(4);
					dao.updatedelivery(oDto);
				}
			}
		}
		
		lists = dao.getSelectdelivery(pageInfo,map);
		System.out.println(lists.get(0).getState());

		mav.addObject("lists",lists);
		mav.addObject("pageInfo", pageInfo);
		mav.setViewName(getPage);
		
		return mav;
		
	}
	
}
