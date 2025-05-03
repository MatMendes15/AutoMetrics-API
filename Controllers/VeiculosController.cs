using AutoMetrics_API.Models;
using AutoMetrics_API.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace AutoMetrics_API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class VeiculosController : ControllerBase
    {
        private readonly VeiculoContext _context;

        public VeiculosController(VeiculoContext context)
            => _context = context;


        // GET /api/veiculos
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Veiculo>>> GetVeiculos()
        {
            var veiculos = await _context.Veiculos.ToListAsync();
            return Ok(veiculos);
        }


        // GET /api/veiculos/{id}
        [HttpGet("{id:int}")]
        public async Task<ActionResult<Veiculo>> GetVeiculo(int id)
        {
            var veiculo = await _context.Veiculos.FindAsync(id);
            if (veiculo == null) return NotFound();
            return Ok(veiculo);
        }

        // POST /api/veiculos
        [HttpPost]
        public async Task<ActionResult<Veiculo>> CreateVeiculo(Veiculo v)
        {
            v.DataCadastro = DateTime.UtcNow;
            _context.Veiculos.Add(v);
            await _context.SaveChangesAsync();

            return CreatedAtAction(
                nameof(GetVeiculo),
                new { id = v.Id },
                v
            );
        }

        [HttpPut("{id:int}")]
        public async Task<IActionResult> UpdateVeiculo(int id, Veiculo v)
        {
            var veiculoExistente = await _context.Veiculos.FindAsync(id);
            if (veiculoExistente == null) return NotFound();

            veiculoExistente.Modelo = v.Modelo;
            veiculoExistente.Fabricante = v.Fabricante;
            veiculoExistente.Ano = v.Ano;
            veiculoExistente.TipoCombustivel = v.TipoCombustivel;
            veiculoExistente.ConsumoMedioKmPorLitro = v.ConsumoMedioKmPorLitro;
            veiculoExistente.EmissaoCO2PorKm = v.EmissaoCO2PorKm;

            await _context.SaveChangesAsync();
            return NoContent();
        }

        // DELETE /api/veiculos/{id}
        [HttpDelete("{id:int}")]
        public async Task<IActionResult> DeleteVeiculo(int id)
        {
            var v = await _context.Veiculos.FindAsync(id);
            if (v == null) return NotFound();
            _context.Veiculos.Remove(v);
            await _context.SaveChangesAsync();
            return NoContent();
        }
    }
}
