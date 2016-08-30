
using Planejae.DAL.Classes;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace Planejae.BLL.Classes {
    
    
    public partial class AtividadeBLL {


        public List<AtividadeRow> GetAll()
        {
            return this.Atividade.ToList();
        }
    }

    
}
