package edu.poly.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.poly.interceptor.SessionAttr;
import edu.poly.model.DonHang;
import edu.poly.model.DonHangChiTiet;
import edu.poly.model.GioHangItem;
import edu.poly.model.NguoiDung;
import edu.poly.model.SanPhams;
import edu.poly.model.cart.GioHang;
import edu.poly.repositories.DonHangChiTietRepository;
import edu.poly.services.DonHangChiTietService;
import edu.poly.services.DonHangService;
import edu.poly.services.SanPhamService;
import edu.poly.services.SessionService;

@Controller
@SessionAttributes("cart")
public class CartController {

	@Autowired
	private SanPhamService spService;

	@Autowired
	private DonHangService dhService;

	@Autowired
	SessionService sessionService;
	@Autowired
	DonHangChiTietService dhChiTietService;

	@GetMapping("/cart")
	public String xemGioHang(Model model, HttpSession session) {
		GioHang gioHang = (GioHang) session.getAttribute("cart");
		if (gioHang == null) {
			gioHang = new GioHang();
			session.setAttribute("cart", gioHang);
		}

		model.addAttribute("cartItems", gioHang.getCacSanPham());
		model.addAttribute("tongTien", gioHang.tinhTongTien());
		return "user/my_cart";
	}

	@RequestMapping("add-to-cart")
	public String themVaoGioHang(@RequestParam int maSanPham, Model model, RedirectAttributes redirectAttributes) {
		// Tìm sản phẩm theo maSanPham
		SanPhams sanPham = spService.getSanPhamById(maSanPham);
		System.out.println("maSanPham: " + maSanPham);
		if (sanPham != null) {
			// Lấy giỏ hàng từ session hoặc tạo một giỏ hàng mới nếu chưa tồn tại
			GioHang gioHang = (GioHang) model.getAttribute("cart");
			if (gioHang == null) {
				gioHang = new GioHang();
				model.addAttribute("cart", gioHang);
			}

			DonHangChiTiet donHangChiTiet = gioHang.timSanPhamTheoIdSP(maSanPham);
			if (donHangChiTiet != null) {
				donHangChiTiet.tangSoLuong();
			} else {
				donHangChiTiet = new DonHangChiTiet();
				donHangChiTiet.setIdSP(sanPham.getIdSP());
				donHangChiTiet.setProduct(sanPham);
				donHangChiTiet.setQuantity(1); // Số lượng mặc định
				donHangChiTiet.setTotalPrice(sanPham.getGia());

				// Thêm sản phẩm vào giỏ hàng
				gioHang.themSanPham(donHangChiTiet);
			}

			redirectAttributes.addFlashAttribute("message", "Sản phẩm đã được thêm vào giỏ hàng.");
		}
		return "redirect:/";
	}

	@PostMapping("/update-cart")
	public String updateCart(@RequestParam("soLuongList") List<Integer> soLuongList, HttpSession session) {
		GioHang gioHang = (GioHang) session.getAttribute("cart");

		if (gioHang != null) {
			List<DonHangChiTiet> donHangChiTiets = gioHang.getCacSanPham();
			for (int i = 0; i < soLuongList.size(); i++) {
				DonHangChiTiet donHangChiTiet = donHangChiTiets.get(i);
				int newQuantity = soLuongList.get(i);
				donHangChiTiet.setQuantity(newQuantity);
				donHangChiTiet.setTotalPrice(donHangChiTiet.getProduct().getGia() * newQuantity);
			}
			gioHang.setCacSanPham(donHangChiTiets);
		}

		return "redirect:/cart";
	}

