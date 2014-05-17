<%@page language="java" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">

<meta name="viewport" content="width=device-width">

<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-responsive.css">
<link rel="stylesheet" href="css/jquery.fancybox.css">
<link rel="stylesheet" href="css/uniform.default.css">
<link rel="stylesheet" href="css/bootstrap.datepicker.css">
<link rel="stylesheet" href="css/jquery.cleditor.css">
<link rel="stylesheet" href="css/jquery.plupload.queue.css">
<link rel="stylesheet" href="css/jquery.tagsinput.css">
<link rel="stylesheet" href="css/jquery.ui.plupload.css">
<link rel="stylesheet" href="css/chosen.css">
<link rel="stylesheet" href="css/jquery.jgrowl.css">
<link rel="stylesheet" href="css/style.css">
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
							<form action="#" class="form-horizontal">
									<div class="control-group">
										<label for="check" class="control-label">标题</label>
										<div class="controls">
											<input type="text" name="obj.title" id="obj.title" class='span9 input-square'>
										</div>
									</div>
									
									<div class="control-group">
										<label for="select" class="control-label">资源类型选择</label>
										<div class="controls">
											<select name="select" id="select">
												<option value="1">学术论文</option>
												<option value="2">语料资源</option>
												<option value="3">技术文档</option>
												<option value="4">开源项目</option>
											</select>
										</div>
									</div>
									
									<div class="control-group">
										<label for="textcounter" class="control-label">正文</label>
										<div class="controls">
											<textarea name="obj.summary" id="obj.summary" class='input-square span9 counter' data-max="255" rows='6'></textarea>
										</div>
									</div>
									
									<div class="control-group">
										<label for="check" class="control-label">广告图片</label>
										<div class="controls">
											<input type="text" name="obj.bannerImg" id="obj.bannerImg" class='span9 input-square'>
										</div>
									</div>
									
									<div class="control-group">
										<label for="check" class="control-label">访问地址</label>
										<div class="controls">
											<input type="text" name="obj.visitUrl" id="obj.visitUrl" class='span9 input-square'>
										</div>
									</div>
									
									<div class="control-group">
										<label for="check" class="control-label">下载地址</label>
										<div class="controls">
											<input type="text" name="obj.downUrl" id="obj.downUrl" class='span9 input-square'>
										</div>
									</div>
									
									<div class="control-group warning">
										<label for="warning" class="control-label">Warning</label>
										<div class="controls">
											<input type="text" name="warning" id="warning" class='input-square'>
											<span class="help-inline">Hm, just a warning - nothing critical!</span>
										</div>
									</div>
									<div class="control-group success">
										<label for="success" class="control-label">Success</label>
										<div class="controls">
											<input type="text" name="success" id="success" class='input-square'>
											<span class="help-inline">Yay! Correct.</span>
										</div>
									</div>
									<div class="control-group">
										<label for="check" class="control-label">Checkboxes</label>
										<div class="controls">
											<label class="checkbox"><input type="checkbox" name="check" id="check"> Just a little checkbox</label>
											<label class="checkbox"><input type="checkbox" name="check"> Lorem ipsum dolor ad tempor enim sed amet esse. </label>
										</div>
									</div>
									<div class="control-group">
										<label for="radio" class="control-label">Radios</label>
										<div class="controls">
											<label class="radio"><input type="radio" name="radio" id="radio"> Lorem ipsum minim adipisicing pariatur do deserunt ut aute officia voluptate nisi ut. </label>
											<label class="radio"><input type="radio" name="radio"> Lorem ipsum in dolor enim laborum ullamco sed adipisicing ex ut.  </label>
											<label class="radio"><input type="radio" name="radio"> Lorem ipsum ut aliqua sed ut dolor reprehenderit consectetur elit.  </label>
										</div>
									</div>
									<div class="control-group">
										<label for="select" class="control-label">Selects</label>
										<div class="controls">
											<select name="select" id="select">
												<option value="1">Option-1</option>
												<option value="2">Option-2</option>
												<option value="3">Option-3</option>
												<option value="4">Option-4</option>
												<option value="5">Option-5</option>
											</select>
										</div>
									</div>
									<div class="control-group">
										<label for="file" class="control-label">File upload</label>
										<div class="controls">
											<input type="file" name="file" id="file">
										</div>
									</div>
									<div class="control-group">
										<label for="basictext" class="control-label">Basic textarea</label>
										<div class="controls">
											<textarea name="basic" id="basictext" class='span9 input-square' rows="6"></textarea>
										</div>
									</div>
									<div class="control-group">
										<label for="textcounter" class="control-label">Textarea with counter</label>
										<div class="controls">
											<textarea name="textcounter" id="textcounter" class='input-square span9 counter' data-max="150" rows='6'></textarea>
										</div>
									</div>
									<div class="form-actions">
										<button class="btn btn-primary" type="submit">Send</button>
										<input type="reset" class='btn btn-danger' value="reset">
									</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span12">
					<div class="box">
						<div class="box-head">
							<h3>Uniform</h3>
						</div>
						<div class="box-content">
							<form action="#" class="form">
									<div class="row-fluid force-margin">
										<div class="span3">
											<div class="control-group">
												<label for="select2" class="control-label">Select</label>
												<div class="controls">
													<select name="select" id="select2" class='uniform'>
														<option value="1">Option-1</option>
														<option value="2">Option-2</option>
														<option value="3">Option-3</option>
														<option value="4">Option-4</option>
														<option value="5">Option-5</option>
													</select>
												</div>
											</div>
										</div>
										<div class="span3">
											<div class="control-group">
												<label for="file2" class="control-label">File upload</label>
												<div class="controls">
													<input type="file" name="file" id="file2" class='uniform'>
												</div>
											</div>
										</div>
										<div class="span3">
											<div class="control-group">
												<label for="radio2" class="control-label">Radio</label>
												<div class="controls">
													<label class="radio"><input type="radio" name="radio" class='uniform' id="radio2"> adipisicing pariatur</label>
													<label class="radio"><input type="radio" class='uniform' name="radio"> Lorem</label>
													<label class="radio"><input type="radio" class='uniform' name="radio"> Lorem ipsum</label>
												</div>
											</div>
										</div>
										<div class="span3">
											<div class="control-group">
												<label for="check2" class="control-label">Checkbox</label>
												<div class="controls">
													<label class="checkbox"><input type="checkbox" class='uniform' name="check" id="check2"> Just </label>
													<label class="checkbox"><input type="checkbox" name="check" class='uniform'> Lorem ipsum</label>
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span12">
											<div class="form-actions">
												<button class="btn btn-primary" type="submit">Send</button>
												<input type="reset" class='btn btn-danger' value="reset">
											</div>
										</div>
									</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span12">
					<div class="box">
						<div class="box-head">
							<h3>Extended Form elements</h3>
						</div>
						<div class="box-content">
							<form action="#" class="form-horizontal">
									<div class="control-group">
										<label for="tags" class="control-label">Tags</label>
										<div class="controls">
											<input type="text" id="tags" value="Laravel,Codeigniter,jQuery" class='tagsinput span12'>
										</div>
									</div>
									<div class="control-group">
										<label for="selsear" class="control-label">Select with search</label>
										<div class="controls">
											<select name="select1" id="selsear" class='cho'>
												<option value="1">Option-1</option>
												<option value="2">Option-2</option>
												<option value="3">Option-3</option>
												<option value="4">Option-4</option>
												<option value="5">Option-5</option>
											</select>
										</div>
									</div>
									<div class="control-group">
										<label for="select5" class="control-label">Multiselect</label>
										<div class="controls">
											<select name="select" id="select5" class='cho span6' multiple>
												<option value="1">Option-1</option>
												<option value="2">Option-2</option>
												<option value="3">Option-3</option>
												<option value="4">Option-4</option>
												<option value="5">Option-5</option>
											</select>
										</div>
									</div>
									<div class="control-group">
										<label for="spinnn" class="control-label">Spinner</label>
										<div class="controls">
											<div class="input-mini">
												<input type="text" id="spinnn" value="5" class='spinner'>
											</div>
										</div>
									</div>
									<div class="control-group">
										<label for="datepicker" class="control-label">Datepicker</label>
										<div class="controls">
											<input type="text" name="datepicker" id="datepicker" class='datepick'>
										</div>
									</div>
									<div class="control-group">
										<label for="timepicker" class="control-label">Timepicker</label>
										<div class="controls">
											<input type="text" name="timepicker" id="timepicker" class='timepicker'>
										</div>
									</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			
			
			<div class="row-fluid">
				<div class="span12">
					<div class="box">
						<div class="box-head">
							<h3>Form wizard with validation</h3>
						</div>
						<div class="box-content box-nomargin">
							<div class="modal hide" id="myModal">
							  <div class="modal-header">
							    <button type="button" class="close" data-dismiss="modal">×</button>
							    <h3>Success</h3>
							  </div>
							  <div class="modal-body">
							    <p>Wizard was submit!</p>
							  </div>
							  <div class="modal-footer">
							    <a href="#" class="btn btn-primary" data-dismiss="modal">Ok, thanks!</a>
							  </div>
							</div>
							<form method="post" action="forms.html" class='form-horizontal bbq wizard'>
								<div class="step" id="step1">
									<h4>Step 1 description</h4>
									<div class="control-group">
										<label for="uname1" class="control-label">Username</label>
										<div class="controls">
											<input type="text" name="uname1" id="uname1" class='required'>
										</div>
									</div>
									<div class="control-group">
										<label for="email1" class="control-label">Email</label>
										<div class="controls">
											<input type="text" name="email1" id="email1" class='email required'>
										</div>
									</div>
								</div>
								<div class="step" id="step2">
									<h4>Step 2 description</h4>
									<div class="control-group">
										<label for="pw6" class="control-label">Password</label>
										<div class="controls">
											<input type="password" name="pw6" id="pw6" class='required'>
										</div>
									</div>
								</div>
								<div id="navigation">
									<div class="form-actions">
										<input class="navigation_button btn btn-danger" id="back" value="Back" type="reset" />
										<input class="navigation_button btn btn-primary" id="next" value="Next" type="submit" />
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span12">
					<div class="box">
						<div class="box-head">
							<h3>Form wizard with custom style</h3>
						</div>
						<div class="box-content box-nomargin">
							<div class="modal hide" id="myModal2">
							  <div class="modal-header">
							    <button type="button" class="close" data-dismiss="modal">×</button>
							    <h3>Success</h3>
							  </div>
							  <div class="modal-body">
							    <p>Wizard was submit!</p>
							  </div>
							  <div class="modal-footer">
							    <a href="#" class="btn btn-primary" data-dismiss="modal">Ok, thanks!</a>
							  </div>
							</div>
							<form method="post" action="forms.html" class='form-horizontal bbq wizard'>
								<div class="step" id="step3">
									<ul class="steps">
										<li class="active">
											Step 1
											<span>Description</span>
										</li>
										<li>
											Step 2
											<span>Description</span>
										</li>
										<li>
											Step 3
											<span>Lorem ipsum</span>
										</li>
									</ul>
									<div class="control-group">
										<label for="uname" class="control-label">Username</label>
										<div class="controls">
											<input type="text" name="uname" id="uname" class='required'>
										</div>
									</div>
									<div class="control-group">
										<label for="email2" class="control-label">Email</label>
										<div class="controls">
											<input type="text" name="email2" id="email2" class='email required'>
										</div>
									</div>
								</div>
								<div class="step" id="step4">
									<ul class="steps">
										<li>
											Step 1
											<span>Description</span>
										</li>
										<li class="active">
											Step 2
											<span>Description</span>
										</li>
										<li>
											Step 3
											<span>Lorem ipsum</span>
										</li>
									</ul>
									<h4>Step 2 description</h4>
									<div class="control-group">
										<label for="pw1" class="control-label">Password</label>
										<div class="controls">
											<input type="password" name="pw1" id="pw1" class='required'>
										</div>
									</div>
								</div>
								<div class="step" id="step8">
									<ul class="steps">
										<li>
											Step 1
											<span>Description</span>
										</li>
										<li>
											Step 2
											<span>Description</span>
										</li>
										<li class="active">
											Step 3
											<span>Lorem ipsum</span>
										</li>
									</ul>
									<h4>Step 3 description</h4>
									<div class="control-group">
										<label class="control-label">Check it</label>
										<div class="controls">
											<label class="checkbox"><input type="checkbox"></label>
										</div>
									</div>
								</div>
								<div id="navigation2">
									<div class="form-actions">
										<input class="navigation_button btn btn-danger" id="back2" value="Back" type="reset" />
										<input class="navigation_button btn btn-primary" id="next2" value="Next" type="submit" />
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span12">
					<div class="box">
						<div class="box-head">
							<h3>Form validation</h3>
						</div>
						<div class="box-content">
							<form action="#" class='validate form-horizontal'>
								<div class="control-group">
									<label for="req" class="control-label">Required</label>
									<div class="controls">
										<input type="text" name="req" id="req" class='required'>
									</div>
								</div>
								<div class="control-group">
									<label for="pw3" class="control-label">Password</label>
									<div class="controls">
										<input type="password" name="pw3" id="pw3" class='required'>
									</div>
								</div>
								<div class="control-group">
									<label for="pw4" class="control-label">Repeat password</label>
									<div class="controls">
										<input type="password" name="pw4" id="pw4" class='required' equalTo="#pw3">
										<p class="help-block">Must match 'password'</p>
									</div>
								</div>
								<div class="control-group">
									<label for="email3" class="control-label">Email</label>
									<div class="controls">
										<input type="text" name="email3" id="email3" class='required email'>
									</div>
								</div>
								<div class="control-group">
									<label for="sela" class="control-label">Select</label>
									<div class="controls">
										<select name="sela" id="sela" class='{required:true}'>
											<option value=''>Choose one</option>
											<option value="1">Option 1</option>
											<option value="2">Option 2</option>
											<option value="3">Option 3</option>
											<option value="4">Option 4</option>
											<option value="5">Option 5</option>
											<option value="6">Option 6</option>
											<option value="7">Option 7</option>
											<option value="8">Option 8</option>
											<option value="9">Option 9</option>
											<option value="10">Option 10</option>
										</select>
									</div>
								</div>
								<div class="control-group">
									<label for="aaa" class="control-label">Checkbox</label>
									<div class="controls">
										<label class="checkbox"><input type="checkbox" name='aaa' value='1' class='{required:true}'> Yes ??</label>
									</div>
								</div>
								<div class="control-group">
									<label for="bbb" class="control-label">Radio</label>
									<div class="controls">
										<label class="radio"><input type="radio" name='bbb' value='1' class='{required:true}'> Radio 1</label>
										<label class="radio"><input type="radio" name='bbb' value='2' class='{required:true}'> Radio 2</label>
										<label class="radio"><input type="radio" name='bbb' value='3' class='{required:true}'> Radio 3</label>
									</div>
								</div>
								<div class="form-actions">
									<input type="submit" class='btn btn-primary'>
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
<script src="js/jquery.uniform.min.js"></script>
<script src="js/bootstrap.timepicker.js"></script>
<script src="js/bootstrap.datepicker.js"></script>
<script src="js/chosen.jquery.min.js"></script>
<script src="js/jquery.fancybox.js"></script>
<script src="js/plupload/plupload.full.js"></script>
<script src="js/plupload/jquery.plupload.queue/jquery.plupload.queue.js"></script>
<script src="js/jquery.cleditor.min.js"></script>
<script src="js/jquery.inputmask.min.js"></script>
<script src="js/jquery.tagsinput.min.js"></script>
<script src="js/jquery.mousewheel.js"></script>
<script src="js/jquery.textareaCounter.plugin.js"></script>
<script src="js/ui.spinner.js"></script>
<script src="js/jquery.jgrowl_minimized.js"></script>
<script src="js/jquery.form.js"></script>
<script src="js/jquery.validate.min.js"></script>
<script src="js/bbq.js"></script>
<script src="js/jquery-ui-1.8.22.custom.min.js"></script>
<script src="js/jquery.form.wizard-min.js"></script>
<script src="js/jquery.cookie.js"></script>
<script src="js/jquery.metadata.js"></script>
<script src="js/custom.js"></script><script src="js/demo.js"></script>
</body>
</html>