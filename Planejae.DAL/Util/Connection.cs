using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Planejae.DAL.Util
{
    public static class Connection
    {


        private static SqlConnection _conn;

        
        //private static SqlConnectionStringBuilder _connString =
        //    new SqlConnectionStringBuilder()
        //    {
        //        DataSource = @"fernandoverago\SQLEXPRESS",
        //        InitialCatalog = "planejae",
        //        IntegratedSecurity = true,
        //        Pooling = true
        //    };

        private static SqlConnectionStringBuilder _connString =
            new SqlConnectionStringBuilder()
            {
                DataSource = "admin.crtugkxdbwbd.us-west-2.rds.amazonaws.com",
                UserID = "admin",
                Password = "amagnnno",
                InitialCatalog = "planejae",
                Pooling = true
            };

        public static SqlConnection GetInstance()
        {
            if (_conn == null)
            {
                _conn = new SqlConnection(_connString.ToString());
            }
            return _conn;            
        }
    }
}
