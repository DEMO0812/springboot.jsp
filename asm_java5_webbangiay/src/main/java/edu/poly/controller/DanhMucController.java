package edu.poly.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.poly.model.SanPhams;
import edu.poly.repositories.SanPhamRepository;
import edu.poly.services.SanPhamService;

@Controller
public class DanhMucController {
	@Autowired
	SanPhamService spService;
	@Autowired
	SanPhamRepository sanPhamsRepository;

	// load sp theo dm
	@RequestMapping("shop1")
	public String sho(Model model, @RequestParam(defaultValue = "0") int idDMC) {
		// Lấy một trang sản phẩm theo id danh mục con
		List<SanPhams> spHome = spService.findByDanhMucCon_IdDMC(idDMC);

		// Thêm trang sản phẩm vào model
		model.addAttribute("spHome", spHome);
		return "user/sanpham";
	}

	@RequestMapping("giay_nu")
	public String shop_nu(Model model, String string1) {
		List<SanPhams> spHome = sanPhamsRepository.findAllByTenSPContaining("nữ");
		model.addAttribute("spHome", spHome);
		return "user/sanpham";
	}

	@RequestMapping("giay_nam")
	public String shop_nam(Model model, String string1) {
		List<SanPhams> spHome = sanPhamsRepository.findAllByTenSPContaining("nam");
		model.addAttribute("spHome", spHome);
		return "user/sanpham";
	}
}
