<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.lang.*" %>
<%String familiaSel = "";
  familiaSel = request.getParameter("familiaSel");
  String subfamiliaSel = "";
  subfamiliaSel = request.getParameter("subfamiliaSel");
%>	
  <%=familiaSel%><%=subfamiliaSel%><input type=text name=codigo value = '' size = 4 maxlength =5> 
  <%--=familiaSel.substring(0,3)--%><%--=subfamiliaSel.substring(0,3)--%><!--input type=text name=codigo value = '' size = 4 maxlength =5--> 
<input type="hidden" name="familiasel" value="<%=familiaSel%>"/>
<input type="hidden" name="subfamiliasel" value="<%=subfamiliaSel%>"/>
<!--input type="hidden" name="familiasel" value="<%--=familiaSel.substring(0,3)--%>"/-->
<!--input type="hidden" name="subfamiliasel" value="<%--=subfamiliaSel.substring(0,3)--%>"/-->
