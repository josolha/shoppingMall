package com.web.jomaltwo.util;

public enum ProdSpec {
	HIT("HIT"),NEW("NEW"),RECOMMAND("RECOMMAND");
	
	private final String value;
	
	private ProdSpec(String value) {
		this.value = value;
	}
	public String getValue() {
		return value;
	}

}
