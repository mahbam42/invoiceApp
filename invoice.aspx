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
        <asp:Panel ID="pnlUpdate" GroupingText="Add New Entry" runat="server">
            <table>
                <tr>
                    <td>
                        Client Name:<br />
                        <asp:TextBox ID="txtClient" runat="server"></asp:TextBox></td>
                    <td>
                        Date:<br />
                        <asp:TextBox ID="txtDate" Width="5em" MaxLength="10" runat="server"></asp:TextBox></td>
                    <td>
                        Gig/Event Name:<br />
                        <asp:TextBox ID="txtDesc" runat="server"></asp:TextBox></td>
                    <td>
                        Budget Code:<br />
                        <asp:DropDownList ID="ddlBudgetCode" runat="server">
                        </asp:DropDownList></td>
                    <td>
                        Hours:<br />
                        <asp:TextBox ID="txtHours" Width="2em" MaxLength="4" runat="server"></asp:TextBox></td>
                    <td>
                        Discount:<br />
                        <asp:TextBox ID="txtDiscount" Width="2em" MaxLength="4" runat="server"></asp:TextBox>%</td>
                    <td>
                        Status:<br />
                        <asp:DropDownList ID="ddlStatus" runat="server">
                        </asp:DropDownList></td>
                    <td>
                        Details:<br />
                        <asp:TextBox ID="txtDetails" runat="server"></asp:TextBox></td>
                    <td>
                        Client Contact:<br />
                        <asp:TextBox ID="txtContact" runat="server"></asp:TextBox></td>
                    <td style="vertical-align: bottom;">
                        <asp:Button ID="btnAdd" runat="server" Text="Add" /></td>
                </tr>
            </table>
        </asp:Panel>

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
                <asp:BoundField DataField="total" SortExpression="total" HeaderText="Total" />
                <asp:BoundField DataField="status" SortExpression="status" HeaderText="Status" />
                <asp:BoundField DataField="paymentrec" SortExpression="paymentrec" HeaderText="Payment Received" />
                <asp:BoundField DataField="details" SortExpression="details" HeaderText="Details" />
                <asp:BoundField DataField="contact" SortExpression="contact" HeaderText="Contact Address" />
            </Columns>
        </asp:gridview>
    </div>
    <div>
        <asp:GridView ID="GridView2" AllowSorting="true" runat="server">
        </asp:GridView>
    </div>
    </form>
</body>
</html>

