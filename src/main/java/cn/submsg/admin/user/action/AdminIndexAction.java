package cn.submsg.admin.user.action;

import org.apache.struts2.ServletActionContext;

import com.sr178.module.web.action.JsonBaseActionSupport;
import com.sr178.module.web.session.SessionManager;

public class AdminIndexAction extends JsonBaseActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	public String index(){
		
		return SUCCESS;
	}
	
	
	public String logout(){
		String sessionId = ServletActionContext.getRequest().getSession().getId();
		SessionManager.ins().removeSession(sessionId);
		return SUCCESS;
	}

}
