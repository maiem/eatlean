package ptithcm.controller;

import javax.servlet.http.HttpServletRequest;

import ptithcm.entity.*;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.regex.*;

import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.transaction.Transactional;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
//import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.SessionScope;

@Controller
@Transactional
@RequestMapping("user")

public class UserController {

	@Autowired
	JavaMailSender mailer;

	@Autowired
	SessionFactory factory;

	ACCOUNT ac = new ACCOUNT();
	public String username;
	private int account_id;


//	public String getUsername() {
//		return username;
//	}
//
//	public void setUsername(String username) {
//		this.username = username;
//	}

	public int getAccount_id() {
		return account_id;
	}

	public void setAccount_id(int account_id) {
		this.account_id = account_id;
	}

	
	@RequestMapping(value = "home")
	public String home() {
		return "user/home";
	}

	@RequestMapping(value = "about")
	public String about() {
		return "user/about";
	}

	@RequestMapping(value = "contact")
	public String contact() {
		return "user/contact";
	}
	
	
	//QUEN MAT KHAU
	@RequestMapping(value = "/forgetPassword", method = RequestMethod.GET)
	public String forget() {
		return "user/success";
	}

	@RequestMapping(value = "/forgetPassword", method = RequestMethod.POST)
	public String forget(ModelMap model, @ModelAttribute("u") ACCOUNT u) {

		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		String hql = "FROM ACCOUNT";
		Query query = session.createQuery(hql);
		List<ACCOUNT> listAcc = query.list();
		for (ACCOUNT user : listAcc) {
			if (user.getAccount_name().equals(u.getAccount_name())) {
				int code = (int) Math.floor(((Math.random() * 8999999) + 1000000));
				String kq = String.valueOf(code);
				try {
					user.setAccount_password(kq);
					
					session.update(user);
					t.commit();
					sendMail(user.getEmail(), user.getAccount_password());
					model.addAttribute("message", true);
				} catch (Exception e) {
					t.rollback();
					model.addAttribute("message", "Thất bại !!!");
				} finally {
					session.close();
				}
			}
		}
		return "user/success";
	}

	// ĐĂNG NHẬP
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(HttpServletRequest request, ModelMap model) throws ServletException, IOException {

		return "user/login";
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(@ModelAttribute("ACCOUNT") ACCOUNT user, HttpServletRequest request, ModelMap model,
			BindingResult errors) throws ServletException, IOException {
		Session session = factory.getCurrentSession();
		String hql = "FROM ACCOUNT";
		Query query = session.createQuery(hql);
		List<ACCOUNT> listAcc = query.list();
		if (user.getAccount_name().trim().length() == 0) {
			errors.rejectValue("account_name", "ACCOUNT", "Vui lòng nhập tên người dùng !!!");
		}
		if (user.getAccount_password().trim().length() == 0) {
			errors.rejectValue("account_password", "ACCOUNT", "Vui lòng nhập mật khẩu !!!");
		}
		if (errors.hasErrors()) {
			model.addAttribute("message1", "Vui lòng nhập thông tin người dùng !!!");
		} else {
			boolean check = true;
			for (ACCOUNT ktra : listAcc) {
				if (user.getAccount_name().equals(ktra.getAccount_name())
						&& user.getAccount_password().equals(ktra.getAccount_password())
						&& ktra.getAccount_state_id() == 1) {

					check = false;
					username=ktra.getAccount_name();
					HttpSession s = request.getSession();
					s.setAttribute("username", ktra.getAccount_name());
					if (ktra.getAccount_type_id() == 1) {
						username=ktra.getAccount_name();
						return "redirect:/admin/home.htm?uname="+username;

					}
				}
			}
			if (check == false) {
				return "redirect:/user/home.htm";
			} else {
				model.addAttribute("message", "Tên tài khoản hoặc mật khẩu chưa đúng !!!");
			}
		}

		return "user/login";
	}

	// DANG KI	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(ModelMap model) throws ServletException, IOException {
		model.addAttribute("ACCOUNT", new ACCOUNT());
		return "user/register";
	}

	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String register(@ModelAttribute("ACCOUNT") ACCOUNT user, BindingResult errors, HttpServletRequest request,
			ModelMap model) throws ServletException, IOException {
		String pass_conf = request.getParameter("pass-conf");
		Session s = factory.openSession();
		Transaction t = s.beginTransaction();
		boolean check = true;
		String hql = "FROM ACCOUNT";
		Query query = s.createQuery(hql);
		List<ACCOUNT> listAcc = query.list();

		if (user.getAccount_name().trim().length() == 0) {
			errors.rejectValue("account_name", "ACCOUNT", "Vui lòng nhập tên người dùng !!!");
		}
		if (user.getAddress().trim().length() == 0) {
			errors.rejectValue("address", "ACCOUNT", "Vui lòng nhập địa chỉ !!!");
		}
		if (user.getEmail().trim().length() == 0) {
			errors.rejectValue("email", "ACCOUNT", "Vui lòng nhập địa chỉ !!!");
		}
		if (user.getPhone().trim().length() == 0) {
			errors.rejectValue("phone", "ACCOUNT", "Vui lòng nhập số điện thoại !!!");
		}
		if (user.getAccount_password().trim().length() == 0) {
			errors.rejectValue("account_password", "ACCOUNT", "Vui lòng nhập mật khẩu !!!");
		}
		if (user.getAccount_password().equals(pass_conf)) {

		} else {
			errors.rejectValue("account_password", "ACCOUNT", "Mật khẩu không giống nhau !!!");
		}
		
		if (errors.hasErrors()) {
			model.addAttribute("message1", "Vui lòng nhập đầy đủ thông tin !!!");
		} else {
			for (ACCOUNT ktra : listAcc) {
				if (user.getAccount_name().equals(ktra.getAccount_name())) {
					check = false;
				}
			}
			if (check == true) {
				user.setAccount_type_id(0);
				user.setAccount_state_id(1);

 // luu do db
				t.commit(); // chap nhan thay doi du lieu trong db
				model.addAttribute("message", "Thành công");
			} else {
				model.addAttribute("message", "Thất bại" + "");
			}
		}
		return "user/register";
	}

	
	// DANH SACH SAN PHAM TRONG GIO HANG
	//PRODUCT product_id;
	int code = 0;

