<%@ page pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
		<h2>Danh Sách Đơn Hàng</h2>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>Mã Đơn Hàng</th>
					<th>Ngày Đặt</th>
					<th>Người Nhận</th>
					<th>Địa Chỉ Nhận Hàng</th>
					<th>Tổng Tiền</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="o" items="${orders}">
					<tr>
						<td>${o.id}</td>
						<td>${o.orderDate}</td>
						<td>${o.receiver}</td>
						<td>${o.address}</td>
						<td>${o.amount}</td>
						<td>
							<a href="/order/detail/${o.id}" class="btn btn-sm btn-warning">
								Xem Chi Tiết
							</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>