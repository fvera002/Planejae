using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace Planejae.UI.Controllers
{
    public static class Config
    {
        public static string ConnectionString
        {
            get
            {
                var connString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

                if (string.IsNullOrEmpty(connString)) throw new ArgumentOutOfRangeException("String de conexã0 não encontrada.");
                return connString;
            }
            
        }
    }
}