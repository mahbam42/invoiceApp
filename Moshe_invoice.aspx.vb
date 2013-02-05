﻿Imports System.Net.Mail
Imports System.Xml.XPath
Imports System.Xml
Imports System.Diagnostics
Imports System.IO
Imports System.Configuration
Imports System.Data

Partial Class invoice
    Inherits System.Web.UI.Page

    Public pathToXML As String = "invoices.xml"
    Dim dt As New DataTable
    Dim dv As DataView
    Dim ds As DataSet

    ''' PreInit is Moshe's code to set-up some things before the page load 
    Protected Sub Page_PreInit(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreInit
        pathToXML = Server.MapPath(pathToXML)
        ds = New DataSet
        ds.ReadXml(pathToXML)
        dt = (ds.Tables(0)) 'create the data table 
        Session("dt") = dt 'create a session variable based on the dataTable to then manipulate 
        If Session("sortdir") Is Nothing Then 'Sets initial values for sorting - not the best way to do things... 
            Session("sortdir") = "ASC"

        End If
        If Session("sortcol") Is Nothing = True Then
            Session("sortcol") = "client"
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack = False Then
            xmlRead()
            bindToGridView()
        End If
    End Sub

    Protected Sub bindToGridView()
        Gridview1.DataSource = Session("dt")
        Gridview1.DataBind()
    End Sub

    Public Sub xmlRead()
        Try
            Dim m_xmld As XmlDocument
            Dim m_nodelist As XmlNodeList
            Dim m_node As XmlNode
            'Dim fileName As String = pathToXML
            'fileName = Server.MapPath(fileName)
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

    Protected Sub Gridview1_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles Gridview1.RowEditing
        Gridview1.EditIndex = e.NewEditIndex
        bindToGridView()
    End Sub

    Protected Sub Gridview1_RowCancelingEdit(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCancelEditEventArgs) Handles Gridview1.RowCancelingEdit
        Gridview1.EditIndex = -1
    End Sub

    Protected Sub Gridview1_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles Gridview1.RowUpdating
        Dim dt = CType(Session("dt"), DataTable) 'Retrieve the table from the Session

        ' Update the values
        Dim row = Gridview1.Rows(e.RowIndex)
        dt.Rows(row.DataItemIndex)("client") = (CType((row.Cells(1).Controls(0)), TextBox)).Text

        ' There will be 1 dt.rows line for each cell column in the data table

        ' Reset
        Gridview1.EditIndex = -1
        ' Bind Changes
        Session("dt") = dt
        'Dim ds As DataSet = dt
        dt.WriteXml(pathToXML)
        bindToGridView()
    End Sub

    Protected Sub Gridview1_RowUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdatedEventArgs) Handles Gridview1.RowUpdated
        Label1.Text = "Updated" + Now().ToString
        'bindToGridView()
    End Sub

    Protected Sub Gridview1_Sorting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewSortEventArgs) Handles Gridview1.Sorting
        Dim sd As String = Session("sortdir")
        Dim dt As DataTable = Session("dt")
        Dim dv As New DataView
        dv = dt.DefaultView
        If sd.IndexOf("ASC") > -1 Then
            Session("sortdir") = "DESC"
        Else
            Session("sortdir") = "ASC"
        End If
        dv.Sort = e.SortExpression + " " + Session("sortdir")
        bindToGridView()
    End Sub


End Class