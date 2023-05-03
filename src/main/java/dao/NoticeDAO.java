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
import dto.NoticeDTO;

public class NoticeDAO {

  Connection con = null;
  PreparedStatement pstmt = null;
  Statement stmt = null;
  ResultSet rs = null;
  String sql = "";

  private NoticeDAO() {}

  private static NoticeDAO instance = new NoticeDAO();

  public static NoticeDAO getInstance() {
    return instance;
  }

  private Connection getCon() throws Exception {
    Context ct = new InitialContext();
    DataSource ds = (DataSource) ct.lookup("java:comp/env/jdbc/mysql");
    return ds.getConnection();
  }

  public void insertNotice(NoticeDTO dto) {
    try {
      con = getCon();
      sql = "insert into notice(num,writer,title,content,pw,regdate,readcount)";
      sql = sql + " values(0,?,?,?,?,NOW(),?)";

      pstmt = con.prepareStatement(sql);
      pstmt.setString(1, dto.getWriter());
      pstmt.setString(2, dto.getTitle());
      pstmt.setString(3, dto.getContent());
      pstmt.setString(4, dto.getPw());
      pstmt.setInt(5, dto.getReadcount());

      pstmt.executeUpdate();
    }
    catch (Exception ex) {
      System.out.println("insertNotice()예외 :" + ex);
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
      catch (Exception ex2) {
        System.out.println("insertNotice() close 예외 :" + ex2);
      }
    }
  }

  public int getCount() {
    int cnt = 0;
    try {
      con = getCon();
      pstmt = con.prepareStatement("select count(*) from notice");
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
      catch (Exception ex2) {
        System.out.println("getCount() close 예외 :" + ex2);
      }
    }

    return cnt;
  }

