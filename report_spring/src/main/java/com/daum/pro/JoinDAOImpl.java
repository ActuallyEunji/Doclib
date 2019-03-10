package com.daum.pro;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Repository
public class JoinDAOImpl implements JoinDAO {
	//======================================================
	// 속성변수 boardDAO 선언하고 BoardDAO 인터페이스를 구현받은 BoardDAOImpl객체를 생성해 저장
	//======================================================
		// @Autowired 의 역할 => 속성변수에 붙은 자료형인 인터페이스를 구현한 클래스를 객체화하여 저장한다.
	
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	//======================================================
	// 회사 회원가입 성공행의 갯수 리턴하는 메소드 선언
	//======================================================
	public int insertCompany(JoinListDTO joinListDTO) {	
		int insertComCnt = sqlSession.insert(
				"com.daum.pro.JoinDAO.insertCompany"			// 실행할 SQL구문의 위치 지정 
				,joinListDTO									// 실행할 SQL구문에서 사용할 데이터 설정
		);
		
		return insertComCnt;
		
	}

	//======================================================
	// 직원 회원가입 성공행의 갯수 리턴하는 메소드 선언
	//======================================================
	public int insertEmployee(JoinListDTO joinListDTO) {	
		int insertEmpCnt = sqlSession.insert(
				"com.daum.pro.JoinDAO.insertEmployee"			// 실행할 SQL구문의 위치 지정 
				,joinListDTO									// 실행할 SQL구문에서 사용할 데이터 설정
		);
		
		return insertEmpCnt;
		
	}
	
	//======================================================
	// 보고서 결재 종류 리턴하는 메소드 선언
	//======================================================
	 public int insertReport_fieldList(JoinListDTO joinListDTO){
		int  reportList 
		= sqlSession.insert(  "com.daum.pro.JoinDAO.insertReport_fieldList" , joinListDTO );
		return reportList;
	 }
	 
	//======================================================
	// 아이디 중복되는지 확인하고 중복되면 갯수 리턴하는 메소드 선언
	//======================================================
	 public int searchemp_id(JoinListDTO joinListDTO) {
		 int searchidCnt = sqlSession.selectOne(
				 "com.daum.pro.JoinDAO.searchemp_id" 
				 , joinListDTO
		);
		 return searchidCnt;
	 }

}
