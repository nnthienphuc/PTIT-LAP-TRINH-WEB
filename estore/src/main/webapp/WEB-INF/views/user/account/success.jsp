<%@ page pageEncoding="UTF-8" %>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
		<div id="mainBody">
			<div class="row">
				<div class="span9" id="mainCol">
					<ul class="breadcrumb">
						<li><a href="/home/index">Trang Chủ</a> <span class="divider"></span></li>
						<li class="active">Đăng nhập</li>
					</ul>
					<h2>LOGIN</h2>
					<h4>${message}</h4>
					<form:errors path="*" element="ul" />
					<form action="/account/login" method="post">
					</form>
				</div>
			</div>
		</div>