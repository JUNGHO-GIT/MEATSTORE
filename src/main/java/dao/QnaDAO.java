package dao;

import java.sql.*;
import java.util.*;
import javax.naming.*;
import javax.sql.*;
import dao.QnaDAO;
import dto.QnaDTO;

public class QnaDAO {

  Connection con = null;
  PreparedStatement pstmt = null;
  Statement stmt = null;
  ResultSet rs = null;
  String sql = "";

  private QnaDAO() {}

  private static QnaDAO instance = new QnaDAO();

  public static QnaDAO getInstance() {
    return instance;
  }

  private Connection getCon() throws Exception {
    Context ct = new InitialContext();
    DataSource ds = (DataSource) ct.lookup("java:comp/env/jdbc/mysql");
    return ds.getConnection();
  }

  public void insertQna(QnaDTO dto) {
    int num = dto.getNum();
    int ref = dto.getRef();
    int re_step = dto.getRe_step();
    int re_indent = dto.getRe_indent();

    int number = 0;

    try {
      con = getCon();

      pstmt = con.prepareStatement("select max(num) from qna");

      rs = pstmt.executeQuery();

      if (rs.next()) {
        number = rs.getInt(1) + 1;
      }
        else {
        number = 1;
      }

      if (num != 0) {
        sql = "update qna set re_step=re_step+1 where ref=? and re_step>?";

        pstmt = con.prepareStatement(sql);

        pstmt.setInt(1, ref);
        pstmt.setInt(2, re_step);
        pstmt.executeUpdate();

        re_step = re_step + 1;
        re_indent = re_indent + 1;
      }
        else {
        ref = number;
        re_step = 0;
        re_indent = 0;
      }

      sql =
        "insert into qna(writer,subject,content,pw,regdate,ref,re_step,re_indent)";
      sql = sql + " values(?,?,?,?,NOW(),?,?,?)";

      pstmt = con.prepareStatement(sql);

      pstmt.setString(1, dto.getWriter());
      pstmt.setString(2, dto.getSubject());
      pstmt.setString(3, dto.getContent());
      pstmt.setString(4, dto.getPw());

      pstmt.setInt(5, ref);
      pstmt.setInt(6, re_step);
      pstmt.setInt(7, re_indent);

      pstmt.executeUpdate();
    }
    catch (Exception ex) {
      System.out.println("insertqna()예외 :" + ex);
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
  }

  public int getCount() {
    int cnt = 0;
    try {
      con = getCon();
      pstmt = con.prepareStatement("select count(*) from qna");
      rs = pstmt.executeQuery();

      if (rs.next()) {
        cnt = rs.getInt(1);
      }
    }
    catch (Exception ex) {
      System.out.println("getCount() 예외 :" + ex);
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

  public List getList(int start, int cnt) {
    List<QnaDTO> list = null;
    try {
      con = getCon();
      sql = "select * from qna order by ref desc, re_step asc limit ?,?";

      pstmt = con.prepareStatement(sql);
      pstmt.setInt(1, start - 1);
      pstmt.setInt(2, cnt);
      rs = pstmt.executeQuery();

      while (rs.next()) {
        list = new ArrayList<QnaDTO>();
        do {
          QnaDTO dto = new QnaDTO();

          dto.setNum(rs.getInt(1));

          dto.setWriter(rs.getString("writer"));
          dto.setSubject(rs.getString("subject"));
          dto.setContent(rs.getString("content"));
          dto.setPw(rs.getString("pw"));

          dto.setRegdate(rs.getTimestamp("regdate"));

          dto.setViews(rs.getInt("views"));
          dto.setRef(rs.getInt("ref"));
          dto.setRe_step(rs.getInt("re_step"));
          dto.setRe_indent(rs.getInt("re_indent"));

          list.add(dto);
        } while (rs.next());
      }
    }
    catch (Exception ex) {
      System.out.println("getList() 예외 :" + ex);
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

  public int getCount(String keyword, String search) {
    int cnt = 0;
    try {
      con = getCon();
      pstmt =
        con.prepareStatement(
          "select count(*) from qna where " +
          keyword +
          " like '%" +
          search +
          "%'"
        );

      rs = pstmt.executeQuery();

      if (rs.next()) {
        cnt = rs.getInt(1);
      }
    }
    catch (Exception ex) {
      System.out.println("getCount() 매개변수 예외: " + ex);
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

  public List<QnaDTO> searchList(
    int start,
    int cnt,
    String subject,
    String writer
  ) {
    List<QnaDTO> list = null;
    try {
      con = getCon();

      String selectClause = "select * from qna ";
      String whereClause = "";
      String orderByClause = " order by ref desc, re_step asc limit ?,?";

      if (subject != null) {
        whereClause += " where subject like ?";
      }

      if (writer != null) {
        whereClause += " where writer like ?";
      }

      sql = selectClause + whereClause + orderByClause;

      pstmt = con.prepareStatement(sql);
      if (subject != null) {
        pstmt.setString(1, "%" + subject + "%");
      }

      if (writer != null) {
        pstmt.setString(1, "%" + writer + "%");
      }
      pstmt.setInt(2, start - 1);
      pstmt.setInt(3, cnt);
      rs = pstmt.executeQuery();

      while (rs.next()) {
        list = new ArrayList<QnaDTO>();
        do {
          QnaDTO dto = new QnaDTO();

          dto.setNum(rs.getInt(1));

          dto.setWriter(rs.getString("writer"));
          dto.setSubject(rs.getString("subject"));
          dto.setContent(rs.getString("content"));
          dto.setPw(rs.getString("pw"));

          dto.setRegdate(rs.getTimestamp("regdate"));

          dto.setViews(rs.getInt("views"));
          dto.setRef(rs.getInt("ref"));
          dto.setRe_step(rs.getInt("re_step"));
          dto.setRe_indent(rs.getInt("re_indent"));

          list.add(dto);
        } while (rs.next());
      }
    }
    catch (Exception ex) {
      System.out.println("getList() 예외 :" + ex);
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

  public QnaDTO getQna(int num) {
    QnaDTO dto = null;

    try {
      con = getCon();

      sql = "update qna set views=views+1 where num=" + num;
      pstmt = con.prepareStatement(sql);
      pstmt.executeUpdate();

      pstmt = con.prepareStatement("select * from qna where num=" + num);
      rs = pstmt.executeQuery();

      if (rs.next()) {
        dto = new QnaDTO();

        dto.setNum(rs.getInt("num"));
        dto.setWriter(rs.getString("writer"));
        dto.setSubject(rs.getString("subject"));
        dto.setContent(rs.getString("content"));
        dto.setPw(rs.getString("pw"));

        dto.setRegdate(rs.getTimestamp("regdate"));
        dto.setViews(rs.getInt("views"));

        dto.setRef(rs.getInt("ref"));
        dto.setRe_step(rs.getInt("re_step"));
        dto.setRe_indent(rs.getInt("re_indent"));
      }
    }
    catch (Exception ex) {
      System.out.println("getqna() 예외 :" + ex);
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

  public QnaDTO getUpdate(int num) {
    QnaDTO dto = null;

    try {
      con = getCon();
      pstmt = con.prepareStatement("select * from qna where num=" + num);
      rs = pstmt.executeQuery();

      if (rs.next()) {
        dto = new QnaDTO();

        dto.setNum(rs.getInt("num"));
        dto.setWriter(rs.getString("writer"));
        dto.setSubject(rs.getString("subject"));
        dto.setContent(rs.getString("content"));
        dto.setPw(rs.getString("pw"));

        dto.setRegdate(rs.getTimestamp("regdate"));
        dto.setViews(rs.getInt("views"));

        dto.setRef(rs.getInt("ref"));
        dto.setRe_step(rs.getInt("re_step"));
        dto.setRe_indent(rs.getInt("re_indent"));
      }
    }
    catch (Exception ex) {
      System.out.println("getUpdate() 예외 :" + ex);
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

  public int updateQna(QnaDTO dto) {
    int x = -100;
    String dbpw = "";
    try {
      con = getCon();
      pstmt = con.prepareStatement("select pw from qna where num=?");
      pstmt.setInt(1, dto.getNum());
      rs = pstmt.executeQuery();

      if (rs.next()) {
        dbpw = rs.getString("pw");

        if (dto.getPw().equals(dbpw)) {
          sql = "update qna set writer=?,subject=?, content=? where num=?";
          pstmt = con.prepareStatement(sql);

          pstmt.setString(1, dto.getWriter());
          pstmt.setString(2, dto.getSubject());
          pstmt.setString(3, dto.getContent());
          pstmt.setInt(4, dto.getNum());

          pstmt.executeUpdate();
          x = 1;
        }
        else {
          x = -1;
        }
      }
    }
    catch (Exception ex) {
      System.out.println("updateqna() 예외 :" + ex);
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

    return x;
  }

  public int deleteQnA(int num, String pw) {
    String dbpw = "";
    int x = -100;

    try {
      con = getCon();

      pstmt = con.prepareStatement("select pw from qna where num=" + num);
      rs = pstmt.executeQuery();

      if (rs.next()) {
        dbpw = rs.getString("pw");
        if (pw.equals(dbpw)) {
          pstmt = con.prepareStatement("delete from qna where num=" + num);
          pstmt.executeUpdate();
          x = 1;
        }
        else {
          x = -1;
        }
      }
    }
    catch (Exception ex) {
      System.out.println("deleteQnA() 예외 :" + ex);
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

    return x;
  }
}
