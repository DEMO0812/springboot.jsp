package edu.poly.services;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import edu.poly.model.DonHang;
import edu.poly.model.DonHangChiTiet;

@Service
public interface DonHangService {
	List<DonHang> getAllDonHang();

	DonHang getDonHangById(int id);

	DonHang saveDonHang(DonHang donHang);

	void deleteDonHang(int id);

	DonHangChiTiet taoChiTietDonHang(DonHangChiTiet donHangChiTiet);

	
}
