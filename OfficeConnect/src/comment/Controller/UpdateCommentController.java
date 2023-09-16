package comment.Controller;

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
@WebServlet("/comment/update.do")
public class UpdateCommentController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

			req.setCharacterEncoding("UTF-8");
			String commCont = req.getParameter("commCont");
			int commNo = Integer.parseInt(req.getParameter("commNo"));
			
			try {
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		
			
			ICommentService CommentService = CommentServiceImpl.GetInstance();
			
			CommentVO cv = new CommentVO();
			cv.setCommCont(commCont);
			cv.setCommNo(commNo);

			

			int cnt = CommentService.updateComment(cv);
			System.out.println(cnt + "수정");
			resp.getWriter().print(cnt);
			



			
	}

}
