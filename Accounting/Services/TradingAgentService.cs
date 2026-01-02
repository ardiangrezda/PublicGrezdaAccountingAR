using Microsoft.EntityFrameworkCore;
using Accounting.Data;
using Accounting.Models;

namespace Accounting.Services
{
    public class TradingAgentService
    {
        private readonly ApplicationDbContext _context;

        public TradingAgentService(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<List<TradingAgent>> GetAllAsync(bool includeInactive = false)
        {
            var query = _context.TradingAgents.AsQueryable();
            
            if (!includeInactive)
            {
                query = query.Where(t => t.IsActive);
            }

            return await query.OrderBy(t => t.Name).ToListAsync();
        }

        public async Task<TradingAgent?> GetByIdAsync(int id)
        {
            return await _context.TradingAgents.FindAsync(id);
        }

        public async Task<TradingAgent> CreateAsync(TradingAgent agent)
        {
            _context.TradingAgents.Add(agent);
            await _context.SaveChangesAsync();
            return agent;
        }

        public async Task<bool> UpdateAsync(TradingAgent agent)
        {
            var existing = await _context.TradingAgents.FindAsync(agent.Id);
            if (existing == null) return false;

            existing.Name = agent.Name;
            existing.Code = agent.Code;
            existing.IsActive = agent.IsActive;

            await _context.SaveChangesAsync();
            return true;
        }

        public async Task<bool> DeleteAsync(int id)
        {
            var agent = await _context.TradingAgents.FindAsync(id);
            if (agent == null) return false;

            // Soft delete by setting IsActive to false
            agent.IsActive = false;
            await _context.SaveChangesAsync();
            return true;
        }
    }
}