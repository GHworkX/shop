package cn.xd.shop.action;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;

import cn.xd.shop.service.OrderService;
import cn.xd.shop.service.ProductService;
import cn.xd.shop.vo.Cart;
import cn.xd.shop.vo.CartItem;
import cn.xd.shop.vo.Order;
import cn.xd.shop.vo.OrderItem;
import cn.xd.shop.vo.Product;
import cn.xd.shop.vo.User;
import cn.xd.utils.BuyerMesBean;
import cn.xd.utils.PageBean;
import cn.xd.utils.PaymentUtil;
import cn.xd.utils.SellerMesBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class OrderAction extends ActionSupport implements ModelDriven<Order> {
	public static String shopPhone = "18021348564";
	public static String shopAddr = "西电营业厅";
	
	// 模型驱动使用的对象
	private Order order = new Order();

	public Order getModel() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}

	// 接收支付通道编码:
	private String pd_FrpId;

	public void setPd_FrpId(String pd_FrpId) {
		this.pd_FrpId = pd_FrpId;
	}
	// 接收付款成功后的参数:
	private String r3_Amt;
	private String r6_Order;
	
	public void setR3_Amt(String r3_Amt) {
		this.r3_Amt = r3_Amt;
	}

	public void setR6_Order(String r6_Order) {
		this.r6_Order = r6_Order;
	}

	// 接收page
	private Integer page;

	public void setPage(Integer page) {
		this.page = page;
	}

	// 注入OrderService
	private OrderService orderService;

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	// 接收pid
	private Integer pid;
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	
	private ProductService productService;
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	public String confirmOrder(){
		User existUser = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("existUser");
		if (existUser == null) {
			this.addActionMessage("亲!您还没有登录!");
			return "msg";
		}
		Product p = productService.findByPid(pid);
		if (p == null) {
			this.addActionMessage("亲!您还没有选定商品!");
			return "msg";
		}
		ActionContext.getContext().getValueStack().set("buyProduct", p);
		return "confirmOrder";
	}
	
	
	// 生成订单的执行的方法:
