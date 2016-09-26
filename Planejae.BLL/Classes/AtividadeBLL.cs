
using Planejae.DAL.Classes;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace Planejae.BLL.Classes {
    
    
    public partial class AtividadeBLL {
        partial class ResponsavelDataTable
        {
        }
    
        partial class AtividadeDataTable
        {
        }

        private AtividadeDAL atividadeDal = new AtividadeDAL();
        private ResponsavelDAL responsavelDal = new ResponsavelDAL();

        public List<AtividadeRow> GetByIdList(IEnumerable<int> ids)
        {    
            foreach(var id in ids)
            {
                atividadeDal.GetById(this.Atividade, id);
            }
            return this.Atividade.ToList();

        }

        public List<ResponsavelRow> GetResponsaveis()
        {
            responsavelDal.GetAll(this.Responsavel);

            return this.Responsavel.ToList();

        }

        public List<AtividadeRow> GetAll()
        {
            atividadeDal.GetAll(this.Atividade);
            return this.Atividade.ToList();
        }

        public int? InsertUpdate(AtividadeRow atividadeRow, List<string> idResponsaveis)
        {
            var idAtividade = atividadeDal.InsertUpdate(atividadeRow.Desc_Atividade,
                atividadeRow.Fl_Permite_Retrabalho,
                atividadeRow.Fl_Permite_Anexo,
                atividadeRow.Fl_Define_Responsavel,
                atividadeRow.Nome,
                atividadeRow.IsNr_Dias_TerminoNull() ? null as int? : atividadeRow.Nr_Dias_Termino,
                atividadeRow.Id_Usuario_Atualiz);

            if (!idAtividade.HasValue) return null;
            foreach(var idUsu in idResponsaveis)
            {
                responsavelDal.InsertUpdate(idAtividade.Value,
                    idUsu,
                    atividadeRow.Id_Usuario_Atualiz,
                    null);
            }
            return idAtividade;
        }
    }

    
}
