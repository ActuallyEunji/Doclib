package com.daum.pro;


public class BoardDTO {
	
   private String board_no;
   private String re_board_no;
   private String subject;
   private String writer;
   private String reg_date;
   private int readcount;
   private String content;
   private String pwd;
   private String email;
   private int group_no;
   private int print_no;
   private int print_level;
   private int emp_no;
   private int writer_no;
   
   private String upDel;
   
   
   public String getUpDel() {
	return upDel;
}
public void setUpDel(String upDel) {
	this.upDel = upDel;
}
public String getRe_board_no() {
	return re_board_no;
}
public void setRe_board_no(String re_board_no) {
	this.re_board_no = re_board_no;
}
public int getWriter_no() {
	return writer_no;
   }
	public void setWriter_no(int writer_no) {
		this.writer_no = writer_no;
	}
	public String getBoard_no() {
	return board_no;
	}
	public void setBoard_no(String board_no) {
		this.board_no = board_no;
	}
	public String getSubject() {
	      return subject;
   }
   public void setSubject(String subject) {
      this.subject = subject;
   }
   public String getWriter() {
      return writer;
   }
   public void setWriter(String writer) {
      this.writer = writer;
   }
   public String getReg_date() {
      return reg_date;
   }
   public void setReg_date(String reg_date) {
      this.reg_date = reg_date;
   }
   public int getReadcount() {
      return readcount;
   }
   public void setReadcount(int readcount) {
      this.readcount = readcount;
   }
   public String getContent() {
      return content;
   }
   public void setContent(String content) {
      this.content = content;
   }
   public String getPwd() {
      return pwd;
   }
   public void setPwd(String pwd) {
      this.pwd = pwd;
   }
   public String getEmail() {
      return email;
   }
   public void setEmail(String email) {
      this.email = email;
   }
   public int getGroup_no() {
      return group_no;
   }
   public void setGroup_no(int group_no) {
      this.group_no = group_no;
   }
   public int getPrint_no() {
      return print_no;
   }
   public void setPrint_no(int print_no) {
      this.print_no = print_no;
   }
   public int getPrint_level() {
      return print_level;
   }
   public void setPrint_level(int print_level) {
      this.print_level = print_level;
   }
	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
   

}