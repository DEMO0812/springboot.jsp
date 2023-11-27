package edu.poly.services.Impl;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.poly.model.DonHang;
import edu.poly.model.DonHangChiTiet;
import edu.poly.repositories.DonHangChiTietRepository;
import edu.poly.repositories.DonHangRepository;
import edu.poly.services.ThongKeService;
@Service
public class ThongKeServiceImpl implements ThongKeService{
	@Autowired
	DonHangRepository dhRepository;
	@Autowired
	DonHangChiTietRepository dhChiTietRepository;
	
	@Override
	public List<DonHang> getDonHangTrongVongNgay(Date startDate, Date endDate) {
		return dhRepository.findByNgayDatBetween(startDate, endDate);
	}

	@Override
	public List<DonHang> getDonHangTrongVong30Ngay(Date currentDate) {
		Date thirtyDaysAgo = getNDaysAgo(currentDate, 30);
		return dhRepository.findByNgayDatBetween(thirtyDaysAgo, currentDate);
	}

	@Override
	public List<DonHang> getDonHangTrongVong3Thang(Date currentDate) {
		Date threeMonthsAgo = getNMonthsAgo(currentDate, 3);
		return dhRepository.findByNgayDatBetween(threeMonthsAgo, currentDate);
	}

	// Hàm trả về ngày sau khi trừ đi một số ngày
	@Override
	public Date getNDaysAgo(Date date, int n) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.DAY_OF_MONTH, -n);
		return calendar.getTime();
	}

	// Hàm trả về ngày sau khi trừ đi một số tháng
	@Override
	public Date getNMonthsAgo(Date date, int n) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.MONTH, -n);
		return calendar.getTime();
	}

	@Override
	public List<DonHangChiTiet> getDonHangChiTietTrongVongNgay(Date startDate, Date endDate) {
		 return dhChiTietRepository.findByDonHang_NgayDatBetween(startDate, endDate);
	}
}
