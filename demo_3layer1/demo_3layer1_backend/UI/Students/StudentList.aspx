<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentList.aspx.cs" Inherits="demo_3layer1.UI.Students.StudentList" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Management</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
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
                    <h1 class="portal-title">Student Management</h1>
                    <p class="portal-subtitle">Tim kiem, cap nhat va xoa thong tin sinh vien mot cach nhanh gon va nhat quan.</p>
                </div>
                <span class="portal-badge">CRUD</span>
            </div>

            <div class="portal-toolbar">
                <div class="portal-row cols-3">
                    <div>
                        <label class="portal-label" for="<%= txtSearch.ClientID %>">Tim kiem</label>
                        <asp:TextBox ID="txtSearch" runat="server" CssClass="portal-input" Placeholder="Nhap ten sinh vien hoac lop hoc"></asp:TextBox>
                    </div>
                    <div class="portal-actions" style="align-items:end;">
                        <asp:Button ID="btnSearch" runat="server" Text="Tim kiem" CssClass="portal-btn primary" OnClick="btnSearch_Click" />
                    </div>
                    <div class="portal-actions" style="align-items:end; justify-content:flex-end;">
                        <asp:Button ID="btnAdd" runat="server" Text="Them sinh vien" CssClass="portal-btn success" OnClick="btnAdd_Click" />
                    </div>
                </div>
            </div>

            <div class="portal-table-wrap">
                <asp:GridView ID="gvStudents" runat="server" CssClass="portal-table"
                    AutoGenerateColumns="False" DataKeyNames="Id" OnRowCommand="gvStudents_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="true" />
                        <asp:BoundField DataField="Name" HeaderText="Ho ten" />
                        <asp:BoundField DataField="ClassName" HeaderText="Lop hoc" />
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:TemplateField HeaderText="Thao tac">
                            <ItemTemplate>
                                <asp:Button ID="btnEdit" runat="server" Text="Sua"
                                    CssClass="portal-btn-sm warning"
                                    CommandName="EditStudent" CommandArgument='<%# Eval("Id") %>' />

                                <asp:Button ID="btnDelete" runat="server" Text="Xoa"
                                    CssClass="portal-btn-sm danger"
                                    CommandName="DeleteStudent" CommandArgument='<%# Eval("Id") %>'
                                    OnClientClick="return confirm('Ban co chac chan muon xoa sinh vien nay khong?');" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

            <div class="portal-footer-actions">
                <asp:Button ID="btnBack" runat="server" Text="Quay lai Admin" CssClass="portal-btn secondary" OnClick="btnBack_Click" />
            </div>
        </div>
    </form>
</body>
</html>
