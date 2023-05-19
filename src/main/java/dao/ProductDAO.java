package dao;

import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.*;
import dto.OrderDTO;
import dto.ProductDTO;
import java.io.File;
import java.sql.*;
import java.util.*;
import javax.naming.*;
import javax.servlet.http.*;
import javax.sql.*;

// ------------------------------------------------------------------------------------------------>
public class ProductDAO {

  // 전역변수 선언 -------------------------------------------------------------------------------->
  Connection connecTion = null;
  PreparedStatement psTmt = null;
  Statement sTmt = null;
  ResultSet resultSet = null;
  String sqlParam = "";
  String dbPw = "";
  int checkParam = 0;

  // 프라이빗 생성자를 통한 싱글톤 패턴 구현 ------------------------------------------------------>
  private ProductDAO() {}

  // 싱글톤 패턴을 위한 객체 생성 ----------------------------------------------------------------->
  private static ProductDAO instance = new ProductDAO();

  // 반복되는 예외처리를 위한 메소드 -------------------------------------------------------------->
  public void exceptionHandling() {
    try {
      if (resultSet != null) {
        resultSet.close();
      }
      if (psTmt != null) {
        psTmt.close();
      }
      if (connecTion != null) {
        connecTion.close();
      }
    }
    catch (Exception ex2) {}
  }

  // [인스턴스 반환 - getInstance] ---------------------------------------------------------------->
  public static ProductDAO getInstance() {
    return instance;
  }

  // [커넥션 반환 - getConnection] ---------------------------------------------------------------->
  private Connection getConnection() throws Exception {
    Context context = new InitialContext();
    DataSource datasource = (DataSource) context.lookup(
      "java:comp/env/jdbc/mysqlParam"
    );
    return datasource.getConnection();
  }

  // ---------------------------------------------------------------------------------------------->
  public List getProductList ()  {
    List<ProductDTO> list = new ArrayList<ProductDTO>();
    try {
      connecTion = getConnection();
      sqlParam = "select * from product";
      sTmt = connecTion.createStatement();
      resultSet = sTmt.executeQuery(sqlParam);
      while (resultSet.next()) {
        ProductDTO dto = new ProductDTO();
        dto.setPro_no(resultSet.getInt("pro_no"));
        dto.setCode(resultSet.getString("code"));
        dto.setName(resultSet.getString("name"));
        dto.setPrice(resultSet.getInt("price"));
        dto.setStock(resultSet.getInt("stock"));
        dto.setContent(resultSet.getString("detail"));
        dto.setComp(resultSet.getString("comp"));
        dto.setRegdate(resultSet.getDate("regdate"));
        dto.setImage(resultSet.getString("image"));
        list.add(dto);
      }
    }
    catch (Exception ex) {
      System.out.println("Exception occurred: " + ex.getMessage());
    }
    finally {
      exceptionHandling();
    }
    return list;
  }

  // ---------------------------------------------------------------------------------------------->
  public int getCount ()  {
    int cnt = 0;
    try {
      connecTion = getConnection();
      psTmt = connecTion.prepareStatement("select count(*) from product");
      resultSet = psTmt.executeQuery();
      if (resultSet.next()) {
        cnt = resultSet.getInt(1);
      }
    }
    catch (Exception ex) {
      System.out.println("Exception occurred: " + ex.getMessage());
    }
    finally {
      exceptionHandling();
    }
    return cnt;
  }

  // ---------------------------------------------------------------------------------------------->
  public List getProductList (int start, int cnt)  {
    List<ProductDTO> list = null;
    try {
      connecTion = getConnection();
      sqlParam = "select*from product order by pro_no desc limit ?,?";
      psTmt = connecTion.prepareStatement(sqlParam);
      psTmt.setInt(1, start - 1);
      psTmt.setInt(2, cnt);
      resultSet = psTmt.executeQuery();
      while (resultSet.next()) {
        list = new ArrayList<ProductDTO>();
        do {
          ProductDTO dto = new ProductDTO();
          dto.setPro_no(resultSet.getInt("pro_no"));
          dto.setCode(resultSet.getString("code"));
          dto.setName(resultSet.getString("name"));
          dto.setPrice(resultSet.getInt("price"));
          dto.setStock(resultSet.getInt("stock"));
          dto.setContent(resultSet.getString("detail"));
          dto.setComp(resultSet.getString("comp"));
          dto.setRegdate(resultSet.getDate("regdate"));
          dto.setImage(resultSet.getString("image"));
          list.add(dto);
        } while (resultSet.next());
      }
    }
    catch (Exception ex) {
      System.out.println("Exception occurred: " + ex.getMessage());
    }
    finally {
      exceptionHandling();
    }
    return list;
  }

