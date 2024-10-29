package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.GetConn;

public class MemberDAO {
	private Connection conn = GetConn.getConn();
//	private Connection conn2 = GetConn.getConn();
//	private GetConn conn = GetConn.getInstance();
//	private GetConn conn2 = GetConn.getInstance();
//	
//	public MemberDAO() {
//		if(conn == conn2) System.out.println("conn과 conn2는 같은 객체 입니다.");
//		else System.out.println("conn과 conn2는 서로 다른 객체 입니다.");
//	}
	
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	MemberVO vo = null;
	
	public void pstmtClose() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {}
		}
	}
	
	public void rsClose() {
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {}
			finally {
				pstmtClose();
			}
		}
	}

//	Member Table에서 ID 검색하기
	public MemberVO getMemberIdCheck(String mid) {
		MemberVO vo = new MemberVO();
		try {
			sql = "select * from member where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
        vo.setIdx(rs.getInt("idx"));
        vo.setMid(rs.getString("mid"));
        vo.setPwd(rs.getString("pwd"));
        vo.setNickName(rs.getString("nickName"));
        vo.setName(rs.getString("name"));
        vo.setGender(rs.getString("gender"));
        vo.setBirthday(rs.getString("birthday"));
        vo.setTel(rs.getString("tel"));
        vo.setAddress(rs.getString("address"));
        vo.setEmail(rs.getString("email"));
        vo.setContent(rs.getString("content"));
        vo.setPhoto(rs.getString("photo"));
        vo.setLevel(rs.getInt("level"));
        vo.setUserInfor(rs.getString("userInfor"));
        vo.setUserDel(rs.getString("userDel"));
        vo.setPoint(rs.getInt("point"));
        vo.setVisitCnt(rs.getInt("visitCnt"));
        vo.setTodayCnt(rs.getInt("todayCnt"));
        vo.setStartDate(rs.getString("startDate"));
        vo.setLastDate(rs.getString("lastDate"));
        vo.setNickName(rs.getString("nickName"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		}
		finally {
			rsClose();
		}
		
		return vo;
	}
	
//	Member Table에서 닉네임 검색하기
	public MemberVO getMemberNickNameCheck(String nickName) {
		MemberVO vo = new MemberVO();
		try {
			sql = "select * from member where nickName = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickName);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setNickName(rs.getString("nickName"));
				vo.setName(rs.getString("name"));
				vo.setGender(rs.getString("gender"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				vo.setEmail(rs.getString("email"));
				vo.setContent(rs.getString("content"));
				vo.setPhoto(rs.getString("photo"));
				vo.setLevel(rs.getInt("level"));
				vo.setUserInfor(rs.getString("userInfor"));
				vo.setUserDel(rs.getString("userDel"));
				vo.setPoint(rs.getInt("point"));
				vo.setVisitCnt(rs.getInt("visitCnt"));
				vo.setTodayCnt(rs.getInt("todayCnt"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setNickName(rs.getString("nickName"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		}
		finally {
			rsClose();
		}
		
		return vo;
	}

public void setPointPlus(String mid, int today) {
	try {
		//sql = "update set member point = point + 10 where mid = ?";
		if(today < 5) {
			sql = "update member set point=point+10, visitCnt=visitCnt+1, todayCnt=todayCnt+1, lastDate=now() where mid = ?";
		}
		else {
			sql = "update member set visitCnt=visitCnt+1, todayCnt=todayCnt+1, lastDate=now() where mid = ?";
		}
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, mid);
		pstmt.executeUpdate();
	} catch (SQLException e) {
		System.out.println("SQL 오류 : " + e.getMessage());
	}	finally {
		pstmtClose();
	}
}

public int setMemberJoinOk(MemberVO vo) {
	int res = 0;
	try {
		sql = "insert into member values(default, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, default, default, default, default, default, default, default);";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, vo.getMid());
		pstmt.setString(2, vo.getPwd());
		pstmt.setString(3, vo.getNickName());
		pstmt.setString(4, vo.getName());
		pstmt.setString(5, vo.getGender());
		pstmt.setString(6, vo.getBirthday());
		pstmt.setString(7, vo.getTel());
		pstmt.setString(8, vo.getAddress());
		pstmt.setString(9, vo.getEmail());
		pstmt.setString(10, vo.getContent());
		pstmt.setString(11, vo.getPhoto());
		pstmt.setString(12, vo.getUserInfor());
		res = pstmt.executeUpdate();
	} catch (SQLException e) {
		System.out.println("SQL 오류 : " + e.getMessage());
	}	finally {
		pstmtClose();
	}
	
	return res;
}

}