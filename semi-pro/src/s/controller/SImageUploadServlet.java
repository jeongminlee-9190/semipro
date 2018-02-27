package s.controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.ibatis.session.SqlSession;

import dao.MySqlSessionFactory;
import dto.SoDTO;

/**
 * 이미지 업로드 서블릿
 */
@WebServlet("/SImageUploadServlet")
public class SImageUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			//이미지 업로드 소스
			// Create a factory for disk-based file items
			DiskFileItemFactory factory = new DiskFileItemFactory();

			// Configure a repository (to ensure a secure temp location is used)
			ServletContext servletContext = this.getServletConfig().getServletContext();
			File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
			factory.setRepository(repository);

			// Create a new file upload handler
			ServletFileUpload upload = new ServletFileUpload(factory);
			String value=null;
			String fileName=null; 
			long sizeInBytes=0;
					
			// Parse the request
			try {
				List<FileItem> items = upload.parseRequest(request);
				//멀티 업로드 가능
				// Process the uploaded items
				Iterator<FileItem> iter = items.iterator();
				while (iter.hasNext()) {
					FileItem item = iter.next();
					if (item.isFormField()) { //type="text"
						String realname = item.getFieldName();
						String name = "상점이름"+realname;
						value = item.getString("UTF-8");//한글 표현
						String ContentType=item.getContentType();
						System.out.println(ContentType);
						System.out.println(name+"\t"+value);
					} else {//type="file" {
						String fieldName = item.getFieldName();
						fileName = "상점이름"+item.getName();
						String contentType = item.getContentType();
						boolean isInMemory = item.isInMemory();
						sizeInBytes = item.getSize();
						System.out.println(fieldName+"\t"+fileName+"\t"+contentType+"\t"+isInMemory+"\t"+sizeInBytes);
						File uploadedFile = new File("C:\\semi-pro\\semi-pro\\WebContent\\upload",fileName);
						item.write(uploadedFile);
					}//end of if
				}//end of while
			} catch (FileUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {//item.write(uploadedFile)의 예외처리
				// TODO Auto-generated catch block
			e.printStackTrace();
			}
			request.setAttribute("value", value);
			request.setAttribute("fileName", fileName);
			request.setAttribute("sizeInBytes", sizeInBytes);
			//이미지 업로드 소스 끝
		RequestDispatcher dis = request.getRequestDispatcher("sImageUpload.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
