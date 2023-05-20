package dao;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import dto.OrderDTO;
import dto.ProductDTO;

// ------------------------------------------------------------------------------------------------>
public class ProductDAO {

  // 전역변수 선언 -------------------------------------------------------------------------------->
  Connection connecTion = null;
  PreparedStatement psTmt = null;
  Statement sTmt = null;
  ResultSet resultSet = null;
  String sqlParam = "";
  String dbPw = "";
  int checkParam = -100;

  // 프라이빗 생성자를 통한 싱글톤 패턴 구현 ------------------------------------------------------>
  private ProductDAO() {}

  // 싱글톤 패턴을 위한 객체 생성 ----------------------------------------------------------------->
  private static ProductDAO instance = new ProductDAO();

  // 반복되는 예외처리를 위한 메소드 -------------------------------------------------------------->
  private void exceptionHandling() {
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
    catch (Exception ex2) {
      System.out.println("Exception occurred: " + ex2.getMessage());
    }
  }

  // [인스턴스 반환 - getInstance] ---------------------------------------------------------------->
  public static ProductDAO getInstance() {
    return instance;
  }

  // [커넥션 반환 - getConnection] ---------------------------------------------------------------->
  private Connection getConnection() throws Exception {
    Context context = new InitialContext();
    DataSource datasource = (DataSource) context.lookup(
      "java:comp/env/jdbc/mysql"
    );
    return datasource.getConnection();
  }

  // ---------------------------------------------------------------------------------------------->
  public int getCount ()  {
    int count = 0;
    try {
      connecTion = getConnection();
      psTmt = connecTion.prepareStatement("select count(*) from product");
      resultSet = psTmt.executeQuery();
      if (resultSet.next()) {
        count = resultSet.getInt(1);
      }
    }
    catch (Exception ex) {
      System.out.println("Exception occurred: " + ex.getMessage());
    }
    finally {
      exceptionHandling();
    }
    return count;
  }

