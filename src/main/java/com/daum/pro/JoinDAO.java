package com.daum.pro;

import java.util.List;
import java.util.Map;

// BoardDAO 인터페이스 선언
public interface JoinDAO {
	// 회사 회원가입 성공행의 갯수 리턴하는 메소드 선언
	int insertCompany(JoinListDTO joinListDTO);
	// 직원 회원가입 성공행의 갯수 리턴하는 메소드 선언
	int insertEmployee(JoinListDTO joinListDTO);
	// 보고서 결재 종류 리턴하는 메소드 선언
	int insertReport_fieldList(JoinListDTO joinListDTO);
	// 아이디 중복체크하는 메소드 선언
	int searchemp_id(JoinListDTO joinListDTO);
}
