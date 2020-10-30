package orderdetails.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("MyOrderdetails")
public class OrderdetailsDao {
	
	private String namespace = "orderdetails.model.Orderdetails";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int getTotalCount(Map<String, Object> map) {
		int cnt = sqlSessionTemplate.selectOne(namespace + ".getTotalCount",map);
		return cnt;
	}
	
	public List<Orderdetails> getSelectOrder() {
		List<Orderdetails> lists1 = new ArrayList<Orderdetails>();
		lists1 = sqlSessionTemplate.selectList(namespace + ".getSelectOrder"); 
		return lists1;
	}	
	
	public void getInsertOrderdetails(Orderdetails orderdetails) {
		sqlSessionTemplate.insert(namespace+".getInsertOrderdetails",orderdetails);
		
	}
	
	public List<Orderdetails> getSelectdelivery(Paging paging, Map<String, Object> map) {
		List<Orderdetails> lists = new ArrayList<Orderdetails>();
		RowBounds rowBounds = new RowBounds(paging.getOffset(),paging.getLimit());
		lists = sqlSessionTemplate.selectList(namespace + ".getSelectdelivery", map,rowBounds);
		return lists;
	}

	public int updatedelivery(Orderdetails dto) {
		int cnt = sqlSessionTemplate.update(namespace + ".updatedelevery",dto);
		return cnt;
		
	}
	
	public int delivery() {
		 int cnt = sqlSessionTemplate.selectOne(namespace +".delivery"); 
		 return cnt; 
	 }
	
	public int delivery2() {
		 int cnt2 = sqlSessionTemplate.selectOne(namespace +".delivery2"); 
		 return cnt2; 
	 }
	
	public int delivery3() {
		 int cnt3 = sqlSessionTemplate.selectOne(namespace +".delivery3"); 
		 return cnt3; 
	 }
}
