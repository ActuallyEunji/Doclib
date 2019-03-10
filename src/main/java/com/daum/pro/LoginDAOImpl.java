package com.daum.pro;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Repository
public class LoginDAOImpl implements LoginDAO {
	//======================================================
	// 속성변수 boardDAO 선언하고 BoardDAO 인터페이스를 구현받은 BoardDAOImpl객체를 생성해 저장
	//======================================================
		// @Autowired 의 역할 => 속성변수에 붙은 자료형인 인터페이스를 구현한 클래스를 객체화하여 저장한다.
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	//======================================================
	// [로그인 아이디, 암호] 정보의 개수를 리턴하는 메소드 선언
	//======================================================
	public String getEmpCnt(Map<String,String> emp_id_pwd) {
		//------------------------------------------------------
		// sqlSessionTemplate 객체의 selectOne(~,~) 메소드를 호출하여 로그인 아이디, 암호의 존재개수 리턴
		//------------------------------------------------------
			// selecOne( "com.naver.erp.LoginDAO.getAdminCnt" , admin_id_pwd );의미
			// 마이바티스 SQL 구문 설정 XML 파일(=mapper_login.xml) 에서 
			// <mapper namespace="com.naver.erp.LoginDAO> 태그 내부의 
			// select id="gegAdminCnt"~> 태그 내부으 
			// 1행 리턴 select 쿼리문을 실행하고 얻은 데이터를 int로 리턴한다.
			// 2번쨰 인자는 n행 리턴 select 쿼리문에 삽입될 데이터이다.
			// 리턴 자료형은 무조건 int이다.
			//------------------------------------------------------	
		String empCnt = sqlSession.selectOne(
				"com.daum.pro.LoginDAO.getEmpCnt"			// 실행할 SQL구문의 위치 지정 
				,emp_id_pwd									// 실행할 SQL구문에서 사용할 데이터 설정
		);
		return empCnt;
		
	}
	
	
	//======================================================
	// [로그인 아이디, 암호] 정보의 개수를 리턴하는 메소드 선언
	//======================================================
	public List<Map<String,String>> getReport(int emp_no) {
		List<Map<String,String>> empCnt = sqlSession.selectList(
				"com.daum.pro.LoginDAO.getReport"			// 실행할 SQL구문의 위치 지정 
				,emp_no									// 실행할 SQL구문에서 사용할 데이터 설정
		);
		return empCnt;
		
	}
	
}
