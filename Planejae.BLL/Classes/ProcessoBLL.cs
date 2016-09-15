
using Planejae.DAL.Classes;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace Planejae.BLL.Classes {
    
    
    public partial class ProcessoBLL {

        private ProcessoDAL processoDal = new ProcessoDAL();


        public List<ProcessoRow> GetAll()
        {
            processoDal.GetAll(this.Processo);
            return this.Processo.ToList();
        }


        public int? InsertUpdate(ProcessoRow processoRow)
        {

            return processoDal.InsertUpdate(
                processoRow.Desc_Processo,
                processoRow.Nome,
                processoRow.Id_Usuario_Atualiz);
        }
    }
}
