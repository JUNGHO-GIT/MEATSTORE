package dao;

import dto.OrderListDTO;
import java.util.concurrent.ConcurrentHashMap;

public class CartDAO {

  private ConcurrentHashMap<Integer, OrderListDTO> hcart = new ConcurrentHashMap<>();

  public CartDAO() {}

  public void addCart(OrderListDTO orderListDTO) {
    int pro_no = orderListDTO.getPro_no();
    int quantity = orderListDTO.getIntQuantity();

    if (quantity > 0) {
      if (hcart.containsKey(pro_no)) {
        OrderListDTO tempDTO = hcart.get(pro_no);
        quantity += tempDTO.getIntQuantity();

        tempDTO.setQuantity(Integer.toString(quantity));
        hcart.put(pro_no, tempDTO);
      } else {
        hcart.put(pro_no, orderListDTO);
      }
    }
  }

  public ConcurrentHashMap<Integer, OrderListDTO> getCartList() {
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
