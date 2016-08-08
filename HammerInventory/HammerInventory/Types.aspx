<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Types.aspx.cs" Inherits="HammerInventory.Types" MasterPageFile="~/Site.Master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<asp:content id="HammerTypeHeader" contentplaceholderid="head" runat="server">
    <link href="Content/Styles/site.css" rel="stylesheet" type="text/css" />
</asp:content>
<asp:content id="HammerTypeBody" contentplaceholderid="bodyContent" runat="server">
        <asp:UpdatePanel ID="upMain" runat="server" UpdateMode="Always">
            <ContentTemplate>
                <table style="width: 100%">
                    <tr>
                        <td>
                            <span class="add_new_button">
                                <asp:LinkButton ID="lbtnAddNew" CausesValidation="false" ValidateRequestMode="Disabled" PostBackUrl="#" runat="server" Text="Add New Category" OnClick="lbtnAddNew_Click"></asp:LinkButton></span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div>
                                <asp:GridView ID="grdHammerTypes" runat="server" Width="100%" AutoGenerateColumns="False" DataKeyNames="TypeId" ShowHeaderWhenEmpty="True"
                                    OnRowDataBound="OnRowDataBound" OnRowEditing="OnRowEditing" PageSize="10" AllowPaging="true" OnPageIndexChanging="OnPageIndexChanging" OnRowDeleting="OnRowDeleting" EmptyDataText="No records has been added." CellPadding="4" ForeColor="#333333" GridLines="None">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="Category" ItemStyle-Width="40%">
                                            <ItemTemplate>
                                                <asp:Label ID="lblName" runat="server" Text='<%# Eval("TypeName") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Width="40%" HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Description" ItemStyle-Width="50%">
                                            <ItemTemplate>
                                                <asp:Label ID="lblDesc" runat="server" Text='<%# Eval("TypeDesc") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Width="50%"  HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:CommandField ButtonType="Image" HeaderText="Actions" ShowEditButton="true" DeleteImageUrl="~/Content/Images/delete.png" EditImageUrl="~/Content/Images/Edit.png" ShowDeleteButton="true"
                                            ItemStyle-Width="10%" >
                                        <ItemStyle Width="10%" HorizontalAlign="Center" />
                                        </asp:CommandField>
                                    </Columns>
                                    <EditRowStyle BackColor="#2461BF" />
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" Height="30px" />
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
                <ajax:ModalPopupExtender ID="mpHammerType" runat="server" PopupControlID="pnlHammerTypeDock"
                    Drag="true" TargetControlID="btnDummy" CancelControlID="lnkClose" BackgroundCssClass="ModalPopupBG"
                    PopupDragHandleControlID="pnlHammerTypeHeader">
                </ajax:ModalPopupExtender>
                <asp:Panel runat="server" ID="pnlHammerTypeDock" Width="500px" Height="240px" CssClass="PopupBG"
                    Style="display: none;">
                    <asp:Panel runat="server" ID="pnlHammerTypeHeader">
                        <div class="popupheader">
                            <table width="100%">
                                <tr>
                                    <td align="left" style="width: 80%">
                                        <asp:Label runat="server" ID="Label5" CssClass="popupheadertitle"></asp:Label>
                                    </td>
                                    <td align="right" style="width: 15%">
                                        <asp:LinkButton runat="server" ID="lnkClose" CssClass="popupheaderclose" OnClientClick="loadHammerTypeHide()">
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
                                        <asp:Label ID="lblTypeText" runat="server" Text="Category:*"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtHammerType" CssClass="inputtext" runat="server" MaxLength="500"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvType" runat="server" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtHammerType" ErrorMessage="Enter Category." Text="" ForeColor="Red">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblTypeDescText" runat="server" Text="Description:"></asp:Label>
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
                                        <asp:LinkButton ID="btnCancel" CausesValidation="false" PostBackUrl="#" runat="server" Text="Cancel" OnClientClick="loadHammerTypeHide();"></asp:LinkButton></span>
                                </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:ValidationSummary ID="vsmTypes" runat="server" DisplayMode="List" ShowMessageBox="false" ShowSummary="true" ForeColor="Red" />
                                        <asp:Label id="lblError" runat="server" ForeColor="Red"></asp:Label>


                                    </td>
                                </tr>
                            </table>
                            <asp:HiddenField ID="hdnTypeId" runat="server" />
                        </div>
                    </asp:Panel>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
<script type="text/javascript">
    function hideHammerType() {
        if ($find('<%= mpHammerType.ClientID %>') != null)
            $find('<%= mpHammerType.ClientID %>').hide();
        return false;
    }
    function loadHammerTypeHide() {
        Sys.Application.add_load(hideHammerType);
    }
    function showHammerTypePopup() {
        $find('<%= mpHammerType.ClientID %>').show();
        return false;
    }
</script>
    </asp:content>
