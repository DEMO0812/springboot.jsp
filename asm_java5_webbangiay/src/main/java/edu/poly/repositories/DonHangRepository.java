package edu.poly.repositories;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import edu.poly.model.DonHang;

@Repository
public interface DonHangRepository extends JpaRepository<DonHang, Integer>{
	List<DonHang> findByNgayDatBetween(Date startDate, Date endDate);
}
