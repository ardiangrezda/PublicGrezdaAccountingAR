# Grezda Accounting System (Demo)

A demo accounting system built with Blazor Server and .NET 8.

## Features

- **Sales Management** - Create and manage sales invoices
- **Purchase Management** - Track purchase invoices
- **Subjects** - Manage buyers and suppliers
- **Articles** - Product catalog with pricing and stock
- **User Management** - Role-based access control
- **Multi-language** - English, Albanian, Serbian

## Requirements

- [.NET 8.0 SDK](https://dotnet.microsoft.com/download/dotnet/8.0)
- [SQL Server 2019+](https://www.microsoft.com/en-us/sql-server/sql-server-downloads) (Express edition is fine)
- [Git](https://git-scm.com/downloads)

## Setup Instructions

### 1. Clone the Repository
`git clone https://github.com/ardiangrezda/PublicGrezdaAccountingAR`

`cd PublicGrezdaAccountingAR/Accounting`

### 2. Configure Database

**⚠️ IMPORTANT: Never commit `appsettings.json` to version control!**

Copy the template and update with your SQL Server details:

`copy ..\appsettings.Template.json appsettings.json`

Copy `appsettings.Template.json` to `appsettings.json` and update your SQL Server name:

	{ "ConnectionStrings": {	
		"DefaultConnection": "Server=YOUR_SERVER\SQLEXPRESS;Database=GrezdaAccountingPublicDB;Trusted_Connection=True;TrustServerCertificate=True;MultipleActiveResultSets=true" 
		},	
		"DatabaseProvider": "SqlServer"
	}

**Replace `YOUR_SERVER` with your computer name or SQL Server instance.**

Edit `appsettings.json` and replace `YOUR_SERVER` with your actual server name.

### 3. Create Database

- Create database and tables

	`dotnet ef database update`
- Add sample data (users, roles, modules)

	`sqlcmd -S "YOUR_SERVER\SQLEXPRESS" -i "seed-data.sql"`

### 4. Run the Application

- dotnet run

	Open your browser: `http://localhost:5090`

### 5. Login

- **Username**: `admin`
- **Email**: `admin@accounting.com`
- **Password**: `Admin123!%a1`

## Useful Scripts

### Reset Database

If you need to start fresh:

- Drop database

	`sqlcmd -S "YOUR_SERVER\SQLEXPRESS" -i "drop-database.sql"`
- Recreate

	`dotnet ef database update`
- Reseed data
    
	`sqlcmd -S "YOUR_SERVER\SQLEXPRESS" -i "seed-data.sql"`

### Clear Data Only

- To keep tables but clear all data:

	`sqlcmd -S "YOUR_SERVER\SQLEXPRESS" -d "GrezdaAccountingPublicDB" -Q " DELETE FROM UserSettings; DELETE FROM UserModuleAccesses; DELETE FROM UserBusinessUnits; DELETE FROM CompanySettings; DELETE FROM LocalizationStrings; DELETE FROM Submodules; DELETE FROM Modules; DELETE FROM BusinessUnits; DELETE FROM Languages; DELETE FROM Currencies; DELETE FROM AspNetUserRoles; DELETE FROM AspNetUsers; DELETE FROM AspNetRoles; "`


- Then reseed

	`sqlcmd -S "YOUR_SERVER\SQLEXPRESS" -i "seed-data.sql"`

## Project Structure

`PublicGrezdaAccountingAR/`

	├── Accounting/ │
	├── Data/                   # Database context │
	├── Models/                 # Entity models │
	├── Pages/                  # Blazor pages │
	├── Services/               # Business logic │
	├── appsettings.json        # Configuration (DO NOT COMMIT) │
	├── seed-data.sql           # Sample data script │
	└── drop-database.sql       # Database cleanup script 
	└── README.md

## What's Included in seed-data.sql

- 3 Roles (Admin, Accountant, User)
- 1 Admin user
- 3 Languages (English, Albanian, Serbian)
- 3 Currencies (EUR, USD, ALL)
- 1 Sample business unit
- 8 Modules and 20 Submodules
- Company settings
- User permissions

## Troubleshooting

**Database connection failed?**
- Check your SQL Server instance name with:

   `sqlcmd -L`
- Make sure SQL Server is running

**Migration errors?**
- Clean and rebuild:

  `dotnet clean && dotnet build`
- Remove migrations: 
  
  `dotnet ef migrations remove`

**Port already in use?**
- Change ports in

  `Properties/launchSettings.json`

## Security Note

⚠️ **Never commit `appsettings.json`** to Git - it contains sensitive connection strings.

## Tech Stack

- .NET 8.0
- Blazor Server
- Entity Framework Core
- SQL Server
- ASP.NET Core Identity
- Bootstrap 5

## License

Demo version for educational purposes.

---

**Questions?** Open an issue on [GitHub](https://github.com/ardiangrezda/PublicGrezdaAccountingAR)

