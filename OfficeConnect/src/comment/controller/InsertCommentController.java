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
@WebServlet("/comment/insert.do") // value 생략가능(어노테이션)
public class InsertCommentController extends HttpServlet {


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("댓글등록");

		req.setCharacterEncoding("UTF-8");
		
		String empNo = req.getParameter("empNo");
		int brdNo = Integer.parseInt(req.getParameter("brdNo"));
		String commCont = req.getParameter("commCont");
		System.out.println("empNo : " + empNo+ "brdNo : " + brdNo + "commCont :" +commCont );

		ICommentService CommentService = CommentServiceImpl.GetInstance();
		
		CommentVO cv = new CommentVO();
		cv.setEmpNo(empNo);
		cv.setBrdNo(brdNo);
		cv.setCommCont(commCont);
			
		int cnt = CommentService.insertComment(cv);
		System.out.println(cnt);
		resp.getWriter().print(cnt);

	}
}
