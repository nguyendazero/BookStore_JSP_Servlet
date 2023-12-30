package controller.user;

import java.io.IOException;
import java.sql.Date;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.KhachHangDAO;
import model.KhachHang;
import util.MaHoa;

/**
 * Servlet implementation class ThayDoiThongTin
 */
@WebServlet("/thay-doi-thong-tin")
public class ThayDoiThongTin extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ThayDoiThongTin() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");
		
		String hoVaTen = request.getParameter("hoVaTen");
		String gioiTinh = request.getParameter("gioiTinh");
		String ngaySinh = request.getParameter("ngaySinh");
		String diaChi = request.getParameter("diaChi");
		String diaChiNhanHang = request.getParameter("diaChiNhanHang");
		String diaChiMuaHang = request.getParameter("diaChiMuaHang");
		String dienThoai = request.getParameter("dienThoai");
		String email = request.getParameter("email");
		String dongYNhanMail = request.getParameter("dongYNhanMail");
		
			
		request.setAttribute("hoVaTen", hoVaTen);
		request.setAttribute("gioiTinh", gioiTinh);
		request.setAttribute("ngaySinh", ngaySinh);
		request.setAttribute("diaChi", diaChi);
		request.setAttribute("diaChiMuaHang", diaChiMuaHang);
		request.setAttribute("diaChiNhanHang", diaChiNhanHang);
		request.setAttribute("dienThoai", dienThoai);
		request.setAttribute("dongYNhanMail", dongYNhanMail);
		request.setAttribute("email", email);

		KhachHangDAO khachHangDAO = new KhachHangDAO();
			Object obj = request.getSession().getAttribute("khachHang");
			KhachHang khachHang = null;
			if (obj!=null)
			{
				khachHang = (KhachHang)obj;		
				if(khachHang!=null){	
					String maKhachHang = khachHang.getMaKhachHang();
					KhachHang kh = new KhachHang(maKhachHang, "", "", hoVaTen, gioiTinh,
									diaChi, diaChiNhanHang, diaChiMuaHang, Date.valueOf(ngaySinh), dienThoai, email,
									dongYNhanMail!=null,"0");
							
					khachHangDAO.updateInfor(kh);
					KhachHang kh2 = khachHangDAO.selectUserById(kh);
					request.getSession().setAttribute("khachHang", kh2);
					
				}	
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/thanhcong.jsp");
		rd.forward(request, response);
	}	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
