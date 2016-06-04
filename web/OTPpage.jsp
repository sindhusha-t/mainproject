<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.io.*,java.lang.*" %>
<%@ page import="dec.Decryption" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Payment</title>
    </head>
    <body bgcolor="lightsteelblue">
        <table style="position:absolute;top:200px;left:500px;border:0">
        <p style="position:absolute;top:120px;left:550px;font-size:25px;color:brown;text-decoration:underline">ONLINE PAYMENT</p>
        <%
        HttpSession sess = request.getSession(false); 
            String ecardno,ed1,ph1,cvv1,date1,time1,pht1;
            ecardno=(String)sess.getAttribute("ecardno");
		ed1=(String)sess.getAttribute("expiry_date");
		ph1=(String)sess.getAttribute("phonenumber");
		cvv1=(String)sess.getAttribute("cvv");
		date1=(String)sess.getAttribute("date");
		time1=(String)sess.getAttribute("time");
                 String cno1=new Decryption().decrypt(ecardno);
		pht1=ph1+time1;
		char cno2[]=cno1.toCharArray();
		char pht2[]=pht1.toCharArray();
		char ed2[]=ed1.toCharArray();
		char date2[]=date1.toCharArray();
		char cvv2[]=cvv1.toCharArray();
		int cno[]=new int[cno2.length];
		int pht[]=new int[pht2.length];
		int ed[]=new int[ed2.length];
		int date[]=new int[date2.length];
		int cvv[]=new int[cvv2.length];
		
		for(int i=0;i<cno2.length;i++)
		{
			cno[i]=((int)cno2[i])-48;
			//System.out.print(cno[i]+" ");
		}
		for(int i=0;i<pht2.length;i++)
		{
			pht[i]=((int)pht2[i])-48;
			//System.out.print(pht[i]+" ");
		}
		for(int i=0;i<ed2.length;i++)
		{
			ed[i]=((int)ed2[i])-48;
			//System.out.print(ed[i]+" ");
		}
		for(int i=0;i<date2.length;i++)
		{
			date[i]=((int)date2[i])-48;
			//System.out.print(date[i]+" ");
		}
		for(int i=0;i<cvv2.length;i++)
		{
			cvv[i]=((int)cvv2[i])-48;
			//System.out.print(cvv[i]+" ");
		}
		Random r=new Random();
                out.print("<tr><td>The Generated OTP value is:</td><td></td></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>");
		out.print("<tr><td>");
                int otp[]=new int[4];
		for(int i=0;i<4;i++)
		{
			otp[i]=cno[i]^cno[4+i]^cno[8+i]^cno[12+i]^pht[i]^pht[4+i]^pht[8+i]^pht[12+i]^ed[i]^ed[4+i]^date[i]^date[4+i];
			if(i!=3){otp[i]=otp[i]^cvv[i];}
			//System.out.print(otp[i]+" ");
			int x=otp[i],sum=0;
                        
		while(x!=0)
		{
			sum+=x%10;
			x=x/10;
		}
                      otp[i]=sum;  
                      
			out.print(otp[i]);
		}
        out.print("</td><td></td></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>");
                %>
       
        </table>
    </body>
</html>
