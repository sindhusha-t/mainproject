
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.io.*,java.lang.*,java.util.regex.Pattern" %>
<!DOCTYPE html>
<html>
    <head>
<%
    String cipher1=null;//to store the final cipher text value
    // variables of the users details
    String cno = request.getParameter("cno");
    String day = request.getParameter("a41");
    String month = request.getParameter("a42");
    String year = request.getParameter("a43");
    String cvv = request.getParameter("cvv");
    String cname = request.getParameter("cname");
    String exd=day+month+year;
    //returns to previous page if insufficient data is provided
      if (cno == "" || cname == ""  || cvv == "") 
      {
           response.sendRedirect("main1.jsp");
      } 
      else if (cno == null || cname == null  || cvv == null) 
      {
            response.sendRedirect("main1.jsp");
      }
      //returns to main page if invalid patterns are used as input
         else if(!Pattern.matches("[0-9]{16}",cno))
         {
             out.print("<h2 align=\"center\">card number should be a 16-digit number</h2>");
            out.print("<p>Redirecting in 3 seconds</p>");
            %><meta http-equiv="refresh" content="3;url=main.jsp"/><%
        }
         else if(!Pattern.matches("[A-Za-z0-9 ]{3,40}",cname))
         {
             out.print("<h2 align=\"center\">name is not valid</h2>");
            out.print("<p>Redirecting in 3 seconds</p>");
                %><meta http-equiv="refresh" content="3;url=main.jsp"/><%
         }
         else if(!Pattern.matches("[0-9]{3}",cvv))
         {
             out.print("<h2 align=\"center\">cvv number should be a 3-digit number</h2>");
            out.print("<p>Redirecting in 3 seconds</p>");
            %><meta http-equiv="refresh" content="3;url=main.jsp"/><%
         }
         // main encryption process goes here in else part
         else 
         {
		int card[]=new int[37];
		int card1[]=new int[37];
                char hex[]={'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};
                char c1[]=new char[37];
		char c3[]=cno.toCharArray();
		for(int i=0;i<16;i++){card[i]=(int)c3[i]-48;}
		int cnt=0,j=16;
		while(cnt<=20)
		{
			for(int k=0;k<j;k++)
			{
				if(k!=j-1)
				{
                                    card1[k]=card[k]^card[k+1];
				}
				else
				{
                                    card1[k]=card[0]^card[k];
				}
			}
                        card1[j]=card[0];
			j++;cnt++;
			for(int k=0;k<j;k++)
			{
                            card[k]=card1[k];
                        }
		}
		Random r=new Random();
		int a=2;
		for(int k=0;k<37;k++)
		{
			c1[k]=hex[card[k]];
		}
                char c2[]=new char[37];
		for(int k=0;k<36;k++)
		{
			int x= (int)(((Math.pow(a,k)))%37);
			c2[x]=c1[k];
		}
                c2[0]=c1[36];
		for(int k=0;k<37;k++){c1[k]=c2[k];}
                char cipher[]=new char[100];
		for(int k=0;k<100;k++)
		{
			cipher[k]=hex[r.nextInt(15)]; 
		}
		cipher[17]='2';
		for(int k=33;k<70;k++)
		{
                        cipher[k]=c1[k-33];
		}
                cipher1=new String(cipher);
                HttpSession sess = request.getSession(false); 
                sess.setAttribute("ecardno",cipher1);
                //sess.setAttribute("cardno", cno);
                sess.setAttribute("expiry_date", exd);
                sess.setAttribute("cvv", cvv);
                sess.setAttribute("name", cname);
                response.sendRedirect("search.jsp");
                               
         }
       
 %>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Payment</title>
    </head>
    <body>
        
    </body>
</html>
