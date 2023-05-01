package shopdb;
import java.util.Hashtable;//장바구니 key,value 사용하려고


//장바구니 처리
public class CartMgr {
	private Hashtable hcart=new Hashtable();

	public CartMgr(){}//디폴트 생성자

	//장바구니 넣기 메서드
	public void addCart(OrderDTO orderDTO){
		int pro_no=orderDTO.getPro_no();
		String q=orderDTO.getQuantity();
		int quantity=Integer.parseInt(q);

		if(quantity>0){//주문 수량이 있으면
			if(hcart.containsKey(pro_no)){
				//같은 물건을 추가 구매했을때
				OrderDTO tempDTO=(OrderDTO)hcart.get(pro_no);
				quantity += Integer.parseInt(tempDTO.getQuantity());


				tempDTO.setQuantity(quantity+"");
				hcart.put(pro_no, tempDTO);//수량 추가하여 장바구니에 다시 넣기
				//         key  , value
			}else{//상품을 장바구니에 처음 넣을때(다른상품)
				hcart.put(pro_no, orderDTO);
			}
		}
	}
	//================
	//hcart내용을 jsp로 리턴한다.
	//장바구니 내용 리스트
	//================
	public Hashtable getCartList(){
		return hcart;
	}

	//================
	//hcart내용 수정
	//================
	public void updateCart(OrderDTO orderDTO){

		int pro_no=orderDTO.getPro_no();
		hcart.put(pro_no, orderDTO);


	}

	//===================
	// hcart내용 제거(장바구니 제거)
	//===================
	public void deleteCart(OrderDTO orderDTO){
		int pro_no=orderDTO.getPro_no();
		hcart.remove(pro_no);//key가 pro_no인것을 제거
	}

}
