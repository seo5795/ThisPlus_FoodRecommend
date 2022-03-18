<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.io.*"%>
<%
	// ������ ���(�ݵ�� webapp�� �̸� ���� ������ ��)
    String path = request.getRealPath("fileUpload");
	// ���� �ִ� ������ ����
    int size = 1024 * 1024 * 20; //20MB
    String str, saveName, originalName;
    try{
    	MultipartRequest multiRequest = new MultipartRequest(request, path, size, "EUC-KR", new DefaultFileRenamePolicy());
    	
    	Enumeration files = multiRequest.getFileNames();
    	str = (String)files.nextElement();
    	// �ߺ��Ǵ� �̸� ������ ���ϸ� ����
    	saveName = multiRequest.getFilesystemName(str);
    	// ���� ���ϸ�
    	originalName = multiRequest.getOriginalFileName(str);
    	
    	out.println("<h1>�̹��� ���ε忡 �����߽��ϴ�.</h1><br>");
    	out.println("���� ���ϸ� : "+originalName+"<br>");
    	out.println("����� ���ϸ� : "+saveName+"<br>");
    	out.println("�켱 ������ : "+path+"<br>");
    	
    	// ��������Ʈ�� ����Ǵ� ���(=path�� ����� ����)
    	String originPath="F:\\eclipse\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\thisfood\\fileUpload";
    	// �츮�� ���ϴ� ���� ���(���ϴ� ���� ��θ� �Է��� �ּ���)
    	String movePath="F:\\resource\\";
    	
    	// Java������ �̿��� ���� �̵�
    	try {
    		FileInputStream fis=new FileInputStream(originPath+saveName);
    		FileOutputStream fos=new FileOutputStream(movePath+saveName);
    		
    		byte[] buff=new byte[3000];
    		int len;
    		while((len=fis.read(buff))!=-1) {
    			fos.write(buff, 0, len); // buff�� �����͸� len��ŭ write();
    		}
    		
    		fos.flush();
    		fos.close();
    	}catch (Exception e) {
    		e.printStackTrace();
    	}
    	finally {
    		System.out.println("�̹��� ���� �Ϸ�");
    		
    		// DB�� ����Ǿ�� �� ������ : �Ĵ��̸�, �Ĵ�����, �̹���������
    		out.println("���� ������ : "+movePath+"<br><br>");
    		
    		// �Է��� �Ķ���ʹ� MultiRequest���� ȣ���� ��
    		// ������ ������ ��ο� ����� ���ϸ��� ���ļ� DB�� ���
    		out.println("<h1>DB�� ������ ����</h1>");
    		out.println("���̵� : "+multiRequest.getParameter("memid")+"<br>");
        	out.println("��й�ȣ : "+multiRequest.getParameter("memPw")+"<br>");
        	out.println("�̸� : "+multiRequest.getParameter("memName")+"<br>");
    		out.println("�̸��� : "+multiRequest.getParameter("memEmail")+"<br>");
        	out.println("��ȭ��ȣ : "+multiRequest.getParameter("memPhone")+"<br>");
        	out.println("ȸ������ : "+multiRequest.getParameter("default-select")+"<br>");
        	out.println("�ּ� : "+multiRequest.getParameter("roadAddrPart1")+" "+multiRequest.getParameter("roadAddrPart2"));
    		out.println("���� : "+movePath+saveName);
    		
    	}
    } catch (Exception e){
    	e.printStackTrace();
    }
%>