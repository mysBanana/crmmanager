package com.crm.util;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class Result {
	private boolean success;
	private Object message;
	private String remark;
	public Result() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Result(boolean success) {
		this.success = success;
	}
	public Result(boolean success, Object message) {
		super();
		this.success = success;
		this.message = message;
	}
	public Result(boolean success, Object message, String remark) {
		super();
		this.success = success;
		this.message = message;
		this.remark = remark;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public Object getMessage() {
		return message;
	}

	public void setMessage(Object message) {
		this.message = message;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String toJson() throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		String jsonString = mapper.writeValueAsString(this);
		return jsonString;
	}
}
