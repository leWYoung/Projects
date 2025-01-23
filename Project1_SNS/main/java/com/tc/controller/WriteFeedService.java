package com.tc.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.ant.jmx.JMXAccessorQueryTask;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.tc.model.feedDAO;
import com.tc.model.feedDTO;
import com.tc.model.memberDTO;

@WebServlet("/WriteFeedService")
public class WriteFeedService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

//		1. 인코딩
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();

		// 세션에서 사용자 ID 가져오기
		memberDTO loggedUser = (memberDTO) session.getAttribute("info");
		if (loggedUser == null) {
			response.sendRedirect("LoginAndJoinPage.jsp"); // 로그인 페이지로 리다이렉트
			return;
		}
		
		String user_id = loggedUser.getUser_id(); // 로그인된 사용자 ID

		request.setCharacterEncoding("UTF-8");

        // 2. 파일 업로드 처리
		String uploadPath = getServletContext().getRealPath("") + "imgfile/"; // 현재 경로에 img 추가
        File dir = new File(uploadPath);
        if (!dir.exists()) {
            dir.mkdirs(); // 경로가 없으면 생성
        }

        // MultipartRequest 객체 생성
        MultipartRequest multi=null;
        try {
            multi = new MultipartRequest(request, uploadPath, 1000 * 1024 * 1024, "UTF-8",
                    new DefaultFileRenamePolicy());
        } catch (IOException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "File upload failed.");
            return;
        }

        // 3. 데이터 처리
        String title = multi.getParameter("title"); // 제목 가져오기
        String content = multi.getParameter("content"); // 내용 가져오기
        String img = multi.getFilesystemName("img"); // 업로드된 이미지 파일 이름 가져오기

        System.out.println("title: " + title);
        System.out.println("content: " + content);
        System.out.println("img: " + img); // 선택된 파일 이름 출력


//		3. 데이터 처리
		feedDAO dao = new feedDAO();
		feedDTO dto = new feedDTO();
		dto.setFeed_title(title);
		dto.setFeed_content(content);
		dto.setUser_id(user_id);
		dto.setFeed_img(img);

		int result = dao.feed_insert(dto);

//		4. 결과 화면 출력
//		Main 화면에서 게시글 전체 내용을 조회할 수 있는 BoardService로 먼저 이동
		response.sendRedirect("FeedPage.jsp");

	}

}
