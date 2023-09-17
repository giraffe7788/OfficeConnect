package comment.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import comment.service.CommentServiceImpl;
import comment.service.ICommentService;


//삭제파일
@WebServlet("/comment/delete.do")
public class DeleteCommentController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int commentNo = Integer.parseInt(req.getParameter("CommentNo"));
		System.out.println(commentNo);
		ICommentService commentService = CommentServiceImpl.GetInstance();

		int cnt = commentService.deleteComment(commentNo);
		String msg = "";
		if (cnt > 0) {
			msg = "성공";
		} else {
			msg = "실패";
		}
		HttpSession session = req.getSession();

		session.setAttribute("msg", msg);
		resp.sendRedirect(req.getContextPath() + "/comment/list.do");

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
