package dto;


public class CartDTO {
  private int pro_no;
  private String code;
  private String name;
  private int price;
  private int quantity;
  private String image;

  public int getPro_no() {
    return pro_no;
  }

  public String getCode() {
    return code;
  }

  public String getName() {
    return name;
  }

  public int getPrice() {
    return price;
  }

  public int getQuantity() {
    return quantity;
  }

  public String getImage() {
    return image;
  }

  public void setPro_no(int pro_no) {
    this.pro_no = pro_no;
  }
  public void setCode(String code) {
    this.code = code;
  }
  public void setName(String name) {
    this.name = name;
  }
  public void setPrice(int price) {
    this.price = price;
  }
  public void setQuantity(int quantity) {
    this.quantity = quantity;
  }
  public void setImage(String image) {
    this.image = image;
  }
}