  // ---------------------------------------------------------------------------------------------->
  public ProductDTO getDetail (String code)  {
    ProductDTO dto = new ProductDTO();
    try {
      connecTion = getConnection();
      sqlParam = "select * from product where code='" + code + "'";
      sTmt = connecTion.createStatement();
      resultSet = sTmt.executeQuery(sqlParam);
      if (resultSet.next()) {
        dto.setPro_no(resultSet.getInt("pro_no"));
        dto.setCode(resultSet.getString("code"));
        dto.setName(resultSet.getString("name"));
        dto.setPrice(resultSet.getInt("price"));
        dto.setStock(resultSet.getInt("stock"));
        dto.setContent(resultSet.getString("detail"));
        dto.setComp(resultSet.getString("comp"));
        dto.setRegdate(resultSet.getDate("regdate"));
        dto.setImage(resultSet.getString("image"));
      }
    }
    catch (Exception ex) {
      System.out.println("Exception occurred: " + ex.getMessage());
    }
    finally {
      exceptionHandling();
    }
    return dto;
  }

  // ---------------------------------------------------------------------------------------------->
  public ProductDTO getProduct (int pro_no)  {
    ProductDTO dto = null;
    try {
      connecTion = getConnection();
      sqlParam = "select * from product where pro_no=" + pro_no;
      psTmt = connecTion.prepareStatement(sqlParam);
      resultSet = psTmt.executeQuery();
      while (resultSet.next()) {
        dto = new ProductDTO();
        dto.setPro_no(resultSet.getInt("pro_no"));
        dto.setCode(resultSet.getString("code"));
        dto.setName(resultSet.getString("name"));
        dto.setPrice(resultSet.getInt("price"));
        dto.setStock(resultSet.getInt("stock"));
        dto.setContent(resultSet.getString("detail"));
        dto.setComp(resultSet.getString("comp"));
        dto.setRegdate(resultSet.getDate("regdate"));
        dto.setImage(resultSet.getString("image"));
      }
    }
    catch (Exception ex) {
      System.out.println("Exception occurred: " + ex.getMessage());
    }
    finally {
      exceptionHandling();
    }
    return dto;
  }

  // ---------------------------------------------------------------------------------------------->
  public void reduceProduct (OrderDTO dto)  {
    int quantity2 = dto.getQuantity();
    try {
      connecTion = getConnection();
      sqlParam = "update product set stock=(stock-?) where pro_no?and stock>=" + quantity2;
      psTmt = connecTion.prepareStatement(sqlParam);
      psTmt.setInt(1, dto.getQuantity());
      psTmt.setInt(2, dto.getPro_no());
      psTmt.executeUpdate();
    }
    catch (Exception ex) {
      System.out.println("Exception occurred: " + ex.getMessage());
    }
    finally {
      exceptionHandling();
    }
  }

  // ---------------------------------------------------------------------------------------------->
  public boolean insertProduct (HttpServletRequest request)  {
    boolean re = false;
    try {
      connecTion = getConnection();
      String realpath = request.getServletContext().getRealPath("/");
      String uploadPath = realpath + "/imgs/";
      uploadPath = "C:\\_imgs\\shop_upload\\";
      MultipartRequest mul = new MultipartRequest(request, uploadPath, 5 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());
      sqlParam = "insert into product(pro_no,name,code,price,stock,detail,comp,regdate,image) ";
      sqlParam = sqlParam + "values(0,?,?,?,?,?,?,NOW(),?)";
      psTmt = connecTion.prepareStatement(sqlParam);
      psTmt.setString(1, mul.getParameter("name"));
      psTmt.setString(2, mul.getParameter("code"));
      psTmt.setInt(3, Integer.parseInt(mul.getParameter("price")));
      psTmt.setInt(4, Integer.parseInt(mul.getParameter("stock")));
      psTmt.setString(5, mul.getParameter("detail"));
      psTmt.setString(6, mul.getParameter("comp"));
      if (mul.getFilesystemName("image") != null) {
        psTmt.setString(7, mul.getFilesystemName("image"));
      }
      else {
        psTmt.setString(7, "readt.gif");
      }

      int count = psTmt.executeUpdate();
      if (count == 1) {
        re = true;
      }
    }
    catch (Exception ex) {
      System.out.println("Exception occurred: " + ex.getMessage());
    }
    finally {
      exceptionHandling();
    }
    return re;
  }

