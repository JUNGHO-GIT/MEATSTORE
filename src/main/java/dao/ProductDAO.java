package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import dto.ProductDTO;
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
        dto.setContent(resultSet.getString("content"));
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
        dto.setContent(resultSet.getString("content"));
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
  public List<ProductDTO> listSearch(int start, int count, String name, String content) {
    List<ProductDTO> list = new ArrayList<>();
    try {
      connecTion = getConnection();
      String selectClause = "SELECT * FROM product";
      String whereClause = "";
      if (name != null) {
        whereClause += " WHERE name LIKE ?";
      }
      if (content != null) {
        if (whereClause.isEmpty()) {
          whereClause += " WHERE content LIKE ?";
        }
        else {
          whereClause += " AND content LIKE ?";
        }
      }

      String orderByClause = " ORDER BY ref DESC, re_indent ASC LIMIT ?, ?";
      String sqlParam = selectClause + whereClause + orderByClause;
      psTmt = connecTion.prepareStatement(sqlParam);
      int paramIndex = 1;

      if (name != null) {
        psTmt.setString(paramIndex++, "%" + name + "%");
      }
      if (content != null) {
        psTmt.setString(paramIndex++, "%" + content + "%");
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
        dto.setContent(resultSet.getString("content"));
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
        dto.setContent(resultSet.getString("content"));
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
  public void insertProduct (ProductDTO dto)  {
    int num = dto.getNum();
    int ref = dto.getRef();
    int re_step = dto.getRe_step();
    int re_indent = dto.getRe_indent();
    int number = 0;
    try {
      connecTion = getConnection();
      psTmt = connecTion.prepareStatement("select max(num) from product");
      resultSet = psTmt.executeQuery();
      if (resultSet.next()) {
        number = resultSet.getInt(1) + 1;
      }
      else {
        number = 1;
      }
      if (num != 0) {
        sqlParam = "update product set re_step = re_step+1 where ref=? and re_step>?";
        psTmt = connecTion.prepareStatement(sqlParam);
        psTmt.setInt(1, ref);
        psTmt.setInt(2, re_step);
        psTmt.executeUpdate();
        re_step = re_step + 1;
        re_indent = re_indent + 1;
      }
      else {
        ref = number;
        re_step = 0;
        re_indent = 0;
      }
      sqlParam = "insert into product(code, name, price, stock, content, comp, views, ref, re_step, re_indent, regDate, imageFile)";
      sqlParam = sqlParam + " values(?,?,?,?,?,?,?,?,?,?,NOW(),?)";
      psTmt = connecTion.prepareStatement(sqlParam);
      psTmt.setString(1, dto.getCode());
      psTmt.setString(2, dto.getName());
      psTmt.setInt(3, dto.getPrice());
      psTmt.setInt(4, dto.getStock());
      psTmt.setString(5, dto.getContent());
      psTmt.setString(6, dto.getComp());
      psTmt.setInt(7, dto.getViews());
      psTmt.setInt(8, ref);
      psTmt.setInt(9, re_step);
      psTmt.setInt(10, re_indent);
      psTmt.setString(11, dto.getImageFile());
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
  public ProductDTO getUpdate (int num)  {
    ProductDTO dto = null;
    try {
      connecTion = getConnection();
      psTmt = connecTion.prepareStatement("select * from product where num=" + num);
      resultSet = psTmt.executeQuery();
      if (resultSet.next()) {
        dto = new ProductDTO();
        dto.setNum(resultSet.getInt("num"));
        dto.setCode(resultSet.getString("code"));
        dto.setName(resultSet.getString("name"));
        dto.setPrice(resultSet.getInt("price"));
        dto.setStock(resultSet.getInt("stock"));
        dto.setContent(resultSet.getString("content"));
        dto.setComp(resultSet.getString("comp"));
        dto.setRef(resultSet.getInt("ref"));
        dto.setRe_step(resultSet.getInt("re_step"));
        dto.setRe_indent(resultSet.getInt("re_indent"));
        dto.setRegDate(resultSet.getTimestamp("regDate"));
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
  public int updateProduct (ProductDTO dto) {
    try {
      connecTion = getConnection();
      psTmt = connecTion.prepareStatement("select num from product where num=?");
      psTmt.setInt(1, dto.getNum());
      resultSet = psTmt.executeQuery();
      if (resultSet.next()) {
        sqlParam = "update product set code=?, name=?, price=?, stock=?, content=?, comp=?, views=?, imageFile=? where num=?";
        psTmt = connecTion.prepareStatement(sqlParam);
        psTmt.setString(1, dto.getCode());
        psTmt.setString(2, dto.getName());
        psTmt.setInt(3, dto.getPrice());
        psTmt.setInt(4, dto.getStock());
        psTmt.setString(5, dto.getContent());
        psTmt.setString(6, dto.getComp());
        psTmt.setInt(7, dto.getViews());
        psTmt.setString(8, dto.getImageFile());
        psTmt.setInt(9, dto.getNum());
        psTmt.executeUpdate();
        checkParam = 1;
      }
      else {
        checkParam = -1;
      }
    }
    catch (Exception ex) {
      System.out.println("Exception occurred: " + ex.getMessage());
    }
    finally {
      exceptionHandling();
    }
    return checkParam;
  }

  // ---------------------------------------------------------------------------------------------->
  public int getDelete (int num, String pw)  {
    try {
      connecTion = getConnection();
      psTmt = connecTion.prepareStatement("select pw from product where num=?");
      psTmt.setInt(1, num);
      resultSet = psTmt.executeQuery();
      if (resultSet.next()) {
        dbPw = resultSet.getString("pw");
        if (pw.equals(dbPw)) {
          sqlParam = "delete from product where num=?";
          psTmt = connecTion.prepareStatement(sqlParam);
          psTmt.setInt(1, num);
          psTmt.executeUpdate();
          checkParam = 1;
        }
        else {
          checkParam = -1;
        }
      }
    }
    catch (Exception ex) {
      System.out.println("Exception occurred: " + ex.getMessage());
    }
    finally {
      exceptionHandling();
    }
    return checkParam;
  }
}
