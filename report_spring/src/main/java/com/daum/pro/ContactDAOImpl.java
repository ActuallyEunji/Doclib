package com.daum.pro;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daum.pro.*;


//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
//[DAO 클래스]인 [ContactDAOImpl 클래스] 선언.
//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// @Repository 를 붙임으로서 [DAO 클래스] 임를 지정하게되고, bean 태그로 자동 등록된다.
//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
@Repository
public class ContactDAOImpl  implements ContactDAO {

	//*****************************************************
	// 속성변수 contactService를 선언하고 SqlSessionTemplate 객체를 생성해 저장
	//*****************************************************
	@Autowired
	private SqlSessionTemplate sqlSession;

	//********************************************************************
	// JSP 페이지의 select, checkbox, radio 에 삽입될 
	// [연락처 사업분야 목록]을 리턴하는  메소드 선언
	//********************************************************************
	public List<Map<String, String>>  getSaup_fieldList( ){

		List<Map<String, String>>  contactList 
			= sqlSession.selectList(  "com.daum.pro.ContactDAO.getSaup_fieldList" );
		return contactList;
	}

	//검색한 연락처 목록 총 개수를 리턴하는 메소드 선언
	public int getContactListAllCnt( ContactSearchDTO contactSearchDTO ) {

		int contactListTotCnt = sqlSession.selectOne("com.daum.pro.ContactDAO.getContactListAllCnt", contactSearchDTO);
		return contactListTotCnt;
	}
	
	// 검색한 연락처 목록을 리턴하는 메소드선언
	public List<Map<String,String>> getContactList(ContactSearchDTO contactSearchDTO){
		List<Map<String, String>>  contactList 
								= sqlSession.selectList(  "com.daum.pro.ContactDAO.getContactList" ,contactSearchDTO );
		return contactList;
	}
	
	// 연락처 입력하고 입력 행의 개수를 리턴하는 메소드 선언
	public int insertContact(ContactDTO contactDTO) {
		int contactRegCnt = sqlSession.insert("com.daum.pro.ContactDAO.insertContact", contactDTO);
		return contactRegCnt;
	}
	
	// 연락처 사업 분야 입력 메소드 선언
	public int insertContactSaup_field( ContactDTO contactDTO) {
		int saup_fieldRegCnt = sqlSession.insert("com.daum.pro.ContactDAO.insertContactSaup_field", contactDTO);
		return saup_fieldRegCnt;
	}
	
	// 연락처 번호에 해당하는 연락처를 리턴하는 메소드 선언
	public Map<String,String> getContact(ContactDTO contactDTO){
		Map<String,String> contactDTO2 = sqlSession.selectOne("com.daum.pro.ContactDAO.getContact", contactDTO);
		return contactDTO2;
	}
	
	public List<Integer> getContactSaup_field(ContactDTO contactDTO){
		List<Integer> getContactSaup_fieldList = sqlSession.selectList("com.daum.pro.ContactDAO.getContactSaup_field", contactDTO);
		return getContactSaup_fieldList; 
	}

	//********************************************************************
	// [1개 연락처 수정하고 수정 행의 개수]를 리턴하는 메소드 선언
	//********************************************************************
	public int  updateContact( ContactDTO contactDTO ){

		return sqlSession.update("com.daum.pro.ContactDAO.updateContact", contactDTO);
	}

	//********************************************************************
	// [1개 연락처의 사업 분야 삭제하고 삭제 행의 개수]를 리턴하는 메소드 선언
	//********************************************************************
	public int  deleteContactSaup_field( int contact_no ){

		return sqlSession.delete("com.daum.pro.ContactDAO.deleteContactSaup_field", contact_no);
	}

	//********************************************************************
	// [1개 연락처 삭제하고 삭제 행의 개수]를 리턴하는 메소드 선언
	//********************************************************************
	public int  deleteContact( int contact_no ){

		return (int)sqlSession.delete("com.daum.pro.ContactDAO.deleteContact", contact_no);
	}
	
	
}
