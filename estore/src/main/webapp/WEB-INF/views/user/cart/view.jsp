<%@ page pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
		<h2>Giỏ Hàng</h2>
		<table class="table">
			<thead>
				<tr>
				 	<th>STT</th>
					<th>Tên Sản Phẩm</th>
					<th>Đơn Giá</th>
					<th>Giảm Giá</th>
					<th>Số Lượng</th>
					<th>Tổng Tiên</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="p" items="${sessionScope['scopedTarget.cartService'].items}" varStatus ="status">
					<tr data-id="${p.id}" data-price="${p.unitPrice}" data-discount="${p.discount}">
						<td>${status.index + 1}</td>
						<td>${p.name}</td>
						<td>${p.unitPrice}</td>
						<td>${p.discount*100} %</td>
						<td><input value="${p.quantity}" type="number" min="1" style="width:70px"></td>
						<td class="amt">${p.quantity*p.unitPrice*(1-p.discount)}</td>
						<td>
							<button class="btn btn-sm btn-warning btn-cart-remove">
								<i class="glyphicon glyphicon-trash"></i>
							</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<button class="btn btn-sm btn-danger  btn-cart-clear">Hủy</button>
		<button class="btn btn-sm btn-info">Tiếp Tục</button>
		<a href="/order/checkout" class="btn btn-sm btn-success">Thanh Toán</a>