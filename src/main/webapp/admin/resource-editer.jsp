<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">

<meta name="viewport" content="width=device-width">

<link rel="stylesheet" href="${ctx}/admin/css/bootstrap.css">
<link rel="stylesheet" href="${ctx}/admin/css/bootstrap-responsive.css">
<link rel="stylesheet" href="${ctx}/admin/css/jquery.fancybox.css">
<link rel="stylesheet" href="${ctx}/admin/css/uniform.default.css">
<link rel="stylesheet" href="${ctx}/admin/css/bootstrap.datepicker.css">
<link rel="stylesheet" href="${ctx}/admin/css/jquery.cleditor.css">
<link rel="stylesheet" href="${ctx}/admin/css/jquery.plupload.queue.css">
<link rel="stylesheet" href="${ctx}/admin/css/jquery.tagsinput.css">
<link rel="stylesheet" href="${ctx}/admin/css/jquery.ui.plupload.css">
<link rel="stylesheet" href="${ctx}/admin/css/chosen.css">
<link rel="stylesheet" href="${ctx}/admin/css/jquery.jgrowl.css">
<link rel="stylesheet" href="${ctx}/admin/css/style.css">
</head>
<body>
<div class="main">
	<div class="content">
			<div class="row-fluid">
				<div class="span12">
					<div class="box">
						<div class="box-head">
							<h3>资源编辑</h3>
						</div>
						
						<div class="box-content">
							<form action="${ctx}/admin/resource/insert" class='validate form-horizontal' method="post">
									<input type="hidden" value="${obj.id}" name="obj.id" id="obj.id"/>
									<div class="control-group">
										<label for="check" class="control-label">标题</label>
										<div class="controls">
											<input type="text" name="obj.title" id="obj.title" class='span6 input-square required' value="${obj.title}"/>
											&nbsp;&nbsp;&nbsp;&nbsp;
											<select name="obj.categoryId" id="obj.categoryId">
												<c:forEach items="${APP_CATEGORYS }" var="category">
												<option value="${category.id }" ${obj.categoryId==category.id?"selected='selected'":""}>${category.name }</option>
												</c:forEach>
											</select>
										</div>
									</div>
									
									
									<div class="control-group">
										<label for="check" class="control-label">类型图片</label>
										<div class="controls">
											<table style="width: 70%;">
												<tr>
													<td>
														<label>
															<input type="radio" name="obj.sysImg" id="obj.sysImg" value="calulator" ${obj.sysImg=="calulator"?"checked='checked'":""}>
															<img src="${ctx}/images/file-ico/calulator.png" style="width: 64px;height: 64px;"/>
														</label>
													</td>
													<td>
														<label>
															<input type="radio" name="obj.sysImg" id="obj.sysImg" value="document" ${obj.sysImg=="document"?"checked='checked'":""}>
															<img src="${ctx}/images/file-ico/document.png" style="width: 64px;height: 64px;"/>
														</label>
													</td>
													<td>
														<label>
															<input type="radio" name="obj.sysImg" id="obj.sysImg" value="pdf" ${obj.sysImg=="pdf"?"checked='checked'":""}>
															<img src="${ctx}/images/file-ico/pdf.png" style="width: 64px;height: 64px;"/>
														</label>
													</td>
													<td>
														<label>
															<input type="radio" name="obj.sysImg" id="obj.sysImg" value="rar"  ${obj.sysImg=="rar"?"checked='checked'":""}>
															<img src="${ctx}/images/file-ico/rar.png" style="width: 64px;height: 64px;"/>
														</label>
													</td>
													<td>
														<label>
															<input type="radio" name="obj.sysImg" id="obj.sysImg" value="soft" ${obj.sysImg=="soft"?"checked='checked'":""}>
															<img src="${ctx}/images/file-ico/soft.png" style="width: 64px;height: 64px;"/>
														</label>
													</td>
													<td>
														<label>
															<input type="radio" name="obj.sysImg" id="obj.sysImg" value="word" ${obj.sysImg=="word"?"checked='checked'":""}>
															<img src="${ctx}/images/file-ico/word.png" style="width: 64px;height: 64px;"/>
														</label>
													</td>
												</tr>
											</table>
										</div>
									</div>
									
									<div class="control-group">
										<label for="textcounter" class="control-label">摘要</label>
										<div class="controls">
											<textarea name="obj.summary" id="obj.summary" class='input-square span9 counter required' data-max="255" rows='6'>${obj.summary }</textarea>
										</div>
									</div>
									
									<div class="control-group">
										<label for="check" class="control-label">访问地址</label>
										<div class="controls">
											<input type="text" name="obj.visitUrl" id="obj.visitUrl" class='span9 input-square' value="${obj.visitUrl }"/>
										</div>
									</div>
									
									<div class="control-group">
										<label for="tags" class="control-label">Tags</label>
										<div class="controls">
											<input type="text" id="tags" name="obj.tags" value="${obj.tags}" class='tagsinput span12'>
										</div>
									</div>
									</div>
									<div class="form-actions" align="left">
										<button class="btn btn-primary" type="submit">Send</button>
									</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>	
</div>	
<script src="${ctx}/admin/js/jquery.js"></script>
<script src="${ctx}/admin/js/less.js"></script>
<script src="${ctx}/admin/js/bootstrap.min.js"></script>
<script src="${ctx}/admin/js/jquery.uniform.min.js"></script>
<script src="${ctx}/admin/js/bootstrap.timepicker.js"></script>
<script src="${ctx}/admin/js/bootstrap.datepicker.js"></script>
<script src="${ctx}/admin/js/chosen.jquery.min.js"></script>
<script src="${ctx}/admin/js/jquery.fancybox.js"></script>
<script src="${ctx}/admin/js/plupload/plupload.full.js"></script>
<script src="${ctx}/admin/js/plupload/jquery.plupload.queue/jquery.plupload.queue.js"></script>
<script src="${ctx}/admin/js/jquery.cleditor.min.js"></script>
<script src="${ctx}/admin/js/jquery.inputmask.min.js"></script>
<script src="${ctx}/admin/js/jquery.tagsinput.min.js"></script>
<script src="${ctx}/admin/js/jquery.mousewheel.js"></script>
<script src="${ctx}/admin/js/jquery.textareaCounter.plugin.js"></script>
<script src="${ctx}/admin/js/ui.spinner.js"></script>
<script src="${ctx}/admin/js/jquery.jgrowl_minimized.js"></script>
<script src="${ctx}/admin/js/jquery.form.js"></script>
<script src="${ctx}/admin/js/jquery.validate.min.js"></script>
<script src="${ctx}/admin/js/bbq.js"></script>
<script src="${ctx}/admin/js/jquery-ui-1.8.22.custom.min.js"></script>
<script src="${ctx}/admin/js/jquery.form.wizard-min.js"></script>
<script src="${ctx}/admin/js/jquery.cookie.js"></script>
<script src="${ctx}/admin/js/jquery.metadata.js"></script>
<script src="${ctx}/admin/js/custom.js"></script>
<script src="${ctx}/admin/js/demo.js"></script>
</body>
</html>