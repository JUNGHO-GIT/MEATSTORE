package shopdb;
import java.sql.*;

import javax.sql.*;
import javax.naming.*;

import java.util.*;
public class OrderDAO {
	public OrderDAO(){}//생성자

	//커넥션 얻기
	public Connection getCon() throws Exception{
		Context ct=new InitialContext();
		DataSource ds=(DataSource)ct.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}

	Connection con=null;
	Statement stmt=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="";

	private static OrderDAO instance=new OrderDAO();

	public static OrderDAO getInstance(){
		return instance;
	}
	//============
	//주문하기 insert
	//============
	 public String insertOrder(OrderDTO dto){
	      String result="";
	      int quantity2=Integer.parseInt(dto.getQuantity());
	      try{
	         con=getCon();
	         pstmt=con.prepareStatement("select * from shop_info where pro_no=? and stock>="+quantity2);
	         pstmt.setInt(1, dto.getPro_no());
	         rs=pstmt.executeQuery();

	         if(rs.next()){//수량이 부족하지 않을 때
	            sql="insert into shop_order(ordno,userid,pro_no,quantity,orddate,state)";
	            sql=sql+" values(0,?,?,?,now(),?)";

	            pstmt=con.prepareStatement(sql);
	            pstmt.setString(1, dto.getUserid());
	            pstmt.setInt(2, dto.getPro_no());
	            pstmt.setString(3, dto.getQuantity());
	            pstmt.setString(4, dto.getState());

	            pstmt.executeUpdate();

	         }else {
	            result="noItem";//수량이 부족할 때
	         }
	      }catch(Exception ex){
	         System.out.println("insertOrder()예외:"+ex);
	         result="insert 실패:"+ex;
	      }finally{
	         try{
	            if(rs!=null){rs.close();}
	            if(pstmt!=null){pstmt.close();}
	            if(con!=null){con.close();}
	         }catch(Exception ex){}
	      }
	      return result;
	   }

	//========================
	// user가 주문한 목록 list를 리턴
	//========================
	public Vector<OrderDTO> getOrder(String userid){
		Vector<OrderDTO> vec=new Vector<OrderDTO>();//객체 생성
		try{
			con=getCon();
			sql="select * from shop_order where userid=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs=pstmt.executeQuery();

			OrderDTO dto=null;
			while(rs.next()){
				dto=new OrderDTO();

				dto.setUserid(rs.getString("userid"));
				dto.setQuantity(rs.getString("quantity"));
				dto.setOrddate(rs.getDate("orddate"));
				dto.setOrdno(rs.getInt("ordno"));
				dto.setState(rs.getString("state"));
				dto.setPro_no(rs.getInt("pro_no"));

				vec.add(dto);
			}
		}catch(Exception ex){
			System.out.println("getOrder 예외"+ex);
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception ex2){}
		}
		return vec;
	}
	//=======================
	//모든 주문 목록 보여주기
	//=======================

	public Vector<OrderDTO> getOrderList(){
		Vector<OrderDTO> vec=new Vector<OrderDTO>();
		try{
			con=getCon();
			sql="select * from shop_order order by ordno desc";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			OrderDTO dto=null;

			while(rs.next()){
				dto=new OrderDTO();

				dto.setUserid(rs.getString("userid"));
				dto.setQuantity(rs.getString("quantity"));
				dto.setOrddate(rs.getDate("orddate"));
				dto.setOrdno(rs.getInt("ordno"));
				dto.setState(rs.getString("state"));
				dto.setPro_no(rs.getInt("pro_no"));

				vec.add(dto);
			}
		}catch(Exception ex){
			System.out.println("getOrderlist에러"+ex);

		}finally{
			try{
				if(rs!=null){rs.close();}
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception ex2){}
		}//finally
		return vec;
	}



}
