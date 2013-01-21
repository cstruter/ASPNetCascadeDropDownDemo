using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CascadeDemo.Data
{
    public class Country
    {
        public Country(Int32 CountryId, String Title)
        {
            this.CountryId = CountryId;
            this.Title = Title;
        }

        public Int32 CountryId { get; set; }
        public String Title { get; set; }

        public static List<Country> Get()
        {
            return new List<Country>(
                new Country[] 
                { 
                    new Country(1, "South Africa"), 
                    new Country(2, "Canada") 
                });
        }
    }

    public class Province
    {
        public Province(Int32 CountryId, Int32 ProvinceId, String Title)
        {
            this.CountryId = CountryId;
            this.ProvinceId = ProvinceId;
            this.Title = Title;
        }

        public Int32 CountryId { get; set; }
        public Int32 ProvinceId { get; set; }
        public String Title { get; set; }

        public static List<Province> Get(Int32 CountryId)
        {
            return new List<Province>(
                new Province[] 
                {
                    new Province(1, 1, "Gauteng"),
                    new Province(1, 2, "Western Cape"),
                    new Province(2, 3, "Ontario"),
                    new Province(2, 4, "Quebec")
                }).Where(p => p.CountryId == CountryId).ToList();
        }
    }

    public class City
    {
        public City(Int32 ProvinceId, Int32 CityId, String Title)
        {
            this.ProvinceId = ProvinceId;
            this.CityId = CityId;
            this.Title = Title;
        }

        public Int32 CityId { get; set; }
        public Int32 ProvinceId { get; set; }
        public String Title { get; set; }

        public static List<City> Get(Int32 ProvinceId)
        {
            return new List<City>(
                new City[] 
                {
                    new City(1, 1, "Pretoria"), new City(1, 2, "Johannesburg"),
                    new City(2, 3, "Cape Town"), new City(2, 4, "Paarl"),
                    new City(3, 5, "Toronto"), new City(4, 7, "Montreal")
                }).Where(p => p.ProvinceId == ProvinceId).ToList();
        }
    }

    public class Location
    {
        public Location(Int32 CountryId, Int32 ProvinceId, Int32 CityId)
        {
            this.CountryId = CountryId;
            this.ProvinceId = ProvinceId;
            this.CityId = CityId;
        }

        public Int32 CountryId { get; set; }
        public Int32 ProvinceId { get;set; }
        public Int32 CityId { get; set; }
     
        public static List<Location> Get()
        {
            return new List<Location>(new Location[] { new Location(1, 1, 1) });
        }

        public static void Update(Int32 CountryId, Int32 ProvinceId, Int32 CityId)
        {
        }
    }
}
