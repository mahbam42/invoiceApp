<%@ Page Language="VB" AutoEventWireup="false" CodeFile="testGridviewWithChildNodesInXml.aspx.vb" Inherits="tests_testGridviewWithChildNodesInXml" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label><br />
        <asp:GridView ID="GridView1" runat="server"  AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="name" />
                <asp:BoundField DataField="description" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:GridView ID="gridview2" AutoGenerateColumns="false" runat="server">
                            <Columns>
                                <asp:BoundField DataField="line_Text" HeaderText="Line Item" />
                            </Columns>
                        </asp:GridView>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>
