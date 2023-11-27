package edu.poly.model;

import java.io.Serializable;
import java.util.Date;

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

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "GioHangItem")
public class GioHangItem implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ghItemId")
	private int ghItemId;

	@Column(name = "idSP")
	private int idSP;

	@Column(name = "quantity")
	private int quantity;

	@Column(name = "totalPrice")
	private double totalPrice;
	
	public void tangSoLuong() {
        this.quantity++; // Tăng số lượng lên 1 đơn vị
        this.totalPrice = this.quantity * this.product.getGia(); // Cập nhật tổng tiền
    }

	@ManyToOne
	@JoinColumn(name = "idSP", referencedColumnName = "IdSP", insertable = false, updatable = false)
	private SanPhams product;

}
