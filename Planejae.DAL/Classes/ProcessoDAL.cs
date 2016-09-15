using Planejae.DAL.Util;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Planejae.DAL.Classes
{
    public class ProcessoDAL
    {
        public void GetAll(DataTable datatable)
        {

            var exec = new ProcedureExecuter(datatable);
            exec.Execute("Sp_Processo_Get");
        }

        public int? InsertUpdate(string descProcesso,
            string nome,
            string idUsu,
            int? id = null
            )
        {
            ParList inPars = new ParList();

            inPars.Add("@Desc_Processo", descProcesso);
            inPars.Add("@Id_Usuario_Atualiz", idUsu);
            //dic.Add("@Dt_Atualiz", "");
            inPars.Add("@Nome", nome);

            ParList outPars = new ParList();
            outPars.Add("@Id_Processo", id);

            var exec = new ProcedureExecuter();

            exec.Execute("Sp_Processo_Ins_Upd", inPars, ref outPars);

            if (outPars.Count == 0) return null;
            var ret = outPars.First().Value.ToString();
            if (string.IsNullOrEmpty(ret)) return null;
            return int.Parse(ret);
        }
    }
}
