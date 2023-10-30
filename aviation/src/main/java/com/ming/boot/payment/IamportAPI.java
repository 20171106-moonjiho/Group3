package com.ming.boot.payment;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class IamportAPI {
	@Value("${iamport_api}")
	private String IAMPORT_API;

	@Value("${iamport_api_secret}")
	private String IAMPORT_API_SECRET;

	public String getApi() {
		return IAMPORT_API;
	}

	public String getApiSecret() {
		return IAMPORT_API_SECRET;
	}
	
}
