package cn.submsg.admin.user.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.module.web.action.BasePageActionSupport;

import cn.submsg.admin.bo.AdminSign;
import cn.submsg.admin.service.AdminService;

public class SignManagerAction extends BasePageActionSupport<AdminSign>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int pageTag;
	
	private String searchContent;
	public String signlist(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		super.initPage(adminService.getAdminSignPage(searchContent,30, super.getToPage()));
		return SUCCESS;
	}
	
	private int id;
	private String signNum;
	public String updateSign(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		adminService.updateAdminSign(id, signNum);
		return SUCCESS;
	}
	public int getPageTag() {
		return pageTag;
	}
	public void setPageTag(int pageTag) {
		this.pageTag = pageTag;
	}
	public String getSearchContent() {
		return searchContent;
	}
	public void setSearchContent(String searchContent) {
		this.searchContent = searchContent;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSignNum() {
		return signNum;
	}
	public void setSignNum(String signNum) {
		this.signNum = signNum;
	}
}
