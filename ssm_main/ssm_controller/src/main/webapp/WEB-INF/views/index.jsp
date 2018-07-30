<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<%-- <script type="text/javascript" src="${APP_PATH }/static/js/myjs.js"></script> --%>
<!-- web路径：
不以/开始的相对路径，找资源，以当前资源的路径为基准，经常容易出问题。
以/开始的相对路径，找资源，以服务器的路径为标准(http://localhost:3306)；需要加上项目名
		http://localhost:3306/
 -->
<script type="text/javascript"
	src="${APP_PATH }/static/js/jquery-3.3.1.min.js"></script>
<link
	href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
		<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">新闻列表</span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#" id="head_title">SSM新闻列表</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<form class="navbar-form navbar-right">
					<button type="submit" class="btn btn-success" id="singin">管理员登录</button>
				</form>
			</div>
			<!--/.navbar-collapse -->
		</div>
		</nav>

		<!-- 查询列 -->
		<!-- Main jumbotron for a primary marketing message or call to action -->
		<div class="jumbotron">
			<form class="navbar-form navbar-right" id="ctgy_id">
				<div class="form-group">
					<select class="form-control"></select>
				</div>
			</form>

			<form class="navbar-form navbar-right" id="search_title">
				<div class="form-group">
					<input type="text" placeholder="请输入标题" class="form-control">
				</div>
			</form>

		</div>

		<div class="container">
			<!-- Example row of columns -->
			<div class="row" id="news_area"></div>
		</div>
		<hr>

		<!-- 显示分页信息 -->
		<div class="row">
			<!--分页文字信息  -->
			<div class="col-md-4" id="page_info_area"></div>
			<!-- 分页条信息 -->
			<div class="col-md-6" id="page_nav_area"></div>
		</div>
		<!-- /container -->

		<!-- ================================================================================================== -->
		<!-- ================================================================================================== -->
		<!-- =======================================管理员登录模态框 ================================================ -->
		<!-- ================================================================================================== -->
		<!-- ================================================================================================== -->

		<!-- 管理员登录模态框 -->
		<div class="modal fade" id="admin_login" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">管理员登录</h4>
					</div>
					<div class="modal-body">
					
<!--由于ajax不能实现controller的页面跳转，所以直接在这提交表单  -->
						<form class="form-signin form-horizontal" id="login_form" action="${APP_PATH }/login#" 
						method="post">
							<div class="form-group">

								<label class="col-sm-4 control-label">用户名:</label>
								<div class="col-sm-6">
									<input type="text" name="username" id="inputUserName" class="form-control"
										placeholder="请输入用户名" required autofocus> <span
										class="help-block"></span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-4 control-label">密码:</label>
								<div class="col-sm-6">
									<input type="password" name="pwd" id="inputPassword" class="form-control"
										placeholder="Password" required> <span
										class="help-block"></span>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-4"></div>
								<div class="col-sm-4">
									<button class="btn btn-lg btn-primary btn-block" type="submit"
										id="login_btn" >登录</button>
								</div>
								<div class="col-sm-4"></div>
							</div>


						</form>

					</div>
				</div>
			</div>
		</div>
		<!--===========================================================================  -->
<!-- 新闻详情的模态框 -->
	<div class="modal fade" id="newsDetailsModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">新闻详情</h4>
				</div>
				<div class="modal-body"> 
					 <form class="form-horizontal" >
						<div class="form-group">
							<label class="col-sm-2 control-label">新闻标题</label>
							<div class="col-sm-10">
								<label  id="title_details" class="form-control"></label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">内容</label>
							<div class="col-sm-10">
								<textarea  class="form-control"
									id="content_details" readonly></textarea>
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">来源</label>
							<div class="col-sm-10">
								<label   class="form-control"
									id="source_details" ></label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">创建日期</label>
							<div class="col-sm-10">
								<label   class="form-control"
									id="issueTime_details" ></label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">所属类别</label>
							<div class="col-sm-4">
								<select class="form-control" id="ctgy_details" disabled="disabled">
								</select>
							</div>
						</div>
					 </form> 
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		//1、页面加载完成以后，直接去发送ajax请求,要到分页数据
		$(function() {
			// 去首页	
			to_page(1, "/news", null, null);
			//查询新闻类别显示在下拉列表
			getCtgy("select");
			$("input").val("");
		});

		// 发送get请求得到新闻分页数据（包括根据标题查找、根据新闻类别查找）
		function to_page(pn, url, cid, title) {
			$.ajax({
				url : "${APP_PATH}" + url,
				data : {
					pn : pn,
					cid : cid,
					title : title
				},
				type : "GET",
				success : function(result) {
					// console.log(result);
					// 1、解析并显示新闻数据
					build_news_table(result);
					// 2、解析并显示分页信息
					build_page_info(result);
					// 3、解析显示分页条数据
					build_page_nav(result, url, cid, title);

				}
			});
		}
		// 1、解析并显示新闻数据
		function build_news_table(result) {
			// 1. 清空原有数据
			$("#news_area").empty();
			// 接收json数据 result.extend.pageinfo.list中封装了json数据
			var newses = result.extend.pageInfo.list;
			// 遍历newses
			// index表示newses， item代表newses中的值
			$
					.each(
							newses,
							function(index, item) {
								// var newses_div = $("<div class='col-md-4'></div>")
								// 构建显示新闻标题的<h5> 在h5标签中放入newsId
								var title_h2 = $("<h3 ></h3>")
										.append(item.title);
								// 构建显示新闻正文的<p> ...
								var content_p = $("<p></p>")
										.append(item.content);
								// 构建详情按钮
								var details_btn = $(
										"<button class='btn btn-default' id='details'>详情</button>")
										.append("&raquo;");
								details_btn.attr("detail_id", item.newsId);
								// append方法执行完成以后还是返回原来的元素
								$("<div class='col-md-4'></div>").append(
										title_h2).append(content_p).append(
										details_btn).appendTo("#news_area");

								// 限制字符个数
								$("#news_area p")
										.each(
												function() {
													var maxwidth = 90;
													if ($(this).text().length > maxwidth) {
														$(this)
																.text(
																		$(this)
																				.text()
																				.substring(
																						0,
																						maxwidth));
														$(this).html(
																$(this).html()
																		+ '…');
													}
												});
								$("#news_area h3")
										.each(
												function() {
													var maxwidth = 6;
													if ($(this).text().length > maxwidth) {
														$(this)
																.text(
																		$(this)
																				.text()
																				.substring(
																						0,
																						maxwidth));
														$(this).html(
																$(this).html()
																		+ '…');
													}
												});
							})
		}

		//查出所有的新闻类别信息并显示在下拉列表中
		function getCtgy(ele) {
			//清空之前下拉列表的值
			$(ele).empty();
			$.ajax({
				url : "${APP_PATH}/ctgy",
				type : "GET",
				success : function(result) {
					//{"code":100,"msg":"处理成功！",
					//"extend":{"depts":[{"deptId":1,"deptName":"开发部"},{"deptId":2,"deptName":"测试部"}]}}
					//console.log(result);
					//显示部门信息在下拉列表中
					//$("#empAddModal select").append("")
					$.each(result.extend.categories, function() {
						var optionEle = $("<option></option>").append(
								this.ctgyName).attr("value", this.ctgyId);
						optionEle.appendTo(ele);
					});
				}
			});

		}

		//解析显示分页信息
		function build_page_info(result) {
			$("#page_info_area").empty();
			$("#page_info_area").append(
					"当前" + result.extend.pageInfo.pageNum + "页,总"
							+ result.extend.pageInfo.pages + "页,总"
							+ result.extend.pageInfo.total + "条记录");
			totalRecord = result.extend.pageInfo.total;
			currentPage = result.extend.pageInfo.pageNum;
		}
		//解析显示分页条，点击分页要能去下一页....
		function build_page_nav(result, url, cid, title) {
			//page_nav_area
			$("#page_nav_area").empty();
			var ul = $("<ul></ul>").addClass("pagination");

			//构建元素
			var firstPageLi = $("<li></li>").append(
					$("<a></a>").append("首页").attr("href", "#"));
			var prePageLi = $("<li></li>").append(
					$("<a></a>").append("&laquo;"));
			if (result.extend.pageInfo.hasPreviousPage == false) {
				firstPageLi.addClass("disabled");
				prePageLi.addClass("disabled");
			} else {
				//为元素添加点击翻页的事件
				firstPageLi.click(function() {
					to_page(1, url, cid, title);
				});
				prePageLi
						.click(function() {
							to_page(result.extend.pageInfo.pageNum - 1, url,
									cid, title);
						});
			}

			var nextPageLi = $("<li></li>").append(
					$("<a></a>").append("&raquo;"));
			var lastPageLi = $("<li></li>").append(
					$("<a></a>").append("末页").attr("href", "#"));
			if (result.extend.pageInfo.hasNextPage == false) {
				nextPageLi.addClass("disabled");
				lastPageLi.addClass("disabled");
			} else {
				nextPageLi
						.click(function() {
							to_page(result.extend.pageInfo.pageNum + 1, url,
									cid, title);
						});
				lastPageLi.click(function() {
					to_page(result.extend.pageInfo.pages, url, cid, title);
				});
			}

			//添加首页和前一页 的提示
			ul.append(firstPageLi).append(prePageLi);
			//1,2，3遍历给ul中添加页码提示
			$.each(result.extend.pageInfo.navigatepageNums, function(index,
					item) {

				var numLi = $("<li></li>").append($("<a></a>").append(item));
				if (result.extend.pageInfo.pageNum == item) {
					numLi.addClass("active");
				}
				numLi.click(function() {
					to_page(item, url, cid, title);
				});
				ul.append(numLi);
			});
			//添加下一页和末页 的提示
			ul.append(nextPageLi).append(lastPageLi);

			//把ul加入到nav
			var navEle = $("<nav></nav>").append(ul);
			navEle.appendTo("#page_nav_area");
		}

		//根据新闻类别查找新闻
		$("#ctgy_id").bind("change", function() {
			//alert( $("select").val());
			to_page(1, "/newsfromctgy", $("select").val(), null);
			$("input").val("");
		});

		//根据标题查找新闻
		$("#search_title").keydown(function(e) {

			var title = $("#search_title input").val();
			if (e.keyCode == 13 && (title.length > 0)) {
				//alert(title);
				to_page(1, "/newsfromtitle", null, title);
			}
			//to_page(1,"/newsfromctgy");
		});

		//点击大标题刷新页面
		$("#head_title").click(function() {
			to_page(1, "/news", null, null);
			$("input").val("");
		});

		/****************************************************************************/
		//清空表单样式及内容
		function reset_form(ele) {
			$(ele)[0].reset();
			//清空表单样式
			$(ele).find("*").removeClass("has-error has-success");
			$(ele).find(".help-block").text("");
		}

		//点击登录按钮弹出模态框。
		$("#singin").click(function() {
			//清除表单数据（表单完整重置（表单的数据，表单的样式））
			reset_form("#login_form");
			//s$("")[0].reset();
			//先设置登录按钮不可用，验证通过才可用
			$("#login_btn").attr("disabled", true); 
			//弹出模态框
			$("#admin_login").modal({
				backdrop : "static"
			});
		});

		//校验用户名是否可用
		$("#login_form input").change(
				function() {
					//发送ajax请求校验用户名是否可用
					var name = $("#inputUserName").val();
					var pwd = $("#inputPassword").val();
					//alert($("#inputUserName").val());
					//alert(pwd);
					if(name !="" && pwd !=""){
						
					$.ajax({
						url : "${APP_PATH}/checkuser",
						data : {
							name : $("#inputUserName").val(),
							pwd : $("#inputPassword").val()
						},
						type : "POST",
						success : function(result) {
							//验证通过，把登录按钮设为可用
							$("#login_btn").attr("disabled", false); 
							if (result.code == 100) {
								show_validate_msg("#inputUserName", "success",
										null);
								$("#login_btn").attr("ajax-va", "success");
								
								//Ajax不能实现controller的页面条转请求，所以不用ajax跳转
								
								/* $.ajax({
									url : "${APP_PATH}/login",
									data : {username : $("#inputUserName").val()},
									type : "POST",
									success: function(result){
										
									}
								}); */
									
								
								//window.location.replace("${APP_PATH}/index1.jsp?name="+name);
								//window.location.href="${APP_PATH}/login";
								/* $.post("${APP_PATH}/login", 
									       { "username" : name }
									); */ 
								 /* $.ajax({
									url : "${APP_PATH}/login",
									type : "GET"
								}); */ 
								
								//window.location.href("${APP_PATH}/index1.jsp?name="+name);  

							} else {

								if (result.extend.va_msg == "密码错误") {
									show_validate_msg("#inputPassword",
											"error", result.extend.va_msg);//
									$("#login_btn").attr("ajax-va", "error");
								} else if (result.extend.va_msg == "用户不存在") {
									show_validate_msg("#inputUserName",
											"error", result.extend.va_msg
													+ "，请重新输入");//
									$("#login_btn").attr("ajax-va", "error");
								}
							}
						}
					});
					}
				});
		//显示校验结果的提示信息
		function show_validate_msg(ele, status, msg) {
			//清除当前元素的校验状态
			$(ele).parent().removeClass("has-success has-error");
			$(ele).next("span").text("");
			if ("success" == status) {
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);
			} else if ("error" == status) {
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
			}
		}
		/*****************输入栏改变即改变样式***************/
		$("#inputUserName").change(function() {
			//alert("xxx");
			$(this).parent().removeClass("has-success has-error");
			$(this).next("span").text("");
		});
		/*****************输入栏改变即改变样式***************/
		$("#inputPassword").change(function() {
			//alert("xxx");
			$(this).parent().removeClass("has-success has-error");
			$(this).next("span").text("");
		});
		/*********************************************************************************/
		
		//1、我们是按钮创建之前就绑定了click，所以绑定不上。
		//1）、可以在创建按钮的时候绑定。    2）、绑定点击.live()
		//jquery新版没有live，使用on进行替代
		$(document).on("click", "#details", function() {
			//alert("edit");

			//1、查出部门信息，并显示部门列表
			getCtgy("#newsDetailsModal select");
			//2、查出员工信息，显示员工信息
			getNews($(this).attr("detail_id"));

			
			$("#newsDetailsModal").modal({
				backdrop : "static"
			});
		});
		
		function getNews(id) {
			$.ajax({
				url : "${APP_PATH}/news/" + id,
				type : "GET",
				success : function(result) {
					//console.log(result);
					var news = result.extend.news;
					$("#title_details").text(news.title);
					$("#content_details").text(news.content);
					$("#source_details").text(news.source);
					$("#issueTime_details").text(news.issuetime);
					$("#newsDetailsModal select").val([ news.cId ]);
				}
			});
		}
		/*
		防止注销后，后退返回以登陆的页面
		*/
		$(function() {
			　　if (window.history && window.history.pushState) {
			　　$(window).on('popstate', function () {
			　　window.history.pushState('forward', null, '#');
			　　window.history.forward(1);
			　　});
			　　}
			　　window.history.pushState('forward', null, '#'); //在IE中必须得有这两行
			　　window.history.forward(1);
			　　});
	</script>

</body>
</html>