	@RequestMapping(value = "/show_prod", method = RequestMethod.GET)
	public String showProd(ModelMap model, HttpServletRequest request) {
		model.addAttribute("od", new ORDER_DETAILS());
		code = Integer.parseInt(request.getParameter("code"));
		request.setAttribute("prod", selectProd(code));
		return "user/show";

	}

	@RequestMapping(value = "/show_prod", method = RequestMethod.POST)
	public String showProd(ORDER_DETAILS od, ORDER_PRODUCT orderProduct, ModelMap model, HttpServletRequest request,
			BindingResult errors) throws ServletException, Exception {
		Session s1 = factory.openSession();
		Transaction t = s1.beginTransaction();
		String hql = "from PRODUCT";
		Query query = s1.createQuery(hql);
		List<PRODUCT> list = query.list();
		for (PRODUCT p : list) {
			if (p.getId() == code) {
				try {
					orderProduct.setAccount_id(selectUserId(username));
					System.out.print(orderProduct.getAccount_id());
					
					orderProduct.setOrdered_date(new Date());
					orderProduct.setOrder_state_id(3);
					System.out.print(od.getAmount_of());
					orderProduct.setTotal_price(od.getAmount_of() * p.getPrice());

					s1.save(orderProduct);
					od.setOrder_product_id(orderProduct.getId());
					od.setUnit_price(orderProduct.getTotal_price());
//					PRODUCT product=new PRODUCT();
//					product.setId(code);
					od.setProduct_id(code);
					
					s1.save(od);
					t.commit();
					model.addAttribute("message", "Thêm vào giỏ hàng thành công!");
					
					return "redirect:/user/cart.htm";
				} catch (Exception e) {
					model.addAttribute("message", "Không thể thêm sản phẩm vào giỏ hàng !");
					return "user/show";
				}
			}
		}
		return "user/show";
	}

	// GIO HANG
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cart(ModelMap model, HttpServletRequest request) {
		return "user/cart";
	}

	@RequestMapping(value = "/cart", method = RequestMethod.POST)
	public String cart(PRODUCT prod, ModelMap model, HttpServletRequest request) {
		return "user/cart";
	}

