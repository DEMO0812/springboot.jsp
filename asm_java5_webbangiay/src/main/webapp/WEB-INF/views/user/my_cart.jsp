<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/common/user/head.jsp"%>
</head>
<body>

	<div class="pos_page">
		<div class="container">
			<!--pos page inner-->
			<div class="pos_page_inner">
				<%@ include file="/common/user/header.jsp"%>

				<!--breadcrumbs area start-->
				<div class="breadcrumbs_area">
					<div class="row">
						<div class="col-12">
							<div class="breadcrumb_content">
								<ul>
									<li><a href="index.html">home</a></li>
									<li><i class="fa fa-angle-right"></i></li>
									<li>giỏ hàng</li>
								</ul>

							</div>
						</div>
					</div>
				</div>
				<!--breadcrumbs area end-->

				<!--shopping cart area start -->
				<div class="shopping_cart_area">
					<form action="/update-cart" method="post">
						<div class="row">
							<div class="col-12">
								<div class="table_desc">
									<div class="cart_page table-responsive">

										<table>
											<thead>
												<tr>
													<th class="product_remove">Xóa</th>
													<th class="product_thumb">Ảnh</th>
													<th class="product_name">Sản phẩm</th>
													<th class="product-price">Gía</th>
													<th class="product_quantity">Số lượng</th>
													<th class="product_total">Tổng</th>
												</tr>
											</thead>


											<tbody>
												<c:forEach items="${cartItems}" var="cartItem">
													<tr>
														<td class="product_remove"><a
															href="/remove-from-cart?maSanPham=${cartItem.product.idSP}">
																<i class="fa fa-trash-o"></i>
														</a></td>
														<td class="product_thumb"><a href="#"> <img
																src="<c:out value='images/products/${cartItem.product.img}' />"
																alt="">
														</a></td>
														<td class="product_name"><a
															href="/ctSanPham/${cartItem.idSP}"><c:out
																	value="${cartItem.product.tenSP}" /></a></td>
														<td class="product-price"><c:out
																value="${cartItem.product.gia}" /></td>
														<td class="product_quantity"><input min="0" max="100"
															name="soLuongList" value="${cartItem.quantity}"
															type="number" /></td>
														<td class="product_total"><c:out
																value="${cartItem.totalPrice}" /></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>

									</div>
									<c:if test="${not empty message}">
										<div class="alert alert-success">${message}</div>
									</c:if>
									<div class="cart_submit">
										<button type="submit">cẬP NHẬT GIỎ HÀNG</button>
									</div>

								</div>
							</div>
						</div>
						<!--coupon code area start-->
						<div class="coupon_area">
							<div class="row">
								<div class="col-lg-6 col-md-6">

									<h5>
										<a href="/" style="color: red;" >Tiếp tục mua sắm</a>
									</h5>
								</div>
								<div class="col-lg-6 col-md-6">
									<div class="coupon_code">
										<h3>TỔNG SỐ GIỎ HÀNG</h3>
										<div class="coupon_inner">


											<div class="cart_subtotal">
												<p>Tổng cộng</p>
												<p class="cart_amount">${tongTien}</p>
											</div>
											<div class="checkout_btn">
												<a href="/check-out">Tiến hành kiểm tra</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!--coupon code area end-->
					</form>
				</div>
				<!--shopping cart area end -->




			</div>
		</div>
	</div>




	<%@ include file="/common/user/footer.jsp"%>
	<%@ include file="/common/user/js.jsp"%>
</body>
</html>