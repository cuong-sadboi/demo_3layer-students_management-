<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SubjectAdd.aspx.cs" Inherits="demo_3layer1.UI.Subjects.SubjectAdd" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Add Subject</title>
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
                    <h1 class="portal-title">Add New Subject</h1>
                    <p class="portal-subtitle">Them mon hoc moi vao he thong voi ten mon va so tin chi phu hop.</p>
                </div>
                <span class="portal-badge">Create</span>
            </div>

            <div class="portal-form-card">
                <div class="portal-row">
                    <div>
                        <label class="portal-label" for="<%= txtName.ClientID %>">Ten mon hoc</label>
                        <asp:TextBox ID="txtName" runat="server" CssClass="portal-input" Placeholder="Nhap ten mon hoc"></asp:TextBox>
                    </div>

                    <div>
                        <label class="portal-label" for="<%= txtCredit.ClientID %>">So tin chi</label>
                        <asp:TextBox ID="txtCredit" runat="server" CssClass="portal-input" TextMode="Number" Placeholder="Nhap so tin chi"></asp:TextBox>
                    </div>
                </div>

                <asp:Label ID="lblMessage" runat="server" CssClass="portal-message"></asp:Label>

                <div class="portal-footer-actions">
                    <asp:Button ID="btnSave" runat="server" Text="Luu mon hoc" CssClass="portal-btn success" OnClick="btnSave_Click" />
                    <asp:Button ID="btnBack" runat="server" Text="Quay lai" CssClass="portal-btn secondary" OnClick="btnBack_Click" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>