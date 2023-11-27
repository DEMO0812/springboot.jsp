package edu.poly.controller;

import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import edu.poly.model.DonHang;
import edu.poly.model.DonHangChiTiet;
import edu.poly.model.ThongKeDTO;
import edu.poly.services.ThongKeService;

//@RestController
@Controller
@RequestMapping("/thongke")
public class ThongKeController {
	@Autowired
	private ThongKeService thongKeService;



	@GetMapping("/7ngay")
	public String thongKeTrong7Ngay(Model model) {
		Date currentDate = new Date();
		Date sevenDaysAgo = thongKeService.getNDaysAgo(currentDate, 7);

		List<DonHang> donHangList = thongKeService.getDonHangTrongVongNgay(sevenDaysAgo, currentDate);
		List<DonHangChiTiet> donHangChiTietList = thongKeService.getDonHangChiTietTrongVongNgay(sevenDaysAgo,
				currentDate);

		double totalMoney = donHangList.stream().mapToDouble(DonHang::getTongTien).sum();
		int totalQuantity = donHangChiTietList.stream().mapToInt(DonHangChiTiet::getQuantity).sum();

		// Tính toán số khách hàng duy nhất
		Set<String> uniqueCustomers = donHangList.stream()
		        .filter(donHang -> donHang.getNguoiDung() != null) // Lọc ra các đơn hàng có người dùng không null
		        .map(donHang -> donHang.getNguoiDung().getUsername())
		        .collect(Collectors.toSet());

		int totalUniqueCustomers = uniqueCustomers.size();

		ThongKeDTO thongKeDTO = new ThongKeDTO(donHangList.size(), totalMoney, totalQuantity, totalUniqueCustomers);
		model.addAttribute("thongKeDTO", thongKeDTO);
		return "admin/ThongKe";
	}
	
	@GetMapping("/1thang")
	public String thongKeTrong1Thang(Model model) {
	    Date currentDate = new Date();
	    Date oneMonthAgo = thongKeService.getNDaysAgo(currentDate, 30);

	    List<DonHang> donHangList = thongKeService.getDonHangTrongVong30Ngay(currentDate);
	    List<DonHangChiTiet> donHangChiTietList = thongKeService.getDonHangChiTietTrongVongNgay(oneMonthAgo, currentDate);

	    double totalMoney = donHangList.stream().mapToDouble(DonHang::getTongTien).sum();
	    int totalQuantity = donHangChiTietList.stream().mapToInt(DonHangChiTiet::getQuantity).sum();

	    Set<String> uniqueCustomers = donHangList.stream()
	            .filter(donHang -> donHang.getNguoiDung() != null)
	            .map(donHang -> donHang.getNguoiDung().getUsername())
	            .collect(Collectors.toSet());

	    int totalUniqueCustomers = uniqueCustomers.size();

	    ThongKeDTO thongKeDTO = new ThongKeDTO(donHangList.size(), totalMoney, totalQuantity, totalUniqueCustomers);
	    model.addAttribute("thongKeDTO", thongKeDTO);
	    return "admin/ThongKe";
	}

	@GetMapping("/3thang")
	public String thongKeTrong3Thang(Model model) {
	    Date currentDate = new Date();
	    Date threeMonthsAgo = thongKeService.getNDaysAgo(currentDate, 90);

	    List<DonHang> donHangList = thongKeService.getDonHangTrongVong3Thang(currentDate);
	    List<DonHangChiTiet> donHangChiTietList = thongKeService.getDonHangChiTietTrongVongNgay(threeMonthsAgo, currentDate);

	    double totalMoney = donHangList.stream().mapToDouble(DonHang::getTongTien).sum();
	    int totalQuantity = donHangChiTietList.stream().mapToInt(DonHangChiTiet::getQuantity).sum();

	    Set<String> uniqueCustomers = donHangList.stream()
	            .filter(donHang -> donHang.getNguoiDung() != null)
	            .map(donHang -> donHang.getNguoiDung().getUsername())
	            .collect(Collectors.toSet());

	    int totalUniqueCustomers = uniqueCustomers.size();

	    ThongKeDTO thongKeDTO = new ThongKeDTO(donHangList.size(), totalMoney, totalQuantity, totalUniqueCustomers);
	    model.addAttribute("thongKeDTO", thongKeDTO);
	    return "admin/ThongKe";
	}

	@GetMapping("/toanbo")
	public String thongKeToanBo(Model model) {
	    Date currentDate = new Date();
	    Date allTimeAgo = thongKeService.getNDaysAgo(currentDate, 365); // Sử dụng 365 ngày cho toàn bộ

	    List<DonHang> donHangList = thongKeService.getDonHangTrongVongNgay(allTimeAgo, currentDate);
	    List<DonHangChiTiet> donHangChiTietList = thongKeService.getDonHangChiTietTrongVongNgay(allTimeAgo, currentDate);

	    double totalMoney = donHangList.stream().mapToDouble(DonHang::getTongTien).sum();
	    int totalQuantity = donHangChiTietList.stream().mapToInt(DonHangChiTiet::getQuantity).sum();

	    Set<String> uniqueCustomers = donHangList.stream()
	            .filter(donHang -> donHang.getNguoiDung() != null)
	            .map(donHang -> donHang.getNguoiDung().getUsername())
	            .collect(Collectors.toSet());

	    int totalUniqueCustomers = uniqueCustomers.size();

	    ThongKeDTO thongKeDTO = new ThongKeDTO(donHangList.size(), totalMoney, totalQuantity, totalUniqueCustomers);
	    model.addAttribute("thongKeDTO", thongKeDTO);
	    return "admin/ThongKe";
	}

}
