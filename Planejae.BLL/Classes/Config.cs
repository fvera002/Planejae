using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Planejae.BLL.Classes
{
    public class Config
    {
        public static void SetConnectionString(string connectionString)
        {
            DAL.Util.Connection.SetStringConnection(connectionString);
        }
    }
}
