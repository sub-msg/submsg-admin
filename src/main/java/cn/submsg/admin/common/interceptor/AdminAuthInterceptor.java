package cn.submsg.admin.common.interceptor;


import org.apache.struts2.ServletActionContext;

import com.google.common.base.Strings;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.sr178.module.web.action.BaseActionSupport;
import com.sr178.module.web.session.Session;
import com.sr178.module.web.session.SessionManager;

public class AdminAuthInterceptor extends AbstractInterceptor{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		
		BaseActionSupport aldAction = null;
		Object obj = invocation.getAction();
		if (obj instanceof BaseActionSupport) {
			aldAction = (BaseActionSupport)obj;
			String sessionId = ServletActionContext.getRequest().getSession().getId();
			Session session = SessionManager.ins().getSession(sessionId);
			if(session==null){
				return "nologin";
			}
			String pageTagStr = ServletActionContext.getRequest().getParameter("pageTag");
			if(!Strings.isNullOrEmpty(pageTagStr)){
				int pageTag = Integer.valueOf(pageTagStr);
				ServletActionContext.getRequest().getSession().setAttribute("pageTag", pageTag);
			}
			aldAction.setUserSession(session);
			aldAction.setUserName(session.getUserName());
			return invocation.invoke();
		}else{
			//不支持这种方式 直接中断
			String className = obj.getClass().getCanonicalName();
			throw new RuntimeException("ACTION继承的类非BaseActionSupport"+className);
		}
	}

}
