using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Planejae.UI.Models
{
    [Serializable]
    public class ResponsavelModel
    { 
//verago aqui
        [Required]
        public int Id { get; set; }
    }
}