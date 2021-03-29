package ptithcm.entity;

import javax.persistence.Entity;
import javax.persistence.*;

@Entity
//@IdClass(ORDER_DETAIL_ID.class)
public class ORDER_DETAILS {
	@Id
	private int order_product_id;
	
//	@ManyToOne
//	@JoinColumn(name= "product_id")
//	private PRODUCT product_id;
	
	private int product_id;
	private int amount_of;
	private double unit_price;
	
	
	public int getOrder_product_id() {
		return order_product_id;
	}

	public void setOrder_product_id(int order_product_id) {
		this.order_product_id = order_product_id;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public int getAmount_of() {
		return amount_of;
	}

	public void setAmount_of(int amount_of) {
		this.amount_of = amount_of;
	}

	public double getUnit_price() {
		return unit_price;
	}

	public void setUnit_price(double unit_price) {
		this.unit_price = unit_price;
	}

	public ORDER_DETAILS() {
		super();
	}

	public ORDER_DETAILS(int order_product_id, int product_id, int amount_of, double unit_price) {
		super();
		this.order_product_id = order_product_id;
		this.product_id = product_id;
		this.amount_of = amount_of;
		this.unit_price = unit_price;
	}

	
}

