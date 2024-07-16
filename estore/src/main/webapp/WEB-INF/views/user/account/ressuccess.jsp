<%@ page pageEncoding="UTF-8" %>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
		<div id="mainBody">
			<div class="row">
				<div class="span9" id="mainCol">
					<ul class="breadcrumb">
						<li><a href="/home/index">Trang Chủ</a> <span class="divider"></span></li>
						<li class="active">Đăng ký</li>
					</ul>
					<h2>REGISTRATION</h2>
					<h4>${message}</h4>
					<form:form action="/account/register" modelAttribute="form" enctype="multipart/form-data">
						<form:errors path="*" element="ul" />

					</form:form>
				</div>
			</div>
		</div>