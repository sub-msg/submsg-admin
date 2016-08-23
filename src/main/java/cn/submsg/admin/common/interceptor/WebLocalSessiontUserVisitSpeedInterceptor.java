package cn.submsg.admin.common.interceptor;

import com.sr178.module.web.interceptor.AbstractUserVisitSpeedInterceptor;
import com.sr178.module.web.session.Session;
import com.sr178.module.web.session.SessionManager;

public class WebLocalSessiontUserVisitSpeedInterceptor extends AbstractUserVisitSpeedInterceptor {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Override
	public void saveSession(Session userSession) {
		
	}
	@Override
	public void afterTrigger(Session arg0) {
		SessionManager.ins().removeSession(arg0.getSessionId());
	}
	
}
