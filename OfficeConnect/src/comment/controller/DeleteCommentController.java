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
System.out.println("댓글 삭제왔음");
		int commNo = Integer.parseInt(req.getParameter("commNo"));
		System.out.println(commNo);
		ICommentService commentService = CommentServiceImpl.GetInstance();

		int cnt = commentService.deleteComment(commNo);
		System.out.println(cnt);
		resp.getWriter().print(cnt);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}