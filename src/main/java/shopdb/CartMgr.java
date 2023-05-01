package shopdb;
import java.util.Hashtable;//��ٱ��� key,value ����Ϸ���


//��ٱ��� ó��
public class CartMgr {
	private Hashtable hcart=new Hashtable();

	public CartMgr(){}//����Ʈ ������

	//��ٱ��� �ֱ� �޼���
	public void addCart(OrderDTO orderDTO){
		int pro_no=orderDTO.getPro_no();
		String q=orderDTO.getQuantity();
		int quantity=Integer.parseInt(q);

		if(quantity>0){//�ֹ� ������ ������
			if(hcart.containsKey(pro_no)){
				//���� ������ �߰� ����������
				OrderDTO tempDTO=(OrderDTO)hcart.get(pro_no);
				quantity += Integer.parseInt(tempDTO.getQuantity());


				tempDTO.setQuantity(quantity+"");
				hcart.put(pro_no, tempDTO);//���� �߰��Ͽ� ��ٱ��Ͽ� �ٽ� �ֱ�
				//         key  , value
			}else{//��ǰ�� ��ٱ��Ͽ� ó�� ������(�ٸ���ǰ)
				hcart.put(pro_no, orderDTO);
			}
		}
	}
	//================
	//hcart������ jsp�� �����Ѵ�.
	//��ٱ��� ���� ����Ʈ
	//================
	public Hashtable getCartList(){
		return hcart;
	}

	//================
	//hcart���� ����
	//================
	public void updateCart(OrderDTO orderDTO){

		int pro_no=orderDTO.getPro_no();
		hcart.put(pro_no, orderDTO);


	}

	//===================
	// hcart���� ����(��ٱ��� ����)
	//===================
	public void deleteCart(OrderDTO orderDTO){
		int pro_no=orderDTO.getPro_no();
		hcart.remove(pro_no);//key�� pro_no�ΰ��� ����
	}

}
