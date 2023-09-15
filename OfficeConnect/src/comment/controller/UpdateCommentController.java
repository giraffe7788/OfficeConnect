package comment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import comment.service.CommentServiceImpl;
import comment.service.ICommentService;
import vo.CommentVO;


@MultipartConfig
@WebServlet("/Comment/update.do")
public class UpdateCommentController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

			req.setCharacterEncoding("UTF-8");
			String commCont = req.getParameter("commCont");

			try {
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		
			
			ICommentService CommentService = CommentServiceImpl.GetInstance();
			
			CommentVO cv = new CommentVO();
			cv.setCommCont(commCont);

			

			int cnt = CommentService.updateComment(cv);

			String msg = "";

			if (cnt > 0) {
				msg ="성공";
			}else {
				msg="실패";
			}
			
			HttpSession session = req.getSession();
			
			session.setAttribute("msg", msg);

//			req.getRequestDispatcher("/member/list.do").forward(req, resp);

			resp.sendRedirect(req.getContextPath() + "/Comment/list.do");
			
	}

}
