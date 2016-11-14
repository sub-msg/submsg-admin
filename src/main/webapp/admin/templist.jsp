<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${code==1}"><script language=javascript>alert('不存在的模板ID');history.go(-1);</script></c:if>
<c:if test="${code==2}"><script language=javascript>alert('请先审核模板签名');history.go(-1);</script></c:if>
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
            <h1 class="page-title">模板管理</h1>
        </div>

        <div class="container-fluid">
            <div class="row-fluid">
                    

<div class="btn-toolbar">
    <form action="/admin/templist.sm" method="post">
       <label>关键字(可为用户名，签名，模板内容):</label><input type="text" value="${searchContent}" class="search form-inline" name="searchContent">
        <select name="tempStatus" id="tempStatus" class="input-xlarge">
          <option value="100" <c:if test="${tempStatus==100}">selected</c:if>>全部</option>
          <option value="-1" <c:if test="${tempStatus==-1}">selected</c:if>>正在审核</option>
          <option value="-2" <c:if test="${tempStatus==-2}">selected</c:if>>审核失败</option>
          <option value="0" <c:if test="${tempStatus==0}">selected</c:if>>未提交审核</option>
          <option value="1" <c:if test="${tempStatus==1}">selected</c:if>>审核成功</option>
    </select>
       <div><button class="btn btn-primary" type="submit">搜索</button>
       </div> </form>
</div>
<div class="well">
    <table class="table">
      <thead>
        <tr>
          <th>用户名</th>
          <th>模板ID</th>
          <th>模板内容</th>
          <th>模板状态</th>
          <th>签名</th>
          <th>发送渠道</th>
          <th>创建时间</th>
          <th>操作</th>
        </tr>
      </thead>
      <tbody>
       <s:iterator var="data" value="dataList">
        <tr>
          <td>${data.userName}</td>
          <td>${data.tempId}</td>
          <td style="width:40%">${data.tempContent}</td>
          <td><c:if test="${data.tempStatus==0}">未提交审核</c:if><c:if test="${data.tempStatus==1}">已审核</c:if><c:if test="${data.tempStatus==-1}"><font color='red'>正在审核</font></c:if><c:if test="${data.tempStatus==-2}">审核不成功(${data.unpassReason})</c:if></td>
          <td><c:if test="${data.signStatus==0}"><font color='red'>${data.signContent}</font></c:if><c:if test="${data.signStatus==1}"><font color='green'>${data.signContent}</font></c:if></td>
          <td><c:if test="${data.sendType==0}">默认设置</c:if><c:if test="${data.sendType==1}">卓望</c:if><c:if test="${data.sendType==2}">SUBMAIL</c:if><c:if test="${data.sendType==3}">云片</c:if><c:if test="${data.sendType==4}">秒滴</c:if></td>
          <td><fmt:formatDate value="${data.createdTime}" type="both"/></td>
          <td>
              <a href="#" name="${data.tempId}" id="sh" title="【${data.signContent}】${data.tempContent}" tempSendType="${data.sendType}" tempStatus="${data.tempStatus}">修改</a>
          </td>
        </tr>
        </s:iterator>
      </tbody>
    </table>
</div>
<div class="pagination">
   <aldtags:pageTag para1="tempStatus" value1="${tempStatus}" para2="searchContent" value2="${searchContent}" />
</div>
<div class="modal small hide fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="myModalLabel">模板审核</h3>
    </div>
    <div class="modal-body">
      <label id="tempContent" name="tempContent"></label>
      <hr>
      <form action="/admin/updatetemp.sm" method="post" id="tempEditForm">
      <label>状态:</label>
        <select name="status" id="status" class="input-xlarge">
          <option value="1">审核成功</option>
          <option value="-2">审核失败</option>
       </select>
       <label>发送渠道选择:</label>
        <select name="sendType" id="sendType" class="input-xlarge">
         <option value="0">默认</option>
          <option value="1">卓望</option>
          <option value="2">SUBMAIL</option>
          <option value="3">云片</option>
          <option value="4">秒滴</option>
       </select>
       <label>原因:</label><input type="text" value="" class="search form-inline" name="unPassReason" />
       <label>新模板ID:</label><input type="text" value="" class="search form-inline" name="newTempId" />
       <input type="hidden" value="" class="search form-inline" name="tempId" id="tempId"/>
      </form>
    </div>
    <div class="modal-footer">
        <button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
        <button class="btn btn-danger" id="sureSubmit">确认</button>
    </div>
</div>
                    
                  <%@ include file="/admin/common/foot.jsp" %>
                    
            </div>
        </div>
    </div>
<script type="text/javascript">

$("#sh").live("click",
	    function() {
	         var tempId = $(this).attr("name");
	         var status = $(this).attr("tempStatus");
	         var tempSendType = $(this).attr("tempSendType");
	         $("#sendType").val(tempSendType);
	         $("#status").val(status);
	        // alert("tempId=["+tempId+"]"+"tempStatus=["+status+"]"+"tempSendType=["+tempSendType+"]");
	         $("#tempContent").html($(this).attr("title"));
	         $('#myModal').modal('show');
	         $("#sureSubmit").live("click",function(){
	        	 $("#tempId").val(tempId);
	        	 $("#tempEditForm").submit();
	         })
	    })

</script>
    
  </body>
</html>