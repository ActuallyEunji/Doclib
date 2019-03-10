package com.daum.pro;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService{
   @Autowired
   private LoginDAO loginDAO;

   // ----------------------------
   // 로그인 정보의 개수를 리턴하는 메소드 선언
   // ----------------------------
   public String getEmpCnt(Map<String,String> emp_id_pwd) {
	   String adminCnt = this.loginDAO.getEmpCnt(emp_id_pwd);
      return adminCnt;
   }
   
   // ----------------------------
   // 로그인 정보의 개수를 리턴하는 메소드 선언
   // ----------------------------
   public List<Map<String,String>> getReport(int emp_no){
	   List<Map<String,String>> report = this.loginDAO.getReport(emp_no);
      return report;
   }
   
}