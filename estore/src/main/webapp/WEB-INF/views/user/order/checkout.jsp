<%@ page pageEncoding="utf-8" %>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
		<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="utf-8">
				<title>Thanh Toán</title>
			</head>

			<body>
				<h2>Thủ Tục Thanh Toán</h2>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>STT</th>
							<th>Tên Sản Phẩm</th>
							<th>Đơn Giá</th>
							<th>Số Lượng</th>
							<th>Phần Trăm Giảm Giá</th>
							<th>Tổng Tiền</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="p" items="${sessionScope['scopedTarget.cartService'].items}" varStatus ="status">
					<tr data-id="${p.id}" data-price="${p.unitPrice}" data-discount="${p.discount}">
						<td>${status.index + 1}</td>
						<td>${p.name}</td>
						<td>${p.unitPrice}</td>
						<td>${p.quantity}</td>
						<td>${p.discount*100} %</td>
						<td class="amt">${p.quantity*p.unitPrice*(1-p.discount)}</td>
					</tr>
				</c:forEach>
					</tbody>
				</table>
				${message}
				<form:form action="/order/checkout" modelAttribute="order">
					<form:hidden path="id" />
					<div class="row">
						<div class="form-group col-sm-4">
							<label>Khách Hàng</label>
							<form:input path="customer.id" readonly="true" cssClass="form-control" />
						</div>
						<div class="form-group col-sm-4">
							<label>Ngày Mua</label>
							<form:input path="orderDate" readonly="true" cssClass="form-control" />
						</div>
						<div class="form-group col-sm-4">
							<label>Ngày Nhận</label>
							<form:input path="requireDate" cssClass="form-control" />
						</div>
					</div>
					<div class="row">
						<div class="form-group col-sm-4">
							<label>Người Nhận</label>
							<form:input path="receiver" cssClass="form-control" />
						</div>
						<div class="form-group col-sm-4">
							<label>Địa Chỉ Nhận Hàng</label>
							<form:input path="address" cssClass="form-control" />
						</div>
						<div class="form-group col-sm-4">
							<label>Tổng Tiền</label>
							<form:input path="amount" readonly="true" cssClass="form-control" />
						</div>
					</div>
					<div class="row">
						<div class="form-group col-sm-12">
							<label>Ghi Chú</label>
							<form:textarea path="description" cssClass="form-control" rows="5"></form:textarea>
						</div>
						<div class="form-group col-sm-12">
							<button class="btn btn-default">Mua</button>
						</div>
					</div>
				</form:form>
			</body>

			</html>