<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>

<!doctype html>
<html lang="cn">
<head>
<meta charset="utf-8">
<title>nlpChina 有组织无纪律</title>
<meta name="description" content="">

<meta name="viewport" content="width=device-width">
<style type="text/css">
body {text-align: center;}
div.center
{
    margin-right: auto; margin-left: auto; 
}
</style>
<link rel="stylesheet" href="${ctx }/admin/css/bootstrap.css">
<link rel="stylesheet" href="${ctx }/admin/css/bootstrap-responsive.css">
<link rel="stylesheet" href="${ctx }/admin/css/jquery.fancybox.css">
<link rel="stylesheet" href="${ctx }/admin/css/uniform.default.css">
<link rel="stylesheet" href="${ctx }/admin/css/bootstrap.datepicker.css">
<link rel="stylesheet" href="${ctx }/admin/css/jquery.cleditor.css">
<link rel="stylesheet"
	href="${ctx }/admin/css/jquery.plupload.queue.css">
<link rel="stylesheet" href="${ctx }/admin/css/jquery.tagsinput.css">
<link rel="stylesheet" href="${ctx }/admin/css/jquery.ui.plupload.css">
<link rel="stylesheet"
	href="${ctx }/admin/js/tableTools/css/TableTools.css">
<link rel="stylesheet" href="${ctx }/admin/css/chosen.css">
<link rel="stylesheet" href="${ctx }/admin/css/chosen.css">
<link rel="stylesheet" href="${ctx }/admin/css/style.css">
</head>
<body>
	<div class="main">
		<div class="content">
			<div class="row-fluid">
				<div class="span12">
					<div class="box">
						<div class="box-head tabs">
							<h3>User profile</h3>
						</div>
						<div class="box-content">
							<form action="${ctx }/admin/user/save/" class="form-horizontal">


								<table class='table table-striped table-bordered'>

									<tbody>
										<tr>
											<td >

												<div class="tab-content">
													<div class="tab-pane active" id="basic">
														<div class="control-group">
															<label for="UserID" class="control-label">用户ID</label>
															<div class="controls">
																<input type="text" name="id" id="id"
																	value="${user.id }" disabled="true">
															</div>
														</div>
														<div class="control-group">
															<label for="user.name" class="control-label">用户名</label>
															<div class="controls">
																<input type="text" name="user.name" id="user.name"
																	value="${user.name }" disabled="true">
															</div>
														</div>
														<div class="control-group">
															<label for="user.gender " class="control-label">性别</label>
															<div class="controls">
																	<c:if test="${user.gender=='m'}">
                                                                          <input type="text" name="user.userType" id="user.userType" value="男" disabled="true">

																	</c:if>
																	<c:if test="${user.gender=='f'}">

                                                                          <input type="text" name="user.userType" id="user.userType" value="女" disabled="true">


																	</c:if>

																	<c:if test="${user.gender=='n'}">

                                                                          <input type="text" name="user.userType" id="user.userType" value="未知" disabled="true">

																	</c:if>




															</div>
														</div>
														<div class="control-group">
															<label for="user.url" class="control-label">博客地址</label>
															<div class="controls">
																<input type="text" name="user.url" id="user.url"
																	value="${user.url } " disabled="true">
															</div>
														</div>
														<div class="control-group">
															<label for="user.registerTime" class="control-label">注册时间</label>
															<div class="controls">
																<input type="text" name="registerTime" id="registerTime"
																	value="${user.registerTime }" disabled="true">
															</div>
														</div>
														
														
														<div class="control-group">
															<label for="user.userType" class="control-label">用户类型</label>
															<div class="controls">
															
															    <c:if test="${ sessionScope.userInfo.userType==2 }"> 
															    <select name="user.userType" id="user.userType"
																	class="form-control">
															
                                                                   <c:if test="${user.userType==0}">
																		<option value="0"  selected="selected">普通用户</option>

																		<option value="1">组织用户</option>

																		<option value="2">管理员</option>


																	</c:if>
																	<c:if test="${user.userType==1}">
																		<option value="0"  >普通用户</option>

																		<option value="1" selected="selected">组织用户</option>

																		<option value="2">管理员</option>


																	</c:if>
																	
																	
											                       <c:if test="${user.userType==2}">
																		<option value="0" >普通用户</option>

																		<option value="1">组织用户</option>

																		<option value="2"  selected="selected">管理员</option>


																	</c:if>
											
																</select>
																</c:if>
																
																<c:if test="${ sessionScope.userInfo.userType!=2 }">
																
																        <c:if test="${user.userType==0 }">
																              <input type="text" name="user.userType" id="user.userType"
																	     value="普通用户" disabled="true">
																        </c:if>
																        <c:if test="${user.userType==1 }">
																              <input type="text" name="user.userType" id="user.userType"
																	     value="组织用户" disabled="true">
																        </c:if>
																        <c:if test="${user.userType==2 }">
																              <input type="text" name="user.userType" id="user.userType"
																	     value="管理员" disabled="true">
																        </c:if>
																</c:if>
																
																
																
															</div>
														</div>
													
														
														
														
														
														
														
													</div>
												</div>






											</td>
											<td >




												<div class="tab-content">
													<div class="tab-pane active" id="basic">
														
														
														<div class="control-group">
															<label for="user.profileImageUrl" class="control-label">自定义图像url</label>
															<div class="controls">
																<input type="text" name="user.profileImageUrl" id="user.profileImageUrl"
																	value="${user.profileImageUrl}" disabled="true">
																<img src="${user.profileImageUrl }"/>
															</div>
														</div>
														<div class="control-group">
															<label for="user.location" class="control-label">所在位置</label>
															<div class="controls">
																<input type="text" name="user.location" id="user.location"
																	value="${user.location }" disabled="true">
															</div>
														</div>

														<div class="control-group">
															<label for="user.userDomain" class="control-label">研究方向
															</label>
															<div class="controls">
																<input type="text" name="user.userDomain"
																	id="user.userDomain" value="${user.userDomain}" disabled="true">
															</div>
														</div>
															
														<div class="control-group">
															<label for="user.description" class="control-label">自我描述</label>
															<div class="controls">
															    <textarea class="form-control" rows="6" name="user.description" id="user.description" disabled="true">${user.description }</textarea>
															</div>
														</div>
														
													</div>
													
													
												</div>
												
											</td>
										</tr>
										
									</tbody>
								</table>

								<div>
									<input type="submit" class='btn btn-primary' value="Save">
									<input type="reset" class='btn btn-danger' value="Reset">
									<input type="hidden" value="${user.id }" name="user.id" id="user.id"/>

								</div>

							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="js/jquery.js"></script>
	<script src="js/less.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.peity.js"></script>
	<script src="js/jquery.uniform.min.js"></script>
	<script src="js/bootstrap.timepicker.js"></script>
	<script src="js/bootstrap.datepicker.js"></script>
	<script src="js/chosen.jquery.min.js"></script>
	<script src="js/plupload/plupload.full.js"></script>
	<script
		src="js/plupload/jquery.plupload.queue/jquery.plupload.queue.js"></script>
	<script src="js/jquery.cleditor.min.js"></script>
	<script src="js/jquery.inputmask.min.js"></script>
	<script src="js/jquery.tagsinput.min.js"></script>
	<script src="js/jquery.mousewheel.js"></script>
	<script src="js/jquery.textareaCounter.plugin.js"></script>
	<script src="js/ui.spinner.js"></script>
	<script src="js/jquery.fancybox.js"></script>
	<script src="js/jquery.flot.js"></script>
	<script src="js/jquery.flot.pie.js"></script>
	<script src="js/jquery.dataTables.min.js"></script>
	<script src="js/jquery.jgrowl_minimized.js"></script>
	<script src="js/jquery.dataTables.bootstrap.js"></script>
	<script src="js/jquery.color.js"></script>
	<script src="js/jquery.flot.resize.js"></script>
	<script src="js/jquery.flot.orderBars.js"></script>
	<script src="js/jquery.cookie.js"></script>
	<script src="js/custom.js"></script>
	<script src="js/demo.js"></script>
</body>
</html>