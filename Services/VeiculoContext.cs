using Microsoft.EntityFrameworkCore;
using AutoMetrics_API.Models;

namespace AutoMetrics_API.Services
{
    public class VeiculoContext : DbContext
    {
        public VeiculoContext(DbContextOptions<VeiculoContext> options) : base(options)
        {
        }

        public DbSet<Veiculo> Veiculos { get; set; }

    }
}
