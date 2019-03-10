package com.daum.pro;

import java.util.List;
import java.util.Map;
import com.daum.pro.*;


//[ContactDAO 인터페이스] 선언

public interface ContactDAO {
	//*****************************************************
	// JSP 페이지의 select, checkbox, radio 에 삽입될 
	// [연락처 사업분야 목록]을 리턴하는  메소드 선언
	//*****************************************************
	List<Map<String, String>>  getSaup_fieldList( );
	
	//검색한 연락처 목록 총 개수를 리턴하는 메소드 선언
	int getContactListAllCnt( ContactSearchDTO contactSearchDTO );
	
	// 검색한 연락처 목록을 리턴하는 메소드선언
	List<Map<String,String>> getContactList(ContactSearchDTO contactSearchDTO);
	
	// 연락처 입력하고 입력 행의 개수를 리턴하는 메소드 선언
	int insertContact(ContactDTO contactDTO);
	
	// 연락처 사업분야를 입력하고 이벽행의 개수 리턴하는 메소드 선언
	int insertContactSaup_field( ContactDTO contactDTO);
	
	// 연락처 번호에 해당하는 연락처를 리턴하는 메소드 선언
	Map<String,String> getContact(ContactDTO contactDTO);
	
	//1명 연락처의 사업분야 목록 검색 메소드 선언
	List<Integer> getContactSaup_field(ContactDTO contactDTO);
	
	// 1개 연락처 수정하고 수정 행의 개수를 리턴하는 메소드 선언
	int updateContact(ContactDTO contactDTO);
		
	// 1개 연락처 삭제하고 삭제 행의 개수를 리턴하는 메소드 선언
	int deleteContact(int contact_no);
	
	// 1개 연락처의 사업 분야 삭제하고 삭제 행의 개수를 리턴하는 메소드 선언
	int deleteContactSaup_field(int contact_no);
}	
	
	
