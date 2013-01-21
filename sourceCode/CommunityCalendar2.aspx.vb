Imports System.Xml.XPath
Imports System.Xml
Imports System.Xml.Xsl
Imports System.IO
Imports System.Data
Imports system.Collections.Generic

Partial Class CommunityCalendar2
   Inherits System.Web.UI.Page

   Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
      Dim css As HtmlGenericControl
      css = New HtmlGenericControl
      css.TagName = "link"
      css.Attributes.Add("rel", "stylesheet")
      css.Attributes.Add("type", "text/css")
      css.Attributes.Add("href", "Styles/communitycalendar.css")
      'css.InnerHtml = "@import ""styles/communitycalendar.css"";"
      Page.Header.Controls.Add(css)

   End Sub

   Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
   End Sub
   Public Function GetEvents()
      Dim theXML As New StringBuilder("<events>")
      Dim cdHTML As String = ""
      Dim ReturnValues As String = ""
      Dim aContentInFolder() As Ektron.Cms.ContentData = Array.CreateInstance(GetType(Ektron.Cms.ContentData), 0)
      Dim c As Ektron.Cms.API.Content.Content = New Ektron.Cms.API.Content.Content
      Dim cd As Ektron.Cms.ContentData
      aContentInFolder = c.GetChildContent(464, False, "id")
      For i As Integer = 0 To aContentInFolder.Length - 1
         cd = aContentInFolder(i)
         cdHTML = cd.Html
         cdHTML = cdHTML.Replace("<root>", "")
         cdHTML = cdHTML.Replace("</root>", "")
         theXML.Append("<event>" & cdHTML & "</event>")
      Next
      theXML.Append("</events>")
      If aContentInFolder.Length >= 0 Then
         Dim strHtml As String
         Dim strXstFile As String = Server.MapPath("CommunityCalendar3.xsl")
         Dim x As XslCompiledTransform = New XslCompiledTransform()
         Dim byteObj() As Byte
         byteObj = System.Text.Encoding.UTF8.GetBytes(theXML.ToString)
         Dim memStr As System.IO.MemoryStream = New System.IO.MemoryStream(byteObj)
         'Dim xpathDoc As XPathDocument = New XPathDocument(memStr)
         'Load the XML 
         Dim doc As XPathDocument = New XPathDocument(memStr) 'New XPathDocument(Server.MapPath("aspalliance.xml"))
         'Load the style sheet.
         Dim xslt As XslCompiledTransform = New XslCompiledTransform()
         xslt.Load(strXstFile)
         Dim ms As MemoryStream = New MemoryStream()
         Dim writer As XmlTextWriter = New XmlTextWriter(ms, Encoding.ASCII)
         Dim rd As StreamReader = New StreamReader(ms)
         xslt.Transform(doc, writer)
         ms.Position = 0
         strHtml = rd.ReadToEnd()
         rd.Close()
         ms.Close()
         ReturnValues = strHtml
         'Response.Write(strHtml)
      End If
      Return ReturnValues
   End Function
End Class
