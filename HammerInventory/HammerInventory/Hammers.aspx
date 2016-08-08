<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Hammers.aspx.cs" Inherits="HammerInventory.Hammers" MasterPageFile="~/Site.Master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

<asp:Content ID="HammerHeader" ContentPlaceHolderID="head" runat="server">
    <link href="Content/Styles/site.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="HammerBody" ContentPlaceHolderID="bodyContent" runat="server">
    <asp:UpdatePanel ID="upMain" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <table style="width: 100%">
                <tr>
                    <td>
                        <span class="add_new_button">
                            <asp:LinkButton ID="lbtnAddNew" CausesValidation="false" ValidateRequestMode="Disabled" PostBackUrl="#" runat="server" Text="Add New Hammer" OnClick="lbtnAddNew_Click"></asp:LinkButton></span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div>
                            <asp:GridView ID="grdHammers" runat="server" Width="100%" AutoGenerateColumns="False" DataKeyNames="HammerId,TypeId" ShowHeaderWhenEmpty="True"
                                OnRowDataBound="OnRowDataBound" OnRowEditing="OnRowEditing" AllowPaging="True" OnPageIndexChanging="OnPageIndexChanging" OnRowDeleting="OnRowDeleting" EmptyDataText="No records has been added." CellPadding="4" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Name" ItemStyle-Width="30%">
                                        <ItemTemplate>
                                            <asp:Label ID="lblName" runat="server" Text='<%# Eval("HammerName") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle Width="30%" HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Description" ItemStyle-Width="40%">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDesc" runat="server" Text='<%# Eval("HammerDescription") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle Width="40%" HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Category" ItemStyle-Width="20%">
                                        <ItemTemplate>
                                            <asp:Label ID="lblType" runat="server" Text='<%# Eval("TypeName") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle Width="20%" HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:CommandField ButtonType="Image" HeaderText="Actions" ShowEditButton="true" DeleteImageUrl="~/Content/Images/delete.png" EditImageUrl="~/Content/Images/Edit.png" ShowDeleteButton="true"
                                        ItemStyle-Width="10%">
                                        <ItemStyle Width="10%" HorizontalAlign="Center" />
                                    </asp:CommandField>
                                </Columns>
                                <EditRowStyle BackColor="#2461BF" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" Height="30px" />
                                <PagerSettings PageButtonCount="4" FirstPageText="First" LastPageText="Last" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#EFF3FB" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                            </asp:GridView>
                        </div>
                    </td>
                </tr>
            </table>

            <asp:Button runat="server" ID="btnDummy" Style="display: none; width: 1px; height: 1px;" />
            <ajax:ModalPopupExtender ID="mpHammer" runat="server" PopupControlID="pnlHammerDock"
                Drag="true" TargetControlID="btnDummy" CancelControlID="lnkClose" BackgroundCssClass="ModalPopupBG"
                PopupDragHandleControlID="pnlHammerHeader">
            </ajax:ModalPopupExtender>
            <asp:Panel runat="server" ID="pnlHammerDock" Width="500px" Height="280px" CssClass="PopupBG"
                Style="display: none;">
                <asp:Panel runat="server" ID="pnlHammerHeader">
                    <div class="popupheader">
                        <table width="100%">
                            <tr>
                                <td align="left" style="width: 80%">
                                    <asp:Label runat="server" ID="Label5" CssClass="popupheadertitle"></asp:Label>
                                </td>
                                <td align="right" style="width: 15%">
                                    <asp:LinkButton runat="server" ID="lnkClose" CssClass="popupheaderclose" OnClientClick="loadHammerHide()">
                                                <span class="rdClose">&nbsp;</span>
                                    </asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </div>
                </asp:Panel>
                <asp:Panel ID="pnlHammerType" Font-Size="Small" runat="server">
                    <div>
                        <table>
                            <tr>
                                <td>
                                    <asp:Label ID="lblHammerText" runat="server" Text="Hammer Name:*"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtHammer" CssClass="inputtext" runat="server" MaxLength="500"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvHammer" runat="server" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtHammer" ErrorMessage="Please Enter Hammer Name." Text="" ForeColor="Red">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblTypetext" runat="server" Text="Category:*"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlTypes" DataTextField="TypeName" DataValueField="TypeId" runat="server" Width="200px" Height="20px" CausesValidation="true" AutoPostBack="false"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvddlTypes" runat="server" Display="Dynamic" SetFocusOnError="true" ControlToValidate="ddlTypes" ErrorMessage="Please Select Hammer Category." InitialValue="Select" Text="" ForeColor="Red">*</asp:RequiredFieldValidator>

                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblDescText" runat="server" Text="Description:"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine" MaxLength="500" Width="320px" Height="80px"></asp:TextBox>

                                </td>
                            </tr>

                            <tr>
                                <td colspan="2">
                                    <div class="button">
                                        <span>
                                            <asp:LinkButton ID="btnSave" CausesValidation="true" PostBackUrl="#" runat="server" Text="Save" OnClick="btnSave_Click"></asp:LinkButton></span>
                                    </div>
                                    &nbsp;
                                <div class="button">
                                    <span>
                                        <asp:LinkButton ID="btnCancel" CausesValidation="false" PostBackUrl="#" runat="server" Text="Cancel" OnClientClick="loadHammerHide();"></asp:LinkButton></span>
                                </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:ValidationSummary ID="vsmHammers" runat="server" DisplayMode="List" ShowMessageBox="false" ShowSummary="true" ForeColor="Red" />
                                    <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>


                                </td>
                            </tr>
                        </table>
                        <asp:HiddenField ID="hdnHammerId" runat="server" />
                    </div>
                </asp:Panel>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>

    <script type="text/javascript">
        function hideHammer() {
            if ($find('<%= mpHammer.ClientID %>') != null)
                $find('<%= mpHammer.ClientID %>').hide();
            return false;
        }
        function loadHammerHide() {
            Sys.Application.add_load(hideHammer);
        }
        function showHammerPopup() {
            $find('<%= mpHammer.ClientID %>').show();
            return false;
        }
    </script>
</asp:Content>