	// XOA SAN PHAM TRONG GIO HANG
	@RequestMapping("delete")
	public String delete(HttpServletRequest request, ModelMap model, HttpServletResponse rsp) {

		int x = Integer.parseInt(request.getParameter("code"));

		Session s1 = factory.openSession();
		Transaction t1 = s1.beginTransaction();
		String hql2 = "FROM ORDER_DETAILS";
		Query query2 = s1.createQuery(hql2);
		List<ORDER_DETAILS> list2 = query2.list();

		for (ORDER_DETAILS p : list2) {
			if (p.getOrder_product_id() == x) {
				s1.delete(p);
				t1.commit();
				s1.close();
			}
		}

		Session s = factory.openSession();
		Transaction t = s.beginTransaction();
		String hql1 = "FROM ORDER_PRODUCT";
		Query query1 = s.createQuery(hql1);
		List<ORDER_PRODUCT> list1 = query1.list();
		for (ORDER_PRODUCT p : list1) {
			if (p.getId() == x) {
				s.delete(p);
				t.commit();
				s.close();
				model.addAttribute("message1", "Thành công");
				return "redirect:/user/cart.htm";
			}
		}
		return "user/cart";
	}


	// DANH SACH SAN PHAM
	@RequestMapping(value = "product")
	public String product(ModelMap model) {
		Session s = factory.openSession();
		Transaction t = s.beginTransaction();
		boolean check = true;
		String hql = "FROM PRODUCT";
		Query query = s.createQuery(hql);
		List<PRODUCT> listPro = query.list();
		model.addAttribute("list", listPro);

		return "user/product";
	}

	@ModelAttribute("product")
	public List<PRODUCT> prod(ModelMap model) {
		Session s = factory.getCurrentSession();
		String hql = "FROM PRODUCT";
		Query query = s.createQuery(hql);
		List<PRODUCT> listPro = query.list();

		return listPro;
	}
	
	
	// DANH SÁCH SẢN PHẨM
		public PRODUCT selectProd(int code) {
			PRODUCT prod = null;
			Session session = factory.getCurrentSession();
			String hql = "from PRODUCT";
			Query query = session.createQuery(hql);
			List<PRODUCT> list = query.list();
			for (PRODUCT u : list) {
				if (u.getId() == code) {
					prod = u;
				}
			}
			return prod;

		}

	//DANH SACH SAN PHAM TRONG GIO HANG
	@ModelAttribute("orderDetail")
	public List<ORDER_DETAILS> orderDetail(ModelMap model) {
		Session s = factory.getCurrentSession();
		String hql = "FROM ORDER_DETAILS";
		Query query = s.createQuery(hql);
		List<ORDER_DETAILS> listPro = query.list();

		return listPro;
	}

	@ModelAttribute("orderProduct")
	public List<ORDER_PRODUCT> orderProd(ModelMap model) {
		Session s = factory.openSession();
		String hql = "FROM ORDER_PRODUCT p where p.account_id =:id";
		Query query = s.createQuery(hql);
		query.setParameter("id", selectUserId(username));
		List<ORDER_PRODUCT> listPro = query.list();

		return listPro;
	}

	// LAY TEN ACCOUNT
	public ACCOUNT selectUser(String uname) {
		ACCOUNT user = null;
		Session session = factory.getCurrentSession();
		String hql = "from ACCOUNT";
		Query query = session.createQuery(hql);
		List<ACCOUNT> list = query.list();
		for (ACCOUNT u : list) {
			if (u.getAccount_name().equals(uname)) {
				user = u;
			}
		}
		return user;

	}

	// LAY ID ACCOUNT
	public int selectUserId(String uname) {
		int userID = 0;
		Session session = factory.getCurrentSession();
		String hql = "from ACCOUNT";
		Query query = session.createQuery(hql);
		List<ACCOUNT> list = query.list();
		for (ACCOUNT u : list) {
			if (u.getAccount_name().equals(uname)) {
				userID = u.getId();
			}
		}
		return userID;

	}

	
	// MAIL
	public boolean sendMail(String mailClient, String pass) {
		boolean check = true;
		String body = "Bạn đã quên mật khẩu, hãy lấy mật khẩu chúng tôi cung cấp để đăng nhập vào website :" + pass
				+ ". <br>Đổi mật khẩu khác nếu bạn không muốn sử dụng mật khẩu này.<br> Xin cảm ơn !!";

		String from = "hathimaianh03@gmail.com";
		try {
			MimeMessage mail = mailer.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(mail);
			helper.setFrom(from, from);
			helper.setTo(mailClient);
			helper.setReplyTo(from, from);
			helper.setSubject("Thông báo xác nhận mật khẩu!");
			helper.setText(body, true);

			mailer.send(mail);
		} catch (Exception e) {
			check = false;
		}
		return check;
	}

}
