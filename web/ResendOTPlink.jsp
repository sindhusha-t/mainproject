<%@page import="javax.mail.MessagingException"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.io.*,java.lang.*,java.text.*;" %>


<!DOCTYPE html>
<%

//link to mail
    HttpSession sess = request.getSession(false); 
                Date dNow = new Date();
      SimpleDateFormat ft = new SimpleDateFormat ("ddMMyyyy");
    String date=ft.format(dNow);
    SimpleDateFormat ft1 = new SimpleDateFormat ("hhmmss");
    String time=ft1.format(dNow);
    String to=(String)sess.getAttribute("mail");
    sess.setAttribute("date",date);
    sess.setAttribute("time",time);
    

//Get the session object
  Properties props = new Properties();
  props.put("mail.smtp.host", "smtp.gmail.com");
  props.put("mail.smtp.socketFactory.port", "465");
  props.put("mail.smtp.socketFactory.class",
        	"javax.net.ssl.SSLSocketFactory");
  props.put("mail.smtp.auth", "true");
  props.put("mail.smtp.port", "465");
 
  Session session1 = Session.getDefaultInstance(props,
   new javax.mail.Authenticator() {
   protected PasswordAuthentication getPasswordAuthentication() {
   return new PasswordAuthentication("sindhusha9289@gmail.com","Sindhusha@517");//change accordingly
   }
  });
 
//compose message
  try {
   MimeMessage message = new MimeMessage(session1);
   message.setFrom(new InternetAddress("sindhusha9289@gmail.com"));//change accordingly
   message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
   message.setSubject("OTP Link");
   message.setText("http://localhost:8084/app1/OTPpage.jsp");
   
   //send message
   Transport.send(message);

   System.out.println("message sent successfully");
 
  } catch (MessagingException e) {throw new RuntimeException(e);}
 

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Payment</title>
    </head>
    <body bgcolor="lightsteelblue">
        <form action="FinalPayment.jsp" method="POST">
            <table style="position:absolute;top:200px;left:500px;border:0">
        <p style="position:absolute;top:120px;left:550px;font-size:25px;color:brown;text-decoration:underline">ONLINE PAYMENT</p>
       <tr><td>Dear   <%=sess.getAttribute("name")%>,</td><td></td></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
       <tr><td>OTP link is resent to the mail   <%=sess.getAttribute("mail")%></td><td></td></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
    <tr><td>Enter OTP: </td><td><input type="number" name="OTP"/></td></tr><br><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
    </table><span style="position:absolute;top:400px;left:300px;border:0">  <input type="submit" value="submit"/></span>
    <span style="position:absolute;top:400px;left:570px;border:0"><input type="button" value="Resend Mail" onclick="location.href='ResendOTPlink.jsp';"/> </span>
    <span style="position:absolute;top:400px;left:700px;border:0"><input type="button" value="cancel" onclick="location.href='main.jsp';"/></span>
    
           
        </form>
        
        </body>
</html>
