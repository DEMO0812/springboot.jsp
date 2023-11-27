package edu.poly.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

import edu.poly.model.NguoiDung;
import edu.poly.services.SessionService;

@Service
public class AuthInterceptor implements HandlerInterceptor {
	@Autowired
	SessionService session;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String uri = request.getRequestURI();
		NguoiDung user = (NguoiDung) session.get("user"); // Lấy từ session
		String error = "";

		  // Kiểm tra đường dẫn không cần đăng nhập
        if (uri.startsWith("/ctSanPham/") && uri.matches("/ctSanPham/\\d+")) {
            return true; // Cho phép truy cập
        }

        // Kiểm tra đường dẫn cần đăng nhập và có quyền admin
        if ((uri.startsWith("/admin") || uri.startsWith("/adminSp")) && (user == null || !user.isAdmin())) {
            error = "Access denied!";
        }

        // Kiểm tra đường dẫn cần đăng nhập
        if (user == null && (uri.startsWith("/cart") || uri.startsWith("/check-out") || uri.startsWith("/add-to-cart"))) {
            error = "Please login!";
        }

		if (error.length() > 0) { // Có lỗi
			session.set("security-uri", uri);
			request.setAttribute("error", error);
			response.sendRedirect("/login?error=" + error);
			 
			return false;
		}
		return true;
	}
}

//	@Override
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
//			throws Exception {
//		String uri = request.getRequestURI();
//		NguoiDung user = (NguoiDung) session.get("user"); // lấy từ session
//		String error = "";
//		if (user == null) { // chưa đăng nhập
//			error = "Please login!";
//		}
//		// không đúng vai trò
//		else if (!user.isAdmin() && uri.startsWith("/admin/")) {
//			error = "Access denied!";
//		}
//		if (error.length() > 0) { // có lỗi
//			session.set("security-uri", uri);
//			response.sendRedirect("/account/login?error=" + error);
//			return false;
//		}
//		return true;
//	}
