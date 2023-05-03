package dto;

import java.util.Date;

public class OrderListDTO {

  private int ordno;
  private int pro_no;
  private String quantity;
  private Date orddate;
  private String state;
  private String userid;

  public int getOrdno() {
    return ordno;
  }

  public void setOrdno(int ordno) {
    this.ordno = ordno;
  }

  public int getPro_no() {
    return pro_no;
  }

  public void setPro_no(int pro_no) {
    this.pro_no = pro_no;
  }

  public String getQuantity() {
    return quantity;
  }

  public void setQuantity(String quantity) {
    this.quantity = quantity;
  }

  public Date getOrddate() {
    return orddate;
  }

  public void setOrddate(Date orddate) {
    this.orddate = orddate;
  }

  public String getState() {
    return state;
  }

  public void setState(String state) {
    this.state = state;
  }

  public String getUserid() {
    return userid;
  }

  public void setUserid(String userid) {
    this.userid = userid;
  }

  public int getIntQuantity() {
    return Integer.parseInt(quantity);
  }
}
