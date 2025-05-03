using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AutoMetrics_API.Models
{
    public class Veiculo
    {
        [Key]
        public int Id { get; set; }

        [Required]
        public string Modelo { get; set; }

        [Required]
        public string Fabricante { get; set; }

        public int Ano { get; set; }

        public string TipoCombustivel { get; set; }

        public DateTime DataCadastro { get; set; }

        [Column(TypeName = "decimal(10,2)")]
        public decimal ConsumoMedioKmPorLitro { get; set; }

        [Column(TypeName = "decimal(10,2)")]
        public decimal EmissaoCO2PorKm { get; set; }

    }
}
