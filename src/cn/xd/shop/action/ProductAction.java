package cn.xd.shop.action;

import cn.xd.shop.service.CategorySecondService;
import cn.xd.shop.service.CategoryService;
import cn.xd.shop.service.ProductService;
import cn.xd.shop.vo.AdminUser;
import cn.xd.shop.vo.Category;
import cn.xd.shop.vo.CategorySecond;
import cn.xd.shop.vo.Order;
import cn.xd.shop.vo.Product;
import cn.xd.shop.vo.User;
import cn.xd.utils.PageBean;
import cn.xd.utils.SaveFileUtils;
import cn.xd.utils.UUIDUtils;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class ProductAction extends ActionSupport implements ModelDriven<Product> {
	// 用于接收数据的模型驱动.
	private Product product = new Product();
	// 注入商品的Service
	private ProductService productService;
	// 接收分类cid
	private Integer cid;
	// 接收二级分类id
	private Integer csid;

	public Integer getCsid() {
		return csid;
	}

	public void setCsid(Integer csid) {
		this.csid = csid;
	}

	// 接收当前页数:
	private int page;

	public void setPage(int page) {
		this.page = page;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public Integer getCid() {
		return cid;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public Product getModel() {
		return product;
	}

	// 文件上传需要的三个属性:
	private File upload;
	private String uploadFileName;
	private String uploadContentType;

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	//额外的图片 上传属性
		private File upload1;
		private String upload1FileName;
		private String upload1ContentType;

		public void setUpload1(File upload1) {
			this.upload1 = upload1;
		}

		public void setUpload1FileName(String upload1FileName) {
			this.upload1FileName = upload1FileName;
		}

		public void setUpload1ContentType(String upload1ContentType) {
			this.upload1ContentType = upload1ContentType;
		}
		private File upload2;
		private String upload2FileName;
		private String upload2ContentType;

		public void setUpload2(File upload2) {
			this.upload2 = upload2;
		}

		public void setUpload2FileName(String upload2FileName) {
			this.upload2FileName = upload2FileName;
		}

		public void setUpload2ContentType(String upload2ContentType) {
			this.upload2ContentType = upload2ContentType;
		}	
	
	
	// 注入CategorySecondService
	private CategorySecondService categorySecondService;

	public void setCategorySecondService(CategorySecondService categorySecondService) {
		this.categorySecondService = categorySecondService;
	}

	// 跳转到添加页面的方法:
	public String addPage() {
		// 查询所有的二级分类:
		List<CategorySecond> csList = categorySecondService.findAll();
		// 将二级分类的数据显示到页面上
		ActionContext.getContext().getValueStack().set("csList", csList);
		// 页面跳转
		return "addPage";
	}

	// 根据商品的ID进行查询商品:执行方法:
	public String findByPid() {
		// 调用Service的方法完成查询.
		product = productService.findByPid(product.getPid());
		return "findByPid";
	}

	private CategoryService categoryService;
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
	
	// 根据分类的id查询商品:
	public String findByCid() {
		// List<Category> cList = categoryService.findAll();
		PageBean<Product> pageBean = productService.findByPageCid(cid, page);// 根据一级分类查询商品,带分页查询
		// 将PageBean存入到值栈中:
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		ActionContext.getContext().getValueStack().set("cuttentCS",categoryService.findByCid(cid).getCategorySeconds());
		ActionContext.getContext().getValueStack().set("isCategory",null);
		return "findByCid";
	}

	// 根据二级分类id查询商品:
	public String findByCsid() {
		// 根据二级分类查询商品
		PageBean<Product> pageBean = productService.findByPageCsid(csid, page);
		// 将PageBean存入到值栈中:
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		CategorySecond cs = categorySecondService.findByCsid(csid);
		Category c = cs.getCategory();
		ActionContext.getContext().getValueStack().set("cuttentCS",c.getCategorySeconds());
		ActionContext.getContext().getValueStack().set("isCategory",cs.getCsname());
		return "findByCsid";
	}

	// 根据用户的id查询商品:
	public String findByUid() {
		// 获得用户的id.
		User existUser = (User) ServletActionContext.getRequest().getSession().getAttribute("existUser");
		// 获得用户的id
		Integer uid = existUser.getUid();
		// 根据用户的id查询订单:
		PageBean<Product> pageBean = productService.findBySellerId(uid, page);
		// 将PageBean数据带到页面上.
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findByUid";
	}

	// 保存商品的方法:
	public String save() throws IOException, ParseException {
		User existUser = (User) ServletActionContext.getRequest().getSession().getAttribute("existUser");
		if(existUser==null){
			this.addActionMessage("亲!您还没登陆~");
			return "msg";
		}
		// 将提交的数据添加到数据库中.
		Date date = new Date();
		SimpleDateFormat temp = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		product.setPdate(temp.parse(temp.format(date)));
		product.setSeller(existUser);
		String path = ServletActionContext.getServletContext().getRealPath("/products");
		String uuid = UUIDUtils.getUUID();
		if(!SaveFileUtils.saveFile(upload, uuid+uploadFileName, path)){
			this.addActionMessage("亲!图片上传失败，请稍后再试!");
			return "msg";
		}else{
			product.setImage("products/" +uuid+uploadFileName);
		}
		//保存额外的图片
		String exFilePaths = "";
		if(upload1!=null){
			uuid = UUIDUtils.getUUID();
			if(!SaveFileUtils.saveFile(upload1, uuid+upload1FileName, path)){
				this.addActionMessage("亲!额外图片上传失败，请稍后再试!");
				return "msg";
			}else{
				exFilePaths = "products/" +uuid+upload1FileName;
			}
		}
		if(upload2!=null){
			uuid = UUIDUtils.getUUID();
			if(!SaveFileUtils.saveFile(upload2, uuid+upload2FileName, path)){
				this.addActionMessage("亲!额外图片上传失败，请稍后再试!");
				return "msg";
			}else{
				if(exFilePaths!="")
					exFilePaths = exFilePaths+","+"products/" +uuid+upload2FileName;
				else
					exFilePaths = "products/" +uuid+upload2FileName;
			}
		}
		if(exFilePaths!="")
			product.setExImage(exFilePaths);
		productService.save(product);
		return "saveSuccess";
	}
	
	
	
	
	public String dropProduct(){
		int pid = Integer.parseInt(ServletActionContext.getRequest().getParameter("pid"));
		// 获得用户的id.
		User existUser = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("existUser");
		Product product =productService.findByPid(pid);
		if(product!=null && product.getSeller().getUid().equals(existUser.getUid())){
			productService.delete(product);
			// 根据用户的id查询订单:
			PageBean<Product> pageBean = productService.findBySellerId(existUser.getUid(), 1);
			// 将PageBean数据带到页面上.
			ActionContext.getContext().getValueStack().set("pageBean", pageBean);
			return "findByUid";
		}else{
			this.addActionMessage("亲!服务器繁忙，请刷新重试!");
			return "msg";
		}
	}
}
