using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using AjaxControlToolkit;
using System.Collections.Specialized;
using CascadeDemo.Data;
using System.Threading;

namespace CascadeDemo.Services
{
    [WebService(Namespace = "http://cstruter.com/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [System.Web.Script.Services.ScriptService]
    public class Service : System.Web.Services.WebService
    {
        [WebMethod]
        public CascadingDropDownNameValue[] GetCountries(
          string knownCategoryValues,
          string category)
        {
            return Country.Get().Select(p =>
                new CascadingDropDownNameValue(p.Title, p.CountryId.ToString())
            ).ToArray();
        }

        [WebMethod]
        public CascadingDropDownNameValue[] GetProvinces(
          string knownCategoryValues,
          string category)
        {
            StringDictionary values = CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
            Int32 CountryId = Convert.ToInt32(values["Country"]);
            return Province.Get(CountryId).Select(p =>
                new CascadingDropDownNameValue(p.Title, p.ProvinceId.ToString())
            ).ToArray();
        }

        [WebMethod]
        public CascadingDropDownNameValue[] GetCities(
          string knownCategoryValues,
          string category)
        {
            StringDictionary values = CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
            Int32 ProvinceId = Convert.ToInt32(values["Province"]);

            return City.Get(ProvinceId).Select(p =>
                new CascadingDropDownNameValue(p.Title, p.CityId.ToString())
            ).ToArray();
        }
    }
}
