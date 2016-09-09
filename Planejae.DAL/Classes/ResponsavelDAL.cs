using Planejae.DAL.Util;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Planejae.DAL.Classes
{
    public class ResponsavelDAL
    {
        public void GetAll(DataTable datatable)
        {

            var exec = new ProcedureExecuter(datatable);
            exec.Execute("Sp_Responsavel_Get");
        }

        public void InsertUpdate(int idAtividade, string idUsuario, string idUsuarioAtualiz, string descResponsabilidade)
        {
            var exec = new ProcedureExecuter();
            var pars = new ParList();

            pars.Add("@Id_Atividade", idAtividade);
            pars.Add("@Id_Usuario", idUsuario);
            pars.Add("@Id_Usuario_Atualiz", idUsuarioAtualiz);
            if(!string.IsNullOrEmpty(descResponsabilidade))pars.Add("@Desc_Responsabilidade", descResponsabilidade);

            exec.Execute("Sp_Atividade_Responsavel_Ins_Upd", pars);
        }
    }
}
