package cn.edu.neu.core.util;

import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;

import cn.edu.neu.model.MailBean;

@Service("email")
public class Email {

	
	private MailSender mailSender;

	private SimpleMailMessage simpleMailMessage;

	public void sendMail(MailBean bean) {

		System.out.println(bean.toString());
		// simpleMailMessage = new SimpleMailMessage();

		simpleMailMessage.setSubject(bean.getTitle()); // 设置邮件主题
		simpleMailMessage.setTo(bean.getTol()); // 设定收件人
		simpleMailMessage.setText(bean.getContext()); // 设置邮件主题内容
		mailSender.send(simpleMailMessage); // 发送邮件
	}

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
