package cn.xd.shop.action;

import java.util.ArrayList;
import java.util.List;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import cn.xd.shop.service.CategorySecondService;
import cn.xd.shop.vo.CategorySecond;
import cn.xd.utils.CategoryJsonBean;


public class CategoryAction  extends ActionSupport{
	private CategorySecondService categorySecondService;
	private List<CategoryJsonBean> list;
	
	@Override
	public String execute() throws Exception {
		Integer cid = Integer.parseInt(ServletActionContext.getRequest().getParameter("cid"));
		List<CategorySecond> data = categorySecondService.findAll();
		list = new ArrayList<CategoryJsonBean>();
		for(CategorySecond cs:data){
			if(cs.getCategory().getCid()==cid){
				CategoryJsonBean cjb = new CategoryJsonBean();
				cjb.setId(cs.getCsid());
				cjb.setName(cs.getCsname());
				list.add(cjb);
			}
		}
		return SUCCESS;
	}
	
	public List<CategoryJsonBean> getList() {
		return list;
	}
	public void setList(List<CategoryJsonBean> list) {
		this.list = list;
	}
	public void setCategorySecondService(CategorySecondService categorySecondService) {
		this.categorySecondService = categorySecondService;
	}
}
