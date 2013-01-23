Imports System.Net.Mail
Imports System.Xml.XPath
Imports System.Xml
Imports System.Diagnostics
Imports System.IO
Imports System.Configuration

Partial Class invoice
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        xmlRead()
    End Sub

    Public Sub xmlRead()
        'Dim m_xmlr As XmlTextReader
        'm_xmlr = New XmlTextReader("invoices.xml")
        ''Disable whitespace so that you don't have to read overwhitespaces
        'm_xmlr.WhitespaceHandling = WhitespaceHandling.None
        'm_xmlr.Read() 'read the heaer
        'm_xmlr.Read() 'read the first node 
        'While Not m_xmlr.EOF
        Try
            Dim m_xmld As XmlDocument
            Dim m_nodelist As XmlNodeList
            Dim m_node As XmlNode
            'Create the XML Document
            m_xmld = New XmlDocument()
            'Load the Xml file
            m_xmld.Load("C:\Users\Max\Dropbox\Freelance\invoiceApp\invoices.xml")
            'Get the list of name nodes 
            m_nodelist = m_xmld.SelectNodes("/invoices/invoice")
            'Loop through the nodes
            For Each m_node In m_nodelist
                ' ''Get the Gender Attribute Value
                ''Dim genderAttribute = m_node.Attributes.GetNamedItem("gender").Value
                Dim clientName As String = m_node.ChildNodes.Item(0).InnerText 'get client name 
                Dim startDate As Date = m_node.ChildNodes.Item(1).InnerText 'get event date or project start date
                Dim description As String = m_node.ChildNodes.Item(2).InnerText 'get event/project name 
                Dim invoiceNumber As String = m_node.ChildNodes.Item(3).InnerText 'Gets the stored invoice number 
                Dim hours As Integer = m_node.ChildNodes.Item(4).InnerText 'gets the hours worked 
                Dim discount As Integer = m_node.ChildNodes.Item(5).InnerText 'gets the discount applied. some clients have a set rate
                Dim details As String = m_node.ChildNodes.Item(6).InnerText 'gets notes and more info regarding the project. 
                Dim contactInfo As String = m_node.ChildNodes.Item(7).InnerText 'contact info. This will be used to send invoices 
                'Now what to do with it
                Label1.Text = Label1.Text + "<br />" + clientName + " | " + startDate + " | " + description + " | " + invoiceNumber.ToString + " | " + hours.ToString + " | " + discount.ToString + " | " + details + " | " + contactInfo
            Next
        Catch errorVariable As Exception
            'Error trapping
            Label1.Text = errorVariable.ToString()
        End Try
    End Sub
End Class
