package productinq.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("MyProductinq")
public class ProductinqDAO {
	
	private String namespace = "productinq.model.Productinq";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public void inqInsert(Productinq productinq) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.insert(namespace+".inqInsert",productinq);
		
	}

	public List<Productinq> inqselect(int pinum) {
		// TODO Auto-generated method stub
		List<Productinq> lists = sqlSessionTemplate.selectList(namespace+".inqselect", pinum);
		System.out.println("lists 여기는 다오다"+ lists);
		return lists;
		
	}

	public void inqUpdate(Productinq productinq) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update(namespace+".inqUpdate", productinq);
		
	}

}
