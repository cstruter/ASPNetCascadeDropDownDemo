using System;
using CascadeDemo.Data;
using System.Web.UI.WebControls;
using System.Collections.Generic;

namespace CascadeDemo
{
    public partial class Alternative : System.Web.UI.Page
    {
        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlCountry.Cascade(ddlProvince, (CountryId) => Province.Get(CountryId));
            ddlProvince.Cascade(ddlCity, (ProvinceId) => City.Get(ProvinceId));
        }

        protected void ddlProvince_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlProvince.Cascade(ddlCity, (ProvinceId) => City.Get(ProvinceId));
        }
    }
}
