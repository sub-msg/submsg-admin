<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="sidebar-nav">
         <%
           int pageTag = 1;
           Object pageTagObj = session.getAttribute("pageTag");
           if(pageTagObj!=null){
        	   pageTag = (Integer)(pageTagObj);
           }
         
         %>
        <a href="#dashboard-menu" class="nav-header" data-toggle="collapse"><i class="icon-dashboard"></i>信息查询<i class="icon-chevron-up"></i></a>
        <ul id="dashboard-menu" class="nav nav-list collapse <%if(pageTag==1)out.print("in"); %>">
            <li><a href="/admin/index.sm?pageTag=1">信息总览</a></li>
        </ul>

        <a href="#accounts-menu" class="nav-header" data-toggle="collapse"><i class="icon-legal"></i>签名模板管理<i class="icon-chevron-up"></i></a>
        <ul id="accounts-menu" class="nav nav-list collapse <%if(pageTag==2)out.print("in"); %>">
            <li ><a href="/admin/templist.sm?pageTag=2">模板审核</a></li>
            <li ><a href="/admin/signlist.sm?pageTag=2">签名审核</a></li>
        </ul>
        
        <a href="#charger-menu" class="nav-header" data-toggle="collapse"><i class="icon-legal"></i>充值管理<i class="icon-chevron-up"></i></a>
        <ul id="charger-menu" class="nav nav-list collapse <%if(pageTag==4)out.print("in"); %>">
            <li ><a href="/admin/orderlist.sm?pageTag=4">商城订单</a></li>
        </ul>

        <a href="#error-menu" class="nav-header collapsed" data-toggle="collapse"><i class="icon-comment"></i>在线客服 <i class="icon-chevron-up"></i></a>
        <ul id="error-menu" class="nav nav-list collapse <%if(pageTag==3)out.print("in"); %>">
            <li ><a href="http://customer-service.submsg.cn:8787/index.php" target="_blank">登录在线客户系统</a></li>
        </ul>
    </div>