using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using Planejae.BLL.Classes;

namespace Planejae.UI.Models
{
    [Serializable]
    public class ProcessoModel
    {
        public int IdProcesso { get; set; }

        [Required]
        [Display(Name = "Nome do Processo")]
        [StringLength(100, ErrorMessage = "Max 100 caracteres.", MinimumLength = 1)]
        public string Nome { get; set; }

        [Display(Name = "Descrição")]
        [StringLength(1024, ErrorMessage = "Max 1024 caracteres", MinimumLength = 1)]
        public string Descricao { get; set; }

        [Required]
        [Display(Name = "Data de Atualização")]
        [DataType(DataType.Date), DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
        public DateTime Dt_Atualiz { get; set; }

        [Required]
        [Display(Name = "Usuario de Atualização")]
        public string Login_Atualiz { get; set; }

        [Display(Name = "Atividades neste processo")]
        public List<AtividadeModel> Atividades { get; set; }


        public ProcessoModel()
        {
            Atividades = new List<AtividadeModel>();
        }

        public ProcessoModel(ProcessoBLL.ProcessoRow row)
        {            
            this.Nome = row.Nome;
            if(!row.IsDesc_ProcessoNull()) this.Descricao = row.Desc_Processo;
            this.Dt_Atualiz = row.Dt_Atualiz;
            this.Login_Atualiz = row.Login_Atualiz;
            if(!row.IsId_ProcessoNull()) this.IdProcesso = row.Id_Processo;
        }


        public Planejae.BLL.Classes.ProcessoBLL.ProcessoRow ToRow()
        {
            var row = new ProcessoBLL().Processo.NewProcessoRow();

            row.Id_Processo = IdProcesso;
            row.Desc_Processo = Descricao;
            row.Nome = Nome;

            return row;
        }
    }
}