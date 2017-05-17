package cn.submsg.admin.user.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.module.web.action.BasePageActionSupport;

import cn.submsg.admin.service.AdminService;
import cn.submsg.member.bo.PaymentOrder;

public class ChargeManagerAction extends BasePageActionSupport<PaymentOrder> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String orderId;
	private int status=-1;
	/**
	 * 查询订单列表
	 */
	public String execute(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		super.initPage(adminService.getOrderPageList(orderId, status, 15, super.getToPage()));
		return SUCCESS;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
}
