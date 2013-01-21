<%@ Page Language="VB" AutoEventWireup="false" CodeFile="postpay.aspx.vb" Inherits="Forms_postpay" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <%-- This page is being called by PayflowLink after a successful payment is made on their website 
         The page has no intereface just code behind.
         The code behind received posted vars about the payment, figures out who to send confirmation to and if changing statuses of database records is needed
         At this point August 2012 online payments are stored either in db3 uj2 database at CourseRegistration table for online courses of WCCE which later are pushed to student manager application
         Or to NameProductService table in UJDB.UJmain which records the online payment for all the rest of the forms that need online payments
    --%>
   <asp:Label runat="server" ID="lblMessage" Text="" />
   <br />
   <hr/>
   <asp:Label runat="server" ID="lblError" Text="" />
    </div>
    </form>
</body>
</html>
