using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace Planejae.UI.Models
{
    [Serializable]
    public class AtividadeModel
    {
        public int Id { get; set; }

        [Required]
        [Display(Name = "Nome da Atividade")]
        [StringLength(100, ErrorMessage = "Max 100 caracteres.", MinimumLength = 1)]
        public string Nome { get; set; }

        [Required]
        [Display(Name = "Descricao detalhada atividade")]
        [StringLength(500, ErrorMessage = "Max {0} caracteres. Min {2} caracteres.", MinimumLength = 1)]
        public string Descricao { get; set; }

        [Display(Name = "Quantidade de dias para o termino")]
        public int? DiasTermino { get; set; }

        [Required]
        [Display(Name = "Permite Redirecionamento do Fluxo")]
        public bool FlPermiteRetrabalho { get; set; }

        [Required]
        [Display(Name = "Permite Adicional Responsável de outras Atividades")]
        public bool FlAdicionaProxResponsavel { get; set; }

        [Required]
        [Display(Name = "Aceita Anexos")]
        public bool FlAceitaAnexo { get; set; }


        public AtividadeModel(BLL.Classes.AtividadeBLL.AtividadeRow row)
        {
            if (row == null) return;

            this.FlPermiteRetrabalho = row.Fl_Permite_Retrabalho > 0 ? true : false;
            this.FlAdicionaProxResponsavel = row.Fl_Define_Responsavel > 0 ? true : false;
            this.FlAceitaAnexo = row.Fl_Permite_Anexo > 0 ? true : false;
            this.Descricao = row.Desc_Atividade;
            this.DiasTermino = row.Nr_Dias_Termino;
            this.Id = row.Id_Atividade;
            this.Nome = row.Nome;
        }
    }
}