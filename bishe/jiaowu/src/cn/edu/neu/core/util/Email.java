package cn.edu.neu.core.util;

import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;

public class Email {

	private MailSender mailSender;
	private SimpleMailMessage simpleMailMessage;

	
//	SimpleMailMessage mail = new SimpleMailMessage();
//    mail.setFrom(from);
//    mail.setTo(to);
//    mail.setSubject("这是测试邮件，请勿回复！");
//    mail.setSentDate(new Date());// 邮件发送时间
//    mail.setText("这是一封测试邮件。如果您已收到此邮件，说明您的邮件服务器已设置成功。请勿回复，请勿回复，请勿回复，重要的事说三遍！");
//    JavaMailSenderImpl sender = createMailSender(host,port,username,password,25000);
//    sender.send(mail);
    
	public MailSender getMailSender() {
		return mailSender;
	}

	public void setMailSender(MailSender mailSender) {
		this.mailSender = mailSender;
	}

	public SimpleMailMessage getSimpleMailMessage() {
		return simpleMailMessage;
	}

	public void setSimpleMailMessage(SimpleMailMessage simpleMailMessage) {
		this.simpleMailMessage = simpleMailMessage;
	}

}
