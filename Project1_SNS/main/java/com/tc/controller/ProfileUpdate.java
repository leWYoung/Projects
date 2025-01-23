package com.tc.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tc.model.memberDAO;
import com.tc.model.memberDTO;

@WebServlet("/ProfileUpdate")
@MultipartConfig
public class ProfileUpdate extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("ProfileUpdate 들어옴");
    	
    	HttpSession session = request.getSession() ;
    	memberDTO user = (memberDTO) session.getAttribute("info") ;
    	
        // 파일 파트 가져오기
        Part user_profile = request.getPart("user_profile"); // 'profilePic'라는 이름으로 파일 가져오기
        String fileName = Path.of(user_profile.getSubmittedFileName()).getFileName().toString(); // 파일 이름 추출

        // 저장할 경로 설정
        String uploads = getServletContext().getRealPath("") + "imgfile/"; // 서버의 uploads 폴더 경로
        File uploadDir = new File(uploads);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs(); // 디렉토리가 없으면 생성
        }

        File file = new File(uploadDir, fileName);

        // 파일 저장
        try (InputStream input = user_profile.getInputStream()) {
            Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING); // 파일 저장
        }

        memberDAO dao = new memberDAO() ;
        memberDTO dto = new memberDTO() ;
        
        dto.setUser_profile(fileName);
        dto.setUser_id(user.getUser_id());
        
        int cnt = dao.updateImg(dto) ;

        // 클라이언트에게 응답
        if(cnt > 0) {
        	System.out.println("이미지 파일 수정 성공");
        	response.getWriter().write("파일 업로드 성공");
        }
        else {
        	System.out.println("이미지 파일 수정 실패");
        	response.getWriter().write("파일 업로드 실패");
        }
    }
}