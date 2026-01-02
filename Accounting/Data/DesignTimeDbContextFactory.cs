using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using Microsoft.Extensions.Configuration;
using Accounting.Data;
using System.IO;

public class DesignTimeDbContextFactory : IDesignTimeDbContextFactory<ApplicationDbContext>
{
    public ApplicationDbContext CreateDbContext(string[] args)
    {
        // Get the actual project directory (where appsettings.json is located)
        var basePath = Directory.GetCurrentDirectory();
        
        // Build config - ONLY load appsettings.json (not Development)
        var config = new ConfigurationBuilder()
            .SetBasePath(basePath)
            .AddJsonFile("appsettings.json", optional: false, reloadOnChange: true)
            .AddEnvironmentVariables()
            .Build();

        // Get database provider from config
        var optionsBuilder = new DbContextOptionsBuilder<ApplicationDbContext>();
        var provider = config.GetValue<string>("DatabaseProvider") ?? "SqlServer";
        
        if (provider.Equals("Sqlite", StringComparison.OrdinalIgnoreCase))
        {
            optionsBuilder.UseSqlite(config.GetConnectionString("SqliteConnection"));
        }
        else
        {
            optionsBuilder.UseSqlServer(config.GetConnectionString("DefaultConnection"));
        }
        
        return new ApplicationDbContext(optionsBuilder.Options);
    }
}