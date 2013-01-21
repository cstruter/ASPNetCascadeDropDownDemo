<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Alternative.aspx.cs" Inherits="CascadeDemo.Alternative" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel runat="server" ID="upnlCascades">
            <ContentTemplate>
                <table>
                    <tr>
                        <td>
                            Country
                        </td>
                        <td>
                            <asp:DropDownList runat="server" ID="ddlCountry" DataTextField="Title" DataValueField="CountryId"
                                DataSourceID="obsCountries" AutoPostBack="true" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged">
                                <asp:ListItem Text="- Please Select -" Value=""></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Province/State
                        </td>
                        <td>
                            <asp:DropDownList runat="server" ID="ddlProvince" DataTextField="Title" DataValueField="ProvinceId"
                                AutoPostBack="true" OnSelectedIndexChanged="ddlProvince_SelectedIndexChanged">
                                <asp:ListItem Text="- Please Select -" Value=""></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            City
                        </td>
                        <td>
                            <asp:DropDownList runat="server" ID="ddlCity" DataTextField="Title" DataValueField="CityId">
                                <asp:ListItem Text="- Please Select -" Value=""></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:Button runat="server" ID="btnAdd" Text="Add" />
        <asp:ObjectDataSource runat="server" ID="obsCountries" TypeName="CascadeDemo.Data.Country"
            SelectMethod="Get"></asp:ObjectDataSource>
    </div>
    </form>
</body>
</html>
