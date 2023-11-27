<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--pos page start-->
<div class="pos_page">
	<div class="container">
		<!--pos page inner-->
		<div class="pos_page_inner">
			<!--header area -->
			<div class="header_area">
				<!--header top-->
				<div class="header_top">
					<div class="row align-items-center">
						<div class="col-lg-6 col-md-6">
							<div class="switcher">
								<ul>
									<li class="languages"><a href="#"><img
											src="/user/assets/img/logo/fontlogo3.png" alt="">
											VietNam <i class="fa fa-angle-down"></i></a>
										<ul class="dropdown_languages">
											<li><a href="#"><img
													src="/user/assets/img/logo/fontlogo.jpg" alt="">
													English</a></li>
											<li><a href="#"><img
													src="/user/assets/img/logo/fontlogo3.png" alt="">
													VietNam </a></li>
										</ul></li>


								</ul>
							</div>
						</div>
						<div class="col-lg-6 col-md-6">
							<div class="header_links">
								<ul>
									<c:choose>
										<c:when test="${not empty sessionScope.user}">
											<!-- Hiển thị các thẻ khi đã đăng nhập -->
											<li class="nav-item"><a
												class="nav-link nav-link-1 active" href="/" title="welcom">
													Welcome, ${sessionScope.user.tenND} </a></li>
											<li><a href="contact.html" title="Contact">Liên Hệ</a></li>
											<li><a href="wishlist.html" title="wishlist">Sản
													Phẩm Yêu Thích</a></li>
											<li><a href="my-account.html" title="My account">Tài
													Khoản Của Tôi</a></li>
											<li><a href="/cart" title="My cart">Giỏ Hàng</a></li>
											<li><a href="/logout" title="Đăng xuất">Đăng xuất</a></li>
										</c:when>
										<c:otherwise>
											<!-- Hiển thị các thẻ khi chưa đăng nhập -->
											<li><a href="/login" title="Login">Đăng Nhập</a></li>
											<li><a href="/register" title="register">Đăng Ký</a></li>
											<li><a href="/forgotPassword" title="register">Lấy
													lại Pass</a></li>
										</c:otherwise>
									</c:choose>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<!--header top end-->

				<!--header middel-->
				<div class="header_middel">
					<div class="row align-items-center">
						<!--logo start-->
						<div class="col-lg-3 col-md-3">
							<div class="logo">
								<a href="index.html"><img
									src="/user/assets/img/logo/logo.png" alt=""></a>
							</div>
						</div>
						<!--logo end-->

						<div class="col-lg-9 col-md-9">
							<div class="header_right_info">
								<div class="search_bar">
									<form action="#">
										<input placeholder="Search..." type="text">
										<button type="submit">
											<i class="fa fa-search"></i>
										</button>
									</form>
								</div>
								<div class="shopping_cart">
									<a href="#"><i class="fa fa-shopping-cart"></i>
										${cartItems.size()} Sản phẩm - ${tongTien} <i
										class="fa fa-angle-down"></i></a>

									<!--mini cart-->
									<div class="mini_cart">
										<c:forEach items="${cartItems}" var="cartItem">
											<div class="cart_item">
												<div class="cart_img">
													<a href="#"><img
														src="<c:out value='images/products/${cartItem.product.img}' />"
														alt=""></a>
												</div>
												<div class="cart_info">
													<a href="#"><c:out value="${cartItem.product.tenSP}" /></a>
													<span class="cart_price">${cartItem.product.gia}</span> <span
														class="quantity">Qty: ${cartItem.quantity}</span>
												</div>
												<div class="cart_remove">
													<a title="Xóa sản phẩm"
														href="/remove-from-cart?maSanPham=${cartItem.idSP}"><i
														class="fa fa-times-circle"></i></a>
												</div>
											</div>
										</c:forEach>
										
											<div class="total_price">
												<span>Tổng cộng</span> <span class="prices">${tongTien}</span>
											</div>
											<div class="row">
												<div class="cart_button col-6">
													<a href="/cart"> Cart</a>
												</div>
												<div class="cart_button col-6">
													<a href="/check-out"> Thanh toán</a>
													
												</div>
											</div>
										
									</div>
									<!--mini cart end-->
								</div>

							</div>
						</div>

					</div>
				</div>
				
				
				<!--header middel end-->
					<!--header middel end-->
				<div class="header_bottom">
					<div class="row">
						<div class="col-12">
							<div class="main_menu_inner">
								<div class="main_menu d-none d-lg-block">
									<nav>
										<ul>
											<li class="active"><a href="/">Home</a></li>
											<li><a href="#">shop</a>
												<div class="mega_menu jewelry">
													<div class="mega_items jewelry">
														<ul>
															<li><a href="giay_nam">giày nam</a></li>
															<li><a href="giay_nu">giày nữ</a></li>
														</ul>
													</div>
												</div></li>
											<li><a href="#">women</a>
												<div class="mega_menu">
													<div class="mega_top fix">
														<div class="mega_items">
															<h3>
																<a href="shop1?idDMC=3">Sandal Nữ</a>
															</h3>
															<ul>
																<li><a href="">Giày quai hậu</a></li>
															</ul>
														</div>
														<div class="mega_items">
															<h3>
																<a href="shop1?idDMC=2">Giày cao gót</a>
															</h3>
															<ul>
																<li><a href="#">Cao gót nữ</a></li>
															</ul>
														</div>
														<div class="mega_items">
															<h3>
																<a href="shop1?idDMC=4">Dép nữ</a>
															</h3>
															<ul>
																<li><a href="#">Dép</a></li>
															</ul>
														</div>
														<div class="mega_items">
															<h3>
																<a href="shop1?idDMC=1">Sneaker nữ</a>
															</h3>
															<ul>
																<li><a href="#">Giày thể thao</a></li>

															</ul>
															
														</div>

													</div>
													<div class="mega_bottom fix">
														<div class="mega_thumb">
															<a href="#"><img
																src="/user/assets/img/banner/banner1.jpg" alt=""></a>
														</div>
														<div class="mega_thumb">
															<a href="#"><img
																src="/user/assets/img/banner/banner2.jpg" alt=""></a>
														</div>
													</div>
												</div></li>
											<li><a href="#">men</a>
												<div class="mega_menu">
													<div class="mega_top fix">
														<div class="mega_items">
															<h3>
																<a href="shop1?idDMC=5">Sneaker Nam</a>
															</h3>
															<ul>
																<li><a href="#">Giày thể thao</a></li>

															</ul>
														</div>
														<div class="mega_items">
															<h3>
																<a href="shop1?idDMC=7">Sandal Nam</a>
															</h3>
															<ul>
																<li><a href="#">Giày quai hậu</a></li>

															</ul>
														</div><div class="mega_items">
															<h3>
																<a href="shop1?idDMC=6">Dép Nam</a>
															</h3>
															<ul>
																<li><a href="#">Dép</a></li>

															</ul>
														</div>
														
														<div class="mega_items">
															<a href="#"><img
																src="/user/assets/img/banner/banner3.jpg" alt=""></a>
														</div>
													</div>
													
													
														

												</div></li>

											<li><a href="contact.html">contact us</a></li>

										</ul>
									</nav>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--header end -->