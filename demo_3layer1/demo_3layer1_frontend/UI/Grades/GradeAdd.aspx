<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GradeAdd.aspx.cs" Inherits="demo_3layer1.UI.Grades.GradeAdd" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Add Grade</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@400;500;600;700&display=swap" rel="stylesheet" />
    <link href="<%= ResolveUrl("~/Content/PortalPro.css") %>" rel="stylesheet" />
    <script>
        function hideMessage() {
            var lbl = document.getElementById('<%= lblMessage.ClientID %>');
            if (lbl) setTimeout(function () { lbl.innerHTML = ''; }, 1000);
        }
    </script>
</head>
<body class="portal-body" onload="hideMessage()">
    <form id="form1" runat="server">
        <div class="portal-shell">
            <div class="portal-topbar">
                <div>
                    <h1 class="portal-title">Add Grade</h1>
                    <p class="portal-subtitle">Nhap diem moi cho sinh vien theo mon hoc va luu vao he thong ngay lap tuc.</p>
                </div>
                <span class="portal-badge">Create</span>
            </div>

            <div class="portal-form-card">
                <asp:Label ID="lblMessage" runat="server" CssClass="portal-message"></asp:Label>

                <div class="portal-row">
                    <div>
                        <label class="portal-label" for="<%= ddlStudent.ClientID %>">Sinh vien</label>
                        <asp:DropDownList ID="ddlStudent" runat="server" CssClass="portal-select"></asp:DropDownList>
                    </div>

                    <div>
                        <label class="portal-label" for="<%= ddlSubject.ClientID %>">Mon hoc</label>
                        <asp:DropDownList ID="ddlSubject" runat="server" CssClass="portal-select"></asp:DropDownList>
                    </div>

                    <div>
                        <label class="portal-label" for="<%= txtScore.ClientID %>">Diem</label>
                        <asp:TextBox ID="txtScore" runat="server" CssClass="portal-input" Placeholder="0 - 10"></asp:TextBox>
                    </div>
                </div>

                <div class="portal-footer-actions">
                    <asp:Button ID="btnSave" runat="server" Text="Luu diem" CssClass="portal-btn success" OnClick="btnSave_Click" />
                    <asp:Button ID="btnBack" runat="server" Text="Quay lai" CssClass="portal-btn secondary" OnClick="btnBack_Click" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
