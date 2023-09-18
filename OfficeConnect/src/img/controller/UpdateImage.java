package img.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import img.service.IImageService;
import img.service.ImageServiceImpl;
import vo.ImageVO;

@MultipartConfig
@WebServlet("/img/update.do")
public class UpdateImage extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		IImageService imageService = ImageServiceImpl.getInstance();

		String empNo = (String)req.getParameter("empNo");
		ImageVO imageVO = imageService.saveImage(req.getParts(), empNo);
		System.out.println(imageVO.getEmpNo());
		System.out.println(imageVO.getImgName());
		System.out.println(imageVO.getImgPath());
		
		int cnt = imageService.updateImage(imageVO);

		if (cnt > 0) {

			System.out.println("사원사진 변경 성공");

			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("isSuccess", "ok");
			String jsonStr = new Gson().toJson(jsonObject);
			resp.setContentType("application/json");
			resp.getWriter().write(jsonStr);
		} else {
			System.out.println("사원사진 변경 실패");

			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("isSuccess", "fail");
			String jsonStr = new Gson().toJson(jsonObject);
			resp.setContentType("application/json");
			resp.getWriter().write(jsonStr);
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
}
