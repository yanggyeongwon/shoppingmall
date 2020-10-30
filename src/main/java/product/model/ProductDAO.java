package product.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("MyProduct")
public class ProductDAO {
	
	private String namespace = "product.model.Product";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public void GetInsertProduct(Product product) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.insert(namespace+".GetInsertProduct", product);
		
	}

	public int getTotalCount(Map<String, String> map) {
		int cnt = sqlSessionTemplate.selectOne(namespace + ".getTotalCount",map);
		return cnt;
	}

	public List<Product> getSelectProduct(Paging paging,Map<String, String> map) {
		List<Product> lists = new ArrayList<Product>();
		RowBounds rowBounds = new RowBounds(paging.getOffset(),paging.getLimit());
		lists = sqlSessionTemplate.selectList(namespace + ".getSelectProduct",map,rowBounds);
		return lists;
	}

	public Product getData(int pnum) {
		// TODO Auto-generated method stub
		 
		Product product = sqlSessionTemplate.selectOne(namespace+".getData", pnum);
		
		return product;
	}

	public void deleteProduct(int pnum) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.delete(namespace+".deleteProduct", pnum);
		
	}

	public void updateProduct(Product product) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update(namespace+".updateProduct", product);
		
	}

	public List<Product> selectMain() {
		// TODO Auto-generated method stub
		List<Product> lists = new ArrayList<Product>();
		lists = sqlSessionTemplate.selectList(namespace+".selectMain");
		return lists;
	}

	public List<Product> selectTop() {
		// TODO Auto-generated method stub
		List<Product> lists = new ArrayList<Product>();
		lists = sqlSessionTemplate.selectList(namespace+".selectTop");
		return lists;
	}

	public List<Product> selectBest() {
		// TODO Auto-generated method stub
		List<Product> lists = new ArrayList<Product>();
		lists = sqlSessionTemplate.selectList(namespace+".selectBest");
		return lists;
	}

	public List<Product> selectPants() {
		// TODO Auto-generated method stub
		List<Product> lists = new ArrayList<Product>();
		lists = sqlSessionTemplate.selectList(namespace+".selectPants");
		return lists;
	}

	public List<Product> selectOuter() {
		// TODO Auto-generated method stub
		List<Product> lists = new ArrayList<Product>();
		lists = sqlSessionTemplate.selectList(namespace+".selectOuter");
		return lists;
	}

	public List<Product> selectShose() {
		// TODO Auto-generated method stub
		List<Product> lists = new ArrayList<Product>();
		lists = sqlSessionTemplate.selectList(namespace+".selectShose");
		return lists;
	}

	public List<Product> selectAcc() {
		// TODO Auto-generated method stub
		List<Product> lists = new ArrayList<Product>();
		lists = sqlSessionTemplate.selectList(namespace+".selectAcc");
		return lists;
	}



}
