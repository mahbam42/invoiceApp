<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Moshe_invoice.aspx.vb" Inherits="invoice" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Invoice App</title>
    <link rel="Stylesheet" href="style/960.css" />
    <link rel="Stylesheet" href="style/main.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container_12">
        <h1>Max Brother Invoices</h1>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label><br />
        <asp:Panel ID="pnlUpdate" CssClass="grid_10" GroupingText="Add New Entry" runat="server">
            <table id="update">
                <tr>
                    <td>
                        Client Name:<br />
                        <asp:TextBox ID="txtClient" runat="server"></asp:TextBox></td>
                    
                    <td>
                        Gig/Event Name:<br />
                        <asp:TextBox ID="txtDesc" runat="server"></asp:TextBox></td>
                    <td colspan="2">
                        Details:<br />
                        <asp:TextBox ID="txtDetails" runat="server"></asp:TextBox></td>
                    <td>
                        Client Contact:<br />
                        <asp:TextBox ID="txtContact" TextMode="Email" runat="server"></asp:TextBox></td>
                    <td rowspan="2"><!-- Buttons -->
                        <asp:Button ID="btnAdd" runat="server" CssClass="add" Text="Add" /> 
                        <asp:Button ID="btnClear" runat="server" CssClass="btnClear" Text="Clear" /><br />
                        <asp:Button ID="btnSend" runat="server" Text="Invoice" /></td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtDate" TextMode="Date" runat="server"></asp:TextBox></td>
                    <td>
                        Budget Code:
                        <asp:DropDownList ID="ddlBudgetCode" runat="server">
                        </asp:DropDownList></td>
                    <td>
                        Hours:
                        <asp:TextBox ID="txtHours" Width="2em" MaxLength="4" runat="server"></asp:TextBox></td>
                    <td>
                        Discount:
                        <asp:TextBox ID="txtDiscount" Width="2em" MaxLength="4" runat="server"></asp:TextBox>%</td>
                    <td>
                        Status:
                        <asp:DropDownList ID="ddlStatus" runat="server">
                        </asp:DropDownList></td>
                </tr>
            </table>
        </asp:Panel>
        <div class="grid_2 omega">
            <asp:GridView ID="GridView2" AllowSorting="true" runat="server">
            </asp:GridView>
        </div>

        <asp:gridview ID="Gridview1" CssClass="grid_12" AllowSorting="True"  runat="server" 
            AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" 
            BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" 
            GridLines="None">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="client" SortExpression="client" HeaderText="Client Name" />
                <asp:BoundField DataField="date" SortExpression="date" HeaderText="Date" />
                <asp:BoundField DataField="desc" SortExpression="desc" HeaderText="Description" />
                <asp:BoundField DataField="ordernumber" SortExpression="ordernumber" HeaderText="Invoice #" />
                <asp:BoundField DataField="hours" SortExpression="hours" HeaderText="Hours"  />
                <asp:BoundField DataField="discount" SortExpression="discount" HeaderText="Discount" />
                <asp:BoundField DataField="total" SortExpression="total" HeaderText="Total" DataFormatString="{0:c}" />
                <asp:BoundField DataField="status" SortExpression="status" HeaderText="Status" />
                <asp:BoundField DataField="paymentrec" SortExpression="paymentrec" HeaderText="Payment Received" />
                <asp:BoundField DataField="details" SortExpression="details" HeaderText="Details" />
                <asp:BoundField DataField="contact" SortExpression="contact" HeaderText="Contact Address" />
            </Columns>
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <SortedAscendingCellStyle BackColor="#FAFAE7" />
            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
            <SortedDescendingCellStyle BackColor="#E1DB9C" />
            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
        </asp:gridview>
    </div>
    
    </form>
</body>
</html>

