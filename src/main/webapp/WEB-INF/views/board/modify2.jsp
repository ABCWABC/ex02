<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<%@include file="/WEB-INF/views/include/header_info.jsp" %>
	
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <%@include file="/WEB-INF/views/include/header.jsp" %>
  <%@include file="/WEB-INF/views/include/left_menu.jsp" %>

  <div class="content-wrapper">
    <section class="content-header">
      <h1>Page Header<small>Optional description</small></h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
        <li class="active">Here</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content container-fluid">

     <div class="row">
      <div class="col-md-12">   
       <div class="box box-primary">
         <div class="box-header with-border">
           <h3 class="box-title">Board Modify Page</h3>
         </div>
            <!-- /.box-header -->
            
         <form id="modifyForm" method="post" action="/board/modify">
             <input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }" />'>
             <input type="hidden" name="amount"  value='<c:out value="${cri.amount }"  />'>
             <input type="hidden" name="type"    value='<c:out value="${cri.type }"    />'>
             <input type="hidden" name="keyword" value='<c:out value="${cri.keyword }" />'>
              
             <div class="box-body">
               <div class="form-group">
                 <label for="bno">Bno</label>
                 <input type="text" class="form-control" id="bno" name="bno" value="${board.bno }" readonly="readonly">
               </div>
               <div class="form-group">
                 <label for="title">Title</label>
                 <input type="text" class="form-control" id="title" name="title" value="${board.title }">
               </div>
               <div class="form-group">
                 <label for="content">Text area</label>
                 <textarea class="form-control" rows="3" id="content" name="content">${board.content }</textarea>
               </div>
               <div class="form-group">
                 <label for="writer">Writer</label>
                 <input type="text" class="form-control" id="writer" name="writer" value="${board.writer }" readonly="readonly">
               </div>
               <div class="form-group">
                 <label for="regdate">RegDate</label> <!-- pattern="yyyy-MM-dd"  날짜포맷이 에러가 발생된다.-->
                 <input type="text" class="form-control" id="regdate" name="regdate" value="<fmt:formatDate value="${board.regdate }" pattern="yyyy/MM/dd"/>" readonly="readonly">
               </div>
               <div class="form-group">
                  <label for="updatedDate">Update Date</label>
                  <input type="text" class="form-control" id="updatedDate" name="updatedDate" value="<fmt:formatDate value="${board.updatedDate }" pattern="yyyy/MM/dd"/>" readonly="readonly">
               </div>
             </div>
             <!-- /.box-body -->
             <div class="box-footer">
               <button id="btnModify" type="submit" class="btn btn-primary">Modify</button>
               <button id="btnRemove" type="button" class="btn btn-danger">Remove</button>
               <button id="btnList" type="button" class="btn btn-info">List</button>
             </div>
         </form>
         
      </div>
     </div>
       
        
	</div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <%@include file="/WEB-INF/views/include/footer.jsp" %>
</div>

  <%@include file="/WEB-INF/views/include/plugin_js.jsp" %>

<script>

  $(document).ready(function(){

    let formObj = $("#modifyForm");

    //목록버튼 클릭시 동작
    $("#btnList").on("click", function(){

      formObj.attr("action", "/board/list");
      formObj.attr("method", "get");

      let pageNumTag = $("input[name='pageNum']").clone();
      let amountTag = $("input[name='amount']").clone();
      let keywordTag = $("input[name='type']").clone();
      let typeTag = $("input[name='keyword']").clone();

      console.log(pageNumTag);
      console.log(amountTag);
      console.log(keywordTag);
      console.log(typeTag);

      formObj.empty(); // 폼의 모든 내용을 제거.

      formObj.append(pageNumTag);
      formObj.append(amountTag);
      formObj.append(keywordTag);
      formObj.append(typeTag);

      formObj.submit();
    });

    //삭제버튼 클릭시 동작
    $("#btnRemove").on("click", function(){

      if(confirm("게시물을 삭제하겠습니까?")){
        formObj.attr("action", "/board/remove");
        formObj.submit();
      }
    });

  });

</script>

</body>
</html>
