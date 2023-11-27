package edu.poly.services.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.poly.model.DonHangChiTiet;
import edu.poly.repositories.DonHangChiTietRepository;
import edu.poly.services.DonHangChiTietService;
@Service
public class DonHangChiTietServiceImpl implements DonHangChiTietService {
	@Autowired
	DonHangChiTietRepository donHangChiTietRepository;
	
	@Override
	public List<DonHangChiTiet> getAllDonHangChiTiet() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public DonHangChiTiet getDonHangChiTietById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public DonHangChiTiet saveDonHangChiTiet(DonHangChiTiet donHangChiTiet) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteDonHangChiTiet(int id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public DonHangChiTiet timSanPhamTheoIdSP(int maSanPham) {
		return donHangChiTietRepository.findByProduct_IdSP(maSanPham);
	}

}
