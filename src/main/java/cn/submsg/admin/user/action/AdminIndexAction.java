package cn.submsg.admin.user.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.module.web.action.BaseActionSupport;
import com.sr178.module.web.session.SessionManager;

import cn.submsg.admin.bean.DailySendNum;
import cn.submsg.admin.bean.PayMentBean;
import cn.submsg.admin.service.AdminService;

public class AdminIndexAction extends BaseActionSupport {

	private int pageTag;
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private List<DailySendNum> dailySendList;
	
	private List<PayMentBean> payMentList;
	
	private int totalMemberCount;
	private int activeMemberCount;
	private int payUserCount;
	private double totalPayAmount;
	public String index(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		dailySendList = adminService.getDailySendNumListByTime(null, null);
		payMentList = adminService.getFinishPayMentOrderList(31);
		totalMemberCount = adminService.getTotleMemberCount();
		activeMemberCount = adminService.getActiveMemberCount();
		payUserCount = adminService.getPaymentMemberCount();
		totalPayAmount = adminService.getTotalPayAmount();
		return SUCCESS;
	}
	
	
	public String logout(){
		String sessionId = ServletActionContext.getRequest().getSession().getId();
		SessionManager.ins().removeSession(sessionId);
		return SUCCESS;
	}
	
	
	public List<DailySendNum> getDailySendList() {
		return dailySendList;
	}
	public void setDailySendList(List<DailySendNum> dailySendList) {
		this.dailySendList = dailySendList;
	}
	public List<PayMentBean> getPayMentList() {
		return payMentList;
	}
	public void setPayMentList(List<PayMentBean> payMentList) {
		this.payMentList = payMentList;
	}
	public int getTotalMemberCount() {
		return totalMemberCount;
	}
	public void setTotalMemberCount(int totalMemberCount) {
		this.totalMemberCount = totalMemberCount;
	}
	public int getActiveMemberCount() {
		return activeMemberCount;
	}
	public void setActiveMemberCount(int activeMemberCount) {
		this.activeMemberCount = activeMemberCount;
	}
	public int getPayUserCount() {
		return payUserCount;
	}
	public void setPayUserCount(int payUserCount) {
		this.payUserCount = payUserCount;
	}
	public double getTotalPayAmount() {
		return totalPayAmount;
	}
	public void setTotalPayAmount(double totalPayAmount) {
		this.totalPayAmount = totalPayAmount;
	}


	public int getPageTag() {
		return pageTag;
	}


	public void setPageTag(int pageTag) {
		this.pageTag = pageTag;
	}
	
	
}
