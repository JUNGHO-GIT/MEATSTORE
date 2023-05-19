package dto;

import java.util.Date;

public class OrderDTO {

  // variables ----------------------------------------------------------------------------------->
  private int ordno;
  private int pro_no;
  private int quantity;
  private Date orddate;
  private String state;
  private String id;

  // getter --------------------------------------------------------------------------------------->
  public int getOrdno() {
    return ordno;
  }
  public int getPro_no() {
    return pro_no;
  }
  public int getQuantity() {
    return quantity;
  }
  public Date getOrddate() {
    return orddate;
  }
  public String getState() {
    return state;
  }
  public String getId() {
    return id;
  }

  // setter --------------------------------------------------------------------------------------->
  public void setOrdno(int ordno) {
    this.ordno = ordno;
  }
  public void setPro_no(int pro_no) {
    this.pro_no = pro_no;
  }
  public void setQuantity(int quantity) {
    this.quantity = quantity;
  }
  public void setOrddate(Date orddate) {
    this.orddate = orddate;
  }
  public void setState(String state) {
    this.state = state;
  }
  public void setId(String id) {
    this.id = id;
  }
}
