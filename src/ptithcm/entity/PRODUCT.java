package ptithcm.entity;

import java.util.Collection;

import javax.persistence.*;

@Entity
public class PRODUCT {
	@Id
	@GeneratedValue
	private int id;
	private String name_product;
	private String img_url;
	private String descreption;
	private int price;
	private int total;
	private int product_state_id;

	@OneToMany(mappedBy = "product_id", fetch = FetchType.EAGER)
	private Collection<ORDER_DETAILS> ord;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName_product() {
		return name_product;
	}

	public void setName_product(String name_product) {
		this.name_product = name_product;
	}

	public String getImg_url() {
		return img_url;
	}

	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}

	public String getDescreption() {
		return descreption;
	}

	public void setDescreption(String descreption) {
		this.descreption = descreption;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getProduct_state_id() {
		return product_state_id;
	}

	public void setProduct_state_id(int product_state_id) {
		this.product_state_id = product_state_id;
	}

	public Collection<ORDER_DETAILS> getOrd() {
		return ord;
	}

	public void setOrd(Collection<ORDER_DETAILS> ord) {
		this.ord = ord;
	}

	public PRODUCT() {
		super();
	}

	public PRODUCT(int id, String name_product, String img_url, String descreption, int price, int total,
			int product_state_id, Collection<ORDER_DETAILS> ord) {
		super();
		this.id = id;
		this.name_product = name_product;
		this.img_url = img_url;
		this.descreption = descreption;
		this.price = price;
		this.total = total;
		this.product_state_id = product_state_id;
		this.ord = ord;
	}

}