//	public String saveOrder(){
//
//		// 调用Service完成数据库插入的操作:
//		// Order order = new Order();
//		// 设置订单的总金额:订单的总金额应该是购物车中总金额:
//		// 购物车在session中,从session总获得购物车信息.
//		Cart cart = (Cart) ServletActionContext.getRequest().getSession()
//				.getAttribute("cart");
//		if (cart == null) {
//			this.addActionMessage("亲!您还没有购物!");
//			return "msg";
//		}
//		order.setTotal(cart.getTotal());
//		// 设置订单的状态
//		order.setState(1); // 1:未付款.
//		// 设置订单时间
//		Date date=new Date();							
//		SimpleDateFormat temp=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
//		try {
//			order.setOrdertime(temp.parse(temp.format(date)));
//		} catch (ParseException e) {
//			e.printStackTrace();
//			this.addActionMessage("亲!服务器繁忙，请稍等!");
//			return "msg";
//		}
//		// 设置订单关联的客户:
//		User existUser = (User) ServletActionContext.getRequest().getSession()
//				.getAttribute("existUser");
//		if (existUser == null) {
//			this.addActionMessage("亲!您还没有登录!");
//			return "msg";
//		}
//		order.setUser(existUser);
//		// 设置订单项集合:
//		for (CartItem cartItem : cart.getCartItems()) {
//			// 订单项的信息从购物项获得的.
//			OrderItem orderItem = new OrderItem();
//			orderItem.setCount(cartItem.getCount());
//			orderItem.setSubtotal(cartItem.getSubtotal());
//			orderItem.setProduct(cartItem.getProduct());
//			orderItem.setOrder(order);
//
//			order.getOrderItems().add(orderItem);
//		}
//		orderService.save(order);
//		// 清空购物车:
//		cart.clearCart();
//
//		// 页面需要回显订单信息:
//		// 使用模型驱动了 所有可以不使用值栈保存了
//		// ActionContext.getContext().getValueStack().set("order", order);
//
//		return "saveOrder";
//	}

	// 查询我的订单:
	public String findByUid() {
		// 获得用户的id.
		User existUser = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("existUser");
		// 获得用户的id
		Integer uid = existUser.getUid();
		// 根据用户的id查询订单:
		PageBean<Order> pageBean = orderService.findByUid(uid, page);
		// 将PageBean数据带到页面上.
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findByUid";
	}

	// 根据订单id查询订单:
	public String findByOid() {
		order = orderService.findByOid(order.getOid());
		return "findByOid";
	}
	private Integer oid;

	
	// 为订单付款:
	public String payOrder() throws IOException {
		// 1.修改数据:
		User existUser = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("existUser");
		if(existUser == null){
			this.addActionMessage("亲!您还没有登录!");
			return "msg";
		}
		Date date=new Date();							
		SimpleDateFormat temp=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		try {
			order.setOrdertime(temp.parse(temp.format(date)));
		} catch (ParseException e) {
			e.printStackTrace();
			this.addActionMessage("亲!服务器繁忙，请稍等!");
			return "msg";
		}
		Product p =productService.findByPid(pid);
		if(p.getSeller().getUid().equals(existUser.getUid())){
			this.addActionMessage("亲!这是您上传的商品哦!");
			return "msg";
		}
		order.setUser(existUser);
		order.setProduct(p);
		order.setTotal(p.getShop_price());
		order.setState(1);
		// 修改订单
		orderService.save(order);
		//目前仅支持当面交易
		oid = order.getOid();
		return showSellerMes();
	}

	// 付款成功后跳转回来的路径:
	public String callBack(){
		// 修改订单的状态:
		Order currOrder = orderService.findByOid(Integer.parseInt(r6_Order));
		// 修改订单状态为2:已经付款:
		currOrder.setState(2);
		orderService.update(currOrder);
		this.addActionMessage("支付成功!订单编号为: "+r6_Order +" 付款金额为: "+r3_Amt);
		return "msg";
	}
	
	// 修改订单的状态:
	public String updateState(){
		oid = order.getOid();
		if(oid == null)
			oid = Integer.parseInt(ServletActionContext.getRequest().getParameter("oid"));
		Order currOrder = orderService.findByOid(oid);
		currOrder.setState(4);
		orderService.update(currOrder);
		return "updateStateSuccess";
	}
	
	public String showSellerMes(){
		if(oid == null)
			oid = Integer.parseInt(ServletActionContext.getRequest().getParameter("oid"));
		Order currOrder = orderService.findByOid(oid);
		//回显seller的信息给用户
		List<SellerMesBean> list = new ArrayList<SellerMesBean>();
		Product temp = currOrder.getProduct();
		SellerMesBean smb = new SellerMesBean();
		smb.setId(oid);
		if(temp.getIsMarket()){
			smb.setName("商城");
			smb.setPhone(shopPhone);
			smb.setAddr(shopAddr);
			smb.setProduct(temp);
		}else{
			User seller = temp.getSeller();
			smb.setName(seller.getName());
			smb.setPhone(seller.getPhone());	
			smb.setAddr(seller.getAddr());
		}
		smb.setProduct(temp);
		list.add(smb);
		ActionContext.getContext().getValueStack().set("sellersMes", list);
		ActionContext.getContext().getValueStack().set("orderId", currOrder.getOid());
		return "showSellerMesPage";
	}
	
	public String dropOrder(){
			oid = Integer.parseInt(ServletActionContext.getRequest().getParameter("oid"));
			// 获得用户的id.
			User existUser = (User) ServletActionContext.getRequest().getSession()
					.getAttribute("existUser");
			Order order =orderService.findByOid(oid);
			if(order!=null && order.getUser().getUid().equals(existUser.getUid())){
				orderService.delete(order);
				// 根据用户的id查询订单:
				PageBean<Order> pageBean = orderService.findByUid(existUser.getUid(), 1);
				// 将PageBean数据带到页面上.
				ActionContext.getContext().getValueStack().set("pageBean", pageBean);
				return "findByUid";
			}else{
				this.addActionMessage("亲!服务器繁忙，请刷新重试!");
				return "msg";
			}
	}
	
	
	public String showAllBuyerMesByPid(){
		Product p =productService.findByPid(pid);
		if(p!=null){
			List<Order> list = orderService.findByPid(pid);
			if(list!=null){
				List<BuyerMesBean> res = new ArrayList<BuyerMesBean>();
				for(Order o : list){
					BuyerMesBean bmb = new BuyerMesBean();
					bmb.setAddr(o.getAddr());
					bmb.setName(o.getName());
					bmb.setPhone(o.getPhone());
					bmb.setOid(o.getOid());
					bmb.setPid(pid);
					bmb.setState(o.getState());
					res.add(bmb);
					System.out.println(o.getName());
				}
				ActionContext.getContext().getValueStack().set("BuyerMesBean", res);	
			}
		}
		return "showBuyerMesPage";
	}
	
	public String finishOrder(){
		Product p =productService.findByPid(pid);
		Order order = orderService.findByOid(oid);
		if(p!=null && order!=null){
			//根据商品id完结所有订单
			orderService.finishOrderByPid(pid);
		}
		return showAllBuyerMesByPid();
	}
}
