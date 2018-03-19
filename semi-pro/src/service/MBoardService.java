package service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import dao.MySqlSessionFactory;
import dto.MNoticeDTO;
import dto.MPageDTO;

public class MBoardService {
	
	public  MPageDTO list(int curPage,HashMap<String, String> map){
		//1. 세션 얻기
		SqlSession session = MySqlSessionFactory.getSession();
		//2. 변수 선언
		MPageDTO mPageDTO = new MPageDTO(); //페이징을 위한 변수 선언
		int start = (curPage-1)*mPageDTO.getPerPage(); //페이징 시작 글 번호
		List<MNoticeDTO> list = null; //게시판 목록
		try{
			list = session.selectList("MBoardMapper.mNoticeList",map,
					new RowBounds(start,mPageDTO.getPerPage()));
			int totalCnt=0;
			if(map.get("searchValue")==null) {//searchValue값이 없는 상태로 검색을 누르면 전체목록 보여주기
				totalCnt=session.selectOne("MBoardMapper.totalCnt");
			}
			else {//입력된 searchValue가 포함된 게시판 글들의 목록을 보여줌
				totalCnt=session.selectOne("MBoardMapper.totalSearchCnt",map);
				//map값을 넘겨주지 않으면 특정 값 검색 시 페이징 처리가 안된다.
			}

			mPageDTO.setList(list);
			mPageDTO.setCurPage(curPage);
			mPageDTO.setTotalCnt(totalCnt);
			mPageDTO.setSearchName(map.get("searchName"));
			mPageDTO.setSearchValue(map.get("searchValue"));
		}finally {
			//세션 닫기
			session.close();
		}
		return mPageDTO;
	}//end of list
	

	public MNoticeDTO retrieve(int noticeNum) {
		//조회수 증가
		readCnt(noticeNum);
		//1. 세션 얻기
		SqlSession session = MySqlSessionFactory.getSession();
		MNoticeDTO dto = null;
		try {
			dto = session.selectOne("MBoardMapper.mNoticeRetrieve", noticeNum);
		}finally {
			session.close();
		}
		return dto;
	}//end of retrieve
	
	
	private void readCnt(int noticeNum) {
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			int n = session.update("MBoardMapper.mNoticeReadCnt",noticeNum);
			session.commit();
		}finally {
			session.close();
		}
	}//end of readCnt
}
