<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String email=request.getParameter("email");
session.putValue("email",email);
String password=request.getParameter("password");

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myform","root","root123");
// out.println("Connection established......");
Statement st= con.createStatement();
ResultSet rs=st.executeQuery("select * from user where email ='"+email+"'");
if(rs.next())
{
    if(rs.getString(4).equals(password))
    {
        out.println("welcome"+email);
        response.sendRedirect("save.html");
    }
else
    {
        out.println("Invalid password try again");
    }
}
else
    {
        response.sendRedirect("index.html");
    }
%>