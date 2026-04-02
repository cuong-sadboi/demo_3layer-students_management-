<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentEdit.aspx.cs" Inherits="demo_3layer1.UI.Students.StudentEdit" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Edit Student</title>
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
                    <h1 class="portal-title">Edit Student</h1>
                    <p class="portal-subtitle">Cập nhật thông tin hồ sơ sinh viên và lưu lại thay đổi.</p>
                </div>
                <span class="portal-badge">Update</span>
            </div>

            <div class="portal-form-card">
                <asp:HiddenField ID="hfId" runat="server" />

                <div class="portal-row">
                    <div>
                        <label class="portal-label" for="<%= txtName.ClientID %>">Tên sinh viên</label>
                        <asp:TextBox ID="txtName" runat="server" CssClass="portal-input"></asp:TextBox>
                    </div>

                    <div>
                        <label class="portal-label" for="<%= txtClass.ClientID %>">Lớp học</label>
                        <asp:TextBox ID="txtClass" runat="server" CssClass="portal-input"></asp:TextBox>
                    </div>

                    <div>
                        <label class="portal-label" for="<%= txtEmail.ClientID %>">Email</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="portal-input"></asp:TextBox>
                    </div>
                </div>

                <asp:Label ID="lblMessage" runat="server" CssClass="portal-message"></asp:Label>

                <div class="portal-footer-actions">
                    <asp:Button ID="btnUpdate" runat="server" Text="Cập nhật" CssClass="portal-btn primary" OnClick="btnUpdate_Click" />
                    <asp:Button ID="btnBack" runat="server" Text="Quay lại" CssClass="portal-btn secondary" OnClick="btnBack_Click" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>








