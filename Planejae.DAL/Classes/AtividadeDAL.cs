using Planejae.DAL.Util;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Planejae.DAL.Classes
{
    public class AtividadeDAL
    {
        public void GetAll(DataTable datatable)
        {

            var exec = new ProcedureExecuter(datatable);
            exec.Execute("Sp_Atividade_Get");
        }

        public int? InsertUpdate(string descAtividade, 
            int permiteRetrabalho, 
            int permiteAnexo, 
            int defineResponsavel,
            string nome,
            int? diasTermino,
            int? id = null)
        {
            ParList inPars = new ParList();
            
            inPars.Add("@Desc_Atividade", descAtividade);
            inPars.Add("@Id_Usuario_Atualiz", 1);
            //dic.Add("@Dt_Atualiz", "");
            inPars.Add("@Fl_Permite_Retrabalho", permiteRetrabalho);
            inPars.Add("@Fl_Define_Responsavel", defineResponsavel);
            inPars.Add("@Fl_Permite_Anexo", permiteAnexo);
            if(diasTermino.HasValue)inPars.Add("@Nr_Dias_Termino", diasTermino);
            inPars.Add("@Nome", nome);

            ParList outPars = new ParList();
            //outPars.Add("@Id_Atividade", id);

            var exec = new ProcedureExecuter();

            exec.Execute("Sp_Atividade_Ins_Upd", inPars);

            return outPars.First().Value as int?;
        }
    }
}
