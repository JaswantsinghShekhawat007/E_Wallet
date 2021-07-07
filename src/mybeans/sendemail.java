package mybeans;

import com.email.durgesh.Email;

public class sendemail 
{
	public sendemail(String Topic,String subject,String content,String recpient)
	{
		try
		{
		Email email = new Email("","");
		email.setFrom("bankingcrown6@gmail.com", Topic);
		email.setSubject(subject);
		email.setContent(content, "text/html");
		email.addRecipient(recpient);
		email.send();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

}
