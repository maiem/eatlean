package ptithcm.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class PRODUCT_STATE {
	@Id
	private int id;
	
	private String name_state;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName_state() {
		return name_state;
	}

	public void setName_state(String name_state) {
		this.name_state = name_state;
	}

	
}