  // ---------------------------------------------------------------------------------------------->
  public boolean updateProduct (HttpServletRequest request)  {
    boolean re = false;
    try {
      connecTion = getConnection();
      String realPath = request.getServletContext().getRealPath("/");
      String uploadPath = realPath + "/imgs/";
      uploadPath = "C:\\_imgs\\shop_upload\\";
      int size = 5 * 1024 * 1024;
      MultipartRequest mul = new MultipartRequest(request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());
      if (mul.getFilesystemName("image") == null) {
        sqlParam = "update product set name?, stock?, detail?, price?, code?, comp?where pro_no?";
        psTmt = connecTion.prepareStatement(sqlParam);
        psTmt.setString(1, mul.getParameter("name"));
        psTmt.setInt(2, Integer.parseInt(mul.getParameter("stock")));
        psTmt.setString(3, mul.getParameter("detail"));
        psTmt.setInt(4, Integer.parseInt(mul.getParameter("price")));
        psTmt.setString(5, mul.getParameter("code"));
        psTmt.setString(6, mul.getParameter("comp"));
        psTmt.setInt(7, Integer.parseInt(mul.getParameter("pro_no")));
      }
      else {
        int im_pro_no = Integer.parseInt(mul.getParameter("pro_no"));
        String sqlParam2 = "select image from product where pro_no=" + im_pro_no;
        sTmt = connecTion.createStatement();
        resultSet = sTmt.executeQuery(sqlParam2);
        if (resultSet.next()) {
          File f = new File(uploadPath + resultSet.getString("image"));
          if (f.isFile()) {
            f.delete();
          }
        }
        resultSet.close();
        sqlParam = "update product set name?,stock?,detail?,price?, code?, comp?, image?where pro_no?";
        psTmt = connecTion.prepareStatement(sqlParam);
        psTmt.setString(1, mul.getParameter("name"));
        psTmt.setInt(2, Integer.parseInt(mul.getParameter("stock")));
        psTmt.setString(3, mul.getParameter("detail"));
        psTmt.setInt(4, Integer.parseInt(mul.getParameter("price")));
        psTmt.setString(5, mul.getParameter("code"));
        psTmt.setString(6, mul.getParameter("comp"));
        psTmt.setString(7, mul.getFilesystemName("image"));
        psTmt.setInt(8, Integer.parseInt(mul.getParameter("pro_no")));
      }

      int cnt = psTmt.executeUpdate();
      if (cnt == 1) {
        re = true;
      }
    }
    catch (Exception ex) {
      System.out.println("Exception occurred: " + ex.getMessage());
    }
    finally {
      exceptionHandling();
    }

    return re;
  }

  // ---------------------------------------------------------------------------------------------->
  public boolean deleteProduct (HttpServletRequest request, int pro_no)  {
    boolean re = false;
    try {
      connecTion = getConnection();
      String realPath = request.getServletContext().getRealPath("/");
      String uploadPath = realPath + "/imgs/";
      uploadPath = "C:\\_imgs\\shop_upload\\";
      sqlParam = "select image from product where pro_no=" + pro_no;
      sTmt = connecTion.createStatement();
      resultSet = sTmt.executeQuery(sqlParam);
      if (resultSet.next()) {
        File f = new File(uploadPath + resultSet.getString("image"));
        if (f.isFile()) {
          f.delete();
        }
      }

      sqlParam = "delete from product where pro_no=" + pro_no;
      psTmt = connecTion.prepareStatement(sqlParam);
      int cnt = psTmt.executeUpdate();
      if (cnt > 0) {
        re = true;
      }
    }
    catch (Exception ex) {
      System.out.println("Exception occurred: " + ex.getMessage());
    }
    finally {
      exceptionHandling();
    }
    return re;
  }
}
