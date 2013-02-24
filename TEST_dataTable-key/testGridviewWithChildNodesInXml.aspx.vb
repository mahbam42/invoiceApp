Imports System.Net.Mail
Imports System.Xml.XPath
Imports System.Xml
Imports System.Diagnostics
Imports System.IO
Imports System.Configuration
Imports System.Data

Partial Class tests_testGridviewWithChildNodesInXml
    Inherits System.Web.UI.Page

    Public pathToXML As String = "test.xml"
    ' sPublic childGV As New GridView
    Public ds As DataSet 'grab the dataset from anywhere! 
    Public dt2 As New DataTable 'should hold the line items 

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Label1.Text = ""
        Dim dt As New DataTable
        'Dim dv As DataView

        ' Reads invoices.xml and stores it to a dataTable accessable as a session variable 
        pathToXML = Server.MapPath(pathToXML)
        ds = New DataSet
        ds.ReadXml(pathToXML)
        dt2.Columns.Add("line_Text")
        Dim custOrderRel As DataRelation = ds.Relations.Add("lineItems", _
           ds.Tables(0).Columns("test_Id"), _
           ds.Tables(2).Columns("lines_Id"))
        Dim testDR As DataRow
        Dim lineDR As DataRow
        For Each testDR In ds.Tables(0).Rows
            'Label1.Text += testDR(0) + "<br />"
            For Each lineDR In testDR.GetChildRows("lineItems")
                'If lineDR.Item(1) = testDR.Item(2) Then
                Label1.Text += lineDR(0) + "<br />"
                dt2.ImportRow(lineDR)
                'End If
            Next
        Next

        dt = ds.Tables(0)
        'dt2 = ds.Tables(2)
        ' Well it didn't not work... but it still didn't work as intended 
        'Dim uc As UniqueConstraint = New UniqueConstraint(New DataColumn() _
        '   {dt2.Columns("line_Text")})
        'dt2.Constraints.Add(uc)


        'Session("dt2") = dt2
        GridView1.DataSource = dt
        GridView1.DataBind()
        'xmlRead()
    End Sub

    'Public Sub xmlRead()
    '    Try
    '        Dim m_xmld As XmlDocument
    '        Dim m_nodelist As XmlNodeList
    '        Dim m_node As XmlNode
    '        'Dim fileName As String = pathToXML
    '        'fileName = Server.MapPath(fileName)
    '        'Create the XML Document
    '        m_xmld = New XmlDocument()
    '        'Load the Xml file
    '        m_xmld.Load(pathToXML)
    '        'Get the list of name nodes 
    '        m_nodelist = m_xmld.SelectNodes("/tests/test/lines/line")
    '        Dim dr As DataRow
    '        Dim dt2 As DataTable
    '        'Loop through the nodes
    '        For Each m_node In m_nodelist
    '            ' ''Get the Gender Attribute Value
    '            ''Dim genderAttribute = m_node.Attributes.GetNamedItem("gender").Value
    '            For i As Integer = 1 To m_node.ChildNodes.Count - 1
    '                'dr.Item(1) = m_node.ChildNodes.Item(i).InnerText 'get client name 
    '                'dt2.ImportRow(dr)
    '            Next
    '            'Now what to do with it

    '        Next
    '        'childGV = GridView1.Rows.Item(2).Controls(1)
    '        'childGV.DataSource = dt2
    '        'childGV.DataBind()
    '    Catch errorVariable As Exception
    '        'Error trapping
    '        Label1.Text = errorVariable.ToString()
    '    End Try
    'End Sub

   ''Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
   ''    Moshe had a better idea so we're trying that... 
   ''    Dim i As Integer = 0
   ''    Dim rowNum As Integer = 0
   ''    Dim dtLineItems As New DataTable
   ''    Dim dr As DataRow
   ''    dtLineItems.Columns.Add("line_Text")
   ''    'For Each DataRow In dt2.Rows
   ''    If e.Row.RowType = DataControlRowType.DataRow Then
   ''        ' Dim customerId As String = GridView1.DataKeys(e.Row.RowIndex).Value.ToString()
   ''        Dim gvOrders As GridView = e.Row.Cells(2).Controls(1) '.FindControl("GridiVew2")
   ''        'If dt2.Rows(i)(1).ToString = i.ToString Then
   ''        '    dr = dt2.Rows(i)
   ''        '    dtLineItems.ImportRow(dr)
   ''        'End If

   ''        'For Each DataRow In dt2.Rows
   ''        If dt2.Rows(rowNum)(1).ToString = i.ToString Then
   ''            dr = dt2.Rows(rowNum)
   ''            dtLineItems.ImportRow(dr)
   ''            rowNum = rowNum + 1
   ''        Else
   ''            i = i + 1
   ''        End If
   ''        'Next
   ''        gvOrders.DataSource = dtLineItems ' dt2
   ''        gvOrders.DataBind()
   ''        'i = i + 1
   ''    End If
   ''    'Next
   ''End Sub

   Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        'Dim dt2 As New DataTable
        'dt2.Columns.Add("line_Text")
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim gvOrders As GridView = e.Row.Cells(2).Controls(1) '.FindControl("GridiVew2")

            gvOrders.DataSource = dt2
            gvOrders.DataBind()
        End If
      
   End Sub
End Class
