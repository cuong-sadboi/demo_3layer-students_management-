<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GradeList.aspx.cs" Inherits="demo_3layer1.UI.Grades.GradeList" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Grade Management</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@400;500;600;700&display=swap" rel="stylesheet" />
    <link href="<%= ResolveUrl("~/Content/PortalPro.css") %>" rel="stylesheet" />

    <script>
        function hideMessage() {
            var lbl = document.getElementById('<%= lblMessage.ClientID %>');
            if (lbl) {
                setTimeout(function () { lbl.innerHTML = ''; }, 2000);
            }
        }
    </script>
</head>

<body class="portal-body" onload="hideMessage()">
    <form id="form1" runat="server">
        <div class="portal-shell">
            <div class="portal-topbar">
                <div>
                    <h1 class="portal-title">Grade Management</h1>
                    <p class="portal-subtitle">Quản lý điểm theo sinh viên và môn học, hỗ trợ tìm kiếm nhanh và cập nhật trực tiếp.</p>
                </div>
                <span class="portal-badge">CRUD</span>
            </div>

            <asp:Label ID="lblStudentName" runat="server" CssClass="portal-message"></asp:Label>

            <div class="portal-toolbar">
                <div class="portal-row cols-4">
                    <div>
                        <label class="portal-label" for="<%= txtKeyword.ClientID %>">Từ khóa</label>
                        <asp:TextBox ID="txtKeyword" runat="server" CssClass="portal-input" Placeholder="Sinh viên, môn học hoặc diem"></asp:TextBox>
                    </div>
                    <div>
                        <label class="portal-label" for="<%= ddlField.ClientID %>">Theo trường</label>
                        <asp:DropDownList ID="ddlField" runat="server" CssClass="portal-select">
                            <asp:ListItem Text="Tất cả" Value="all" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="Sinh viên" Value="student"></asp:ListItem>
                            <asp:ListItem Text="Môn học" Value="subject"></asp:ListItem>
                            <asp:ListItem Text="Điểm" Value="score"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="portal-actions" style="align-items:end;">
                        <asp:Button ID="btnSearch" runat="server" CssClass="portal-btn primary" Text="Tim" OnClick="btnSearch_Click" />
                    </div>
                    <div class="portal-actions" style="align-items:end;">
                        <asp:Button ID="btnClear" runat="server" CssClass="portal-btn secondary" Text="Lam moi" OnClick="btnClear_Click" />
                    </div>
                </div>

                <div class="portal-actions" style="margin-top:10px;">
                    <asp:Button ID="btnAddGrade" runat="server" Text="Nhập điểm mới" CssClass="portal-btn success" OnClick="btnAddGrade_Click" />
                </div>
            </div>

            <asp:Label ID="lblMessage" runat="server" CssClass="portal-message"></asp:Label>

            <div class="portal-table-wrap">
                <asp:GridView ID="gvGrades" runat="server"
                    CssClass="portal-table"
                    AutoGenerateColumns="False"
                    DataKeyNames="StudentId,SubjectId"
                    OnRowEditing="gvGrades_RowEditing"
                    OnRowUpdating="gvGrades_RowUpdating"
                    OnRowDeleting="gvGrades_RowDeleting"
                    EmptyDataText="Chua co dữ liệu diem.">
                    <Columns>
                        <asp:BoundField DataField="Student.Name" HeaderText="Sinh viên" ReadOnly="true" />
                        <asp:BoundField DataField="Subject.Name" HeaderText="Môn học" ReadOnly="true" />
                        <asp:BoundField DataField="Score" HeaderText="Điểm" />

                        <asp:TemplateField HeaderText="Thao tac">
                            <ItemTemplate>
                                <asp:Button ID="btnEdit" runat="server" Text="Sửa"
                                    CssClass="portal-btn-sm warning"
                                    CommandName="Edit" CommandArgument='<%# Container.DisplayIndex %>' />

                                <asp:Button ID="btnDelete" runat="server" Text="Xóa"
                                    CssClass="portal-btn-sm danger"
                                    CommandName="Delete" CommandArgument='<%# Container.DisplayIndex %>'
                                    OnClientClick="return confirm('Bạn có chắc chắn muốn xoa điểm này không?');" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

            <div class="portal-footer-actions">
                <asp:Button ID="btnBack" runat="server" Text="Quay lại" CssClass="portal-btn secondary" OnClick="btnBack_Click" />
            </div>
        </div>
    </form>
</body>
</html>















