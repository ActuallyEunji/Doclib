
package com.daum.pro;

import java.util.*;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.daum.pro.*;

//[서비스 클래스]인 [ContactServiceImpl 클래스] 선언

@Transactional 
@Service

public class ContactServiceImpl  implements ContactService {
	//**************************************************************************
	// 속성변수 contactDAO 선언하고, ContactDAO 인터페이스를 구현한 클래스를 객체 생성해 저장.
	// ContactDAO 인터페이스를 구현한 클래스명은 알 필요가 없다.
	//**************************************************************************
	@Autowired
	private ContactDAO contactDAO;

	//*****************************************************
	// JSP 페이지의 select, checkbox, radio 에 삽입될 
	// [연락처 사업분야 목록]을 리턴하는  메소드 선언
	//*****************************************************
	public List<Map<String, String>>  getSaup_fieldList( ){
		List<Map<String, String>>  saup_fieldList = this.contactDAO.getSaup_fieldList(  );
		return saup_fieldList;
	}
	
	//*****************************************************
	//검색한 연락처 목록 총 개수를 리턴하는 메소드 선언
	//*****************************************************
	public int getContactListAllCnt(ContactSearchDTO contactSearchDTO) {
		
		int contactListTotCnt = this.contactDAO.getContactListAllCnt( contactSearchDTO );
		return contactListTotCnt;
	}
	
	//*****************************************************
	// 검색한 연락처 목록을 리턴하는 메소드선언
	//*****************************************************
	public List<Map<String,String>> getContactList(ContactSearchDTO contactSearchDTO){
		List<Map<String, String>>  contactList = this.contactDAO.getContactList(contactSearchDTO);
		return contactList;
	}

	//*****************************************************
	// [ 연락처 ] 입력하고 입력 행의 개수를 리턴하는 메소드 선언
	//*****************************************************
	public int insertContact( ContactDTO contactDTO ){
	   // 연락처를 입력하고 입력 행의 개수 얻기
	   int contactRegCnt = this.contactDAO.insertContact(contactDTO);
	      
	   // 연락처 사업분야를 입력하고 입력 행의 개수 얻기
	   contactRegCnt = contactRegCnt + this.contactDAO.insertContactSaup_field(contactDTO);
	   return contactRegCnt;
	}
	
	// 연락처 번호에 해당하는 연락처를 리턴하는 메소드 선언
	public Map<String,String> getContact(ContactDTO contactDTO) {
		// contactDAOImpl 객체의 getContact메소드 호출로 연락처 기본 정보 얻어 ContactDTO 객체에 저장하기
		Map<String,String> contactDTO2 = this.contactDAO.getContact(contactDTO);
		// contactDTO 객체가 null이면, 즉 삭제되었으면~
		if(contactDTO != null) {
			// contactDAOImpl 객체의 getContact메소드 호출로 연락처 사업분야 번호 정보 얻기
			List<Integer> contactSaup_fieldList = this.contactDAO.getContactSaup_field( contactDTO );
			// 연락처 사업분야 번호 정보를 ContactDTO 객체의 속성변수 Saup_fieldList에 저장
			contactDTO.setSaup_field(contactSaup_fieldList);
		}
		return contactDTO2;
	}
	
	// 1개 연락처 수정하고 수정 행의 개수를 리턴하는 메소드 선언
	public int updateContact(ContactDTO contactDTO) {
		int contact_no = contactDTO.getContact_no();
		// 1개 연락처 기본정보 수정하고 수정 행의 개수를 얻기
		// 1개 연락처 사업분야 정보 삭제하고 삭제 행의 개수를 얻기
		// 1개 연락처 사업분야 정보 입력하고 입력 행의 개수를 얻기.
		int contactUpCnt = this.contactDAO.updateContact( contactDTO );
		if( contactUpCnt >0 ) {
			contactUpCnt = contactUpCnt + this.contactDAO.deleteContactSaup_field(contact_no);
			contactUpCnt = contactUpCnt + this.contactDAO.insertContactSaup_field(contactDTO);
		}
		return contactUpCnt;
	}
		
	// 1개 연락처 삭제하고 삭제 행의 개수를 리턴하는 메소드 선언
	public int deleteContact(int contact_no) {
		int contactDelCnt = this.contactDAO.deleteContactSaup_field(contact_no);
		contactDelCnt = contactDelCnt + this.contactDAO.deleteContact(contact_no);
		return contactDelCnt;
	}

}