
using Planejae.DAL.Classes;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace Planejae.BLL.Classes {
    
    
    public partial class AtividadeBLL {

        private AtividadeDAL Dal = new AtividadeDAL();

        public List<AtividadeRow> GetAll()
        {
            Dal.GetAll(this.Atividade);
            return this.Atividade.ToList();
        }
    }

    
}
