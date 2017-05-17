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
            <h1 class="page-title">订单管理</h1>
        </div>

        <div class="container-fluid">
            <div class="row-fluid">
                    

<div style="margin-top: 5px;">
    <form action="/admin/orderlist.sm" method="post">
    <p>订单号:
     <input type="text" value="${orderId}"  name="orderId">
     订单状态:
         <select name="status" id="status">
         <option value="-1" <c:if test="${status==-1}"> selected</c:if>>全部</option>
          <option value="0" <c:if test="${status==0}"> selected</c:if>>未支付</option>
          <option value="1" <c:if test="${status==1}"> selected</c:if>>已支付</option>
       </select>
       <button class="btn btn-primary" type="submit">搜索</button></p>
    </form>
</div>

<div class="well">
    <table class="table">
      <thead>
        <tr>
          <th>订单号</th>
          <th>用户id</th>
          <th>商品描述</th>
          <th>商品数量</th>
          <th>交易金额</th>
          <th>发票类型</th>
          <th>订单状态</th>
          <th>支付类型</th>
          <th>第三方订单号</th>
          <th>付款时间</th>
          <th>创建时间</th>
          <th>操作</th>
        </tr>
      </thead>
      <tbody>
       <s:iterator var="data" value="dataList">
        <tr>
          <td>${data.orderId}</td>
          <td>${data.userId}</td>
          <td>${data.productDesc}</td>
          <td>${data.productNum}</td>
          <td>${data.productAmount}</td>
          <td><c:if test="${data.invoiceId==0}">不需要</c:if><c:if test="${data.invoiceId!=0}"><font color='green'><a href="#" id="sh" invoiceId="${data.invoiceId}">查看发票信息</a></font></c:if></td>
          <td><c:if test="${data.status==0}">未支付</c:if><c:if test="${data.status==1}"><font color='green'>已支付</font></c:if></td>
          <td><c:if test="${data.payType==1}">阿里</c:if><c:if test="${data.payType==2}">京东</c:if><c:if test="${data.payType==3}">管理员补单</c:if></td>
          <td>${data.bankOrderId}</td>
          <td><fmt:formatDate value="${data.updatedTime}" type="both"/></td>
          <td><fmt:formatDate value="${data.createdTime}" type="both"/></td>
          <td>
             <c:if test="${data.status==0}"><a href="#" onclick="javascript:updateToSuccess('${data.orderId}')" ><i class="icon-pencil"></i>补单</a></c:if>
             <!--  <a href="#myModal" role="button" data-toggle="modal"><i class="icon-remove"></i></a> -->
          </td>
        </tr>
        </s:iterator>
      </tbody>
    </table>
</div>
<div class="pagination">
   <aldtags:pageTag para1="orderId" value1="${orderId}" para2="status" value2="${status}"/>
</div>
<div class="modal small hide fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h2 id="myModalLabel">发票信息</h2>
    </div>
    <div class="modal-body">
发票类型:<label id="invoiceType"></label>
 发票抬头:<label id="invoiceName"></label>
 纳税人标识:<label id="taxpayerTag"></label>
公司地址：      <label id="comAddress"></label>         
公司电话：<label id="comPhone"></label>
 开户银行：<label id="comBankName"></label>
开户行账号：<label id="comBankAccount"></label>
<hr />
收件人姓名：<label id="sName"></label>
地址：<label id="address"></label>
联系电话：<label id="phone"></label>
    </div>
    <div class="modal-footer">
        <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
    </div>
</div>
                  <%@ include file="/admin/common/foot.jsp" %>
                    
            </div>
        </div>
    </div>
<script type="text/javascript">
$("#sh").live("click",
	    function() {
	        var invoiceId = $(this).attr("invoiceId");
	         $.post("/admin/getInvoiceById.sm", {
		         id: invoiceId,
		         tim: Math.random()
		     },
		     function(d) {
		     	   if(d.flag==0){
		     		  $("#invoiceName").text(d.rc.invoiceName);
		     		  if(d.rc.invoiceType==1){
		     			 $("#invoiceType").text('普通发票');  
		     		  }else if(d.rc.invoiceType==2){
		     			 $("#invoiceType").text('增值税专用发票');    
		     		  }
		     		 $("#taxpayerTag").text(d.rc.taxpayerTag);
		     		$("#comAddress").text(d.rc.comAddress);
		     		$("#comPhone").text(d.rc.comPhone);
		     		$("#comBankName").text(d.rc.comBankName);
		     		$("#comBankAccount").text(d.rc.comBankAccount);
		     		$("#sName").text(d.rc.firstName+d.rc.secondName);
		     		$("#address").text(d.rc.provice+d.rc.city+d.rc.area+d.rc.address);
		     		$("#phone").text(d.rc.phone);
		     		 $('#myModal').modal('show');
		     	   }else{
		     		  alert('查询失败！');
		     		  return;
		     	   }
		     })
	    })	   


function updateToSuccess(orderId){
				var msg = "您真的确定要补单"+orderId+"吗？确认后，商品会直接发送到该用户账号上，\n\n请确认！"; 
				 if (confirm(msg)==false){ 
				    return;
				 } 
				 $.post("/admin/updatesuccess.sm", {
			         orderId: orderId,
			         tim: Math.random()
			     },
			     function(d) {
			     	   if(d.flag==0){
			     		   alert('补单成功！');
			     		  window.location.reload(); 
			     	   }else{
			     		  alert('补单失败！');
			     		  return;
			     	   }
			     })
	    }
	    
 
</script>
    
  </body>
</html>