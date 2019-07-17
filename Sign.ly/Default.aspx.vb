Imports System.Data.SqlClient
Imports System.Globalization
Imports System.Web.Configuration

Public Class _Default
    Inherits System.Web.UI.Page
    Dim conn As New SqlConnection(WebConfigurationManager.ConnectionStrings("SignlyConnectionString").ConnectionString)

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


    End Sub

    Protected Sub BtnCreateCardReceipt(ByVal sender As Object, ByVal e As EventArgs)
        Const DATE_FORMAT As String = "MM/dd/yyyy"
        Dim recipientName As String = RecipientFullName.Text.Trim
        Dim emailRecipient As String = RecipientEmail.Text.Trim
        Dim recipientSignatureDate As Date = Date.ParseExact(RecipientSignageDate.Text, DATE_FORMAT, CultureInfo.InvariantCulture)
        Dim representativeName As String = ITRepresentative.SelectedValue
        Dim representativeDate As Date = Date.ParseExact(ITRepSignageDate.Text, DATE_FORMAT, CultureInfo.InvariantCulture)

        Dim receiptID As String = CreateCardReceipt(recipientName, emailRecipient, recipientSignatureDate, representativeName, representativeDate)
        ClearForm()
    End Sub

    Public Sub ClearForm()
        RecipientFullName.Text = ""
        RecipientEmail.Text = ""
        RecipientSignageDate.Text = ""
        ITRepresentative.SelectedValue = "IT Representative"
        ITRepSignageDate.Text = ""
    End Sub

    Public Function CreateCardReceipt(ByVal recipientName As String, ByVal emailRecipient As String,
                                  ByVal recipientSignatureDate As Date, ByVal representativeName As String,
                                  ByVal representativeDate As Date) As String
        Dim receiptID As String
        Dim query As String = String.Empty
        query &= "INSERT INTO CardReceipts (RecipientFullName, RecipientEmail, RecipientSignageDate, ITRepFullName, ITRepSignageDate)"
        query &= "VALUES (@RecipientFullName, @RecipientEmail, @RecipientSignageDate, @ITRepFullName, @ITRepSignageDate);"
        query &= "SELECT @@IDENTITY from CardReceipts"

        Using comm As New SqlCommand()
            With comm
                .Connection = conn
                .CommandType = CommandType.Text
                .CommandText = query
                .Parameters.AddWithValue("@RecipientFullName", recipientName)
                .Parameters.AddWithValue("@RecipientEmail", emailRecipient)
                .Parameters.AddWithValue("@RecipientSignageDate", recipientSignatureDate)
                .Parameters.AddWithValue("@ITRepFullName", representativeName)
                .Parameters.AddWithValue("@ITRepSignageDate", representativeDate)
            End With
            conn.Open()
            receiptID = comm.ExecuteScalar()
            conn.Close()
        End Using

        Return receiptID
    End Function


End Class