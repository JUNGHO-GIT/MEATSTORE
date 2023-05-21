package dto;

import java.util.Date;

public class AdminDTO {

  // variables ------------------------------------------------------------------------------------>
  private String adminId;
  private String adminPw;
  private String adminName;
  private Date regDate;

  // getter --------------------------------------------------------------------------------------->
  public String getAdminId() {
    return adminId;
  }
  public String getAdminPw() {
    return adminPw;
  }
  public String getAdminName() {
    return adminName;
  }
  public Date getRegDate() {
    return regDate;
  }

  // setter --------------------------------------------------------------------------------------->
  public void setAdminId(String adminId) {
    this.adminId = adminId;
  }
  public void setAdminPw(String adminPw) {
    this.adminPw = adminPw;
  }
  public void setAdminName(String adminName) {
    this.adminName = adminName;
  }
  public void setRegDate(Date regDate) {
    this.regDate = regDate;
  }

}