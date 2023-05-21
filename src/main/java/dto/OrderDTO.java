package dto;

import java.util.Date;

public class OrderDTO {

  // variables ----------------------------------------------------------------------------------->
  private int ordno;
  private int num;
  private int quantity;
  private Date orddate;
  private String state;
  private String id;

  // getter --------------------------------------------------------------------------------------->
  public int getOrdno() {
    return ordno;
  }
  public int getNum() {
    return num;
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
  public void setNum(int num) {
    this.num = num;
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
