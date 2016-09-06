using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using Planejae.BLL.Classes;

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

        [Required]
        [Display(Name = "Usuário Inclusão")]
        public string LoginInclusao { get; set; }

        public string IdUsu { get; set; }

        public IEnumerable<ResponsavelModel> Responsveis { get; set; }

        private AtividadeBLL.AtividadeRow Row;

        public AtividadeModel()
        {

        }

        public AtividadeModel(AtividadeBLL.AtividadeRow row)
        {
            if (row == null) return;
            this.Row = row;

            this.FlPermiteRetrabalho = row.Fl_Permite_Retrabalho > 0 ? true : false;
            this.FlAdicionaProxResponsavel = row.Fl_Define_Responsavel > 0 ? true : false;
            this.FlAceitaAnexo = row.Fl_Permite_Anexo > 0 ? true : false;
            this.Descricao = row.Desc_Atividade;
            this.DiasTermino = row.Nr_Dias_Termino;
            this.Id = row.Id_Atividade;
            this.Nome = row.Nome;
            this.LoginInclusao = row.Login_Atualiz;
        }

        public AtividadeBLL.AtividadeRow ToRow()
        {
            if (this.Row != null) return Row;
            var newRow = new AtividadeBLL().Atividade.NewAtividadeRow();

            newRow.Fl_Permite_Retrabalho = this.FlPermiteRetrabalho ? 1 : 0;
            newRow.Fl_Define_Responsavel = this.FlAdicionaProxResponsavel ? 1 : 0;
            newRow.Fl_Permite_Anexo = this.FlAceitaAnexo? 1: 0;
            newRow.Desc_Atividade = this.Descricao;
            if(this.DiasTermino.HasValue)newRow.Nr_Dias_Termino = this.DiasTermino.Value;
            newRow.Id_Atividade = this.Id;
            newRow.Nome = this.Nome;

            return newRow;

        }
    }
}