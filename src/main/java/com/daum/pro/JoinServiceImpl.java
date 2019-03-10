package com.daum.pro;


import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class JoinServiceImpl implements JoinService{
	
   @Autowired
   private JoinDAO joinDAO;

   // ----------------------------
   // 회원가입 정보 개수를 리턴하는 메소드 선언 (2이상)
   // ----------------------------
   public int joinCompany(JoinListDTO joinListDTO) {
	  int insertComCnt = this.joinDAO.insertCompany(joinListDTO);
	  int insertErpCnt =  this.joinDAO.insertEmployee(joinListDTO);
	  int reportCnt = this.joinDAO.insertReport_fieldList(joinListDTO);
      return insertComCnt+ insertErpCnt + reportCnt;
   }
   // ----------------------------
   // 아이디 중복체크하는 메소드 선언
   // ----------------------------
   public int searchemp_id(JoinListDTO joinListDTO) {
	   int searchIdCnt = this.joinDAO.searchemp_id(joinListDTO);
	   return searchIdCnt;
   }
   
}