<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SubjectList.aspx.cs" Inherits="demo_3layer1.UI.Subjects.SubjectList" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Subject Management</title>
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
                    <h1 class="portal-title">Subject Management</h1>
                    <p class="portal-subtitle">Quản lý danh mục môn học, số tín chỉ và tra cứu thông tin theo tu khoa.</p>
                </div>
                <span class="portal-badge">CRUD</span>
            </div>

            <asp:Label ID="lblMessage" runat="server" Visible="false" CssClass="portal-message"></asp:Label>

            <div class="portal-toolbar">
                <div class="portal-row cols-4">
                    <div>
                        <label class="portal-label" for="<%= txtKeyword.ClientID %>">Từ khóa</label>
                        <asp:TextBox ID="txtKeyword" runat="server" CssClass="portal-input" Placeholder="Nhập tên môn học"></asp:TextBox>
                    </div>
                    <div class="portal-actions" style="align-items:end;">
                        <asp:Button ID="btnSearch" runat="server" CssClass="portal-btn primary" Text="Tim" OnClick="btnSearch_Click" />
                    </div>
                    <div class="portal-actions" style="align-items:end;">
                        <asp:Button ID="btnClear" runat="server" CssClass="portal-btn secondary" Text="Lam moi" OnClick="btnClear_Click" />
                    </div>
                    <div class="portal-actions" style="align-items:end; justify-content:flex-end;">
                        <asp:Button ID="btnAdd" runat="server" Text="Thêm môn học" CssClass="portal-btn success" OnClick="btnAdd_Click" />
                    </div>
                </div>
            </div>

            <div class="portal-table-wrap">
                <asp:GridView ID="gvSubjects" runat="server" CssClass="portal-table"
                    AutoGenerateColumns="False" DataKeyNames="Id" OnRowCommand="gvSubjects_RowCommand" OnRowDataBound="gvSubjects_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Ma mon" />
                        <asp:BoundField DataField="Name" HeaderText="Tên môn học" />
                        <asp:BoundField DataField="Credit" HeaderText="Tin chi" />
                        <asp:TemplateField HeaderText="Thao tac">
                            <ItemTemplate>
                                <asp:Button ID="btnEdit" runat="server" Text="Sửa"
                                    CssClass="portal-btn-sm warning"
                                    CommandName="EditSubject" CommandArgument='<%# Eval("Id") %>' />

                                <asp:Button ID="btnDelete" runat="server" Text="Xóa"
                                    CssClass="portal-btn-sm danger"
                                    CommandName="DeleteSubject" CommandArgument='<%# Eval("Id") %>'
                                    OnClientClick="return confirm('Bạn có chắc chắn muốn xoa môn học này không?');" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

            <div class="portal-footer-actions">
                <asp:Button ID="btnBackAdmin" runat="server" Text="Quay lại" CssClass="portal-btn secondary" OnClick="btnBackAdmin_Click" />
            </div>
        </div>
    </form>
</body>
</html>










