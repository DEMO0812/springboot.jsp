package edu.poly.repositories;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import edu.poly.model.DonHangChiTiet;

@Repository
public interface DonHangChiTietRepository extends JpaRepository<DonHangChiTiet, Integer> {
	DonHangChiTiet findByProduct_IdSP(int idSP);
	List<DonHangChiTiet> findByDonHang_NgayDatBetween(Date startDate, Date endDate);
}
