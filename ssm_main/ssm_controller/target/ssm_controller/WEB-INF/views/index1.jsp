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
<!-- web路径：
不以/开始的相对路径，找资源，以当前资源的路径为基准，经常容易出问题。
以/开始的相对路径，找资源，以服务器的路径为标准(http://localhost:3306)；需要加上项目名
		http://localhost:3306/
 -->
<script type="text/javascript"
	src="${APP_PATH }/static/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${APP_PATH }/static/js/myjs.js"></script>
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
			<a class="navbar-brand" href="#" id="admin_name"></a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<form class="navbar-form navbar-right" action= "${APP_PATH }/logout#" >
				<button type="submit" class="btn btn-danger" id="logout">注销</button>
			</form>
		</div>
		<!--/.navbar-collapse -->
	</div>
	</nav>

	<!-- Main jumbotron for a primary marketing message or call to action -->
	<div class="jumbotron">
		<div class="container">
			<div class="row">
				<form class="navbar-form navbar-right">
					<div class="col-md-4 col-md-offset-8">
						<button class="btn btn-primary" id="news_add_modal_btn">新增新闻</button>
						<button class="btn btn-primary" id="ctgy_add_modal_btn">新增新闻类别</button>
						<button class="btn btn-danger" id="news_delete_all_btn">删除</button>
					</div>
				</form>
			</div>
			<!-- 显示表格数据 -->
			<div class="row">
				<div class="col-md-12">
					<table class="table table-hover" id="news_table">
						<thead>
							<tr>
								<th><input type="checkbox" id="check_all" /></th>
								<th>#</th>
								<th>标题</th>
								<th>内容</th>
								<th>来源</th>
								<th>创建日期</th>
								<th>所属类别</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>

						</tbody>
					</table>
				</div>
			</div>

			<!-- 显示分页信息 -->
			<div class="row">
				<!--分页文字信息  -->
				<div class="col-md-4" id="page_info_area"></div>
				<!-- 分页条信息 -->
				<div class="col-md-5" id="page_nav_area"></div>
			</div>



		</div>
	</div>

	<!-- =============================================================================================== -->
	<!-- 新闻添加的模态框 -->
	<div class="modal fade" id="newsAddModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">添加新闻</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">新闻标题</label>
							<div class="col-sm-10">
								<input type="text" name="title" class="form-control"
									id="title_add_input" placeholder="请输入标题"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">内容</label>
							<div class="col-sm-10">
								<textarea name="content" class="form-control"
									id="content_add_input" placeholder="填写内容"></textarea>
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">来源</label>
							<div class="col-sm-10">
								<input type="text" name="source" class="form-control"
									id="content_add_input" placeholder="来源">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">所属类别</label>
							<div class="col-sm-4">
								<!-- 部门提交部门id即可 -->
								<select class="form-control" name="cId">
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="news_save_btn">保存</button>
				</div>
			</div>
		</div>
	</div>

	<!--====================================================================================================-->
	<!-- 新增新闻类别模态框 -->
	<div class="modal fade" id="ctgyAddModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">添加新闻类别</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">名称</label>
							<div class="col-sm-10">
								<input type="text" name="ctgyName" class="form-control"
									id="ctgy_add_input" placeholder="请输入类别名称"> <span
									class="help-block"></span>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="ctgy_save_btn">保存</button>
				</div>
			</div>
		</div>
	</div>


	<!--======================================================================================================  -->
	<!-- 新闻修改的模态框 -->
	<div class="modal fade" id="newsUpdateModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">修改新闻</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">新闻标题</label>
							<div class="col-sm-10">
								<input type="text" name="title" class="form-control"
									id="title_update_input" placeholder="请输入标题">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">内容</label>
							<div class="col-sm-10">
								<textarea name="content" class="form-control"
									id="content_update_input" placeholder="填写内容"></textarea>
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">来源</label>
							<div class="col-sm-10">
								<input type="text" name="source" class="form-control"
									id="source_update_input" placeholder="来源">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">所属类别</label>
							<div class="col-sm-4">
								<!-- 部门提交部门id即可 -->
								<select class="form-control" name="cId">
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="news_update_btn">更新</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->


	<script>
		//1、页面加载完成以后，直接去发送ajax请求,要到分页数据
		$(function() {
			//获取session的值（用户名）
			var name = '<%= session.getAttribute("username")%>';
			$("#admin_name").text("欢迎您，"+name)
			var totalRecord, currentPage;
			// 去首页	
			to_page(1, "/news", null, null);
			
			//查询新闻类别显示在下拉列表
			//getCtgy("select");
			//$("input").val("");
			
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
			$("#news_table tbody").empty();
			// 接收json数据 result.extend.pageinfo.list中封装了json数据
			var newses = result.extend.pageInfo.list;
			// 遍历newses
			// index表示newses， item代表newses中的值
			$
					.each(
							newses,
							function(index, item) {
								// var newses_div = $("<div class='col-md-4'></div>")

								var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
								var newsIdTd = $("<td></td>").append(
										item.newsId);
								var newsTitleTd = $("<td id='title'></td>")
										.append(item.title);
								var newsContentTd = $("<td id='cont'></td>")
										.append(item.content);
								var newsSourceTd = $("<td></td>").append(
										item.source);
								var issueTimeTd = $("<td></td>").append(
										item.issuetime);
								var ctgyNameTd = $("<td></td>").append(
										item.category.ctgyName);
								/**
								<button class="">
													<span class="" aria-hidden="true"></span>
													编辑
												</button>
								 */
								var editBtn = $("<button></button>")
										.addClass(
												"btn btn-primary btn-sm edit_btn")
										.append(
												$("<span></span>")
														.addClass(
																"glyphicon glyphicon-pencil"))
										.append("编辑");
								//为编辑按钮添加一个自定义的属性，来表示当前员工id
								editBtn.attr("edit-id", item.newsId);
								var delBtn = $("<button></button>")
										.addClass(
												"btn btn-danger btn-sm delete_btn")
										.append(
												$("<span></span>")
														.addClass(
																"glyphicon glyphicon-trash"))
										.append("删除");
								//为删除按钮添加一个自定义的属性来表示当前删除的员工id
								delBtn.attr("del-id", item.newsId);
								var btnTd = $("<td></td>").append(editBtn)
										.append(" ").append(delBtn);
								// append方法执行完成以后还是返回原来的元素
								$("<tr></tr>").append(checkBoxTd).append(
										newsIdTd).append(newsTitleTd).append(
										newsContentTd).append(newsSourceTd)
										.append(issueTimeTd).append(ctgyNameTd)
										.append(btnTd).appendTo(
												"#news_table tbody");

								// 限制字符个数
								$("td")
										.each(
												function() {
													var maxwidth = 8;
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
								$("td")
										.each(
												function() {
													var maxwidth = 8;
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

		/****************************************************************************************************/

		//点击新增按钮弹出模态框。
		$("#news_add_modal_btn").click(function() {
			//清除表单数据（表单完整重置（表单的数据，表单的样式））
			reset_form("#newsAddModal form");
			//s$("")[0].reset();
			//发送ajax请求，查出部门信息，显示在下拉列表中
			getCtgy("#newsAddModal select");
			//弹出模态框
			$("#newsAddModal").modal({
				backdrop : "static"
			});
		});

		//清空表单样式及内容
		function reset_form(ele) {
			$(ele)[0].reset();
			//清空表单样式
			$(ele).find("*").removeClass("has-error has-success");
			$(ele).find(".help-block").text("");
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

		/****************************************************************************************************/

		//点击保存，保存新闻。
		$("#news_save_btn").click(function() {

			//2、发送ajax请求保存员工
			$.ajax({
				url : "${APP_PATH}/news",
				type : "POST",
				data : $("#newsAddModal form").serialize(),
				success : function(result) {
					//alert(result.msg);
					if (result.code == 100) {
						//员工保存成功；
						//1、关闭模态框
						$("#newsAddModal").modal('hide');

						//2、来到最后一页，显示刚才保存的数据
						//发送ajax请求显示最后一页数据即可
						to_page(totalRecord, "/news", null, null);
					}
				}
			});
		});
		/***********************************************************************************************/
		//点击新增新闻类别按钮弹出模态框。
		$("#ctgy_add_modal_btn").click(function() {
			//清除表单数据（表单完整重置（表单的数据，表单的样式））
			reset_form("#ctgyAddModal form");
			//弹出模态框
			$("#ctgyAddModal").modal({
				backdrop : "static"
			});
		});

		//点击保存，保存新闻类别。
		$("#ctgy_save_btn").click(function() {

			//2、发送ajax请求保存员工
			$.ajax({
				url : "${APP_PATH}/ctgy",
				type : "POST",
				data : $("#ctgyAddModal form").serialize(),
				success : function(result) {
					//alert(result.msg);
					if (result.code == 100) {
						//员工保存成功；
						//1、关闭模态框
						$("#ctgyAddModal").modal('hide');

						//2、来到最后一页，显示刚才保存的数据
						//发送ajax请求显示最后一页数据即可
						to_page(totalRecord, "/news", null, null);
					}
				}
			});
		});

		/**************************************************************************************************/
		//单个删除
		$(document).on("click", ".delete_btn", function() {
			//1、弹出是否确认删除对话框
			//var empName = $(this).parents("tr").find("td:eq(2)").text();
			var newsId = $(this).attr("del-id");
			//alert($(this).parents("tr").find("td:eq(1)").text());
			if (confirm("确认删除吗？")) {
				//确认，发送ajax请求删除即可
				$.ajax({
					url : "${APP_PATH}/news/" + newsId,
					type : "DELETE",
					success : function(result) {
						alert(result.msg);
						//回到本页
						to_page(currentPage, "${APP_PATH}/news", null, null);
					}
				});
			}
		});

		//完成全选/全不选功能
		$("#check_all").click(function() {
			//attr获取checked是undefined;
			//我们这些dom原生的属性；attr获取自定义属性的值；
			//prop修改和读取dom原生属性的值
			$(".check_item").prop("checked", $(this).prop("checked"));
		});

		//check_item
		$(document)
				.on(
						"click",
						".check_item",
						function() {
							//判断当前选择中的元素是否5个
							var flag = $(".check_item:checked").length == $(".check_item").length;
							$("#check_all").prop("checked", flag);
						});

		//点击全部删除，就批量删除
		$("#news_delete_all_btn").click(
				function() {
					//
					var empNames = "";
					var del_idstr = "";
					$.each($(".check_item:checked"), function() {
						//this
						empNames += $(this).parents("tr").find("td:eq(2)")
								.text()
								+ ",";
						//组装员工id字符串
						del_idstr += $(this).parents("tr").find("td:eq(1)")
								.text()
								+ "-";
					});
					//去除删除的id多余的-
					del_idstr = del_idstr.substring(0, del_idstr.length - 1);
					if (confirm("确认删除吗？")) {
						//发送ajax请求删除
						$.ajax({
							url : "${APP_PATH}/news/" + del_idstr,
							type : "DELETE",
							success : function(result) {
								alert(result.msg);
								//回到当前页面
								to_page(currentPage, "${APP_PATH}/news", null,
										null);
							}
						});
					}
					//
				});
		
		
		/*******************************************************************************************/
		//1、我们是按钮创建之前就绑定了click，所以绑定不上。
		//1）、可以在创建按钮的时候绑定。    2）、绑定点击.live()
		//jquery新版没有live，使用on进行替代
		$(document).on("click", ".edit_btn", function() {
			//alert("edit");

			//1、查出部门信息，并显示部门列表
			getCtgy("#newsUpdateModal select");
			//2、查出员工信息，显示员工信息
			getNews($(this).attr("edit-id"));

			//3、把员工的id传递给模态框的更新按钮
			$("#news_update_btn").attr("edit-id", $(this).attr("edit-id"));
			$("#newsUpdateModal").modal({
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
					$("#title_update_input").val(news.title);
					$("#content_update_input").val(news.content);
					$("#source_update_input").val(news.source);
					$("#newsUpdateModal select").val([ news.cId ]);
				}
			});
		}
		
		
		//点击更新，更新员工信息
		$("#news_update_btn").click(function() {

			//2、发送ajax请求保存更新的员工数据
			$.ajax({
				url : "${APP_PATH}/news/" + $(this).attr("edit-id"),
				type : "PUT",
				data : $("#newsUpdateModal form").serialize(),
				success : function(result) {
					//alert(result.msg);
					//1、关闭对话框
					$("#newsUpdateModal").modal("hide");
					//2、回到本页面
					to_page(currentPage,"${APP_PATH}/news",null,null);
				}
			});
		});
		
		//不能用ajax提交表单，因为设计页面跳转。
		/* /$("#logout").click(function(){
			$.ajax({
				url : "${APP_PATH}/logout",
				type : "GET"	
			});
		}); */ 
	</script>
</body>
</html>
