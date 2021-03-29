package ptithcm.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class CART {
	@Id
	private int accout_id;
	private int product_id;
	private int amount_of;
	private int total_price;

	public int getAccout_id() {
		return accout_id;
	}

	public void setAccout_id(int accout_id) {
		this.accout_id = accout_id;
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

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}

}
