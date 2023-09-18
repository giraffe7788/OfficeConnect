package board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.service.BoardServiceImpl;
import board.service.IBoardService;
import vo.BoardVO;


@MultipartConfig
@WebServlet("/board/update.do")
public class UpdateBoardController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int brdNo = Integer.parseInt(req.getParameter("brdNo"));
		
	
		
		IBoardService boardService = BoardServiceImpl.GetInstance();
		BoardVO bv= boardService.detailBoard(brdNo);
		
		req.setAttribute("bv", bv);


		req.getRequestDispatcher("/board/updateForm.jsp").forward(req, resp);
	
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

			req.setCharacterEncoding("UTF-8");
			String brdTitle =req.getParameter("title");
			String brdCont = req.getParameter("comment");
			int brdNo = Integer.parseInt(req.getParameter("num"));

			try {
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		
			
			IBoardService boardService = BoardServiceImpl.GetInstance();
			
			BoardVO bv = new BoardVO();
			bv.setBrdTitle(brdTitle);
			bv.setBrdCont(brdCont);
			bv.setBrdNo(brdNo);
			
			System.out.println(brdCont);
			System.out.println("e도챡 2");
			int cnt = boardService.updateBoard(bv);

			String msg = "";

			if (cnt > 0) {
				msg ="성공";
			}else {
				msg="실패";
			}
			
			HttpSession session = req.getSession();
			
			session.setAttribute("msg", msg);

//			req.getRequestDispatcher("/member/list.do").forward(req, resp);

			resp.sendRedirect(req.getContextPath() + "/board/list.do");
			
	}

}