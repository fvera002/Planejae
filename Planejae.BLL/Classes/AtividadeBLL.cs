
using Planejae.DAL.Classes;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace Planejae.BLL.Classes {
    
    
    public partial class AtividadeBLL {
        partial class AtividadeDataTable
        {
        }

        private AtividadeDAL Dal = new AtividadeDAL();

        public List<AtividadeRow> GetAll()
        {
            Dal.GetAll(this.Atividade);
            return this.Atividade.ToList();
        }

        public int? InsertUpdate(AtividadeRow row)
        {
            return Dal.InsertUpdate(row.Desc_Atividade,
                row.Fl_Permite_Retrabalho,
                row.Fl_Permite_Anexo,
                row.Fl_Define_Responsavel,
                row.Nome,
                row.IsNr_Dias_TerminoNull() ? null as int? : row.Nr_Dias_Termino);
        }
    }

    
}
