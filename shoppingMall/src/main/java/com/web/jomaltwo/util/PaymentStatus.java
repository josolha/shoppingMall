package com.web.jomaltwo.util;

public enum PaymentStatus {
	  PAID("결제 완료"),
	  PENDING("결제 대기"),
	  CANCELLED("결제 취소");

	  private final String status;

	  PaymentStatus(String status) {
	    this.status = status;
	  }

	  public String getStatus() {
	    return status;
	  }
	}
