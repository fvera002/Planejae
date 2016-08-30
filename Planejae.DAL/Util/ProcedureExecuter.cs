using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Planejae.DAL.Util
{
    public class ProcedureExecuter
    {
        private DataTable CurrentDataTable;

        public ProcedureExecuter()
        {

        }

        public ProcedureExecuter(DataTable dataTable)
        {
            this.CurrentDataTable = dataTable;
        }

        public void Execute(string procedureName)
        {
            using (var conn = Connection.GetInstance())
            using (var cmd = new SqlCommand(procedureName))
            {
                conn.Open();

                using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                {
                    adapter.Fill(this.CurrentDataTable);
                }
            }
        }
    }
}
