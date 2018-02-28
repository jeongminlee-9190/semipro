package s.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
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
import dto.SDTO;
import dto.SoDTO;
import exception.MyException;
import sevice.SService;

/**
 * 이미지 업로드 서블릿
 */
@WebServlet("/SImageUploadServlet")
public class SImageUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			//shopowner의 soId 값 가져오기
			HttpSession session=request.getSession();
			SoDTO dto = (SoDTO)session.getAttribute("login");
			String soId=dto.getSoId();
 
			SService service = new SService();
			String sCode=null;
			
			HashMap<String, String> map= new HashMap<>();
			map.put("soId", soId);
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
				int i=1;
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
						sCode =service.sCodeInfo(soId);
						String fieldName = item.getFieldName();
						String contentType = item.getContentType().split("/")[1];
						System.out.println(sCode);
						fileName = sCode+"_sImage"+i+"."+contentType;
						boolean isInMemory = item.isInMemory();
						sizeInBytes = item.getSize();
						System.out.println(fieldName+"\t"+fileName+"\t"+contentType+"\t"+isInMemory+"\t"+sizeInBytes);
						File uploadedFile = new File("C:\\semi-pro\\semi-pro\\WebContent\\upload",fileName);
						map.put("fieldName"+i, fieldName);
						map.put("fileName"+i, fileName);
						item.write(uploadedFile);
						i++;
					}//end of if
				}//end of while
				service.sImageAdd(map);
				request.setAttribute("success", "상점 이미지 등록 성공");
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
		RequestDispatcher dis = request.getRequestDispatcher("sManagement.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
