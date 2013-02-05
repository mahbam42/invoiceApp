<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Moshe_invoice.aspx.vb" Inherits="invoice" %>

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
        <asp:gridview ID="Gridview1" AllowSorting="True"  runat="server" 
            AutoGenerateColumns="False">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="client" SortExpression="client" HeaderText="Client Name" />
                <asp:BoundField DataField="date" SortExpression="date" HeaderText="Date" />
                <asp:BoundField DataField="desc" SortExpression="desc" HeaderText="Description" />
                <asp:BoundField DataField="ordernumber" SortExpression="ordernumber" HeaderText="Invoice #" />
                <asp:BoundField DataField="hours" SortExpression="hours" HeaderText="Hours" />
                <asp:BoundField DataField="discount" SortExpression="discount" HeaderText="Discount" />
                <asp:BoundField DataField="details" SortExpression="details" HeaderText="Details" />
                <asp:BoundField DataField="contact" SortExpression="contact" HeaderText="Contact Address" />
            </Columns>
        </asp:gridview>
    </div>
    <div>
        <asp:GridView ID="GridView2" AllowSorting="true" runat="server">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:TemplateField SortExpression="Clients" HeaderText="Clients" />
            </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>

