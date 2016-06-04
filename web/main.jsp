<%-- 
    Document   : main
    Created on : 14 Apr, 2016, 3:01:09 PM
    Author     : Sindhusha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.io.*,java.lang.*,java.text.*;" %>

<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Payment</title>
    
    </head>
    <body bgcolor="lightsteelblue">
       
<form action="encryption.jsp" method="post" name="f11">
    <table name="t1" style="position:absolute;top:200px;left:500px;border:0">
        <p style="position:absolute;top:120px;left:550px;font-size:25px;color:brown;text-decoration:underline">ENTER CARD DETAILS</p>
       <tr><td>16-digit Card number:</td><td><input type="text" id="cno" name="cno" ></td></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
               <tr><td>Expiry Date:</td><td>
           <select name="a41" id="Expiry_Date">
 <option value="01">1</option>
 <option value="02">2</option>
 <option value="03">3</option>
  
 <option value="04">4</option>
 <option value="05">5</option>
 <option value="06">6</option>
 <option value="07">7</option>
 <option value="08">8</option>
 <option value="09">9</option>
 <option value="10">10</option>
 <option value="11">11</option>
 <option value="12">12</option>
  
 <option value="13">13</option>
 <option value="14">14</option>
 <option value="15">15</option>
 <option value="16">16</option>
 <option value="17">17</option>
 <option value="18">18</option>
 <option value="19">19</option>
 <option value="20">20</option>
 <option value="21">21</option>
  
 <option value="22">22</option>
 <option value="23">23</option>
 <option value="24">24</option>
 <option value="25">25</option>
<option value="26">26</option>
 <option value="27">27</option>
 <option value="28">28</option>
 <option value="29">29</option>
 <option value="30">30</option>
  
 <option value="31">31</option>
 </select>
  
 <select name="a42" id="Birthday_month">
 <option value="01">Jan</option>
 <option value="02">Feb</option>
 <option value="03">Mar</option>
 <option value="04">Apr</option>
 <option value="05">May</option>
 <option value="06">Jun</option>
 <option value="07">Jul</option>
 <option value="08">Aug</option>
 <option value="09">Sep</option>
 <option value="10">Oct</option>
 <option value="11">Nov</option>
 <option value="12">Dec</option>
 </select>
  
 <select name="a43" id="Birthday_Year">
 <option value="2016">2016</option>
 <option value="2017">2017</option>
 <option value="2018">2018</option>
 <option value="2019">2019</option>
 <option value="2020">2020</option>
 <option value="2021">2021</option>
 <option value="2022">2022</option>
 <option value="2023">2023</option>
 <option value="2024">2024</option>
 <option value="2025">2025</option>
 <option value="2026">2026</option>
 <option value="2027">2027</option>
 <option value="2028">2028</option>
  
 <option value="2029">2029</option>
 <option value="2030">2030</option>
 <option value="2031">2031</option>
 <option value="2032">2032</option>
 <option value="2033">2033</option>
 <option value="2034">2034</option>
 <option value="2035">2035</option>
 <option value="2036">2036</option>
 <option value="2037">2037</option>
 <option value="2038">2038</option>
  
 <option value="2039">2039</option>
 <option value="2040">2040</option>
 <option value="2041">2041</option>
 <option value="2042">2042</option>
 <option value="2043">2043</option>
 <option value="2044">2044</option>
 <option value="2045">2045</option>
 <option value="2046">2046</option>
 <option value="2047">2047</option>
 <option value="2048">2048</option>
 </select>
                       
           </td></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
    <tr><td>Card Holder Name:</td><td><input type="text" name="cname"></td></tr><br><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
    <tr><td>CVV :</td><td><input type="text" name="cvv"></td></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
   <tr><td> <input type="submit" value="submit" ></td>
       <td><input type="button" value="cancel" /></td></tr>
    </table>
  </form>
       
    </body>
</html>
