package cn.submsg.admin.user.action;

import org.apache.struts2.ServletActionContext;

import com.sr178.game.framework.config.ConfigLoader;
import com.sr178.game.framework.exception.ServiceException;
import com.sr178.module.utils.ParamCheck;
import com.sr178.module.web.action.BaseActionSupport;
import com.sr178.module.web.session.Session;
import com.sr178.module.web.session.SessionManager;


public class AdminLoginAction extends BaseActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String userName;
	private String password;
	public String login(){
		ParamCheck.checkString(userName, 1, "用户名不能为空");
		ParamCheck.checkString(password, 2, "密码不能为空");
		String serverUserName = ConfigLoader.getStringValue("user_name");
		String serverPassword = ConfigLoader.getStringValue("password");
		if(userName.equals(serverUserName)&&serverPassword.equals(password)){
			String sessionId = ServletActionContext.getRequest().getSession().getId();
			Session session = new Session(userName, System.currentTimeMillis(), sessionId);
			SessionManager.ins().addSession(sessionId, session);
		}else{
			throw new ServiceException(3,"用户名或密码错误！");
		}
		return "red";
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	
	
}
