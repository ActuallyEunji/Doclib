package com.daum.pro;

import java.util.List;
import java.util.Map;

// BoardDAO 인터페이스 선언
public interface LoginDAO {
	// [로그인 아이디, 암호] 정보의 개수를 리턴하는 메소드 선언
	String getEmpCnt(Map<String,String> emp_id_pwd);
	// 각 회사의 선택한 보고서 종류 얻는 메소드 선언
	List<Map<String,String>> getReport(int emp_no);
}
