package ptithcm.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class ORDER_STATE {
	@Id
	private int id;
	private String name_order_state;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName_order_state() {
		return name_order_state;
	}

	public void setName_order_state(String name_order_state) {
		this.name_order_state = name_order_state;
	}

}
