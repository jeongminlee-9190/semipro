package service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import dao.MySqlSessionFactory;
import dto.PageDTO;
import dto.SoDTO;
import dto.SoNoticeDTO;
import dto.SoQnaDTO;
import exception.MyException;

public class SoBoardService {
	
	public  PageDTO list(int curPage,HashMap<String, String> map){
		//1. 세션 얻기
		SqlSession session = MySqlSessionFactory.getSession();
		//2. 변수 선언
		PageDTO pageDTO = new PageDTO(); //페이징을 위한 변수 선언
		int start = (curPage-1)*pageDTO.getPerPage(); //페이징 시작 글 번호
		List<SoNoticeDTO> list = null; //게시판 목록
		try{
			list = session.selectList("SoBoardMapper.soNoticeList",map,
					new RowBounds(start,pageDTO.getPerPage()));
			int totalCnt=0;
			if(map.get("searchValue")==null) {//searchValue값이 없는 상태로 검색을 누르면 전체목록 보여주기
				totalCnt=session.selectOne("SoBoardMapper.totalCnt");
			}
			else {//입력된 searchValue가 포함된 게시판 글들의 목록을 보여줌
				totalCnt=session.selectOne("SoBoardMapper.totalSearchCnt",map);
				//map값을 넘겨주지 않으면 특정 값 검색 시 페이징 처리가 안된다.
			}

			pageDTO.setList(list);
			pageDTO.setCurPage(curPage);
			pageDTO.setTotalCnt(totalCnt);
			pageDTO.setSearchName(map.get("searchName"));
			pageDTO.setSearchValue(map.get("searchValue"));
		}finally {
			//세션 닫기
			session.close();
		}
		return pageDTO;
	}
	
	public SoNoticeDTO retrieve(int noticeNum) {
		//1. 세션 얻기
			SqlSession session = MySqlSessionFactory.getSession();
			SoNoticeDTO dto = null;
			try {
				dto = session.selectOne("SoBoardMapper.soNoticeRetrieve", noticeNum);
			}finally {
				session.close();
			}
			return dto;
		
	}
}
