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
                DataSource = "ec2-52-35-48-50.us-west-2.compute.amazonaws.com",
                UserID = "amagnnno",
                Password = "olaf2016",
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
