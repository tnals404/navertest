package board.spring.mybatis;


import org.apache.ibatis.annotations.Mapper;
// servlet 4.0 미만 javax.servlet.hhtp.HttpServlet
// servlety 5.0 jakarta.servlet.....
import org.apache.ibatis.session.SqlSession;//mybatis(새로운이름) -  ibatis(이전이름)
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface MemberDAO {

	
	public MemberDTO oneMember(String id);


}




