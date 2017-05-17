package cn.submsg.admin.user.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.module.web.action.JsonBaseActionSupport;

import cn.submsg.member.constant.PayType;
import cn.submsg.member.service.PayMentService;

public class ChargeManagerJsonAction extends JsonBaseActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String orderId;
	private int status;
	/**
	 * 更新订单状态
	 * @return
	 */
	public String updateOrderStatusToSuccess(){
		PayMentService payMentService = ServiceCacheFactory.getService(PayMentService.class);
		boolean result = payMentService.afterOrderSuccess(orderId, PayType.AdminPay, "0000", -1);
		if(result){
			return this.renderSuccessResult();
		}else{
			return this.renderErrorResult("补单不成功");
		}
	}
	
	
	/**
	 * 获取单个发票信息
	 * @return
	 */
	private int id;
	public String getInvoiceById(){
		PayMentService payMentService = ServiceCacheFactory.getService(PayMentService.class);
		return this.renderObjectResult(payMentService.getInvoiceById(id));
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

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
}
