package shopdb;
//占쏙옙占싹억옙占싸듸옙
//jdk/jre/lib/ext/cos.jar
//WebContent/WEB-INF/lib/cos.jar ==>tomcat/lib/cos.jar 占쏙옙 占싫곤옙占쏙옙
//DAO占쏙옙占쏙옙絿占쏙옙占쏙옙占�
import java.io.File;
import java.sql.*;
import java.util.*;

import javax.sql.*;//DataSource
import javax.naming.*;//lookup

import com.oreilly.servlet.*;//cos.jar
import com.oreilly.servlet.multipart.*;//cos.jar

import board.BoardDTO;

import javax.servlet.http.*;//HttpServletRequest request

	public class ProductDAO {
		//占싱깍옙占쏙옙 占쏙옙체 占쏙옙占�
	private ProductDAO(){}

	private static ProductDAO instance=new ProductDAO();

	public static ProductDAO getInstance(){
		return instance;
	}
	//==============
	//커占쌔쇽옙 풀 占쏙옙占�
	//==============

	private Connection getCon() throws Exception{
		Context ct=new InitialContext();
		DataSource ds=(DataSource)ct.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}

	Connection con=null;
	Statement stmt=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="";
	//=====================
	//占쏙옙품 占쏙옙占� 占쏙옙占쏙옙트
	//=====================
	public List getGoodList(){
		List<ProductDTO> list=new ArrayList<ProductDTO>();
		try{
			con=getCon();
			sql="select * from shop_info";
			stmt=con.createStatement();
			rs=stmt.executeQuery(sql);

			while(rs.next()){
				//rs占쏙옙占쏙옙占쏙옙 dto占쏙옙 占쏙옙占�  dto占쏙옙 list占쏙옙 占쌍는댐옙. 占쌓몌옙占쏙옙 list占쏙옙 占쏙옙占쏙옙占싼댐옙

				ProductDTO dto=new ProductDTO();

				dto.setPro_no(rs.getInt("pro_no"));
				dto.setCode(rs.getString("code"));
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getInt("price"));
				dto.setStock(rs.getInt("stock"));
				dto.setDetail(rs.getString("detail"));
				dto.setComp(rs.getString("comp"));
				dto.setRegdate(rs.getDate("regdate"));
				dto.setImage(rs.getString("image"));

				list.add(dto);
			}
		}catch(Exception ex){
			System.out.println("goodList 占쏙옙占쏙옙"+ex);
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(stmt!=null){stmt.close();}
				if(con!=null){con.close();}
			}catch(Exception ex2){}
		}
		return list;
	}

	//-----------------
	//占쌜곤옙占쏙옙(占쏙옙占쏙옙占쏙옙처占쏙옙, 占쏙옙처占쏙옙)
	//-----------------
	public int getCount(){
			int cnt=0;
			try{
				con=getCon(); //커占쌔쇽옙 占쏙옙占�
				pstmt=con.prepareStatement("select count(*) from shop_info");
				rs=pstmt.executeQuery();

				if(rs.next()){
					cnt=rs.getInt(1);//占십듸옙占싫�
				}
			}catch(Exception ex){
				System.out.println("getCount()占쏙옙占쏙옙:"+ex);
			}finally{
				try{
					if(rs!=null){rs.close();}
					if(pstmt!=null){pstmt.close();}
					if(con!=null){con.close();}
				}catch(Exception ex2){}
			}
			return cnt;
	}\

	//===========================
	//占쏙옙占쏙옙트
	//===========================
	public List getProductList(int start, int cnt){
		List<ProductDTO> list=null;
		try{
			con=getCon();
			sql="select*from shop_info order by pro_no desc limit ?,?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, start-1);
			pstmt.setInt(2, cnt);
			rs=pstmt.executeQuery();

			while(rs.next()){
				list=new ArrayList<ProductDTO>();
				do{
					ProductDTO dto=new ProductDTO();

					dto.setPro_no(rs.getInt("pro_no"));
					dto.setCode(rs.getString("code"));
					dto.setName(rs.getString("name"));
					dto.setPrice(rs.getInt("price"));
					dto.setStock(rs.getInt("stock"));
					dto.setDetail(rs.getString("detail"));
					dto.setComp(rs.getString("comp"));
					dto.setRegdate(rs.getDate("regdate"));
					dto.setImage(rs.getString("image"));

					list.add(dto);
				}while(rs.next());
			}
		}catch(Exception ex){
			System.out.println("productList 占쏙옙占쏙옙"+ex);
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception ex2){}
		}
		return list;
	}

	//===========================
	// 占쏢세븝옙占쏙옙
	//===========================

	public ProductDTO getDetail(String code){
		ProductDTO dto=new ProductDTO();
		try{
			con=getCon();
			sql="select * from shop_info where code='"+code+"'";
				stmt=con.createStatement();
			rs=stmt.executeQuery(sql);

			if(rs.next()){

				dto.setPro_no(rs.getInt("pro_no"));
				dto.setCode(rs.getString("code"));
				dto.setName(rs.getString("name"));

				dto.setPrice(rs.getInt("price"));
				dto.setStock(rs.getInt("stock"));

				dto.setDetail(rs.getString("detail"));
				dto.setComp(rs.getString("comp"));

				dto.setRegdate(rs.getDate("regdate"));
				dto.setImage(rs.getString("image"));


			}
		}catch(Exception ex){
			System.out.println("getDetail占쏙옙占쏙옙"+ex);
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(stmt!=null){stmt.close();}
				if(con!=null){con.close();}
			}catch(Exception ex2){}
		}
		return dto;
	}
	//============================
	//getProduct(),pro_no占쏙옙 占쌔댐옙占싹댐옙 占쏙옙占쏙옙占쏙옙 jsp占쏙옙 占쏙옙占쏙옙占쏙옙 占쌔댐옙
	//============================
	public ProductDTO getProduct(int pro_no){
		ProductDTO dto=null;
		try{
			con=getCon();
			sql="select * from shop_info where pro_no="+pro_no;
			pstmt=con.prepareStatement(sql);//占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙載ｏ옙占�
			rs=pstmt.executeQuery();

			while(rs.next()){
				dto=new ProductDTO();

				//rs占쏙옙占쏙옙占쏙옙 dto占쏙옙 占쌍곤옙 占쏙옙占쏙옙占쏙옙
				dto.setPro_no(rs.getInt("pro_no"));
				dto.setCode(rs.getString("code"));
				dto.setName(rs.getString("name"));

				dto.setPrice(rs.getInt("price"));
				dto.setStock(rs.getInt("stock"));

				dto.setDetail(rs.getString("detail"));
				dto.setComp(rs.getString("comp"));

				dto.setRegdate(rs.getDate("regdate"));
				dto.setImage(rs.getString("image"));
			}

		}catch(Exception ex){
			System.out.println("getProduct() 占쏙옙占쏙옙:"+ex);
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception ex2){}
		}
		return dto;
	}
	//=====================
	//占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占�
	//=====================
	public void reduceProduct(OrderDTO dto){
		int quantity2=Integer.parseInt(dto.getQuantity());
		try{
			con=getCon();
			sql="update shop_info set stock=(stock-?) where pro_no=? and stock>="+quantity2;
			pstmt=con.prepareStatement(sql);

			pstmt.setString(1, dto.getQuantity());//占쏙옙占쏙옙
			pstmt.setInt(2, dto.getPro_no());// 占쏙옙품 占싹뤄옙 占쏙옙호

			pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println("reduece占쏙옙占쏙옙"+ex);
		}finally{
			try{
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception ex2){}
		}
	}
	//=====================
	// 占쏙옙품占쏙옙占�(占쏙옙占쏙옙占쌘곤옙 占싹댐옙占쏙옙=占실몌옙占쌘곤옙 占싹댐옙 占쏙옙)
	// insert
	// HttpServletReuquest, request
	//=====================
	public boolean insertProduct(HttpServletRequest request){
		boolean re=false;


		//jsp占쏙옙占쏙옙 占쏙옙占� 占쏙옙占�(占쏙옙占쏙옙 占쏙옙占싸듸옙 = 占쌓몌옙占쏙옙占쏙옙 占쏙옙占�)
		//<%= config.getServletContext().getrealPath("/")%>占싱곤옙占쏙옙 占쏙옙占쏙옙究占쏙옙占�
		//<%= application.getrealPath("/")%>

		//Servlet占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占� 占쏙옙占�: 占쌓몌옙占쏙옙占쏙옙 占쏙옙占�(=占쏙옙占쏙옙 占쏙옙占싸듸옙)占싹깍옙 占쏙옙占쏙옙
		//request.getRealPath("/");
		//request.getServletContext().getRealPath("/"); //占싱곤옙占쏙옙 占쏙옙 占쏙옙확占쏙옙

		//jsp占쏙옙占쏙옙 占쌓몌옙占쏙옙占쏙옙占쏙옙 占쏙옙占싹면에 占쏙옙占�
		//<%=request.getContextPath()%> : 占쏙옙占쌔쏙옙트 占싱몌옙=占쏙옙占쏙옙占쏙옙트占싱몌옙=占쏙옙 占쏙옙占시몌옙占쏙옙占싱쇽옙 占싱몌옙
		try{
			con=getCon();
			String realpath=request.getServletContext().getRealPath("/");
			String uploadPath=realpath+"/imgs/";
			uploadPath="C:\\_imgs\\shop_upload\\";

			MultipartRequest mul=new MultipartRequest(request, uploadPath,5*1024*1024,"utf-8",new DefaultFileRenamePolicy());
			sql="insert into shop_info(pro_no,name,code,price,stock,detail,comp,regdate,image) ";
			sql=sql+"values(0,?,?,?,?,?,?,NOW(),?)";

			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, mul.getParameter("name"));
			pstmt.setString(2, mul.getParameter("code"));
			pstmt.setInt(3, Integer.parseInt(mul.getParameter("price")));
			pstmt.setInt(4, Integer.parseInt(mul.getParameter("stock")));
			pstmt.setString(5, mul.getParameter("detail"));
			pstmt.setString(6, mul.getParameter("comp"));

			//占쌓몌옙占쏙옙占쏙옙
			if(mul.getFilesystemName("image") != null){
				pstmt.setString(7, mul.getFilesystemName("image"));//***
			}else{
				pstmt.setString(7, "readt.gif");
			}

			int count=pstmt.executeUpdate();

			if(count==1){
				re=true;
			}
		}catch(Exception ex){
			System.out.println("insertProduct() 占쏙옙占쏙옙:"+ex);
		}finally{
			try{
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception ex2){}
		}
		return re;
	}
	//=====================
		//상품 update(관리자가 하는 일=판매자가 하는 일)
		//그림파일 수정
		//=====================
		public boolean updateProduct(HttpServletRequest request){
			boolean re=false;
			try{
				con=getCon();
				String realPath=request.getServletContext().getRealPath("/");
				String uploadPath=realPath+"/imgs/";
				uploadPath="C:\\_imgs\\shop_upload\\";//앞에 두줄 대신 사용
				int size=5*1024*1024;

				MultipartRequest mul=new MultipartRequest(request,uploadPath,size,"utf-8",new DefaultFileRenamePolicy());

				if(mul.getFilesystemName("image")==null){
					//수정할 그림 파일이 없으면, 이전 그림 그대로 사용
					sql="update shop_info set name=?, stock=?, detail=?, price=?, code=?, comp=? where pro_no=?";
					pstmt=con.prepareStatement(sql);

					//?값 채우기
					pstmt.setString(1, mul.getParameter("name"));
					pstmt.setInt(2, Integer.parseInt(mul.getParameter("stock")));
					pstmt.setString(3, mul.getParameter("detail"));
					pstmt.setInt(4, Integer.parseInt(mul.getParameter("price")));
					pstmt.setString(5, mul.getParameter("code"));
					pstmt.setString(6, mul.getParameter("comp"));

					pstmt.setInt(7, Integer.parseInt(mul.getParameter("pro_no")));

				}else{
					//새로운 이미지로 바꿀때
					int im_pro_no=Integer.parseInt(mul.getParameter("pro_no"));
					String sql2="select image from shop_info where pro_no="+im_pro_no;
					stmt=con.createStatement();
					rs=stmt.executeQuery(sql2);//실행시 인자 들어감

					if(rs.next()){//이미지가 존재하면 삭제
						File f=new File(uploadPath+rs.getString("image"));
						if(f.isFile()){//파일이 존재하면
							f.delete();//파일 삭제

						}
					}
					rs.close();

					sql="update shop_info set name=?,stock=?,detail=?,price=?, code=?, comp=?, image=? where pro_no=?";
					pstmt=con.prepareStatement(sql);

					//?값 채우기
					pstmt.setString(1, mul.getParameter("name"));
					pstmt.setInt(2, Integer.parseInt(mul.getParameter("stock")));
					pstmt.setString(3, mul.getParameter("detail"));
					pstmt.setInt(4, Integer.parseInt(mul.getParameter("price")));
					pstmt.setString(5, mul.getParameter("code"));
					pstmt.setString(6, mul.getParameter("comp"));
					pstmt.setString(7, mul.getFilesystemName("image"));//*****

					pstmt.setInt(8, Integer.parseInt(mul.getParameter("pro_no")));
				}

				int cnt=pstmt.executeUpdate();//쿼리 실행
				if(cnt==1){
					re=true;
				}
			}catch(Exception ex){
				System.out.println("updateProduct()예외"+ex);
			}finally{
				try{
					if(rs!=null){rs.close();}
					if(stmt!=null){stmt.close();}
					if(pstmt!=null){pstmt.close();}
					if(con!=null){con.close();}
				}catch(Exception ex2){}
			}

			return re;
		}


		//=====================
		//없는 상품 삭제(관리자가  하는일=판매자가 하는 일)
		//그림파일 삭제
		//======================
		public boolean deleteProduct(HttpServletRequest request, int pro_no){
			boolean re=false;
			try{
				con=getCon();
				String realPath=request.getServletContext().getRealPath("/");
				String uploadPath=realPath+"/imgs/";

				uploadPath="C:\\_imgs\\shop_upload\\";//앞에 두줄 대신 사용 server.xml에 경로 설정함.

				sql="select image from shop_info where pro_no="+pro_no;
				stmt=con.createStatement();
				rs=stmt.executeQuery(sql);//실행시 인자 들어감

				if(rs.next()){
					File f=new File(uploadPath+rs.getString("image"));
					if(f.isFile()){
						//파일이 존재하면 삭제
						f.delete();
					}
				}
				//----그림파일 삭제

				//DB의 행삭제 작업
				sql="delete from shop_info where pro_no="+pro_no;
				pstmt=con.prepareStatement(sql);

				int cnt=pstmt.executeUpdate();

				if(cnt>0){
					re=true;
				}
			}catch(Exception ex){
				System.out.println("deleteProduct 예외"+ex);
			}finally{
				try{
					if(rs!=null){rs.close();}
					if(stmt!=null){stmt.close();}
					if(pstmt!=null){pstmt.close();}
					if(con!=null){con.close();}
				}catch(Exception ex2){}
			}
			return re;
		}




}
