<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CourseRegistration.aspx.cs" Inherits="demo_3layer1.UI.Students.CourseRegistration" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Course Registration</title>
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
                    <h1 class="portal-title">Course Registration</h1>
                    <p class="portal-subtitle">Dang ky hoc phan theo hoc ky, theo doi danh sach mon da chon va huy dang ky khi can.</p>
                </div>
                <span class="portal-badge">Student</span>
            </div>

            <asp:Label ID="lblMessage" runat="server" CssClass="portal-message"></asp:Label>

            <div class="portal-toolbar">
                <div class="portal-row cols-3">
                    <div>
                        <label class="portal-label" for="<%= ddlSubjects.ClientID %>">Mon hoc</label>
                        <asp:DropDownList ID="ddlSubjects" runat="server" CssClass="portal-select" AppendDataBoundItems="true">
                            <asp:ListItem Text="-- Chon mon hoc --" Value="" />
                        </asp:DropDownList>
                    </div>

                    <div>
                        <label class="portal-label" for="<%= txtSemester.ClientID %>">Hoc ky</label>
                        <asp:TextBox ID="txtSemester" runat="server" CssClass="portal-input" placeholder="VD: 2026A"></asp:TextBox>
                    </div>

                    <div class="portal-actions" style="align-items:end;">
                        <asp:Button ID="btnRegister" runat="server" Text="Dang ky mon" CssClass="portal-btn success" OnClick="btnRegister_Click" />
                    </div>
                </div>
            </div>

            <div class="portal-table-wrap">
                <asp:GridView ID="gvRegistrations" runat="server" CssClass="portal-table"
                    AutoGenerateColumns="False" DataKeyNames="Id" OnRowCommand="gvRegistrations_RowCommand" EmptyDataText="Ban chua dang ky mon hoc nao.">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Ma" />
                        <asp:BoundField DataField="Subject.Name" HeaderText="Mon hoc" />
                        <asp:BoundField DataField="Semester" HeaderText="Hoc ky" />
                        <asp:TemplateField HeaderText="Thao tac">
                            <ItemTemplate>
                                <asp:Button ID="btnDelete" runat="server" Text="Huy"
                                    CssClass="portal-btn-sm danger"
                                    CommandName="DeleteRegistration" CommandArgument='<%# Eval("Id") %>'
                                    OnClientClick="return confirm('Ban co chac chan muon huy dang ky mon hoc nay khong?');" />
                            </ItemTemplate>
                        </asp:TemplateField>
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
