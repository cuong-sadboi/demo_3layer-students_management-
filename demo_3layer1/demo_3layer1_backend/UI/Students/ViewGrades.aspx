<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewGrades.aspx.cs" Inherits="demo_3layer1.UI.Students.ViewGrades" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>View Grades</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@400;500;600;700&display=swap" rel="stylesheet" />
    <link href="<%= ResolveUrl("~/Content/PortalPro.css") %>" rel="stylesheet" />
</head>
<body class="portal-body">
    <form id="form1" runat="server">
        <div class="portal-shell">
            <div class="portal-topbar">
                <div>
                    <h1 class="portal-title">Academic Results</h1>
                    <p class="portal-subtitle">Theo doi ket qua hoc tap theo tung mon va cap nhat nhanh cac diem so moi nhat.</p>
                </div>
                <span class="portal-badge">Student</span>
            </div>

            <asp:Label ID="lblStudentName" runat="server" CssClass="portal-message"></asp:Label>
            <asp:Label ID="lblMessage" runat="server" CssClass="portal-message"></asp:Label>

            <div class="portal-table-wrap">
                <asp:GridView ID="gvGrades" runat="server" CssClass="portal-table"
                    AutoGenerateColumns="False" EmptyDataText="Chua co diem duoc ghi nhan.">
                    <Columns>
                        <asp:BoundField DataField="Subject.Name" HeaderText="Mon hoc" />
                        <asp:BoundField DataField="Score" HeaderText="Diem" />
                    </Columns>
                </asp:GridView>
            </div>

            <div class="portal-footer-actions">
                <asp:Button ID="btnBack" runat="server" Text="Quay lai dashboard" CssClass="portal-btn secondary" OnClick="btnBack_Click" />
            </div>
        </div>
    </form>
</body>
</html>
