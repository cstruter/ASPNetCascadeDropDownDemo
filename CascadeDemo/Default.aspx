<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CascadeDemo._Default"
    EnableEventValidation="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        Please note that this solution requires the AjaxControlToolkit, which can be downloaded
        from <a href="http://ajaxcontroltoolkit.codeplex.com/">http://ajaxcontroltoolkit.codeplex.com/</a>
        <asp:ToolkitScriptManager ID="tsManager" runat="server">
        </asp:ToolkitScriptManager>
        <asp:FormView ID="fvCompany" runat="server" DefaultMode="Insert" DataSourceID="obsLocations">
            <InsertItemTemplate>
                <table>
                    <tr>
                        <td>
                            Country
                        </td>
                        <td>
                            <asp:CascadingDropDown ID="cddlCountries" runat="server" TargetControlID="ddlCountry"
                                Category="Country" PromptText="- Please Select -" ServicePath="~/Services/Service.asmx"
                                ServiceMethod="GetCountries">
                            </asp:CascadingDropDown>
                            <asp:DropDownList runat="server" ID="ddlCountry">
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
                                ServicePath="~/Services/Service.asmx" ServiceMethod="GetProvinces">
                            </asp:CascadingDropDown>
                            <asp:DropDownList runat="server" ID="ddlProvince">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            City
                        </td>
                        <td>
                            <asp:CascadingDropDown ID="cddlCities" runat="server" TargetControlID="ddlCity" ParentControlID="ddlProvince"
                                Category="City" PromptText="- Please Select -" ServicePath="~/Services/Service.asmx"
                                ServiceMethod="GetCities">
                            </asp:CascadingDropDown>
                            <asp:DropDownList runat="server" ID="ddlCity">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button runat="server" ID="btnAdd" Text="Add" CommandName="Insert" />
                        </td>
                    </tr>
                </table>
            </InsertItemTemplate>
        </asp:FormView>
        <asp:ObjectDataSource runat="server" ID="obsLocations" TypeName="CascadeDemo.Data.Location"
            InsertMethod="Add">
            <InsertParameters>
                <asp:ControlParameter ControlID="fvCompany$ddlCountry" Name="CountryId" Type="Int32"
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="fvCompany$ddlProvince" Name="ProvinceId" Type="Int32"
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="fvCompany$ddlCity" Name="CityId" Type="Int32" PropertyName="SelectedValue" />
            </InsertParameters>
        </asp:ObjectDataSource>
    </div>
    </form>
</body>
</html>