	@GetMapping("/remove-from-cart")
	public String xoaSanPhamKhoiGioHang(@RequestParam("maSanPham") int maSanPham,
			RedirectAttributes redirectAttributes) {
		// Lấy giỏ hàng từ session
		// Đảm bảo rằng bạn đã tạo và lưu giỏ hàng vào session ở nơi khác trong ứng dụng
		GioHang gioHang = (GioHang) sessionService.get("cart");
		System.out.println("b " + gioHang);
		if (gioHang != null) {
			// Tìm sản phẩm theo mã sản phẩm
			DonHangChiTiet donHangChiTiet = gioHang.timSanPhamTheoIdSP(maSanPham);
			System.out.println("a " + donHangChiTiet);

			if (donHangChiTiet != null) {
				// Xóa sản phẩm khỏi giỏ hàng
				gioHang.xoaSanPham(donHangChiTiet);
				redirectAttributes.addFlashAttribute("message", "Sản phẩm đã được xóa khỏi giỏ hàng.");
			}
		}

		// Chuyển hướng lại đến trang giỏ hàng sau khi xóa sản phẩm
		return "redirect:/cart";
	}

	@GetMapping("/check-out")
	public String thongTinThanhToan(@ModelAttribute("cart") GioHang gioHang, Model model) {
		if (gioHang != null && !gioHang.isEmpty()) {
			model.addAttribute("cartItems", gioHang.getCacSanPham());
			model.addAttribute("tongTien", gioHang.tinhTongTien());
			return "user/checkout"; // Trả về trang thông tin thanh toán
		} else {
			return "user/my_cart"; // Trả về trang giỏ hàng trống nếu không có sản phẩm trong giỏ hàng
		}
	}

	@PostMapping("/check-out")
	public String thanhToan(Model model, HttpSession session, @RequestParam("tenNguoiNhan") String tenNguoiNhan,
			@RequestParam("diaChiGiao") String diaChiGiao, @RequestParam("sdtNguoiNhan") String sdtNguoiNhan,
			RedirectAttributes redirectAttributes) {
		NguoiDung currentUser = (NguoiDung) session.getAttribute(SessionAttr.CURRENT_USER);
		GioHang gioHang = (GioHang) model.getAttribute("cart");
		System.out.println("gh " + gioHang);
		if (gioHang != null && !gioHang.isEmpty()) {
			// Tạo một đơn hàng mới và lưu vào cơ sở dữ liệu
			Date currentDate = new Date();// lấy ngày đặt
			DonHang donHang = new DonHang(); // Điền thông tin đơn hàng
			donHang.setNguoiDung(currentUser);
			donHang.setTenNguoiNhan(tenNguoiNhan); // Điền tên người nhận
			donHang.setDiaChiGiao(diaChiGiao); // Điền địa chỉ giao hàng
			donHang.setSdtNguoiNhan(sdtNguoiNhan); // Điền số điện thoại người nhận
			donHang.setTongTien(gioHang.tinhTongTien()); // Tính tổng tiền từ giỏ hàng
			donHang.setNgayDat(currentDate);

			try {
				dhService.saveDonHang(donHang);

				// Tạo chi tiết đơn hàng từ giỏ hàng và lưu vào cơ sở dữ liệu
				for (DonHangChiTiet chiTiet : gioHang.getCacSanPham()) {
					// Kiểm tra xem mã sản phẩm hợp lệ trước khi tạo chi tiết đơn hàng
					int maSanPham = chiTiet.getProduct().getIdSP();
					System.out.println("ma " + maSanPham);
					SanPhams sanPham = spService.getSanPhamById(maSanPham);
					if (sanPham != null) {
						chiTiet.setDonHang(donHang);
						dhService.taoChiTietDonHang(chiTiet);

					} else {
						System.out.println("Mã sản phẩm không hợp lệ: " + maSanPham);
					}
				}
				// Xóa giỏ hàng sau khi đã tạo đơn hàng
				gioHang.clear();
				session.setAttribute("cart", gioHang);
				redirectAttributes.addFlashAttribute("message", "Thanh toán thành công.");

				return "redirect:/check-out";
			} catch (Exception e) {
				redirectAttributes.addFlashAttribute("message", "Thanh toán thất bại." + e.getMessage());
				System.out.println("Lỗi khi lưu đơn hàng: " + e.getMessage());
			}
		} else {
			return "user/my_cart"; // Trả về trang giỏ hàng trống nếu không có sản phẩm trong giỏ hàng
		}
		System.out.println("Không thể thực hiện thanh toán.");
		return "404"; // Trả về trang lỗi nếu có lỗi
	}

}
