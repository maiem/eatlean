package ptithcm.controller;

import java.io.File;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.transaction.Transactional;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.*;
import org.springframework.beans.factory.annotation.Autowired;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
//import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import ptithcm.entity.*;


@Transactional
@Controller
@RequestMapping("/admin/")
public class AdminController {

	
	@Autowired
	SessionFactory factory;
	UserController uc;
	@Autowired
	ServletContext context;

	@RequestMapping(value="error")
	public String error() {
		return "admin/error";
	}
	
//	String user;
	@RequestMapping(value = "home")
	public String home( HttpServletRequest request) {
		String user = request.getParameter("uname");
		if (selectUserRole(user)==1) {
			return "admin/home";
		} else {
			return "admin/error";
		}
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
		
		public int selectUserRole(String uname) {
			int userRole = 0;
			Session session = factory.getCurrentSession();
			String hql = "from ACCOUNT";
			Query query = session.createQuery(hql);
			List<ACCOUNT> list = query.list();
			for (ACCOUNT u : list) {
				if (u.getAccount_name().equals(uname)) {
					userRole = u.getAccount_type_id();
				}
			}
			return userRole;
		}

		@RequestMapping(value = "qldh")
		public String qldh(HttpServletRequest request) {
			String user = request.getParameter("uname");
			if (selectUserRole(user)==1) {
				return "admin/qldh";
			} else {
				return "admin/error";
			}
		}

		@RequestMapping(value = "qlsp")
		public String qlsp(HttpServletRequest request) {
			String user = request.getParameter("uname");
			if (selectUserRole(user)==1) {
				return "admin/qlsp";
			} else {
				return "admin/error";
			}
		}

		@RequestMapping(value = "qltk")
		public String qltk() {
			return "admin/qltk";
			
		}
//		
//		@RequestMapping(value = "qltk")
//		public String qltk(HttpServletRequest request) {
//			String user = request.getParameter("uname");
//			if (selectUserRole(user)==1) {
//				return "admin/qltk";
//			} else {
//				return "admin/error";
//			}
//		}
	
	
	
					//QUẢN LÝ SẢN PHẨM
	
	// SUA SAN PHAM	
	int code = 0;

	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String update(ModelMap model, HttpServletRequest request) {
		code = Integer.parseInt(request.getParameter("idUpdate"));
		model.addAttribute("prods", selectProd(code));
		return "admin/update";
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(@ModelAttribute("prods") PRODUCT prod, @RequestParam(value = "image1") MultipartFile img1,
			ModelMap model, HttpServletRequest request, BindingResult errors) throws ServletException, IOException {
		Session s = factory.openSession();
		Transaction t = s.beginTransaction();
		String hql = "from PRODUCT";
		Query query = s.createQuery(hql);
		List<PRODUCT> list = query.list();
		
		for (PRODUCT p : list) {
			if (p.getId() == code) {
				try {
					saveImage(img1);
					prod.setImg_url(img1.getOriginalFilename());
					p.setImg_url(prod.getImg_url());
					p.setName_product(prod.getName_product());
					p.setPrice(prod.getPrice());
					p.setTotal(prod.getTotal());
					
					s.update(p);
					t.commit();
					model.addAttribute("message1", "Cập nhật thành công !!!");
					return "redirect:/admin/qlsp.htm";
				} catch (Exception e) {

					model.addAttribute("message1", "Không thể cập nhật !!!");
					return "redirect:/admin/qlsp.htm";
				} finally {
					s.close();
				}
			}
		}

		return "admin/qlsp";
	}

	
	// XOA SAN PHAM
	@RequestMapping("delete")
	public String del(ModelMap model, HttpServletRequest request, HttpServletResponse rsp)
			throws ServletException, IOException {

		Session s = factory.openSession();
		Transaction t = s.beginTransaction();
		int code = Integer.parseInt(request.getParameter("id"));
//		System.out.print(code);
		try {
			String hql = "from PRODUCT where id LIKE :id";
			Query query = s.createQuery(hql);
			query.setParameter("id", code);
			List<PRODUCT> list = query.list();
			
			for (PRODUCT prod : list) {
				prod.setProduct_state_id(0);
				s.update(prod);
				t.commit();
				model.addAttribute("message1", "Thành công ");
				rsp.addIntHeader("Refresh", 0);
			}
			return "redirect:/admin/qlsp.htm";
		} catch (Exception e) {

			model.addAttribute("message1", "Thất bại");
		} finally {
			s.close();
		}

		return "admin/qlsp";

	}
	
	// THEM SAN PHAM
	@RequestMapping(value = "qlsp", method = RequestMethod.GET)
	public String add(ModelMap model, HttpServletRequest request) {
		Session s = factory.openSession();
		Transaction t = s.beginTransaction();
		boolean check = true;
		String hql = "FROM PRODUCT";
		Query query = s.createQuery(hql);
		List<PRODUCT> listPro = query.list();
		model.addAttribute("list", listPro);
		model.addAttribute("p", new PRODUCT());
		return "admin/qlsp";

	}

	@RequestMapping(value = "qlsp", method = RequestMethod.POST)
	public String add(HttpServletResponse rsp, @ModelAttribute("p") PRODUCT prod,
			@RequestParam(value = "image1") MultipartFile img1, ModelMap model,
			BindingResult errors) {
		Session s = factory.openSession();
		Transaction t = s.beginTransaction();
		if(prod.getName_product().trim().length() == 0) {
			errors.rejectValue("name_product", "p", "Vui lòng nhập tên sản phẩm !!!");
		}
		if(prod.getTotal() <0) {
			errors.rejectValue("total", "p", "Vui lòng số lượng !!!");
		}
		if(prod.getPrice()<0) {
			errors.rejectValue("price", "p", "Vui lòng nhập giá !!!");
		}
		if(img1.isEmpty()) {
			errors.rejectValue("img_url", "p", "Vui lòng thêm hình ảnh !!!");
		}
		if(prod.getDescreption().trim().length() == 0) {
			errors.rejectValue("descreption", "p", "Vui lòng nhập mô tả !!!");
		}
		if(errors.hasErrors()) {
			model.addAttribute("message", false);
		}else {
			try {
				saveImage(img1);
				//prod.setDateCreate(new Date());
				prod.setImg_url(img1.getOriginalFilename());
				prod.setProduct_state_id(1);
				s.save(prod);
				t.commit();
				model.addAttribute("message", true);

			rsp.addIntHeader("Refresh", 0);
			}
			catch (Exception e) {
				// TODO: handle exception
				t.rollback();
				model.addAttribute("message", false);
			}
		}
		
		
		return "admin/qlsp";
	}

	// LUU ẢNH
	public void saveImage(MultipartFile image) {
		try {
			image.transferTo(new File(
					"C:\\Users\\MaiEm\\eclipse-workspace\\EATCLEAN\\WebContent\\img\\" + image.getOriginalFilename()));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// LAY DANH SACH SAN PHAM
	public PRODUCT selectProd(int code) {
		PRODUCT pro = null;
		Session session = factory.getCurrentSession();
		String hql = "from PRODUCT";
		Query query = session.createQuery(hql);
		List<PRODUCT> list = query.list();
		for (PRODUCT u : list) {
			if (u.getId() == code) {
				pro = u;
			}
		}
		return pro;
	}
	

				//QUẢN LÍ TÀI KHOẢN
	// XOA TAI KHOAN
		int codeAcc = 0;

		@RequestMapping(value = "/delete/{taikhoan}")
		public String delete(ModelMap model, @PathVariable("taikhoan") int taikhoan) {
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			try {
				ACCOUNT s = (ACCOUNT) session.get(ACCOUNT.class, taikhoan);
				s.setAccount_state_id(0);
				session.update(s);
				t.commit();
				model.addAttribute("message", "Xóa thành công");
			} catch (Exception e) {
				t.rollback();
				model.addAttribute("message", "Xóa thất bại");
			} finally {
				session.close();
			}
			return "redirect:/admin/qltk.htm";
		} 
		
	// DANH SACH TAI KHOAN
	@ModelAttribute("listAcc")
		public List<ACCOUNT> selectAcc() {
			ACCOUNT acc = null;
			Session session = factory.getCurrentSession();
			String hql = "from ACCOUNT";
			Query query = session.createQuery(hql);
			List<ACCOUNT> listAcc = query.list();

			return listAcc;
		}
	
	
	
			
	
	
	// QUAN LY DON HANG
	
	// DANH SACH DON HANG
//	@ModelAttribute("listOrd")
//	public String selectOrd() {
//		Session session = factory.getCurrentSession();
//		String hql = "from ORDER_DETAILS o where o.order_product_id=o";//bỏ cái id hóa đơn để bỏ vô tìm
//		Query query = session.createQuery(hql);
//		List<ORDER_DETAILS> listOrd = query.list();
//
//		return "admin/qldh";
//	}
//	
//	@RequestMapping(value="qldh", method = RequestMethod.GET)
//	public String manage(ModelMap model, HttpServletRequest request) {
//		Session session = factory.getCurrentSession();
//		String hql1 = "FROM ORDER_DETAIL";
//		Query query1 = session.createQuery(hql1);
//		List<ORDER_DETAILS> list1 = query1.list();
//		return "admin/qldh";
//	}
//	
//	@RequestMapping(value = "manage", method = RequestMethod.POST)
//	public String manage(ORDER_DETAILS od, ModelMap model, HttpServletRequest request) {
//		
//		Session s = factory.openSession();
//		Transaction t = s.beginTransaction();
//		
//		int id = Integer.parseInt(request.getParameter("id"));
//
//		boolean check = false;
//		
//		try {
//			od.setOrder_product_id(selectOrder_product_id());
//			String hql1 = "select u.email, p.name, p.price ,o.amount_o from USERS u, PRODUCTS p, ORDERS o where o.id like :id and p.code like o.products_orders.code and o.users_orders.id = u.id ";
//			Query query1 = s.createQuery(hql1);
//			query1.setParameter("id", id);
//			List<Object[]> list1 = query1.list();
//			String email = "";
//			String name = "";
//			float total1 = 1, price = 1;
//			int amount = 1;
//			for(Object[] ktra : list1) {
//				email = ktra[0].toString();
//				name = ktra[1].toString();
//				amount = Integer.parseInt(ktra[2].toString());
//				price = Float.parseFloat(ktra[3].toString());
//				total1 = amount * price;
//			}
//
//			String hql = "from ORDERS where id LIKE :id";
//			Query query = s.createQuery(hql);
//			query.setParameter("id", id);
//			List<ORDER_DETAILS> list = query.list();
//			for(ORDER_DETAILS ktra:list) {
//				if(ktra.getStatus().equals("CHÆ¯A XÃ�C NHáº¬N") && ktra.getDetail().equals == 1) {
//					if(sendMail(email, ktra.getId(), name, ktra.getAmount_o(), total1) == true) {
//						update(ktra.getProducts_orders().getCode(), ktra.getAmount_o());
//						od.setAmount(amount);
//						od.setPrice(price);
//						od.setTotal(total1);
//						s.save(od);
//						ktra.setStatus(Đã thành công");
//						s.update(ktra);
//						t.commit();
//					}
//					else {
//						model.addAttribute("message1", "Xác nhận không thành công !");
//					}
//				}
//				else {
//					model.addAttribute("message1", "Ä�Æ¡n hÃ ng Ä‘Ã£ Ä‘Æ°á»£c xÃ¡c nháº­n!");
//				}
//			}
//			return "redirect:/admin/qldh.htm";
//
//		} catch (Exception e) {
//	
//		} finally {
//			s.close();
//		}
//
//		
//		return "admin/qldh";
//	}

}