package dao;

import dto.OrderListDTO;
import java.util.Hashtable;

public class CartDAO {

  private Hashtable hcart = new Hashtable();

  public CartDAO() {}

  public void addCart(OrderListDTO orderListDTO) {
    int pro_no = orderListDTO.getPro_no();
    String q = orderListDTO.getQuantity();
    int quantity = Integer.parseInt(q);

    if (quantity > 0) {
      if (hcart.containsKey(pro_no)) {
        OrderListDTO tempDTO = (OrderListDTO) hcart.get(pro_no);
        quantity += Integer.parseInt(tempDTO.getQuantity());

        tempDTO.setQuantity(quantity + "");
        hcart.put(pro_no, tempDTO);
      } else {
        hcart.put(pro_no, orderListDTO);
      }
    }
  }

  public Hashtable getCartList() {
    return hcart;
  }

  public void updateCart(OrderListDTO orderListDTO) {
    int pro_no = orderListDTO.getPro_no();
    hcart.put(pro_no, orderListDTO);
  }

  public void deleteCart(OrderListDTO orderListDTO) {
    int pro_no = orderListDTO.getPro_no();
    hcart.remove(pro_no);
  }
}
