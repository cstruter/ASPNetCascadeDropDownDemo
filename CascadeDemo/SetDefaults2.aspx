<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SetDefaults2.aspx.cs" Inherits="CascadeDemo.SetDefaults2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    Please note that this solution requires the AjaxControlToolkit, which can be downloaded
    from http://ajaxcontroltoolkit.codeplex.com/
    <asp:ToolkitScriptManager EnablePartialRendering="true" ID="tsManager" runat="server">
    </asp:ToolkitScriptManager>
    <asp:FormView ID="fvCompany" runat="server" DefaultMode="Edit" DataSourceID="obsLocations">
        <EditItemTemplate>
            <table>
                <tr>
                    <td>
                        Country
                    </td>
                    <td>
                        <asp:CascadingDropDown ID="cddlCountries" runat="server" TargetControlID="ddlCountry"
                            Category="Country" PromptText="- Please Select -" ServicePath="~/Services/Service2.asmx"
                            ServiceMethod="GetCountries" UseContextKey="true" ContextKey='<%# Eval("CountryId") %>'>
                        </asp:CascadingDropDown>
                        <asp:DropDownList runat="server" ID="ddlCountry" DataTextField="Title" DataValueField="CountryId">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        Province/State
                    </td>
                    <td>
                        <asp:CascadingDropDown ID="cddlProvinces" runat="server" TargetControlID="ddlProvince"
                            ParentControlID="ddlCountry" Category="Province" PromptText="- Please Select -"
                            ServicePath="~/Services/Service2.asmx" ServiceMethod="GetProvinces" UseContextKey="true"
                            ContextKey='<%# Eval("ProvinceId") %>'>
                        </asp:CascadingDropDown>
                        <asp:DropDownList runat="server" ID="ddlProvince" DataTextField="Title" DataValueField="ProvinceId">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        City
                    </td>
                    <td>
                        <asp:CascadingDropDown ID="cddlCities" runat="server" TargetControlID="ddlCity" ParentControlID="ddlProvince"
                            Category="City" PromptText="- Please Select -" ServicePath="~/Services/Service2.asmx"
                            ServiceMethod="GetCities" UseContextKey="true" ContextKey='<%# Eval("CityId") %>'>
                        </asp:CascadingDropDown>
                        <asp:DropDownList runat="server" ID="ddlCity" DataTextField="Title" DataValueField="CityId">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button runat="server" ID="btnUpdate" Text="Update" CommandName="Update" />
                    </td>
                </tr>
            </table>
        </EditItemTemplate>
    </asp:FormView>
    <asp:ObjectDataSource runat="server" ID="obsLocations" TypeName="CascadeDemo.Data.Location"
        SelectMethod="Get" UpdateMethod="Update">
        <UpdateParameters>
            <asp:ControlParameter ControlID="fvCompany$ddlCountry" Name="CountryId" Type="Int32"
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="fvCompany$ddlProvince" Name="ProvinceId" Type="Int32"
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="fvCompany$ddlCity" Name="CityId" Type="Int32" PropertyName="SelectedValue" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    </form>
</body>
</html>
