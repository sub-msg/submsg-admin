<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>SUBMSG管理后台</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="stylesheet" type="text/css" href="/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/stylesheets/theme.css">
    <link rel="stylesheet" href="/lib/font-awesome/css/font-awesome.css">
    <script src="/lib/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="/lib/bootstrap/js/bootstrap.js"></script>
    <style type="text/css">
        #line-chart {
            height:300px;
            width:800px;
            margin: 0px auto;
            margin-top: 1em;
        }
        .brand { font-family: georgia, serif; }
        .brand .first {
            color: #ccc;
            font-style: italic;
        }
        .brand .second {
            color: #fff;
            font-weight: bold;
        }
    </style>

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

  </head>

  <!--[if lt IE 7 ]> <body class="ie ie6"> <![endif]-->
  <!--[if IE 7 ]> <body class="ie ie7 "> <![endif]-->
  <!--[if IE 8 ]> <body class="ie ie8 "> <![endif]-->
  <!--[if IE 9 ]> <body class="ie ie9 "> <![endif]-->
  <!--[if (gt IE 9)|!(IE)]><!--> 
  <body class=""> 
  <!--<![endif]-->
    
<%@ include file="/admin/common/top.jsp" %>
    



    
<%@ include file="/admin/common/left.jsp" %>

    
    <div class="content">
        
        <div class="header">
            <h1 class="page-title">签名管理</h1>
        </div>

        <div class="container-fluid">
            <div class="row-fluid">
                    

<div class="btn-toolbar">
    <form action="/admin/signlist.sm" method="post">
       <label>签名内容:</label><input type="text" value="" class="search form-inline" name="searchContent">
       <div><button class="btn btn-primary" type="submit">搜索</button></div> </form>
</div>

<div class="well">
    <table class="table">
      <thead>
        <tr>
          <th>编号</th>
          <th>签名内容</th>
          <th>签名状态</th>
          <th>网关编码</th>
          <th>创建时间</th>
          <th>操作</th>
        </tr>
      </thead>
      <tbody>
       <s:iterator var="data" value="dataList">
        <tr>
          <td>${data.id}</td>
          <td>${data.signContent}</td>
          <td><c:if test="${data.signStatus==0}"><font color='red'>未审核</font></c:if><c:if test="${data.signStatus==1}"><font color='green'>已审核</font></c:if></td>
          <td>${data.signNum}</td>
          <td><fmt:formatDate value="${data.createdTime}" type="both"/></td>
          <td>
              <a href="#" id="sh" name="${data.id}"><i class="icon-pencil"></i></a>
             <!--  <a href="#myModal" role="button" data-toggle="modal"><i class="icon-remove"></i></a> -->
          </td>
        </tr>
        </s:iterator>
      </tbody>
    </table>
</div>
<div class="pagination">
   <aldtags:pageTag para1="searchContent" value1="${searchContent}" />
</div>
<div class="modal small hide fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="myModalLabel">Delete Confirmation</h3>
    </div>
    <div class="modal-body">
        <p class="error-text"><i class="icon-warning-sign modal-icon"></i>Are you sure you want to delete the user?</p>
    </div>
    <div class="modal-footer">
        <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
        <button class="btn btn-danger" data-dismiss="modal">Delete</button>
    </div>
</div>
                    
                  <%@ include file="/admin/common/foot.jsp" %>
                    
            </div>
        </div>
    </div>
<script type="text/javascript">

$("#sh").live("click",
	    function() {
	        var resionMassage=prompt("请输入该签名网关编码:","");
	        if(resionMassage==""){
	        	alert("请输入网关编码");return;
	        }
	        if(resionMassage==null){
	        	return;
	        }
	        var id = $(this).attr("name");
	        var d = '<form name="signHiddenForm" id="signHiddenForm" action="/admin/updatesign.sm" method="post" target="_self"><input type="text" name="id" value="' + id + '"/><input type="text" name="signNum" value="' + resionMassage + '"/><input type="submit" style="display:none" /></form>';
	        $("body").append(d);
	        $("#signHiddenForm").submit();
	        $("#signHiddenForm").remove();
	    })
</script>
    
  </body>
</html>