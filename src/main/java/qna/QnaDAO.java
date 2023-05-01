package qna;

import java.sql.*;//Connection, Statement,PreparedStatement,ResultSet

import javax.sql.*;//DataSource
import javax.naming.*;//lookup

import qna.QnaDAO;
import qna.QnaDTO;

import java.util.*;//List,ArrayList

public class QnaDAO {

	Connection con = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet rs = null;
	String sql = "";

	private QnaDAO() {
	}

	private static QnaDAO instance = new QnaDAO();

	public static QnaDAO getInstance() {
		return instance;
	}

	// --------------------
	// 커넥션 얻기
	// --------------------
	private Connection getCon() throws Exception {
		Context ct = new InitialContext();
		DataSource ds = (DataSource) ct.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}

	// ----------------------
	// 글 작성
	// ----------------------
	public void insertQna(QnaDTO dto) {

		int num = dto.getNum();
		int ref = dto.getRef();
		int re_step = dto.getRe_step();
		int re_indent = dto.getRe_indent();

		int number = 0;

		try {
			con = getCon();

			pstmt = con.prepareStatement("select max(num) from qna");
			// pstmt=con.prepareStatement("select num,writer from qna");
			// 커넥션을 받아온 후, qna의 가장 큰 num을 가져오는 sql구문을 준비해둔다.
			rs = pstmt.executeQuery();

			if (rs.next()) {
				number = rs.getInt(1) + 1;
				// 만약 qna리스트를 읽어온다면, 총 글 수에서 1을 더한다.
			} else {
				number = 1;/// ref=number
				// 만약 글이 없어서 읽어올 것이 없다면, number(글번호)는 1로 고정한다.
			}

			if (num != 0) {
				// 만약 num이 0이 아니라면 (답글이라고한다면)
				sql = "update qna set re_step=re_step+1 where ref=? and re_step>?";
				// qna테이블을 글 순서=글순서+1 로 업데이트하라
				// where 글 묶음번호가 ?이고, 글 순서가 ?보다 클 때만.
				pstmt = con.prepareStatement(sql);

				pstmt.setInt(1, ref);
				pstmt.setInt(2, re_step);
				pstmt.executeUpdate();

				re_step = re_step + 1;// ***
				re_indent = re_indent + 1;// ***

			} else {
				ref = number;
				re_step = 0;
				re_indent = 0;
			}

			// insert
			sql = "insert into qna(writer,subject,content,pw,regdate,ref,re_step,re_indent)";
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

		} catch (Exception ex) {
			System.out.println("insertqna()예외 :" + ex);
		} finally {
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
			} catch (Exception ex2) {
			}
		}
	}

	// -----------------
	// 글 개수 (페이지 처리, 블럭 처리)
	// -----------------
	public int getCount() {
		int cnt = 0;
		try {
			con = getCon();// 커넥션 얻기
			pstmt = con.prepareStatement("select count(*) from qna");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				cnt = rs.getInt(1);// 필드 번호
			}
		} catch (Exception ex) {
			System.out.println("getCount() 예외 :" + ex);
		} finally {
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
			} catch (Exception ex2) {
			}
		}

		return cnt;
	}
		// ---------------
		// 리스트
		// ----------------

	public List getList(int start, int cnt) {
		List<QnaDTO> list = null;
		try {
			con = getCon();// 커넥션 얻기
			sql = "select * from qna order by ref desc, re_step asc limit ?,?";
			// limit ?,?
			// limit 시작 위치, 개수

			pstmt = con.prepareStatement(sql);// 생성시 인자가 들어간다
			pstmt.setInt(1, start - 1);// mysql 0부터
			pstmt.setInt(2, cnt);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// rs내용을 dto에 담는다, dto를 list로 return list
				list = new ArrayList<QnaDTO>();
				do {
					QnaDTO dto = new QnaDTO();

					dto.setNum(rs.getInt(1));// num

					dto.setWriter(rs.getString("writer"));
					dto.setSubject(rs.getString("subject"));
					dto.setContent(rs.getString("content"));
					dto.setPw(rs.getString("pw"));

					dto.setRegdate(rs.getTimestamp("regdate"));

					dto.setViews(rs.getInt("views"));
					dto.setRef(rs.getInt("ref"));
					dto.setRe_step(rs.getInt("re_step"));
					dto.setRe_indent(rs.getInt("re_indent"));

					list.add(dto);// ****
				} while (rs.next());

			}
		} catch (Exception ex) {
			System.out.println("getList() 예외 :" + ex);
		} finally {
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
			} catch (Exception ex2) {
			}
		}
		return list;// *************

	}

	//--------------------
		//검색용 리스트 재배열
	//-------------------


		public int getCount(String keyword, String search){
	        int cnt=0;
	        try{
	           con=getCon();
	           pstmt=con.prepareStatement("select count(*) from qna where " +keyword+ " like '%"+search+"%'");

	           rs=pstmt.executeQuery();

	           if(rs.next()){
	              cnt=rs.getInt(1);
	           }

	        }catch(Exception ex){
	           System.out.println("getCount() 매개변수 예외: "+ex);
	        }finally{
	           try{
	              if(rs!=null){rs.close();}
	              if(pstmt!=null){pstmt.close();}
	              if(con!=null){con.close();}
	           }catch(Exception ex2){}
	        }

	        return cnt;
	     }



	//__________________________

	//서치 결과물 출력
	//___________________

	public List<QnaDTO> searchList(int start, int cnt, String subject, String writer) {
		List<QnaDTO> list = null;
		try {
			con = getCon();// 커넥션 얻기
			//sql = "select * from qna order by ref desc, re_step asc limit ?,?";


			String selectClause = "select * from qna ";
			String whereClause = "";
			String orderByClause = " order by ref desc, re_step asc limit ?,?";

			if (subject != null) {
				whereClause += " where subject like ?";

			}

			if (writer != null) {
				whereClause += " where writer like ?";
			}
			// limit ?,?
			// limit 시작 위치, 개수

			sql = selectClause + whereClause + orderByClause;

			pstmt = con.prepareStatement(sql);// 생성시 인자가 들어간다
			if (subject != null) {
				pstmt.setString(1, "%" + subject + "%");
			}

			if (writer != null) {
				pstmt.setString(1, "%" + writer  + "%");
			}
			pstmt.setInt(2, start - 1);// mysql 0부터
			pstmt.setInt(3, cnt);
			rs = pstmt.executeQuery();


			while (rs.next()) {
				// rs내용을 dto에 담는다, dto를 list로 return list
				list = new ArrayList<QnaDTO>();
				do {
					QnaDTO dto = new QnaDTO();

					dto.setNum(rs.getInt(1));// num

					dto.setWriter(rs.getString("writer"));
					dto.setSubject(rs.getString("subject"));
					dto.setContent(rs.getString("content"));
					dto.setPw(rs.getString("pw"));

					dto.setRegdate(rs.getTimestamp("regdate"));

					dto.setViews(rs.getInt("views"));
					dto.setRef(rs.getInt("ref"));
					dto.setRe_step(rs.getInt("re_step"));
					dto.setRe_indent(rs.getInt("re_indent"));

					list.add(dto);// ****
				} while (rs.next());

			}
		} catch (Exception ex) {
			System.out.println("getList() 예외 :" + ex);
		} finally {
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
			} catch (Exception ex2) {
			}
		}
		return list;// *************

	}

	// -------------------------------------
	// 조회수 증가, 글 내용 보기
	// -------------------------------------
	public QnaDTO getQna(int num) {
		QnaDTO dto = null;

		try {
			con = getCon();

			// 조회수 증가
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
		} catch (Exception ex) {
			System.out.println("getqna() 예외 :" + ex);
		} finally {
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
			} catch (Exception ex2) {
			}
		}
		return dto;
	}

	// ------------------
	// 글 수정 폼
	// ------------------
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
		} catch (Exception ex) {
			System.out.println("getUpdate() 예외 :" + ex);
		} finally {
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
			} catch (Exception ex2) {
			}
		}

		return dto;
	}
		// ---------------
		// DB글 수정
		// ----------------

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
				} else {
					x = -1;
				}
			} // if
		} catch (Exception ex) {
			System.out.println("updateqna() 예외 :" + ex);
		} finally {
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
			} catch (Exception ex2) {
			}
		}

		return x;
	}

	// -------------------
	// 공지사항 삭제
	// -------------------
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
				} else {
					x = -1;
				}
			}

		} catch (Exception ex) {
			System.out.println("deleteQnA() 예외 :" + ex);
		} finally {
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
			} catch (Exception ex2) {
			}
		}

		return x;
	}

}
