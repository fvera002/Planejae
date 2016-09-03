using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Planejae.DAL.Util
{
    public  class Connection
    {


        private  SqlConnection _conn;


        private SqlConnectionStringBuilder _connStringLocal =
            new SqlConnectionStringBuilder()
            {
                DataSource = @"fernandoverago\SQLEXPRESS",
                InitialCatalog = "planejae",
                IntegratedSecurity = true,
                Pooling = true
            };

        private  SqlConnectionStringBuilder _connStringAmazon =
            new SqlConnectionStringBuilder()
            {
                DataSource = "admin.crtugkxdbwbd.us-west-2.rds.amazonaws.com",
                UserID = "admin",
                Password = "amagnnno",
                InitialCatalog = "planejae",
                Pooling = true
            };

        public Connection()
        {
            _conn = new SqlConnection(_connStringAmazon.ToString());
        }

        public SqlConnection GetInstance()
        {
            return _conn;            
        }
    }
}
