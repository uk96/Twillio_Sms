package com.Twilio;
import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

public class SendSms {
	
	public static final String ACCOUNT_SID = "";
	public static final String AUTH_TOKEN = "";
	public void sms(String number,String name,boolean license,boolean insurance)
	{
		Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
		String mess="Dear "+name+" as you have violated traffic rule,the fine of RS500 have to be paid within 10-15 days to nearest RTO Office. ";
		if(!license)
			mess+="And your license is expired. ";
		if(!insurance)
			mess+="Your Insurance as also expired.";
		System.out.println(mess);
		Message message = Message.creator(new PhoneNumber(number),new PhoneNumber("+14159037744"),mess).create();
		System.out.println(message.getSid());
	}
}
