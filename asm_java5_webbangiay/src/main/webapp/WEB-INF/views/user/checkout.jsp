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
									<li>Thanh Toán</li>
								</ul>

							</div>
						</div>
					</div>
				</div>
				<!--breadcrumbs area end-->


				<!--Checkout page section-->
				<div class="Checkout_section">

					<div class="checkout_form">
						<div class="row">
							<div class="col-lg-6 col-md-6">
								<form action="/check-out" method="post">
									<h3>Billing Details</h3>
									<div class="row">
										<div class="col-lg-6 mb-30">
											<label>Tên <span>*</span></label> <input name="tenNguoiNhan"
												type="text" required>
										</div>
										<div class="col-lg-6 mb-30">
											<label>Địa Chỉ <span>*</span></label> <input
												name="diaChiGiao" type="text" required>
										</div>
										<div class="col-12 mb-30">
											<label>Số điện thoại</label> <input name="sdtNguoiNhan"
												type="text" required>
										</div>
									</div>
							</div>


							<div class="col-lg-6 col-md-6">

								<h3>Your order</h3>
								<div class="order_table table-responsive mb-30">
									<table>
										<thead>
											<tr>
												<th>Sản phẩm</th>
												<th>Ảnh</th>
												<th>Giá</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${cartItems}" var="item">
												<td><h6>${item.product.tenSP}
														<strong> × ${item.quantity}</strong>
													</h6></td>
												<td class="product_thumb"><a href="#"> <img
														src="<c:out value='images/products/${item.product.img}' />"
														alt="">
												</a></td>
												<td><h6>${item.totalPrice}</h6></td>
												</tr>
											</c:forEach>

										</tbody>
										<tfoot>
											<tr>
												<th>Cart Subtotal</th>
												<td><h5>${tongTien}</h5></td>
											</tr>
											<tr>
												<th>Phí ship không thay đổi</th>
												<td><strong>30.000VND</strong></td>
											</tr>
											<tr class="order_total">
												<th>Order Total</th>
												<td><h5>${tongTien + 30000}</h5></td>
											</tr>
										</tfoot>
									</table>
								</div>

								<div class="payment_method">

									<div class="panel-default">
										<input id="payment_defult" name="check_method" type="radio"
											data-target="createp_account"> <label
											for="payment_defult" data-toggle="collapse"
											data-target="#collapsedefult" aria-controls="collapsedefult">PayPal
											<img src="user/assets/img/visha/papyel.png" alt="">
										</label>


									</div>
									<div class="order_button">
										<button type="submit">Proceed to PayPal</button>
									</div>
								</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!--Checkout page section end-->



			</div>
		</div>
	</div>
	<%@ include file="/common/user/footer.jsp"%>
	<%@ include file="/common/user/js.jsp"%>
</body>
</html>