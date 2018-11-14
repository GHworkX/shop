package cn.xd.shop.interceptor;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
import cn.xd.shop.vo.User;

public class UserLoginInterceptor  extends MethodFilterInterceptor{
	@Override
	protected String doIntercept(ActionInvocation actionInvocation){
		// 判断是否登录,如果登录,放行,没有登录,跳转到登录页面.
		User existUser = (User) ServletActionContext.getRequest().getSession().getAttribute("existUser");
				if(existUser != null){
					// 已经登录过
					try {
						return actionInvocation.invoke();
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}finally{
						return "index";
					}
				}else{
					// 跳转到登录页面:
					ActionSupport support = (ActionSupport) actionInvocation.getAction();
					support.addActionError("您还没有登录!没有权限访问!");
					return "userLogin";
				}
	}

}
