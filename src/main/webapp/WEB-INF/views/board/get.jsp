<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<!-- css, js 파일포함 -->
<!-- 절대경로  /WEB-INF/views/include/header_info.jsp -->
<%@include file="/WEB-INF/views/include/header_info.jsp" %>
<!--
BODY TAG OPTIONS:
=================
Apply one or more of the following classes to get the
desired effect
|---------------------------------------------------------|
| SKINS         | skin-blue                               |
|               | skin-black                              |
|               | skin-purple                             |
|               | skin-yellow                             |
|               | skin-red                                |
|               | skin-green                              |
|---------------------------------------------------------|
|LAYOUT OPTIONS | fixed                                   |
|               | layout-boxed                            |
|               | layout-top-nav                          |
|               | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <!-- Main Header -->
  <%@include file="/WEB-INF/views/include/header.jsp" %>
  <!-- Left side column. contains the logo and sidebar -->
  <%@include file="/WEB-INF/views/include/left_menu.jsp" %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Page Header
        <small>Optional description</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
        <li class="active">Here</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content container-fluid">

      <!--------------------------
        | 글쓰기 폼 | BoardVO클래스의 필드명을 참고.
        -------------------------->
     <div class="row">
      <div class="col-md-12">   
       <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Board Read Page</h3>
            </div>
            <!-- /.box-header -->
            
              <div class="box-body">
                <div class="form-group">
                  <label for="bno">Bno</label>
                  <input type="text" class="form-control" id="bno" name="bno" value="${board.bno }" readonly="readonly">
                </div>
                <div class="form-group">
                  <label for="title">Title</label>
                  <input type="text" class="form-control" id="title" name="title" value="${board.title }" readonly="readonly">
                </div>
                <div class="form-group">
                  <label for="content">Text area</label>
                  <textarea class="form-control" rows="3" id="content" name="content" readonly="readonly">${board.content }</textarea>
                </div>
                <div class="form-group">
                  <label for="writer">Writer</label>
                  <input type="text" class="form-control" id="writer" name="writer" value="${board.writer }" readonly="readonly">
                </div>
              </div>
              <!-- /.box-body -->

              <div class="box-footer">
                <button id="btnModify" type="button" data-bno="${board.bno }" class="btn btn-primary">Modify</button>
                <button id="btnList" type="button" class="btn btn-info">List</button>


                <form id="operForm" action="/board/modify" method="get">
                  <input type="hidden" id="bno" name="bno" value='<c:out value="${ board.bno}" />'>
                  <input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }" />'>
                  <input type="hidden" name="amount" value='<c:out value="${cri.amount }" />'>
                  <input type="hidden" name="type" value='<c:out value="${cri.type }" />'>
                  <input type="hidden" name="keyword" value='<c:out value="${cri.keyword }" />'>
                  
                </form>

              </div>
          
          </div>
        </div>
       
        
	</div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Main Footer (기타 footer태그밑에 소스포함)-->
  <%@include file="/WEB-INF/views/include/footer.jsp" %>
</div>
<!-- ./wrapper -->

<!-- REQUIRED JS SCRIPTS(with jquery) -->
<%@include file="/WEB-INF/views/include/plugin_js.jsp" %>

<script>

  $(document).ready(function(){

    let operForm = $("#operForm");

    //수정 버튼 클릭시 동작
    $("#btnModify").on("click", function(){
      operForm.submit();
    });

    //목록 버튼 클릭시 동작
    $("#btnList").on("click", function(){
      operForm.find("#bno").remove();
      operForm.attr("action", "/board/list");
      operForm.submit();
    });
  });

</script>
</body>
</html>
