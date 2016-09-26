
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


        public int? InsertUpdate(ProcessoRow processoRow, List<int> idsAtividadesOrdenadas)
        {

            int? id = processoDal.InsertUpdate(
                processoRow.Desc_Processo,
                processoRow.Nome,
                processoRow.Id_Usuario_Atualiz);

            if (id.HasValue) InsertProcessoAtividade(id.Value, idsAtividadesOrdenadas);

            return id;

        }

        public void InsertProcessoAtividade(int idProcesso, List<int> idsAtividade)
        {

            foreach(var id in idsAtividade)
            {
                processoDal.InsertUpdateProcessoAtividade(idProcesso, id);   
            }
        }

        public List<AtividadeBLL.AtividadeRow> GetAllAtividades()
        {
            return new AtividadeBLL().GetAll();
        }

        public List<AtividadeBLL.AtividadeRow> GetAtividadesByIdsList(IEnumerable<int>ids)
        {
            return new AtividadeBLL().GetByIdList(ids);
        }
    }
}
