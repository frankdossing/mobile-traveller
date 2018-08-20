using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Cheertravel.Mobile.Migrations
{
    public partial class initial : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "mobile_AspNetRoles",
                columns: table => new
                {
                    Id = table.Column<string>(nullable: false),
                    Name = table.Column<string>(maxLength: 256, nullable: true),
                    NormalizedName = table.Column<string>(maxLength: 256, nullable: true),
                    ConcurrencyStamp = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_mobile_AspNetRoles", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "mobile_AspNetUsers",
                columns: table => new
                {
                    Id = table.Column<string>(nullable: false),
                    UserName = table.Column<string>(maxLength: 256, nullable: true),
                    NormalizedUserName = table.Column<string>(maxLength: 256, nullable: true),
                    Email = table.Column<string>(maxLength: 256, nullable: true),
                    NormalizedEmail = table.Column<string>(maxLength: 256, nullable: true),
                    EmailConfirmed = table.Column<bool>(nullable: false),
                    PasswordHash = table.Column<string>(nullable: true),
                    SecurityStamp = table.Column<string>(nullable: true),
                    ConcurrencyStamp = table.Column<string>(nullable: true),
                    PhoneNumber = table.Column<string>(nullable: true),
                    PhoneNumberConfirmed = table.Column<bool>(nullable: false),
                    TwoFactorEnabled = table.Column<bool>(nullable: false),
                    LockoutEnd = table.Column<DateTimeOffset>(nullable: true),
                    LockoutEnabled = table.Column<bool>(nullable: false),
                    AccessFailedCount = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_mobile_AspNetUsers", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "mobile_LoginTravellers",
                columns: table => new
                {
                    ForeignTravellerKey = table.Column<int>(nullable: false),
                    Id = table.Column<string>(nullable: false),
                    CreatedDateTime = table.Column<DateTime>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_mobile_LoginTravellers", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "mobile_AspNetRoleClaims",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    RoleId = table.Column<string>(nullable: false),
                    ClaimType = table.Column<string>(nullable: true),
                    ClaimValue = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_mobile_AspNetRoleClaims", x => x.Id);
                    table.ForeignKey(
                        name: "FK_mobile_AspNetRoleClaims_mobile_AspNetRoles_RoleId",
                        column: x => x.RoleId,
                        principalTable: "mobile_AspNetRoles",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "mobile_AspNetUserClaims",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    UserId = table.Column<string>(nullable: false),
                    ClaimType = table.Column<string>(nullable: true),
                    ClaimValue = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_mobile_AspNetUserClaims", x => x.Id);
                    table.ForeignKey(
                        name: "FK_mobile_AspNetUserClaims_mobile_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "mobile_AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "mobile_AspNetUserLogins",
                columns: table => new
                {
                    LoginProvider = table.Column<string>(maxLength: 128, nullable: false),
                    ProviderKey = table.Column<string>(maxLength: 128, nullable: false),
                    ProviderDisplayName = table.Column<string>(nullable: true),
                    UserId = table.Column<string>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_mobile_AspNetUserLogins", x => new { x.LoginProvider, x.ProviderKey });
                    table.ForeignKey(
                        name: "FK_mobile_AspNetUserLogins_mobile_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "mobile_AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "mobile_AspNetUserRoles",
                columns: table => new
                {
                    UserId = table.Column<string>(nullable: false),
                    RoleId = table.Column<string>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_mobile_AspNetUserRoles", x => new { x.UserId, x.RoleId });
                    table.ForeignKey(
                        name: "FK_mobile_AspNetUserRoles_mobile_AspNetRoles_RoleId",
                        column: x => x.RoleId,
                        principalTable: "mobile_AspNetRoles",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_mobile_AspNetUserRoles_mobile_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "mobile_AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "mobile_AspNetUserTokens",
                columns: table => new
                {
                    UserId = table.Column<string>(nullable: false),
                    LoginProvider = table.Column<string>(maxLength: 128, nullable: false),
                    Name = table.Column<string>(maxLength: 128, nullable: false),
                    Value = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_mobile_AspNetUserTokens", x => new { x.UserId, x.LoginProvider, x.Name });
                    table.ForeignKey(
                        name: "FK_mobile_AspNetUserTokens_mobile_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "mobile_AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_mobile_AspNetRoleClaims_RoleId",
                table: "mobile_AspNetRoleClaims",
                column: "RoleId");

            migrationBuilder.CreateIndex(
                name: "RoleNameIndex",
                table: "mobile_AspNetRoles",
                column: "NormalizedName",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_mobile_AspNetUserClaims_UserId",
                table: "mobile_AspNetUserClaims",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_mobile_AspNetUserLogins_UserId",
                table: "mobile_AspNetUserLogins",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_mobile_AspNetUserRoles_RoleId",
                table: "mobile_AspNetUserRoles",
                column: "RoleId");

            migrationBuilder.CreateIndex(
                name: "EmailIndex",
                table: "mobile_AspNetUsers",
                column: "NormalizedEmail");

            migrationBuilder.CreateIndex(
                name: "UserNameIndex",
                table: "mobile_AspNetUsers",
                column: "NormalizedUserName",
                unique: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "mobile_AspNetRoleClaims");

            migrationBuilder.DropTable(
                name: "mobile_AspNetUserClaims");

            migrationBuilder.DropTable(
                name: "mobile_AspNetUserLogins");

            migrationBuilder.DropTable(
                name: "mobile_AspNetUserRoles");

            migrationBuilder.DropTable(
                name: "mobile_AspNetUserTokens");

            migrationBuilder.DropTable(
                name: "mobile_LoginTravellers");

            migrationBuilder.DropTable(
                name: "mobile_AspNetRoles");

            migrationBuilder.DropTable(
                name: "mobile_AspNetUsers");
        }
    }
}
