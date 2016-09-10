package cn.submsg.admin.user.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.module.web.action.BasePageActionSupport;

import cn.submsg.admin.service.AdminService;
import cn.submsg.member.bean.AdminMsgTempBean;

public class TempManagerAction extends BasePageActionSupport<AdminMsgTempBean> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int tempStatus=-1;
	private String searchContent;
	public String templist(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		super.initPage(adminService.getTempPage(searchContent, tempStatus, 30, super.getToPage()));
		return SUCCESS;
	}
	private int status;
	private String tempId;
	private String newTempId;
	private String unPassReason;
	private int sendType;
	public String updateStatus(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		adminService.updateTemp(tempId, status, newTempId, unPassReason,sendType);
		return "redirect";
	}
	public int getTempStatus() {
		return tempStatus;
	}
	public void setTempStatus(int tempStatus) {
		this.tempStatus = tempStatus;
	}
	public String getSearchContent() {
		return searchContent;
	}
	public void setSearchContent(String searchContent) {
		this.searchContent = searchContent;
	}
	public String getTempId() {
		return tempId;
	}
	public void setTempId(String tempId) {
		this.tempId = tempId;
	}
	public String getNewTempId() {
		return newTempId;
	}
	public void setNewTempId(String newTempId) {
		this.newTempId = newTempId;
	}
	public String getUnPassReason() {
		return unPassReason;
	}
	public void setUnPassReason(String unPassReason) {
		this.unPassReason = unPassReason;
	}
	public int getSendType() {
		return sendType;
	}
	public void setSendType(int sendType) {
		this.sendType = sendType;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
}
