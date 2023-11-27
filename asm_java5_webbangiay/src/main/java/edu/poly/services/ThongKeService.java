package edu.poly.services;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import edu.poly.model.DonHang;
import edu.poly.model.DonHangChiTiet;
@Service
public interface ThongKeService {
	public List<DonHang> getDonHangTrongVongNgay(Date startDate, Date endDate);

	public List<DonHang> getDonHangTrongVong30Ngay(Date currentDate);

	public List<DonHang> getDonHangTrongVong3Thang(Date currentDate);
	
	
	
	// đơn hàng chi tiết
	 public List<DonHangChiTiet> getDonHangChiTietTrongVongNgay(Date startDate, Date endDate);

	// Hàm trả về ngày sau khi trừ đi một số ngày
	public Date getNDaysAgo(Date date, int n);

	// Hàm trả về ngày sau khi trừ đi một số tháng
	public Date getNMonthsAgo(Date date, int n);
}
