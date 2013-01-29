<%@ Page Language="VB" AutoEventWireup="false" CodeFile="invoice.aspx.vb" Inherits="invoice" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>Max Brother Invoices</h1>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label><br />
        <asp:gridview ID="Gridview1" AllowSorting="true" EditIndex="1"  runat="server"></asp:gridview>
    </div>
    </form>
</body>
</html>

