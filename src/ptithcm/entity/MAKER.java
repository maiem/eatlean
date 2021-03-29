package ptithcm.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class MAKER {
	@Id
	private int id;
	private String name_maker;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName_maker() {
		return name_maker;
	}

	public void setName_maker(String name_maker) {
		this.name_maker = name_maker;
	}

}
