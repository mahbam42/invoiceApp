﻿Imports System.Net.Mail
Imports System.Xml.XPath
Imports System.Xml
Imports System.Diagnostics
Imports System.IO
Imports System.Configuration
Imports System.Data

Partial Class invoice
    Inherits System.Web.UI.Page
    Public pathToXML As String = "C:\Users\Max\Documents\Websites\invoiceApp\invoices.xml"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack = False Then
            xmlRead()
            bindToGridView()
        End If
    End Sub

    Protected Sub bindToGridView()
        Dim dataUrl As String = pathToXml
        Dim ds As DataSet = New DataSet
        ds.ReadXml(dataUrl)
        Dim dv As DataView = New DataView(ds.Tables(0))
        Gridview1.DataSource = dv
        Gridview1.DataBind()
    End Sub

    Public Sub xmlRead()
        Try
            Dim m_xmld As XmlDocument
            Dim m_nodelist As XmlNodeList
            Dim m_node As XmlNode
            'Create the XML Document
            m_xmld = New XmlDocument()
            'Load the Xml file
            m_xmld.Load(pathToXML)
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
