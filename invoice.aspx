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
                        <asp:TextBox ID="txtClient" TabIndex="10" runat="server"></asp:TextBox></td>
                    
                    <td>
                        Gig/Event Name:<br />
                        <asp:TextBox ID="txtDesc" TabIndex="20" runat="server"></asp:TextBox></td>
                    <td colspan="2">
                        Details:<br />
                        <asp:TextBox ID="txtDetails" TabIndex="30" runat="server"></asp:TextBox></td>
                    <td>
                        Client Contact:<br />
                        <asp:TextBox ID="txtContact" TabIndex="40" TextMode="Email" runat="server"></asp:TextBox></td>
                    <td rowspan="2"><!-- Buttons -->
                        <asp:Button ID="btnAdd" TabIndex="100" runat="server" CssClass="add" Text="Add" /> 
                        <asp:Button ID="btnClear" runat="server" CssClass="btnClear" Text="Clear" /><br />
                        <asp:Button ID="btnSend" runat="server" Text="Invoice" /></td>
                </tr>
                <tr>
                    <td>
                        Date:<br />
                        <asp:TextBox ID="txtDate" TabIndex="50" TextMode="Date" runat="server"></asp:TextBox></td>
                    <td>
                        Budget Code:<br />
                        <asp:DropDownList ID="ddlBudgetCode" TabIndex="60" runat="server">
                        </asp:DropDownList></td>
                    <td>
                        Hours:<br />
                        <asp:TextBox ID="txtHours" Width="2em" TabIndex="70" MaxLength="4" runat="server"></asp:TextBox></td>
                    <td>
                        Discount:<br />
                        <asp:TextBox ID="txtDiscount" Width="2em" TabIndex="80" MaxLength="4" runat="server"></asp:TextBox>%</td>
                    <td>
                        Status:
                        <asp:DropDownList ID="ddlStatus" TabIndex="90" runat="server">
                        </asp:DropDownList></td>
                </tr>
            </table>
        </asp:Panel>
        <div class="grid_2 omega">
            <asp:GridView ID="GridView2" runat="server">
            </asp:GridView>
        </div>
    </div>
        <asp:gridview ID="Gridview1" CssClass="gridview1" AllowSorting="True"  runat="server" 
            AutoGenerateColumns="False" DataKeyNames="Invoices_Id" BackColor="LightGoldenrodYellow" 
            BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" 
            GridLines="None">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="client" ItemStyle-CssClass="left" SortExpression="client" HeaderText="Client Name" />
                <asp:BoundField DataField="date" ItemStyle-CssClass="left" SortExpression="date" DataFormatString="{0:mm-dd-yyyy}" HeaderText="Date" />
                <asp:BoundField DataField="desc" ItemStyle-CssClass="left" SortExpression="desc" HeaderText="Description" />
                <asp:BoundField DataField="ordernumber" ItemStyle-CssClass="left"  SortExpression="ordernumber" HeaderText="Invoice #" />
                <asp:BoundField DataField="hours" ItemStyle-CssClass="right" SortExpression="hours" DataFormatString="{0:n}" HeaderText="Hours"  />
                <asp:BoundField DataField="discount" ItemStyle-CssClass="right" SortExpression="discount" DataFormatString="{0:n0}" HeaderText="Discount" />
                <asp:BoundField DataField="total" ItemStyle-CssClass="right" SortExpression="total" DataFormatString="{0:c}" HeaderText="Total"/>
                <asp:BoundField DataField="status" ItemStyle-CssClass="left" SortExpression="status" HeaderText="Status" />
                <asp:BoundField DataField="paymentrec" ItemStyle-CssClass="left" SortExpression="paymentrec" DataFormatString="{0:d}" ConvertEmptyStringToNull="true"  HeaderText="Payment Received" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <div style="width: 200px;">
                            <asp:GridView ID="gridview2" Width="100%" AutoGenerateColumns="false" runat="server">
                                <Columns>
                                    <asp:BoundField DataField="line_Text" HeaderText="Line Item" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="contact" ItemStyle-CssClass="left" SortExpression="contact" HeaderText="Contact Address" />
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
    </form>
</body>
</html>

