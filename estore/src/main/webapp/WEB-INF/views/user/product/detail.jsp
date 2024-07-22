<%@ page pageEncoding="utf-8" %>
	<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
		<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
			<div class="row">
				<div>
					<div class="col-sm-5 text-center">
						<img class="detail-img" src="/static/images/products/${prod.image}">
					</div>
					<div class="col-sm-7">
						<ul class="detail-info">
							<li>Tên Sản Phẩm: ${prod.name}</li>
							<li>Đơn Giá:
								<f:formatNumber value="${prod.unitPrice}" pattern="#,###.0" />USD
							</li>
							<li>Đơn Vị: ${prod.unitBrief}</li>
							<li>Ngày Sản Xuất:
								<f:formatDate value="${prod.productDate}" pattern="dd-MM-yyyy" />
							</li>
							<li>Thể Loại: ${prod.category.nameVN}</li>
							<li>Số Lượng: ${prod.quantity}</li>
							<li>Phần Trăm Giảm Giá:
								<f:formatNumber value="${prod.discount}" type="percent" />
							</li>
							<li>Lượt Xem: ${prod.views}</li>
							<li>Có Sẵn: ${prod.available?'Có':'Không'}</li>
							<li>Đặc Biệt: ${prod.special?'Có':'Không'}</li>
							<li>Mới Nhất: ${prod.latest?'Có':'Không'}</li>
							<li>Mô Tả: ${prod.description}</li>
							
							<div data-id="${prod.id}" class="d-flex">
				              <button class="btn btn-sm btn-danger">
				                <i class="glyphicon glyphicon-shopping-cart btn-add-to-cart"> </i>
				              </button>
				              <button class="btn btn-sm btn-warning btn-star">
				                <i class="glyphicon glyphicon-star"> </i>
				              </button>
				              <button class="btn btn-sm btn-success btn-open-dialog" data-toggle="modal" data-target="#myModal">
				                <i class="glyphicon glyphicon-envelope"> </i>
				              </button>
            				</div>
						</ul>
					</div>
					
				</div>
			</div>
				<ul class="nav nav-tabs">
					<li class="active"><a data-toggle="tab" href="#tab1">Cùng Loại</a></li>
					<li><a data-toggle="tab" href="#tab2">Yêu Thích</a></li>
					<li><a data-toggle="tab" href="#tab3">Đã Xem</a></li>
				</ul>

				<div class="tab-content">
					<div id="tab1" class="tab-pane fade in active">
						<div class="flex">
							<c:forEach var="p" items="${list}">
								<a href="/product/detail/${p.id}"> <img class="thumb-img"
										src="/static/images/products/${p.image}">
								</a>
							</c:forEach>
						</div>
					</div>
					<div id="tab2" class="tab-pane fade">
						<div class="flex">
							<c:forEach var="p" items="${favo}">
								<a href="/product/detail/${p.id}"> <img class="thumb-img"
										src="/static/images/products/${p.image}">
								</a>
							</c:forEach>
						</div>
					</div>
					<div id="tab3" class="tab-pane fade">
						<div class="flex">
							<c:forEach var="p" items="${viewed}">
								<a href="/product/detail/${p.id}"> <img class="thumb-img"
										src="/static/images/products/${p.image}">
								</a>
							</c:forEach>
						</div>
					</div>
				</div>