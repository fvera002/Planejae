using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using Planejae.BLL.Classes;

namespace Planejae.UI.Models
{
    [Serializable]
    public class ProjetoModel
    {
        public int Id {get;set;}

        [Required]
        [Display(Name="Nome do Processo")]
        [StringLength(100, ErrorMessage="Max 100 caracteres.", MinimumLength=1)]
        string Nome { get; set; }

        [Display(Name = "Descrição")]
        [StringLength(1024, ErrorMessage = "Max 1024 caracteres", MinimumLength = 1)]
        public string Descricao { get; set; }

        [Required]
        [Display(Name = "Data de Atualização")]
        [DataType(DataType.Date), DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
        DateTime Dt_Atualiz { get; set; }

        public ProjetoModel()
        {}

    }
}