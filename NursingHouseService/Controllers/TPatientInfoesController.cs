using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NursingHouseService.DTO;
using NursingHouseService.Models;

namespace NursingHouseService.Controllers
{

    [EnableCors("AllowAny")]
    [Route("api/[controller]")]
    [ApiController]
    public class TPatientInfoesController : ControllerBase
    {
        private readonly fpdb2Context _context;

        public TPatientInfoesController(fpdb2Context context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<IEnumerable<PatientLoginDTO>> GetTPatientInfo()
        {
            return  _context.TPatientInfo.Select(emp=>new PatientLoginDTO
            {
                P身分證字號=emp.P身分證字號,
                P聯絡電話=emp.P聯絡電話,
            });
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<TPatientInfo>> GetTPatientInfo(int id)
        {
            var tPatientInfo = await _context.TPatientInfo.FindAsync(id);

            if (tPatientInfo == null)
            {
                return NotFound();
            }

            return tPatientInfo;
        }

        // PUT: api/TPatientInfoes/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutTPatientInfo(int id, TPatientInfo tPatientInfo)
        {
            if (id != tPatientInfo.PId)
            {
                return BadRequest();
            }

            _context.Entry(tPatientInfo).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TPatientInfoExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/TPatientInfoes
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<TPatientInfo>> PostTPatientInfo(TPatientInfo tPatientInfo)
        {
            _context.TPatientInfo.Add(tPatientInfo);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetTPatientInfo", new { id = tPatientInfo.PId }, tPatientInfo);
        }

        // DELETE: api/TPatientInfoes/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteTPatientInfo(int id)
        {
            var tPatientInfo = await _context.TPatientInfo.FindAsync(id);
            if (tPatientInfo == null)
            {
                return NotFound();
            }

            _context.TPatientInfo.Remove(tPatientInfo);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool TPatientInfoExists(int id)
        {
            return _context.TPatientInfo.Any(e => e.PId == id);
        }
    }
}
