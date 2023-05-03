package dao;

import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.*;
import dto.OrderListDTO;
import dto.ProductDTO;
import java.io.File;
import java.sql.*;
import java.util.*;
import javax.naming.*;
import javax.servlet.http.*;
import javax.sql.*;

public class ProductDAO {

  private ProductDAO() {}

  private static ProductDAO instance = new ProductDAO();

  public static ProductDAO getInstance() {
    return instance;
  }

  private Connection getCon() throws Exception {
    Context ct = new InitialContext();
    DataSource ds = (DataSource) ct.lookup("java:comp/env/jdbc/mysql");
    return ds.getConnection();
  }

  Connection con = null;
  Statement stmt = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  String sql = "";

  public List getGoodList() {
    List<ProductDTO> list = new ArrayList<ProductDTO>();
    try {
      con = getCon();
      sql = "select * from product";
      stmt = con.createStatement();
      rs = stmt.executeQuery(sql);

      while (rs.next()) {
        ProductDTO dto = new ProductDTO();

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
    }
    catch (Exception ex) {
    }
    finally {
      try {
        if (rs != null) {
          rs.close();
        }
        if (stmt != null) {
          stmt.close();
        }
        if (con != null) {
          con.close();
        }
      }
    catch (Exception ex2) {}
    }
    return list;
  }

  public int getCount() {
    int cnt = 0;
    try {
      con = getCon();
      pstmt = con.prepareStatement("select count(*) from product");
      rs = pstmt.executeQuery();

      if (rs.next()) {
        cnt = rs.getInt(1);
      }
    }
    catch (Exception ex) {
      System.out.println("getCount() error : " + ex);
    }
    finally {
      try {
        if (rs != null) {
          rs.close();
        }
        if (pstmt != null) {
          pstmt.close();
        }
        if (con != null) {
          con.close();
        }
      }
    catch (Exception ex2) {}
    }
    return cnt;
  }

  public List getProductList(int start, int cnt) {
    List<ProductDTO> list = null;
    try {
      con = getCon();
      sql = "select*from product order by pro_no desc limit ?,?";
      pstmt = con.prepareStatement(sql);
      pstmt.setInt(1, start - 1);
      pstmt.setInt(2, cnt);
      rs = pstmt.executeQuery();

      while (rs.next()) {
        list = new ArrayList<ProductDTO>();
        do {
          ProductDTO dto = new ProductDTO();

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
        } while (rs.next());
      }
    }
    catch (Exception ex) {
      System.out.println("getProductList() error : " + ex);
    }
    finally {
      try {
        if (rs != null) {
          rs.close();
        }
        if (pstmt != null) {
          pstmt.close();
        }
        if (con != null) {
          con.close();
        }
      }
    catch (Exception ex2) {}
    }
    return list;
  }

  public ProductDTO getDetail(String code) {
    ProductDTO dto = new ProductDTO();
    try {
      con = getCon();
      sql = "select * from product where code='" + code + "'";
      stmt = con.createStatement();
      rs = stmt.executeQuery(sql);

      if (rs.next()) {
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
    }
    catch (Exception ex) {
      System.out.println("getDetail() error : " + ex);
    }
    finally {
      try {
        if (rs != null) {
          rs.close();
        }
        if (stmt != null) {
          stmt.close();
        }
        if (con != null) {
          con.close();
        }
      }
    catch (Exception ex2) {}
    }
    return dto;
  }

  public ProductDTO getProduct(int pro_no) {
    ProductDTO dto = null;
    try {
      con = getCon();
      sql = "select * from product where pro_no=" + pro_no;
      pstmt = con.prepareStatement(sql);
      rs = pstmt.executeQuery();

      while (rs.next()) {
        dto = new ProductDTO();

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
    }
    catch (Exception ex) {
      System.out.println("getProduct() error : " + ex);
    }
    finally {
      try {
        if (rs != null) {
          rs.close();
        }
        if (pstmt != null) {
          pstmt.close();
        }
        if (con != null) {
          con.close();
        }
      }
    catch (Exception ex2) {}
    }
    return dto;
  }

  public void reduceProduct(OrderListDTO dto) {
    int quantity2 = Integer.parseInt(dto.getQuantity());
    try {
      con = getCon();
      sql =
        "update product set stock=(stock-?) where pro_no=? and stock>=" +
        quantity2;
      pstmt = con.prepareStatement(sql);

      pstmt.setString(1, dto.getQuantity());
      pstmt.setInt(2, dto.getPro_no());

      pstmt.executeUpdate();
    }
    catch (Exception ex) {
      System.out.println("reduceProduct() error : " + ex);
    }
    finally {
      try {
        if (pstmt != null) {
          pstmt.close();
        }
        if (con != null) {
          con.close();
        }
      }
    catch (Exception ex2) {}
    }
  }

  public boolean insertProduct(HttpServletRequest request) {
    boolean re = false;

    try {
      con = getCon();
      String realpath = request.getServletContext().getRealPath("/");
      String uploadPath = realpath + "/imgs/";
      uploadPath = "C:\\_imgs\\shop_upload\\";

      MultipartRequest mul = new MultipartRequest(
        request,
        uploadPath,
        5 * 1024 * 1024,
        "UTF-8",
        new DefaultFileRenamePolicy()
      );
      sql = "insert into product(pro_no,name,code,price,stock,detail,comp,regdate,image) ";
      sql = sql + "values(0,?,?,?,?,?,?,NOW(),?)";

      pstmt = con.prepareStatement(sql);
      pstmt.setString(1, mul.getParameter("name"));
      pstmt.setString(2, mul.getParameter("code"));
      pstmt.setInt(3, Integer.parseInt(mul.getParameter("price")));
      pstmt.setInt(4, Integer.parseInt(mul.getParameter("stock")));
      pstmt.setString(5, mul.getParameter("detail"));
      pstmt.setString(6, mul.getParameter("comp"));

      if (mul.getFilesystemName("image") != null) {
        pstmt.setString(7, mul.getFilesystemName("image"));
      }
        else {
        pstmt.setString(7, "readt.gif");
      }

      int count = pstmt.executeUpdate();

      if (count == 1) {
        re = true;
      }
    }
    catch (Exception ex) {
      System.out.println("insertProduct() error : " + ex);
    }
    finally {
      try {
        if (pstmt != null) {
          pstmt.close();
        }
        if (con != null) {
          con.close();
        }
      }
    catch (Exception ex2) {}
    }
    return re;
  }

  public boolean updateProduct(HttpServletRequest request) {
    boolean re = false;
    try {
      con = getCon();
      String realPath = request.getServletContext().getRealPath("/");
      String uploadPath = realPath + "/imgs/";
      uploadPath = "C:\\_imgs\\shop_upload\\";
      int size = 5 * 1024 * 1024;

      MultipartRequest mul = new MultipartRequest(
        request,
        uploadPath,
        size,
        "UTF-8",
        new DefaultFileRenamePolicy()
      );

      if (mul.getFilesystemName("image") == null) {
        sql =
          "update product set name=?, stock=?, detail=?, price=?, code=?, comp=? where pro_no=?";
        pstmt = con.prepareStatement(sql);

        pstmt.setString(1, mul.getParameter("name"));
        pstmt.setInt(2, Integer.parseInt(mul.getParameter("stock")));
        pstmt.setString(3, mul.getParameter("detail"));
        pstmt.setInt(4, Integer.parseInt(mul.getParameter("price")));
        pstmt.setString(5, mul.getParameter("code"));
        pstmt.setString(6, mul.getParameter("comp"));

        pstmt.setInt(7, Integer.parseInt(mul.getParameter("pro_no")));
      }
        else {
        int im_pro_no = Integer.parseInt(mul.getParameter("pro_no"));
        String sql2 = "select image from product where pro_no=" + im_pro_no;
        stmt = con.createStatement();
        rs = stmt.executeQuery(sql2);

        if (rs.next()) {
          File f = new File(uploadPath + rs.getString("image"));
          if (f.isFile()) {
            f.delete();
          }
        }
        rs.close();

        sql =
          "update product set name=?,stock=?,detail=?,price=?, code=?, comp=?, image=? where pro_no=?";
        pstmt = con.prepareStatement(sql);

        pstmt.setString(1, mul.getParameter("name"));
        pstmt.setInt(2, Integer.parseInt(mul.getParameter("stock")));
        pstmt.setString(3, mul.getParameter("detail"));
        pstmt.setInt(4, Integer.parseInt(mul.getParameter("price")));
        pstmt.setString(5, mul.getParameter("code"));
        pstmt.setString(6, mul.getParameter("comp"));
        pstmt.setString(7, mul.getFilesystemName("image"));

        pstmt.setInt(8, Integer.parseInt(mul.getParameter("pro_no")));
      }

      int cnt = pstmt.executeUpdate();
      if (cnt == 1) {
        re = true;
      }
    }
    catch (Exception ex) {
      System.out.println("updateProduct()예외" + ex);
    }
    finally {
      try {
        if (rs != null) {
          rs.close();
        }
        if (stmt != null) {
          stmt.close();
        }
        if (pstmt != null) {
          pstmt.close();
        }
        if (con != null) {
          con.close();
        }
      }
    catch (Exception ex2) {}
    }

    return re;
  }

  public boolean deleteProduct(HttpServletRequest request, int pro_no) {
    boolean re = false;
    try {
      con = getCon();
      String realPath = request.getServletContext().getRealPath("/");
      String uploadPath = realPath + "/imgs/";

      uploadPath = "C:\\_imgs\\shop_upload\\";

      sql = "select image from product where pro_no=" + pro_no;
      stmt = con.createStatement();
      rs = stmt.executeQuery(sql);

      if (rs.next()) {
        File f = new File(uploadPath + rs.getString("image"));
        if (f.isFile()) {
          f.delete();
        }
      }

      sql = "delete from product where pro_no=" + pro_no;
      pstmt = con.prepareStatement(sql);

      int cnt = pstmt.executeUpdate();

      if (cnt > 0) {
        re = true;
      }
    }
    catch (Exception ex) {
      System.out.println("deleteProduct 예외" + ex);
    }
    finally {
      try {
        if (rs != null) {
          rs.close();
        }
        if (stmt != null) {
          stmt.close();
        }
        if (pstmt != null) {
          pstmt.close();
        }
        if (con != null) {
          con.close();
        }
      }
    catch (Exception ex2) {}
    }
    return re;
  }
}
