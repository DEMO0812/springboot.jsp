<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/common/admin/head.jsp"%>

</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">

		<!-- Preloader -->
		<div
			class="preloader flex-column justify-content-center align-items-center">
			<img class="animation__shake" src="/admin/dist/img/AdminLTELogo.jpg"
				alt="AdminLTELogo" height="60" width="60">
		</div>

		<!-- Navbar -->
		<nav
			class="main-header navbar navbar-expand navbar-white navbar-light">
			<!-- Left navbar links -->
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" data-widget="pushmenu"
					href="#" role="button"><i class="fas fa-bars"></i></a></li>

			</ul>


			<!-- Right navbar links -->
			<ul class="navbar-nav ml-auto">
				<!-- Navbar Search -->
				<li class="nav-item"><a class="nav-link"
					data-widget="navbar-search" href="#" role="button"> <i
						class="fas fa-search"></i>
				</a>
					<div class="navbar-search-block">
						<form class="form-inline">
							<div class="input-group input-group-sm">
								<input class="form-control form-control-navbar" type="search"
									placeholder="Search" aria-label="Search">
								<div class="input-group-append">
									<button class="btn btn-navbar" type="submit">
										<i class="fas fa-search"></i>
									</button>
									<button class="btn btn-navbar" type="button"
										data-widget="navbar-search">
										<i class="fas fa-times"></i>
									</button>
								</div>
							</div>
						</form>
					</div></li>
				<!-- Notifications Dropdown Menu -->

				<li class="nav-item"><a class="nav-link"
					data-widget="control-sidebar" data-controlsidebar-slide="true"
					href="#" role="button"> <i class="fas fa-th-large"></i>
				</a></li>
			</ul>





		</nav>
		<!-- /.navbar -->

		<!-- Main Sidebar Container -->
		<aside class="main-sidebar sidebar-dark-primary elevation-4">
			<!-- Brand Logo -->
			<a href="/admin" class="brand-link"> <img
				src="/admin/dist/img/AdminLTELogo.jpg" alt="AdminLTE Logo"
				class="brand-image img-circle elevation-3" style="opacity: .8">
				<span class="brand-text font-weight-light">${sessionScope.user.tenND}</span>
			</a>

			<!-- Sidebar -->
			<div class="sidebar">


				<!-- SidebarSearch Form -->
				<div class="form-inline">
					<div class="input-group" data-widget="sidebar-search">
						<input class="form-control form-control-sidebar" type="search"
							placeholder="Search" aria-label="Search">
						<div class="input-group-append">
							<button class="btn btn-sidebar">
								<i class="fas fa-search fa-fw"></i>
							</button>
						</div>
					</div>
				</div>

				<!-- Sidebar Menu -->
				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column"
						data-widget="treeview" role="menu" data-accordion="false">
						<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
						<li class="nav-item "><a href="/admin" class="nav-link ">
								<i class="nav-icon fas fa-tachometer-alt"></i>
								<p>Home</p>
						</a></li>


						<li class="nav-item "><a href="#" class="nav-link"> <i
								class="nav-icon fas fa-tachometer-alt"></i>
								<p>
									Sản phẩm <i class="right fas fa-angle-left "></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="#" class="nav-link "> <i
										class="far fa-circle nav-icon"></i>
										<p>Tổng quan</p>
								</a></li>
								<li class="nav-item"><a href="/adminSp" class="nav-link ">
										<i class="far fa-circle nav-icon"></i>
										<p>Thêm mới sản phẩm</p>
								</a></li>
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>Hóa đơn</p>
								</a></li>
							</ul></li>


						<li class="nav-item menu-open "><a href="#"
							class="nav-link  active "> <i
								class="nav-icon fas fa-tachometer-alt"></i>
								<p>
									Thống kê <i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="/thongke/toanbo"
									class="nav-link active "> <i class="far fa-circle nav-icon"></i>
										<p>Doanh thu</p>
								</a></li>
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>Tốp sản phẩm bán chạy</p>
								</a></li>
							</ul></li>


					</ul>
				</nav>
				<!-- /.sidebar-menu -->
			</div>
			<!-- /.sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1 class="m-0">Doanh thu</h1>
						</div>
						<!-- /.col -->
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active">Doanh thu</li>
							</ol>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /.content-header -->



			<%-- bắt đầu --%>
			<div class="container mt-5">
				<div class="row">
					<div class="col-md-12">
						<!-- Small boxes (Stat box) -->
						<div class="row">
							<div class="col-lg-3 col-6">
								<!-- small box -->
								<div class="small-box bg-info">
									<div class="inner">
										<h3>${thongKeDTO.totalOrders}</h3>

										<p>Đơn hàng</p>
									</div>
									<div class="icon">
										<i class="ion ion-bag"></i>
									</div>
									
								</div>
							</div>
							<!-- ./col -->
							<div class="col-lg-3 col-6">
								<!-- small box -->
								<div class="small-box bg-success">
									<div class="inner">
										<h3>
											${thongKeDTO.totalMoney}<sup style="font-size: 20px">VND</sup>
										</h3>

										<p>Tổng tiền</p>
									</div>
									<div class="icon">
										<i class="ion ion-stats-bars"></i>
									</div>
									
								</div>
							</div>
							<!-- ./col -->
							<div class="col-lg-3 col-6">
								<!-- small box -->
								<div class="small-box bg-warning">
									<div class="inner">
										<h3>${thongKeDTO.totalUniqueCustomers}</h3>

										<p>Tổng số khách hàng</p>
									</div>
									<div class="icon">
										<i class="ion ion-person-add"></i>
									</div>
									
								</div>
							</div>
							<!-- ./col -->
							<div class="col-lg-3 col-6">
								<!-- small box -->
								<div class="small-box bg-danger">
									<div class="inner">
										<h3>${thongKeDTO.totalQuantity}</h3>

										<p>Tổng số lượng</p>
									</div>
									<div class="icon">
										<i class="ion ion-pie-graph"></i>
									</div>
									
								</div>
							</div>
							<!-- ./col -->
						</div>
						<!-- /.row -->
					</div>
					<!-- HTML của nút -->

					<div class="mt-3">
						<p>Lọc theo</p>
						<a href="/thongke/7ngay" class="btn btn-success">7 Ngày</a> <a
							href="/thongke/1thang" class="btn btn-success">1 Tháng</a> <a
							href="/thongke/3thang" class="btn btn-success">3 Tháng</a> <a
							href="/thongke/toanbo" class="btn btn-success">1 Năm</a>
					</div>
				</div>
				<div class="row mt-3">
					<div class="col-md-12">
						<canvas id="thongkeChart" width="400" height="200"></canvas>
					</div>
				</div>
			</div>

			<script>
	var ctx = document.getElementById('thongkeChart').getContext('2d');
    var thongKeData = {
        labels: ['Tổng số đơn hàng', 'Tổng tiền', 'Tổng số lượng'],
        datasets: [{
            label: 'Tổng số đơn hàng',
            data: [
                ${thongKeDTO.totalOrders},
                0, // Thêm 0 cho giá trị tổng tiền
                0 // Thêm 0 cho giá trị tổng số lượng
            ],
            backgroundColor: 'rgba(75, 192, 192, 0.2)',
            borderColor: 'rgba(75, 192, 192, 1)',
            borderWidth: 1
        }, {
            label: 'Tổng tiền',
            data: [
                0, // Thêm 0 cho giá trị tổng số đơn hàng
                ${thongKeDTO.totalMoney},
                0 // Thêm 0 cho giá trị tổng số lượng
            ],
            backgroundColor: 'rgba(255, 99, 132, 0.2)',
            borderColor: 'rgba(255, 99, 132, 1)',
            borderWidth: 1
        }, {
            label: 'Tổng số lượng',
            data: [
                0, // Thêm 0 cho giá trị tổng số đơn hàng
                0, // Thêm 0 cho giá trị tổng tiền
                ${thongKeDTO.totalQuantity}
            ],
            backgroundColor: 'rgba(54, 162, 235, 0.2)',
            borderColor: 'rgba(54, 162, 235, 1)',
            borderWidth: 1
        }]
    };

    var myChart = new Chart(ctx, {
        type: 'bar',
        data: thongKeData,
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
    </script>


			<%-- kết thúc --%>







			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<footer class="main-footer">
			<strong>Copyright &copy; 2023 <a href="">Demo</a>.
			</strong> All rights reserved.
			<div class="float-right d-none d-sm-inline-block">
				<b>Version</b> 3.2.0
			</div>
		</footer>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>
		<!-- /.control-sidebar -->
	</div>


	<%@ include file="/common/admin/js.jsp"%>
</body>
</html>

