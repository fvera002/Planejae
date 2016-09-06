using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Planejae.UI.Models
{
    public class AtividadeResponsavel
    {
        [Display(Name = "Atividade")]
        public AtividadeModel Atividade { set; get; }

        [Display(Name = "Responsável")]
        public ResponsavelModel Responsavel { set; get; }
    }
}