package com.moving.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.moving.vo.DesignLoungeVO;
import com.moving.vo.PointVO;
import com.moving.vo.ReservVO;
import com.moving.vo.UserVO;

@Repository
public interface UserMapper {

	public int idJungbokCheck(UserVO userVo);

	public int phoneJungbokCheck(UserVO userVo);

	public int joinProc(UserVO userVo);

	public UserVO loginProc(UserVO userVo);

	public String idSearchProc(UserVO userVo);

	public String pwdSearchProc(UserVO userVo);

	public int updatePwd(UserVO param);
	
	public UserVO getUserInfo(String userId);

	public int myInfoUpdate(UserVO userVo);

	public int checkUserPwd(UserVO userVo);

	public int insertRegDesignLounge(DesignLoungeVO designLoungeVO);

	public int updateLoginDate(String userId);

	public int outMember(UserVO userVO);

	public List<ReservVO> selectMyPointList(PointVO pointVO);

	public int myPointListCnt(PointVO pointVO);

	public int insertJoinPoint(UserVO userVo);

	public int selectUserNo(String userId);

}