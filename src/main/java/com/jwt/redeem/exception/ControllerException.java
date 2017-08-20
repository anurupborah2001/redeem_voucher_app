package com.jwt.redeem.exception;

import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;

@Component
@ResponseStatus(value=HttpStatus.NOT_FOUND, reason="Record not Founds")
public class ControllerException extends BaseException{
	/**
	 * 
	 */
	private static final long serialVersionUID = -4268474491087257478L;

	public ControllerException(int id){
		super("Record Not Found with id="+id);
	}
}
