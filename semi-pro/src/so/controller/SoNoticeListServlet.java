package so.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.PageDTO;
import dto.SoNoticeDTO;
import exception.MyException;
import service.SoBoardService;

@WebServlet("/SoNoticeListServlet")
public class SoNoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SoBoardService service = new SoBoardService();
		//페이징 처리를 위한 선행 작업 start
		String curPage=request.getParameter("curPage");
		if(curPage==null) {
			curPage = "1"; //첫 시작은 1페이지
		}
		//페이징 처리를 위한 선행 작업 end
		
		//게시판 검색 기능을 위한 선행작업 start
		String searchName = request.getParameter("searchName");
		String searchValue = request.getParameter("searchValue");
		
		HashMap<String, String> map = new HashMap<>();
		map.put("searchName", searchName);
		map.put("searchValue", searchValue);
		
		PageDTO list = service.list(Integer.parseInt(curPage),map);
		
	//	List<SoNoticeDTO> list = service.list();
		
		request.setAttribute("noticelist", list);
		
		RequestDispatcher dis = request.getRequestDispatcher("soNoticeList.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
