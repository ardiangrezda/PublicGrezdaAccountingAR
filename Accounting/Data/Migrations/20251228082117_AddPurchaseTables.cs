using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Accounting.Data.Migrations
{
    /// <inheritdoc />
    public partial class AddPurchaseTables : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "PurchaseCategories",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Code = table.Column<string>(type: "nvarchar(20)", maxLength: 20, nullable: true),
                    IsActive = table.Column<bool>(type: "bit", nullable: false),
                    NameStringId = table.Column<int>(type: "int", nullable: true),
                    DescriptionStringId = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PurchaseCategories", x => x.Id);
                    table.ForeignKey(
                        name: "FK_PurchaseCategories_LocalizationStrings_DescriptionStringId",
                        column: x => x.DescriptionStringId,
                        principalTable: "LocalizationStrings",
                        principalColumn: "StringId");
                    table.ForeignKey(
                        name: "FK_PurchaseCategories_LocalizationStrings_NameStringId",
                        column: x => x.NameStringId,
                        principalTable: "LocalizationStrings",
                        principalColumn: "StringId");
                });

            migrationBuilder.CreateTable(
                name: "TradingAgents",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    Code = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    IsActive = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TradingAgents", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "PurchaseInvoices",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    InvoiceNumber = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    InvoiceDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    InvoiceExpiryDate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    SupplierId = table.Column<int>(type: "int", nullable: false),
                    SupplierCode = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    SupplierName = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    TotalWithoutVAT = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    TotalVATAmount = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    TotalWithVAT = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    TotalDiscountAmount = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    IsCancelled = table.Column<bool>(type: "bit", nullable: false),
                    CancellationReason = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true),
                    IsPosted = table.Column<bool>(type: "bit", nullable: false),
                    PostedDate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    CreatedByUserId = table.Column<string>(type: "nvarchar(450)", maxLength: 450, nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    LastModifiedByUserId = table.Column<string>(type: "nvarchar(450)", maxLength: 450, nullable: true),
                    LastModifiedAt = table.Column<DateTime>(type: "datetime2", nullable: true),
                    PurchaseCategoryId = table.Column<int>(type: "int", nullable: false),
                    BusinessUnitId = table.Column<int>(type: "int", nullable: false),
                    SequentialNumber = table.Column<int>(type: "int", nullable: false),
                    IsReturn = table.Column<bool>(type: "bit", nullable: false),
                    OriginalInvoiceId = table.Column<int>(type: "int", nullable: true),
                    OriginalInvoiceNumber = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    ReturnReason = table.Column<string>(type: "nvarchar(500)", maxLength: 500, nullable: true),
                    Shipment = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: true),
                    TradingAgentId = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PurchaseInvoices", x => x.Id);
                    table.ForeignKey(
                        name: "FK_PurchaseInvoices_AspNetUsers_CreatedByUserId",
                        column: x => x.CreatedByUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_PurchaseInvoices_AspNetUsers_LastModifiedByUserId",
                        column: x => x.LastModifiedByUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_PurchaseInvoices_BusinessUnits_BusinessUnitId",
                        column: x => x.BusinessUnitId,
                        principalTable: "BusinessUnits",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_PurchaseInvoices_PurchaseCategories_PurchaseCategoryId",
                        column: x => x.PurchaseCategoryId,
                        principalTable: "PurchaseCategories",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_PurchaseInvoices_PurchaseInvoices_OriginalInvoiceId",
                        column: x => x.OriginalInvoiceId,
                        principalTable: "PurchaseInvoices",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_PurchaseInvoices_Subjects_SupplierId",
                        column: x => x.SupplierId,
                        principalTable: "Subjects",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_PurchaseInvoices_TradingAgents_TradingAgentId",
                        column: x => x.TradingAgentId,
                        principalTable: "TradingAgents",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "PurchaseInvoiceItems",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    PurchaseInvoiceId = table.Column<int>(type: "int", nullable: false),
                    ArticleId = table.Column<int>(type: "int", nullable: false),
                    Barcode = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    ArticleCode = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    Description = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    Quantity = table.Column<decimal>(type: "decimal(18,3)", nullable: false),
                    UnitId = table.Column<int>(type: "int", nullable: false),
                    UnitCode = table.Column<string>(type: "nvarchar(20)", maxLength: 20, nullable: false),
                    PriceWithoutVAT = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    PriceWithVAT = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    DiscountPercent = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    DiscountAmount = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    VATPercent = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    VATAmount = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    ValueWithoutVAT = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    ValueWithVAT = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    CurrencyId = table.Column<int>(type: "int", nullable: true),
                    CurrencyCode = table.Column<string>(type: "nvarchar(3)", maxLength: 3, nullable: false),
                    ExchangeRate = table.Column<decimal>(type: "decimal(18,4)", nullable: false),
                    OriginalInvoiceItemId = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PurchaseInvoiceItems", x => x.Id);
                    table.ForeignKey(
                        name: "FK_PurchaseInvoiceItems_Articles_ArticleId",
                        column: x => x.ArticleId,
                        principalTable: "Articles",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_PurchaseInvoiceItems_Currencies_CurrencyId",
                        column: x => x.CurrencyId,
                        principalTable: "Currencies",
                        principalColumn: "CurrencyId");
                    table.ForeignKey(
                        name: "FK_PurchaseInvoiceItems_PurchaseInvoiceItems_OriginalInvoiceItemId",
                        column: x => x.OriginalInvoiceItemId,
                        principalTable: "PurchaseInvoiceItems",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_PurchaseInvoiceItems_PurchaseInvoices_PurchaseInvoiceId",
                        column: x => x.PurchaseInvoiceId,
                        principalTable: "PurchaseInvoices",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_PurchaseInvoiceItems_Units_UnitId",
                        column: x => x.UnitId,
                        principalTable: "Units",
                        principalColumn: "UnitId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_PurchaseCategories_DescriptionStringId",
                table: "PurchaseCategories",
                column: "DescriptionStringId");

            migrationBuilder.CreateIndex(
                name: "IX_PurchaseCategories_NameStringId",
                table: "PurchaseCategories",
                column: "NameStringId");

            migrationBuilder.CreateIndex(
                name: "IX_PurchaseInvoiceItems_ArticleId",
                table: "PurchaseInvoiceItems",
                column: "ArticleId");

            migrationBuilder.CreateIndex(
                name: "IX_PurchaseInvoiceItems_CurrencyId",
                table: "PurchaseInvoiceItems",
                column: "CurrencyId");

            migrationBuilder.CreateIndex(
                name: "IX_PurchaseInvoiceItems_OriginalInvoiceItemId",
                table: "PurchaseInvoiceItems",
                column: "OriginalInvoiceItemId");

            migrationBuilder.CreateIndex(
                name: "IX_PurchaseInvoiceItems_PurchaseInvoiceId",
                table: "PurchaseInvoiceItems",
                column: "PurchaseInvoiceId");

            migrationBuilder.CreateIndex(
                name: "IX_PurchaseInvoiceItems_UnitId",
                table: "PurchaseInvoiceItems",
                column: "UnitId");

            migrationBuilder.CreateIndex(
                name: "IX_PurchaseInvoices_BusinessUnitId",
                table: "PurchaseInvoices",
                column: "BusinessUnitId");

            migrationBuilder.CreateIndex(
                name: "IX_PurchaseInvoices_CreatedByUserId",
                table: "PurchaseInvoices",
                column: "CreatedByUserId");

            migrationBuilder.CreateIndex(
                name: "IX_PurchaseInvoices_LastModifiedByUserId",
                table: "PurchaseInvoices",
                column: "LastModifiedByUserId");

            migrationBuilder.CreateIndex(
                name: "IX_PurchaseInvoices_OriginalInvoiceId",
                table: "PurchaseInvoices",
                column: "OriginalInvoiceId");

            migrationBuilder.CreateIndex(
                name: "IX_PurchaseInvoices_PurchaseCategoryId",
                table: "PurchaseInvoices",
                column: "PurchaseCategoryId");

            migrationBuilder.CreateIndex(
                name: "IX_PurchaseInvoices_SupplierId",
                table: "PurchaseInvoices",
                column: "SupplierId");

            migrationBuilder.CreateIndex(
                name: "IX_PurchaseInvoices_TradingAgentId",
                table: "PurchaseInvoices",
                column: "TradingAgentId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "PurchaseInvoiceItems");

            migrationBuilder.DropTable(
                name: "PurchaseInvoices");

            migrationBuilder.DropTable(
                name: "PurchaseCategories");

            migrationBuilder.DropTable(
                name: "TradingAgents");
        }
    }
}