  // ---------------------------------------------------------------------------------------------->
  public List getList (int start, int count)  {
    List<ProductDTO> list = new ArrayList<ProductDTO>();
    try {
      connecTion = getConnection();
      sqlParam = "select * from product order by num desc limit ?, ?";
      psTmt = connecTion.prepareStatement(sqlParam);
      psTmt.setInt(1, start - 1);
      psTmt.setInt(2, count);
      resultSet = psTmt.executeQuery();
      while (resultSet.next()) {
        ProductDTO dto = new ProductDTO();
        dto.setNum(resultSet.getInt("num"));
        dto.setCode(resultSet.getString("code"));
        dto.setName(resultSet.getString("name"));
        dto.setPrice(resultSet.getInt("price"));
        dto.setStock(resultSet.getInt("stock"));
        dto.setContent(resultSet.getString("detail"));
        dto.setComp(resultSet.getString("comp"));
        dto.setRegDate(resultSet.getDate("regDate"));
        dto.setImageFile(resultSet.getString("imageFile"));
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
  public ProductDTO getDetail (String code)  {
    ProductDTO dto = new ProductDTO();
    try {
      connecTion = getConnection();
      sqlParam = "select * from product where code='" + code + "'";
      sTmt = connecTion.createStatement();
      resultSet = sTmt.executeQuery(sqlParam);
      if (resultSet.next()) {
        dto.setNum(resultSet.getInt("num"));
        dto.setCode(resultSet.getString("code"));
        dto.setName(resultSet.getString("name"));
        dto.setPrice(resultSet.getInt("price"));
        dto.setStock(resultSet.getInt("stock"));
        dto.setContent(resultSet.getString("detail"));
        dto.setComp(resultSet.getString("comp"));
        dto.setRegDate(resultSet.getDate("regDate"));
        dto.setImageFile(resultSet.getString("imageFile"));
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
  public int getSearch (String keyword, String search)  {
    int count = 0;
    try {
      connecTion = getConnection();
      psTmt = connecTion.prepareStatement("select count(*) from product where " + keyword + " like '%" + search + "%'");
      resultSet = psTmt.executeQuery();
      if (resultSet.next()) {
        count = resultSet.getInt(1);
      }
    }
    catch (Exception ex) {
      System.out.println("Exception occurred: " + ex.getMessage());
    }
    finally {
      exceptionHandling();
    }
    return count;
  }

  // ---------------------------------------------------------------------------------------------->
  public List<ProductDTO> listSearch(int start, int count, String name, String detail) {
    List<ProductDTO> list = new ArrayList<>();
    try {
      connecTion = getConnection();
      String selectClause = "SELECT * FROM product";
      String whereClause = "";
      if (name != null) {
        whereClause += " WHERE name LIKE ?";
      }
      if (detail != null) {
        if (whereClause.isEmpty()) {
          whereClause += " WHERE detail LIKE ?";
        }
        else {
          whereClause += " AND detail LIKE ?";
        }
      }

      String orderByClause = " ORDER BY ref DESC, re_indent ASC LIMIT ?, ?";
      String sqlParam = selectClause + whereClause + orderByClause;
      psTmt = connecTion.prepareStatement(sqlParam);
      int paramIndex = 1;

      if (name != null) {
        psTmt.setString(paramIndex++, "%" + name + "%");
      }
      if (detail != null) {
        psTmt.setString(paramIndex++, "%" + detail + "%");
      }
      psTmt.setInt(paramIndex++, start - 1);
      psTmt.setInt(paramIndex, count);
      resultSet = psTmt.executeQuery();

      while (resultSet.next()) {
        ProductDTO dto = new ProductDTO();
        dto.setNum(resultSet.getInt("num"));
        dto.setCode(resultSet.getString("code"));
        dto.setName(resultSet.getString("name"));
        dto.setPrice(resultSet.getInt("price"));
        dto.setStock(resultSet.getInt("stock"));
        dto.setContent(resultSet.getString("detail"));
        dto.setComp(resultSet.getString("comp"));
        dto.setRegDate(resultSet.getDate("regDate"));
        dto.setImageFile(resultSet.getString("imageFile"));
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
  public ProductDTO getProduct (int num)  {
    ProductDTO dto = null;
    try {
      connecTion = getConnection();
      sqlParam = "select * from product where num=" + num;
      psTmt = connecTion.prepareStatement(sqlParam);
      resultSet = psTmt.executeQuery();
      while (resultSet.next()) {
        dto = new ProductDTO();
        dto.setNum(resultSet.getInt("num"));
        dto.setCode(resultSet.getString("code"));
        dto.setName(resultSet.getString("name"));
        dto.setPrice(resultSet.getInt("price"));
        dto.setStock(resultSet.getInt("stock"));
        dto.setContent(resultSet.getString("detail"));
        dto.setComp(resultSet.getString("comp"));
        dto.setRegDate(resultSet.getDate("regDate"));
        dto.setImageFile(resultSet.getString("imageFile"));
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
      sqlParam = "update product set stock=(stock-?) where num?and stock>=" + quantity2;
      psTmt = connecTion.prepareStatement(sqlParam);
      psTmt.setInt(1, dto.getQuantity());
      psTmt.setInt(2, dto.getNum());
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
      sqlParam = "insert into product(num,name,code,price,stock,detail,comp,regDate,imageFile) ";
      sqlParam = sqlParam + "values(0,?, ?, ?, ?, ?, ?,NOW(),?)";
      psTmt = connecTion.prepareStatement(sqlParam);
      psTmt.setString(1, mul.getParameter("name"));
      psTmt.setString(2, mul.getParameter("code"));
      psTmt.setInt(3, Integer.parseInt(mul.getParameter("price")));
      psTmt.setInt(4, Integer.parseInt(mul.getParameter("stock")));
      psTmt.setString(5, mul.getParameter("detail"));
      psTmt.setString(6, mul.getParameter("comp"));
      if (mul.getFilesystemName("imageFile") != null) {
        psTmt.setString(7, mul.getFilesystemName("imageFile"));
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
  public boolean getUpdate (HttpServletRequest request)  {
    boolean re = false;
    try {
      connecTion = getConnection();
      String realPath = request.getServletContext().getRealPath("/");
      String uploadPath = realPath + "/imgs/";
      uploadPath = "C:\\_imgs\\shop_upload\\";
      int size = 5 * 1024 * 1024;
      MultipartRequest mul = new MultipartRequest(request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());
      if (mul.getFilesystemName("imageFile") == null) {
        sqlParam = "update product set name?, stock?, detail?, price?, code?, comp?where num?";
        psTmt = connecTion.prepareStatement(sqlParam);
        psTmt.setString(1, mul.getParameter("name"));
        psTmt.setInt(2, Integer.parseInt(mul.getParameter("stock")));
        psTmt.setString(3, mul.getParameter("detail"));
        psTmt.setInt(4, Integer.parseInt(mul.getParameter("price")));
        psTmt.setString(5, mul.getParameter("code"));
        psTmt.setString(6, mul.getParameter("comp"));
        psTmt.setInt(7, Integer.parseInt(mul.getParameter("num")));
      }
      else {
        int im_num = Integer.parseInt(mul.getParameter("num"));
        String sqlParam2 = "select imageFile from product where num=" + im_num;
        sTmt = connecTion.createStatement();
        resultSet = sTmt.executeQuery(sqlParam2);
        if (resultSet.next()) {
          File f = new File(uploadPath + resultSet.getString("imageFile"));
          if (f.isFile()) {
            f.delete();
          }
        }
        resultSet.close();
        sqlParam = "update product set name?,stock?,detail?,price?, code?, comp?, imageFile?where num?";
        psTmt = connecTion.prepareStatement(sqlParam);
        psTmt.setString(1, mul.getParameter("name"));
        psTmt.setInt(2, Integer.parseInt(mul.getParameter("stock")));
        psTmt.setString(3, mul.getParameter("detail"));
        psTmt.setInt(4, Integer.parseInt(mul.getParameter("price")));
        psTmt.setString(5, mul.getParameter("code"));
        psTmt.setString(6, mul.getParameter("comp"));
        psTmt.setString(7, mul.getFilesystemName("imageFile"));
        psTmt.setInt(8, Integer.parseInt(mul.getParameter("num")));
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
  public boolean getDelete (HttpServletRequest request, int num)  {
    boolean re = false;
    try {
      connecTion = getConnection();
      String realPath = request.getServletContext().getRealPath("/");
      String uploadPath = realPath + "/imgs/";
      uploadPath = "C:\\_imgs\\shop_upload\\";
      sqlParam = "select imageFile from product where num=" + num;
      sTmt = connecTion.createStatement();
      resultSet = sTmt.executeQuery(sqlParam);
      if (resultSet.next()) {
        File f = new File(uploadPath + resultSet.getString("imageFile"));
        if (f.isFile()) {
          f.delete();
        }
      }

      sqlParam = "delete from product where num=" + num;
      psTmt = connecTion.prepareStatement(sqlParam);
      int count = psTmt.executeUpdate();
      if (count > 0) {
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
