<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8" import="java.io.*"%>
<%
	// 저장할 경로(반드시 webapp에 미리 폴더 만들어둘 것)
    String path = request.getRealPath("fileUpload");
	// 파일 최대 사이즈 정의
    int size = 1024 * 1024 * 20; //20MB
    String str, saveName, originalName;
    try{
    	MultipartRequest multiRequest = new MultipartRequest(request, path, size, "EUC-KR", new DefaultFileRenamePolicy());
    	
    	Enumeration files = multiRequest.getFileNames();
    	str = (String)files.nextElement();
    	// 중복되는 이름 있을시 파일명 변경
    	saveName = multiRequest.getFilesystemName(str);
    	// 원래 파일명
    	originalName = multiRequest.getOriginalFileName(str);
    	
    	out.println("<h1>이미지 업로드에 성공했습니다.</h1><br>");
    	out.println("원래 파일명 : "+originalName+"<br>");
    	out.println("저장된 파일명 : "+saveName+"<br>");
    	out.println("우선 저장경로 : "+path+"<br>");
    	
    	// 웹프로젝트에 저장되는 경로(=path의 내용과 동일)
    	String originPath="F:\\eclipse\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\thisfood\\fileUpload";
    	// 우리가 원하는 저장 경로(원하는 폴더 경로를 입력해 주세요)
    	String movePath="F:\\resource\\";
    	
    	// Java로직을 이용해 파일 이동
    	try {
    		FileInputStream fis=new FileInputStream(originPath+saveName);
    		FileOutputStream fos=new FileOutputStream(movePath+saveName);
    		
    		byte[] buff=new byte[3000];
    		int len;
    		while((len=fis.read(buff))!=-1) {
    			fos.write(buff, 0, len); // buff의 데이터를 len만큼 write();
    		}
    		
    		fos.flush();
    		fos.close();
    	}catch (Exception e) {
    		e.printStackTrace();
    	}
    	finally {
    		System.out.println("이미지 복사 완료");
    		
    		// DB에 저장되어야 할 데이터 : 식당이름, 식당종류, 이미지저장경로
    		out.println("최종 저장경로 : "+movePath+"<br><br>");
    		
    		// 입력한 파라미터는 MultiRequest에서 호출할 것
    		// 사진은 저장한 경로와 저장된 파일명을 합쳐서 DB에 등록
    		out.println("<h1>DB에 저장할 정보</h1>");
    		out.println("아이디 : "+multiRequest.getParameter("memid")+"<br>");
        	out.println("비밀번호 : "+multiRequest.getParameter("memPw")+"<br>");
        	out.println("이름 : "+multiRequest.getParameter("memName")+"<br>");
    		out.println("이메일 : "+multiRequest.getParameter("memEmail")+"<br>");
        	out.println("전화번호 : "+multiRequest.getParameter("memPhone")+"<br>");
        	out.println("회원종류 : "+multiRequest.getParameter("default-select")+"<br>");
        	out.println("주소 : "+multiRequest.getParameter("roadAddrPart1")+" "+multiRequest.getParameter("roadAddrPart2"));
    		out.println("사진 : "+movePath+saveName);
    		
    	}
    } catch (Exception e){
    	e.printStackTrace();
    }
%>