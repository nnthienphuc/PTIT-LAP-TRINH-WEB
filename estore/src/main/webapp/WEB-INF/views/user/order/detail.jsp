<%@ page pageEncoding="UTF-8" %>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
		<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
			<h2>Thông Tin Đơn Hàng</h2>
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
						<form:input path="requireDate" readonly="true" cssClass="form-control" />
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-4">
						<label>Người Nhận</label>
						<form:input path="receiver" readonly="true" cssClass="form-control" />
					</div>
					<div class="form-group col-sm-4">
						<label>Địa Chỉ Nhận Hàng</label>
						<form:input path="address" readonly="true" cssClass="form-control" />
					</div>
					<div class="form-group col-sm-4">
						<label>Tổng Tiền</label>
						<form:input path="amount" readonly="true" cssClass="form-control" />
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-12">
						<label>Ghi Chú</label>
						<form:textarea path="description" readonly="true" cssClass="form-control" rows="5"/>
					</div>
				</div>
			</form:form>
			<h2>Chi Tiết Đơn Hàng</h2>
			<table class="table">
				<thead>
					<tr>
						<th>STT</th>
						<th>Tên Sản Phẩm</th>
						<th>Đơn Giá</th>
						<th>Số Lượng</th>
						<th>Giảm Giá</th>
						<th>Tổng Tiền</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="d" items="${details}" varStatus ="status">
						<tr>
							<td>${status.index + 1}</td>
							<td>${d.product.name}</td>
							<td>${d.unitPrice}</td>
							<td>${d.quantity}</td>
							<td>${d.discount*100} %</td>
							<td>${d.unitPrice*d.quantity*(1-d.discount)}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>