  public int getCount(String keyword, String search) {
    int cnt = 0;
    try {
      con = getCon();
      pstmt =
        con.prepareStatement(
          "select count(*) from notice where " +
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
      catch (Exception ex2) {
        System.out.println("getCount() close 예외 :" + ex2);
      }
    }

    return cnt;
  }

  public List getList(int start, int cnt) {
    List<NoticeDTO> list = null;
    try {
      con = getCon();

      sql = "select * from notice order by num desc limit ?,?";

      pstmt = con.prepareStatement(sql);
      pstmt.setInt(1, start - 1);
      pstmt.setInt(2, cnt);
      rs = pstmt.executeQuery();

      list = new ArrayList<NoticeDTO>();
      while (rs.next()) {
        do {
          NoticeDTO dto = new NoticeDTO();

          dto.setNum(rs.getInt(1));
          dto.setWriter(rs.getString(2));
          dto.setTitle(rs.getString("title"));
          dto.setContent(rs.getString("content"));
          dto.setPw(rs.getString("pw"));
          dto.setRegdate(rs.getTimestamp("regdate"));
          dto.setReadcount(rs.getInt("readcount"));

          dto.setIp(rs.getString("ip"));

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
      catch (Exception ex2) {
        System.out.println("getList() close 예외 :" + ex2);
      }
    }
    return list;
  }

  public List<NoticeDTO> searchList(
    int start,
    int cnt,
    String title,
    String writer
  ) {

    // 초기화를 먼저 수행합니다.
    List<NoticeDTO> list = new ArrayList<>();
    try {
      con = getCon();

      String selectClause = "select * from notice ";
      String whereClause = "";
      String orderByClause = " order by num desc limit ?,?";

      boolean hasTitle = title != null && !title.trim().isEmpty(); // 조건 확인을 변수로 추출
      boolean hasWriter = writer != null && !writer.trim().isEmpty(); // 조건 확인을 변수로 추출

      if (hasTitle) {
        whereClause += " where title like ?";
      }

      if (hasWriter) {
        whereClause += hasTitle ? " and writer like ?" : " where writer like ?";
      }

      sql = selectClause + whereClause + orderByClause;

      pstmt = con.prepareStatement(sql);
      int parameterIndex = 1; // 파라미터 인덱스 변수 추가
      if (hasTitle) {
        pstmt.setString(parameterIndex++, "%" + title + "%");
      }

      if (hasWriter) {
        pstmt.setString(parameterIndex++, "%" + writer + "%");
      }
      pstmt.setInt(parameterIndex++, start - 1);
      pstmt.setInt(parameterIndex, cnt);
      rs = pstmt.executeQuery();

      while (rs.next()) {
        NoticeDTO dto = new NoticeDTO();

        dto.setNum(rs.getInt(1));
        dto.setWriter(rs.getString("writer"));
        dto.setTitle(rs.getString("title"));
        dto.setContent(rs.getString("content"));
        dto.setPw(rs.getString("pw"));
        dto.setRegdate(rs.getTimestamp("regdate"));
        dto.setReadcount(rs.getInt("readcount"));
        dto.setIp(rs.getString("ip"));

        list.add(dto);
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
      catch (Exception ex2) {
        System.out.println("getList() close 예외 :" + ex2);
      }
    }
    return list;
  }


  public NoticeDTO getNotice(int num) {
    NoticeDTO dto = null;
    try {
      con = getCon();

      sql = "update notice set readcount=readcount+1 where num=" + num;
      pstmt = con.prepareStatement(sql);
      pstmt.executeUpdate();

      pstmt = con.prepareStatement("select * from notice where num=" + num);
      rs = pstmt.executeQuery();

      if (rs.next()) {
        dto = new NoticeDTO();

        dto.setNum(rs.getInt("num"));
        dto.setWriter(rs.getString("writer"));
        dto.setTitle(rs.getString("title"));
        dto.setRegdate(rs.getDate("regdate"));
        dto.setContent(rs.getString("content"));

        dto.setReadcount(rs.getInt("readcount"));
      }
    }
    catch (Exception ex) {
      System.out.println("getNotice() 예외 :" + ex);
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

  public NoticeDTO getUpdate(int num) {
    NoticeDTO dto = null;
    try {
      con = getCon();
      pstmt = con.prepareStatement("select * from notice where num=" + num);
      rs = pstmt.executeQuery();

      if (rs.next()) {
        dto = new NoticeDTO();

        dto.setNum(rs.getInt("num"));
        dto.setWriter(rs.getString("writer"));
        dto.setTitle(rs.getString("Title"));
        dto.setContent(rs.getString("content"));
        dto.setPw(rs.getString("pw"));
        dto.setRegdate(rs.getTimestamp("regdate"));
        dto.setReadcount(rs.getInt("readcount"));

        dto.setIp(rs.getString("ip"));
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

  public int updateNotice(NoticeDTO dto) {
    int x = -100;

    String dbpw = "";

    try {
      con = getCon();
      pstmt = con.prepareStatement("select pw from notice where num=?");
      pstmt.setInt(1, dto.getNum());
      rs = pstmt.executeQuery();

      if (rs.next()) {
        dbpw = rs.getString("pw");

        if (dto.getPw().equals(dbpw)) {
          sql = "update notice set writer=?,title=?,content=? where num=?";
          pstmt = con.prepareStatement(sql);

          pstmt.setString(1, dto.getWriter());
          pstmt.setString(2, dto.getTitle());
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
      System.out.println("updateNotice() 예외 :" + ex);
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

  public int deleteNotice(int num, String pw) {
    String dbpw = "";
    int x = -100;

    try {
      con = getCon();
      pstmt = con.prepareStatement("select pw from notice where num=" + num);
      rs = pstmt.executeQuery();

      if (rs.next()) {
        dbpw = rs.getString("pw");
        if (pw.equals(dbpw)) {
          pstmt = con.prepareStatement("delete from notice where num=" + num);
          pstmt.executeUpdate();
          x = 1;
        }
        else {
          x = -1;
        }
      }
    }
    catch (Exception ex) {
      System.out.println("deleteNotice() 예외 :" + ex);
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
