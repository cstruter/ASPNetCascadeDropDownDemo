using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

public static class ExtensionMethods
{
    public static void Cascade<T>(this DropDownList parentDropDownList, DropDownList childDropDownList, Func<Int32, T> dataSource)
    {
        childDropDownList.Items.Clear();
        childDropDownList.AppendDataBoundItems = true;
        childDropDownList.Items.Add(new ListItem("- Please Select -", ""));
        if (!String.IsNullOrEmpty(parentDropDownList.SelectedValue))
        {
            childDropDownList.DataSource = dataSource(Convert.ToInt32(parentDropDownList.SelectedValue));
            childDropDownList.DataBind();
        }
    }
}

