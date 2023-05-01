package notice;
import java.sql.*;//Connection, Statement,PreparedStatement,ResultSet

import javax.sql.*;//DataSource

import notice.*;

import javax.naming.*;//lookup

import java.util.*;//List,ArrayList

public class NoticeDAO {

	Connection con=null;
	PreparedStatement pstmt=null;
	Statement stmt=null;
	ResultSet rs=null;
	String sql="";

	private NoticeDAO(){}//생성자,외부에서 생성 못하게

	private static NoticeDAO instance=new NoticeDAO();//객체생성

	//JSP에서 사용할 메서드
	public static NoticeDAO getInstance(){
		return instance;//dao객체 리턴
	}

	//-------------------
	// 커넥션 얻기
	//-------------------

	private Connection getCon() throws Exception{
		Context ct=new InitialContext();
		DataSource ds=(DataSource)ct.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}

	//-------------
	// 글쓰기
	//-------------
	public void insertNotice(NoticeDTO dto){



		//-------------
		try{

			con=getCon();//커넥션 얻기
			sql="insert into notice(num,writer,title,content,pw,regdate,readcount)";
			sql=sql+" values(0,?,?,?,?,NOW(),?)";

			pstmt=con.prepareStatement(sql);//생성시 인자 들어간다
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPw());
			pstmt.setInt(5, dto.getReadcount());


			pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println("insertNotice()예외 :"+ex);
		}finally{
			try{
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception ex2){}
		}

	}

	//-----------------
	// 글 갯수 (페이지처리,블럭처리)
	//-----------------
	public int getCount(){
		int cnt=0;
		try{
			con=getCon();//커넥션 얻기
			pstmt=con.prepareStatement("select count(*) from notice") ;
			rs=pstmt.executeQuery();

			if(rs.next()){
				cnt=rs.getInt(1);//필드 번호
			}
		}catch(Exception ex){
			System.out.println("getCount() 예외 :"+ex);
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception ex2){}
		}

		return cnt;
	}

	//--------------------
	//검색용 리스트 재배열
	//-------------------


	public int getCount(String keyword, String search){
        int cnt=0;
        try{
           con=getCon();
           pstmt=con.prepareStatement("select count(*) from notice where " +keyword+ " like '%"+search+"%'");

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





	//---------------
	// 리스트
	//----------------
	public List getList(int start,int cnt){
		List<NoticeDTO> list=null;
		try{
			con=getCon();//커넥션 얻기



			sql="select * from notice order by num desc limit ?,?";//num desc
			//limit ?,?
			//limit 시작위치, 갯수

			pstmt=con.prepareStatement(sql);//생성시 인자 들어간다
			pstmt.setInt(1, start-1);//mysql  0부터
			pstmt.setInt(2, cnt);
			rs=pstmt.executeQuery();

			list=new ArrayList<NoticeDTO>();
			while(rs.next()){
				//rs내용을 dto에 담는다 , dto를 list에 담는다
			do{
				NoticeDTO dto=new NoticeDTO();

				dto.setNum(rs.getInt(1));
				dto.setWriter(rs.getString(2));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPw(rs.getString("pw"));
				dto.setRegdate(rs.getTimestamp("regdate"));//년월일 시분초
				dto.setReadcount(rs.getInt("readcount"));

				dto.setIp(rs.getString("ip"));

				list.add(dto);//****

			}while(rs.next());

			}
		}catch(Exception ex){
			System.out.println("getList() 예외 :"+ex);
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception ex2){}
		}
		return list;//*************

	}

	//__________________________

		//서치 결과물 출력
		//___________________

		public List<NoticeDTO> searchList(int start, int cnt, String title, String writer) {
			List<NoticeDTO> list = null;
			try {
				con = getCon();// 커넥션 얻기
				//sql = "select * from notice order by ref desc, re_step asc limit ?,?";
//				System.out.println(title);
//				System.out.println(writer);

				String selectClause = "select * from notice ";
				String whereClause = "";
				String orderByClause = " order by num desc limit ?,?";
				//구문 나눠서 조합한거임.

				if (title != null) {
					whereClause += " where title like ?";
				} //title에 값이 들어오면 중간에 title을 찾는 구문쓰기

				if (writer != null) {
					whereClause += " where writer like ?";
				}

				// limit ?,?
				// limit 시작 위치, 개수

				sql = selectClause + whereClause + orderByClause;
				//System.out.println(sql);

				pstmt = con.prepareStatement(sql);// 생성시 인자가 들어간다
				if (title != null) {
					pstmt.setString(1, "%" + title + "%");
				}

				if (writer != null) {
					pstmt.setString(1, "%" + writer  + "%");
				}
				pstmt.setInt(2, start - 1);// mysql 0부터
				pstmt.setInt(3, cnt);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					// rs내용을 dto에 담는다, dto를 list로 return list
					list = new ArrayList<NoticeDTO>();
					do {
						NoticeDTO dto = new NoticeDTO();

						dto.setNum(rs.getInt(1));// num

						dto.setWriter(rs.getString("writer"));
						dto.setTitle(rs.getString("title"));
						dto.setContent(rs.getString("content"));
						dto.setPw(rs.getString("pw"));
						dto.setRegdate(rs.getTimestamp("regdate"));//년월일 시분초
						dto.setReadcount(rs.getInt("readcount"));

						dto.setIp(rs.getString("ip"));
						list.add(dto);// ****
					} while (rs.next()); //무슨일이 있어도 do문은 무조건 한번 실행됨

				}  조건을 만족하지 않으면 반복문이 한번도 실행되지 않을수도 있음.
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


	//-------------------
	// 조횟수 증가, 글내용 보기
	//-------------------
	public NoticeDTO getNotice(int num){
		NoticeDTO dto=null;
		try{
			con=getCon();//커넥션 얻기

			//조횟수 증가
			sql="update notice set readcount=readcount+1 where num="+num;
			pstmt=con.prepareStatement(sql);//생성자 인자 들어간다
			pstmt.executeUpdate();
			//조횟수 증가  끝

			//글내용보기
			pstmt=con.prepareStatement("select * from notice where num="+num);
			rs=pstmt.executeQuery();

			//rs내용을 dto담는다.  return dto
			if(rs.next()){
				dto=new NoticeDTO();

				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setRegdate(rs.getDate("regdate"));//년월일
				dto.setContent(rs.getString("content"));
				//dto.setStartDate(rs.getTimestamp("startDate"));//년월일 시분초
				dto.setReadcount(rs.getInt("readcount"));
			}
		}catch(Exception ex){
			System.out.println("getNotice() 예외 :"+ex);
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception ex2){}
		}
		return dto;
	}

	//-----------------
	// 글 수정 폼
	//-----------------
	public NoticeDTO getUpdate(int num){

		NoticeDTO dto=null;
		try{
			con=getCon();//커넥션 얻기
			pstmt=con.prepareStatement("select * from notice where num="+num);
			rs=pstmt.executeQuery();

			if(rs.next()){
				dto=new NoticeDTO();

				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("Title"));
				dto.setContent(rs.getString("content"));
				dto.setPw(rs.getString("pw"));//**********!!!!!!!!!!!!
				dto.setRegdate(rs.getTimestamp("regdate"));
				dto.setReadcount(rs.getInt("readcount"));

				dto.setIp(rs.getString("ip"));
			}

		}catch(Exception ex){
			System.out.println("getUpdate() 예외 :"+ex);
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception ex2){}
		}
		return dto;
	}
	//-----------------
	// DB 글수정
	//-----------------
	//***
	public int updateNotice(NoticeDTO dto){
		int x=-100;
		// 숫자 자료형 x에 -100을 대입한다.
		String dbpw="";
		//dbpw 문자 자료형에 공백을 대입한다.

		try{
			con=getCon();
			pstmt=con.prepareStatement("select pw from notice where num=?");
			pstmt.setInt(1, dto.getNum());
			rs=pstmt.executeQuery();
		//커넥션설정
			//notice의 모든 암호를 설정해서 그 중 num이 ?인것을 찾는 sql구문을 pstmt에 대입한다.
			//num에는 dto에서 가져온 num을 설정한다.
			if(rs.next()){
				//만약, 해당 구문이 작동될 수 있다면 (num이 존재한다면.)
				dbpw=rs.getString("pw");
				//입력받은 암호인 pw를 dbpw에 넣는다.


				if(dto.getPw().equals(dbpw)){
					sql="update notice set writer=?,title=?,content=? where num=?";
					pstmt=con.prepareStatement(sql);

					//위의 조건을 만족함과 동시에,
					//만약 받아온 암호와 입력한 암호의 문자열이 같다고 한다면
					//notice의 writer, subject, content 에 차례대로 ?를 갱신한다. (?의 값을 가진 num을 가진 것만.)

					pstmt.setString(1, dto.getWriter());
					pstmt.setString(2, dto.getTitle());
					pstmt.setString(3, dto.getContent());
					pstmt.setInt(4, dto.getNum());

					pstmt.executeUpdate();//쿼리 실행

					x=1;//정상적으로 수정

					//입력한 비밀번호와 sql구문의 비밀번호가 같았으니, 1을 x에 넣는다.
					//후에 이것을 return한다.

				}else{//암호가 틀리면
					//얄짤없이 바로 -1 리턴
					x=-1;
				}
			}//if
		}catch(Exception ex){
			System.out.println("updateNotice() 예외 :" + ex);
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception ex2){}
		}
			return x;
	}
	//***

	//------------------
	// 공지사항 삭제
	//------------------
	public int deleteNotice(int num , String pw){
		String dbpw="";
		int x=-100;

		try{
			con=getCon();
			pstmt=con.prepareStatement("select pw from notice where num="+num);//생성시 인자 들어간다
			rs=pstmt.executeQuery();//쿼리 실행

			if(rs.next()){
				dbpw=rs.getString("pw");
				if(pw.equals(dbpw)){
					//암호가 일치하면 글 삭제
					pstmt=con.prepareStatement("delete from notice where num="+num);
					pstmt.executeUpdate();//쿼리 실행
					x=1;//삭제 성공
				}else{//암호가 틀릴때 처리
					x=-1;
				}
			}
		}catch(Exception ex){
			System.out.println("deleteNotice() 예외 :"+ex);
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception ex2){}
		}

		return x;
	}



}