<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<title>Thống kê</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>


	<div class="container mt-5">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Thông tin thống kê</h5>
						<div class="row">
							<div class="col-md-3">
								<p>
									Tổng số đơn hàng: <span id="totalOrders">${thongKeDTO.totalOrders}</span>
								</p>
							</div>
							<div class="col-md-3">
								<p>
									Tổng tiền: <span id="totalMoney">${thongKeDTO.totalMoney}</span>
								</p>
							</div>
							<div class="col-md-3">
								<p>
									Tổng số lượng: <span id="totalQuantity">${thongKeDTO.totalQuantity}</span>
								</p>
							</div>
							<div class="col-md-3">
								<p>
									Tổng số khách hàng: <span id="totalUniqueCustomers">${thongKeDTO.totalUniqueCustomers}</span>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- HTML của nút -->
			<div class="mt-5">
				<a href="/thongke/7ngay">7 Ngày</a>
				<a href="/thongke/7ngay">1 Tháng</a>
				<a href="/thongke/7ngay">3 Tháng</a>
				<a href="/thongke/7ngay">1 Năm</a>
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
	
		
</body>

</html>
