<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<%@include file="/WEB-INF/views/include/header_info.jsp"%>

<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<%@include file="/WEB-INF/views/include/header.jsp"%>
		<%@include file="/WEB-INF/views/include/left_menu.jsp"%>

		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>Page Header <small>Optional description</small></h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
					<li class="active">Here</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content container-fluid">

				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box-header">
								<h3 class="box-title">Hover Data Table</h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
									<div class="row">
										<div class="col-sm-6"></div>
										<div class="col-sm-6"></div>
									</div>
									<div class="row">
										<div class="col-sm-12">
											<table id="example2" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
												<thead>
													<tr role="row">
														<th class="sorting">번호</th>
														<th class="sorting">제목</th>
														<th class="sorting">작성자</th>
														<th class="sorting">작성일</th>
														<th class="sorting">수정일</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${list }" var="board">
														<tr>
															<td><c:out value="${board.bno }"></c:out></td>
															<td><a class="move" href="<c:out value="${board.bno }"></c:out>"><c:out value="${board.title }"></c:out></a></td>
															<td><c:out value="${board.writer }"></c:out></td>
															<td><fmt:formatDate value="${board.regdate }" pattern="yyyy-MM-dd" /></td>
															<td><fmt:formatDate value="${board.updatedDate }" pattern="yyyy-MM-dd" /></td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
									
									<div class="row">
									
										<div class="col-sm-5 dataTables_info">
											<form id="searchForm" action="/board/list" method="get">
												<select name="type">
												    <option value=""   <c:out value="${pageMaker.cri.type == null?  'selected':'' }" />>--</option>
													<option value="T"  <c:out value="${pageMaker.cri.type eq 'T'?   'selected':'' }" />>제목</option>
													<option value="C"  <c:out value="${pageMaker.cri.type eq 'C'?   'selected':'' }" />>내용</option>
													<option value="W"  <c:out value="${pageMaker.cri.type eq 'W'?   'selected':'' }" />>작성자</option>
													<option value="TC" <c:out value="${pageMaker.cri.type eq 'TC'?  'selected':'' }" />>제목 or 내용</option>
													<option value="TW" <c:out value="${pageMaker.cri.type eq 'TW'?  'selected':'' }" />>제목 or 작성자</option>
													<option value="TWC"<c:out value="${pageMaker.cri.type eq 'TWC'? 'selected':'' }" />>제목 or 작성자 or 내용</option>
											    </select>
											    <input type="text" name="keyword" value="<c:out value="${pageMaker.cri.keyword}" />">
											    <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
											    <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
											    <button class="btn btn-primary">Search</button>
											</form>
									    </div>
									    
										<div class="col-sm-7">
									    	<div class="dataTables_paginate paging_simple_numbers" id="example2_paginate">
									        	<ul class="pagination">
													<c:if test="${pageMaker.prev}">
														<li class="paginate_button previous" id="example2_previous"><a href="${pageMaker.startPage-1}">Previous</a></li>
													</c:if>
													<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage}" var="num">	
														<li class='paginate_button ${pageMaker.cri.pageNum == num ? "active":""}'><a href="${num}">${num}</a></li>
													</c:forEach>
													<c:if test="${pageMaker.next}">	
										 				<li class="paginate_button next" id="example2_next"><a href="${pageMaker.endPage+1}">Next</a></li>
													</c:if>
									   			</ul>
									  		</div>
									    </div>
									    
									    <!--prev,page number, next 를 클릭하면 아래 form이 작동된다.-->
									    <form id="actionForm" action="/board/list" method="get">
									    	<!--list.jsp 가 처음 실행되었을 때 pageNum의 값을 사용자가 선택한 번호의 값으로 변경-->
											<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
											<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
											<input type="hidden" name="type" value="${pageMaker.cri.type}">
											<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
								        <!--글번호추가-->
									    </form>
							</div>
						   </div>
					      </div>
					      <!-- /.box-body -->
						</div>
					</div>
					<!-- /.col -->
				</div>

			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<!-- Main Footer -->
		<%@include file="/WEB-INF/views/include/footer.jsp"%>
	</div>
	<!-- ./wrapper -->

	<!-- REQUIRED JS SCRIPTS (with jQuery)-->
	<%@include file="/WEB-INF/views/include/plugin_js.jsp"%>

	<script>
		$(document).ready(function() {

			let actionForm = $("#actionForm");
			
			$(".move").on("click", function(e) {
				e.preventDefault();

				let bno = $(this).attr("href");
				console.log("글번호" + bno);

				actionForm.append("<input type='hidden' name='bno' value='" + $(this).attr("href") + "'>");
				actionForm.attr("action", "/board/get");
				actionForm.submit();
			});

			$(".paginate_button a").on("click", function(e){
				e.preventDefault();
				actionForm.find("input[name='pageNum']").val($(this).attr("href"));
				console.log("click");
				actionForm.submit();
			});
		});
	</script>
	

</body>
</html>
