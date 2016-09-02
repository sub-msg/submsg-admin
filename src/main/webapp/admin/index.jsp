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
            <h1 class="page-title">信息总览</h1>
        </div>

        <div class="container-fluid">
            <div class="row-fluid">
                    

<div class="row-fluid">
    <div class="block">
        <a href="#page-stats" class="block-heading" data-toggle="collapse">统计</a>
        <div id="page-stats" class="block-body collapse in">

            <div class="stat-widget-container">
                <div class="stat-widget">
                    <div class="stat-button">
                        <p class="detail">总用户数</p>
                        <p class="title">${totalMemberCount}</p>
                    </div>
                </div>

                <div class="stat-widget">
                    <div class="stat-button">
                       <p class="detail">已激活用户数</p>
                        <p class="title">${activeMemberCount}</p>
                    </div>
                </div>

                <div class="stat-widget">
                    <div class="stat-button">
                    <p class="detail">付费用户数</p>
                        <p class="title">${payUserCount}</p>
                    </div>
                </div>

                <div class="stat-widget">
                    <div class="stat-button">
                        <p class="detail">充值总额</p>
                         <p class="title">¥${totalPayAmount}</p>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<div class="row-fluid">
    <div class="block span6">
        <a href="#tablewidget" class="block-heading" data-toggle="collapse">信息发送统计</a>
        <div id="tablewidget" class="block-body collapse in">
            <table class="table">
              <thead>
                <tr>
                  <th>日期</th>
                  <th>发送次数</th>
                  <th>失败次数</th>
                  <th>发送数量</th>
                  <th>失败数量</th>
                </tr>
              </thead>
              <tbody>
              <s:iterator var="data" value="dailySendList">
                <tr>
                  <td>${data.time}</td>
                  <td>${data.times}</td>
                  <td>${data.loseTimes}</td>
                  <td>${data.nums}</td>
                  <td>${data.loseNums}</td>
                </tr>
                </s:iterator>
              </tbody>
            </table>
        </div>
    </div>
    <div class="block span6">
        <a href="#tablewidget1" class="block-heading" data-toggle="collapse">最近充值</a>
        <div id="tablewidget1" class="block-body collapse in">
            <table class="table">
              <thead>
                <tr>
                  <th>用户</th>
                  <th>充值数</th>
                  <th>充值日期</th>
                </tr>
              </thead>
              <tbody>
              <s:iterator var="payData" value="payMentList">
                <tr>
                  <td>${payData.userName}</td>
                  <td>¥${payData.amount}</td>
                  <td><fmt:formatDate value="${payData.time}" type="both"/></td>
                </tr>
                </s:iterator>
              </tbody>
            </table>
        </div>
    </div>
</div>
                    
                  <%@ include file="/admin/common/foot.jsp" %>
                    
            </div>
        </div>
    </div>
    


    
  </body>
</html>