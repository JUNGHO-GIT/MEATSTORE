package dto;

import java.util.Date;

public class MemberDTO {

  // variables ----------------------------------------------------------------------------------->
  private String id;
  private String pw;
  private String name;
  private String email;
  private String tel;
  private String zipcode;
  private String addr;
  private String addr2;
  private Date regdate;
  private String adminid;
  private String adminpw;

  // getter --------------------------------------------------------------------------------------->
  public String getId() {
    return id;
  }
  public String getPw() {
    return pw;
  }
  public String getName() {
    return name;
  }
  public String getEmail() {
    return email;
  }
  public String getTel() {
    return tel;
  }
  public String getZipcode() {
    return zipcode;
  }
  public String getAddr() {
    return addr;
  }
  public String getAddr2() {
    return addr2;
  }
  public Date getRegdate() {
    return regdate;
  }
  public String getAdminid() {
    return adminid;
  }
  public String getAdminpw() {
    return adminpw;
  }

  // setter --------------------------------------------------------------------------------------->
  public void setId(String id) {
    this.id = id;
  }
  public void setPw(String pw) {
    this.pw = pw;
  }
  public void setName(String name) {
    this.name = name;
  }
  public void setEmail(String email) {
    this.email = email;
  }
  public void setTel(String tel) {
    this.tel = tel;
  }
  public void setZipcode(String zipcode) {
    this.zipcode = zipcode;
  }
  public void setAddr(String addr) {
    this.addr = addr;
  }
  public void setAddr2(String addr2) {
    this.addr2 = addr2;
  }
  public void setRegdate(Date regdate) {
    this.regdate = regdate;
  }
  public void setAdminid(String adminid) {
    this.adminid = adminid;
  }
  public void setAdminpw(String adminpw) {
    this.adminpw = adminpw;
  }
}

