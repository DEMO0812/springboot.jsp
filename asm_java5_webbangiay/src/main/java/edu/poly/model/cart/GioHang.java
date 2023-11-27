package edu.poly.model.cart;

import java.util.ArrayList;
import java.util.List;

import edu.poly.model.DonHangChiTiet;
import edu.poly.model.GioHangItem;
import edu.poly.model.SanPhams;

public class GioHang {
	private List<DonHangChiTiet> cacSanPham = new ArrayList<>();

	// Thêm sản phẩm vào giỏ hàng
	public void themSanPham(DonHangChiTiet gioHangItem) {
		cacSanPham.add(gioHangItem);
	}

	// Truy cập danh sách sản phẩm trong giỏ hàng
	public List<DonHangChiTiet> getCacSanPham() {
		return cacSanPham;
	}

	public void setCacSanPham(List<DonHangChiTiet> cacSanPham) {
		this.cacSanPham = cacSanPham;
	}

	// Xóa sản phẩm khỏi giỏ hàng
	public void xoaSanPham(DonHangChiTiet gioHangItem) {
		cacSanPham.remove(gioHangItem);
	}

	// Kiểm tra xem giỏ hàng có sản phẩm hay không
	public boolean isEmpty() {
		return cacSanPham.isEmpty();
	}

	public void clear() {
		cacSanPham.clear(); // Xóa danh sách sản phẩm
	}

	// Tính tổng tiền trong giỏ hàng
	public double tinhTongTien() {
		double tongTien = 0.0;
		for (DonHangChiTiet gioHangItem : cacSanPham) {
			tongTien += gioHangItem.getTotalPrice();
		}
		return tongTien;
	}

	// Trả về số lượng của một sản phẩm trong giỏ hàng
	public int getSoLuongSanPham(DonHangChiTiet gioHangItem) {
		int soLuong = 0;
		for (DonHangChiTiet item : cacSanPham) {
			if (item.getProduct().getIdSP() == gioHangItem.getProduct().getIdSP()) {
				soLuong++;
			}
		}
		return soLuong;
	}

	public DonHangChiTiet timSanPhamTheoIdSP(int maSanPham) {
		for (DonHangChiTiet gioHangItem : cacSanPham) {
			if (gioHangItem.getProduct().getIdSP() == maSanPham) {
				return gioHangItem;
			}
		}
		return null; // Trả về null nếu không tìm thấy sản phẩm
	}
}
