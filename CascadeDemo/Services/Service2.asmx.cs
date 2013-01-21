using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using CascadeDemo.Data;
using AjaxControlToolkit;
using System.Collections.Specialized;

namespace CascadeDemo.Services
{
    [WebService(Namespace = "http://cstruter.com")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [System.Web.Script.Services.ScriptService]
    public class Service2 : System.Web.Services.WebService
    {
        [WebMethod]
        public CascadingDropDownNameValue[] GetCountries(
          string knownCategoryValues,
          string category, string contextKey)
        {
            return Country.Get().Select(p =>
               new CascadingDropDownNameValue(p.Title, p.CountryId.ToString(), 
                   p.CountryId == Convert.ToInt32(contextKey))
           ).ToArray();
        }

        [WebMethod]
        public CascadingDropDownNameValue[] GetProvinces(
          string knownCategoryValues,
          string category, string contextKey)
        {
            StringDictionary values = CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
            Int32 CountryId = Convert.ToInt32(values["Country"]);
            return Province.Get(CountryId).Select(p =>
               new CascadingDropDownNameValue(p.Title, p.ProvinceId.ToString(), 
                   p.ProvinceId == Convert.ToInt32(contextKey))
           ).ToArray();
        }

        [WebMethod]
        public CascadingDropDownNameValue[] GetCities(
          string knownCategoryValues,
          string category, string contextKey)
        {
            StringDictionary values = CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
            Int32 ProvinceId = Convert.ToInt32(values["Province"]);
            return City.Get(ProvinceId).Select(p =>
                new CascadingDropDownNameValue(p.Title, p.CityId.ToString(), 
                    p.CityId == Convert.ToInt32(contextKey))
            ).ToArray();
        }
    }
}
