package dto;


public class CartDTO {
  private int num;
  private String code;
  private String name;
  private int price;
  private int quantity;
  private String imageFile;

  public int getNum() {
    return num;
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

  public String getImageFile() {
    return imageFile;
  }

  public void setNum(int num) {
    this.num = num;
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
  public void setImageFile(String imageFile) {
    this.imageFile = imageFile;
  }
}