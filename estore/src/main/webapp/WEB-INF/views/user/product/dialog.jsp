<%@ page pageEncoding="utf-8" %>
  <!-- Modal -->
  <div id="myModal" class="modal fade" role="dialog">
    <div class="modal-dialog">

      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Gửi Tới Bạn Bè</h4>
        </div>
        <div class="modal-body">
          <div class="form-group">
            <label>Email Người Gửi</label>
            <input id="sender" class="form-control">
          </div>
          <div class="form-group">
            <label>Email Người Nhận</label>
            <input id="email" class="form-control">
          </div>
          <div class="form-group">
            <label>Nội Dung</label>
            <textarea id="comments" class="form-control" rows="3"></textarea>
          </div>
          <input type="hidden" id="id">
        </div>
        <div class="modal-footer">
          <button class="btn btn-default btn-send">Gửi</button>
          <button class="btn btn-default" data-dismiss="modal">Đóng</button>
        </div>
      </div>

    </div>
  </div>