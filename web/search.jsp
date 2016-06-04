

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.io.*,java.lang.*,java.util.regex.Pattern" %>
<%@ page import="com.kk.dic.action.Ftpcon" %>
<%@ page import="dec.Decryption" %>

<!DOCTYPE html>
<%
    HttpSession sess = request.getSession(false); 
    String s;
    String s1[]=new String[21];
    int nr=0;
    String jspPath = session.getServletContext().getRealPath("");
    String txtFilePath = jspPath+ "/Usersdata.txt";
    File f1=new File(txtFilePath);
    Ftpcon f=new Ftpcon();          
    boolean status=f.download(f1,"Usersdata.txt");
    BufferedReader br=new BufferedReader(new FileReader(txtFilePath));
    s=(String)sess.getAttribute("ecardno");
    char c[]=s.toCharArray();
    while((s=br.readLine())!=null)
    {
	s1=s.split(" ");nr++;
        char comparec[]=s1[0].toCharArray();
        for(int i=0;i<2;i++)
        {
            for(int j=33;j<70;j++)
            {
		for(int x=0;x<36;x++)
		{
                    for(int y=x+1;y<37;y++)
                    {
			if(c[33+x]>=c[33+y])
			{
                            char t= c[33+x];
                            c[33+x]=c[33+y];
                            c[33+y]=t;
			}
			if(comparec[33+x]>=comparec[33+y])
			{
                            char t= comparec[33+x];
                            comparec[33+x]=comparec[33+y];
                            comparec[33+y]=t;
			}
                    }
		}
            }
        }
	int k=0;
        for(int i=33;i<70;i++)
        {
            if(c[i]!=comparec[i])
            {
		k++;break;
            }
        }
        if(k==0)
        {
             if(((String)sess.getAttribute("cvv")).equals(s1[2])){}
             else
             {
                 out.println("<h2 align=\"center\">invalid cvv</h2>");
                 out.println(
              "<p>You have entered wrong card details,Enter correct details " +
              "Redirecting in 3 seconds...</p>");
		%><meta http-equiv="refresh" content="3;url=main.jsp"/><%
               break;
             }
             if(((String)sess.getAttribute("name")).equals(s1[3])){}
             else
             {
                 out.println("<h2 align=\"center\">invalid card holder name</h2>");
                 out.println(
              "<p>You have entered wrong card details,Enter correct details " +
              "Redirecting in 3 seconds...</p>");
		%><meta http-equiv="refresh" content="3;url=main.jsp"/><%
               break;
             }
             String exd=new String();
             String s2[]=s1[1].split("-");
             for(int j=0;j<s2.length;j++)
             {
                   exd+=s2[j];
             }
               
               if(((String)sess.getAttribute("expiry_date")).equals(exd)){}
               else{out.println("<h2 align=\"center\">invalid expiry_date</h2>");
                 out.println(
              "<p>You have entered wrong card details,Enter correct details " +
              "Redirecting in 3 seconds...</p>");
		%><meta http-equiv="refresh" content="3;url=main.jsp"/><%
               break;}
                sess.setAttribute("phonenumber", s1[4]);
        
                sess.setAttribute("mail", s1[5]);
                
                
         
                %>
                <%
                String ecardno=(String)sess.getAttribute("ecardno");
                String cardno=new Decryption().decrypt(ecardno);
                %>
                
                <form action="OTPlink.jsp" method="POST">
                    <table style="position:absolute;top:200px;left:500px;border:0">
        <p style="position:absolute;top:120px;left:550px;font-size:25px;color:brown;text-decoration:underline">ONLINE PAYMENT</p>
       <tr><td>Dear   <%=s1[3]%>,</td><td></td></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
       <tr><td>Your Card Number is  <%=cardno%>,</td><td></td></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
    <tr><td>Your Phone Number is   <%=s1[4]%>,</td><td></td></tr><br><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
    <tr><td>Your mail id   <%=s1[5]%></td><td></td></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
    </table><span style="position:absolute;top:400px;left:500px;border:0"> <input type="submit" value="Confirm Payment"/></span>
    <span style="position:absolute;top:400px;left:700px;border:0"><input type="button" value="cancel" onclick="location.href='main.jsp';"/></span>
    
                   
                    
                  
                </form>
                
                <%   
                break;
                }	
            }
                if(s==null){out.println("<p>invalid card</p>");
                 out.println(
              "<p>You have entered wrong card details,Enter correct details " +
              "Redirecting in 3 seconds...</p>");
		%><meta http-equiv="refresh" content="3;url=main.jsp"/><%
                
            }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Payment</title>
    </head>
    <body bgcolor="lightsteelblue">        
    </body>
</html>
