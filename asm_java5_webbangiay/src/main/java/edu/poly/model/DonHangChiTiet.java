package edu.poly.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "DonHangChiTiet")
public class DonHangChiTiet implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private int id;

	@Column(name = "IdSP")
	private int idSP;

	@ManyToOne
	@JoinColumn(name = "IdDH")
	private DonHang donHang;

	@Column(name = "SoLuong")
	private int quantity;

	@Column(name = "Gia")
	private double totalPrice;

	public void tangSoLuong() {
		this.quantity++; // Tăng số lượng lên 1 đơn vị
		this.totalPrice = this.quantity * this.product.getGia(); // Cập nhật tổng tiền
	}

	@ManyToOne
	@JoinColumn(name = "IdSP", referencedColumnName = "IdSP", insertable = false, updatable = false)
	private SanPhams product;

}
