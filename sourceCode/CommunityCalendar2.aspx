<%@ Page Language="VB" MasterPageFile="~/OurUniversity.master" AutoEventWireup="false" CodeFile="CommunityCalendar2.aspx.vb" Inherits="CommunityCalendar2" title="Community Calendar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h2>Community Calendar 2011 - 2012</h2>
<a href="#" onclick="$(&quot;.toggle_container&quot;).hide();">Hide Events Details</a>&nbsp; &nbsp;&nbsp;<a href="#" onclick="$(&quot;.toggle_container&quot;).show();">Show All Events Details</a>
<%=GetEvents()%>
</asp:Content>

