package com.daum.pro;
import java.util.List;
import java.util.Map;

import com.daum.pro.*;

// BoardService 인터페이스 선언
public interface JoinService {
	// 회원가입 성공행의 갯수 리턴하는 메소드 선언
	int joinCompany(JoinListDTO joinListDTO);
	// 아이디 중복체크하는 메소드 선언
	int searchemp_id(JoinListDTO joinListDTO);
}
