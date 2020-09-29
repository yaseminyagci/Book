using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Data.Migrations
{
    public partial class miggy : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Comments_Posts_BookId",
                table: "Comments");

            migrationBuilder.DropForeignKey(
                name: "FK_Likes_Posts_BookId",
                table: "Likes");

            migrationBuilder.DropForeignKey(
                name: "FK_Posts_UserDetail_UserId",
                table: "Posts");

            migrationBuilder.DropTable(
                name: "TagPosts");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Posts",
                table: "Posts");

            migrationBuilder.RenameTable(
                name: "Posts",
                newName: "Books");

            migrationBuilder.RenameIndex(
                name: "IX_Posts_UserId",
                table: "Books",
                newName: "IX_Books_UserId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Books",
                table: "Books",
                column: "Id");

            migrationBuilder.CreateTable(
                name: "TagBooks",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    DateCreated = table.Column<DateTime>(nullable: false),
                    DateModified = table.Column<DateTime>(nullable: true),
                    DateDeleted = table.Column<DateTime>(nullable: true),
                    Status = table.Column<byte>(nullable: false),
                    TagId = table.Column<int>(nullable: false),
                    BookId = table.Column<int>(nullable: false),
                    Selected = table.Column<byte>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TagBooks", x => x.Id);
                    table.ForeignKey(
                        name: "FK_TagBooks_Books_BookId",
                        column: x => x.BookId,
                        principalTable: "Books",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_TagBooks_Tags_TagId",
                        column: x => x.TagId,
                        principalTable: "Tags",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_TagBooks_BookId",
                table: "TagBooks",
                column: "BookId");

            migrationBuilder.CreateIndex(
                name: "IX_TagBooks_TagId",
                table: "TagBooks",
                column: "TagId");

            migrationBuilder.AddForeignKey(
                name: "FK_Books_UserDetail_UserId",
                table: "Books",
                column: "UserId",
                principalTable: "UserDetail",
                principalColumn: "UserId",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Comments_Books_BookId",
                table: "Comments",
                column: "BookId",
                principalTable: "Books",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Likes_Books_BookId",
                table: "Likes",
                column: "BookId",
                principalTable: "Books",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Books_UserDetail_UserId",
                table: "Books");

            migrationBuilder.DropForeignKey(
                name: "FK_Comments_Books_BookId",
                table: "Comments");

            migrationBuilder.DropForeignKey(
                name: "FK_Likes_Books_BookId",
                table: "Likes");

            migrationBuilder.DropTable(
                name: "TagBooks");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Books",
                table: "Books");

            migrationBuilder.RenameTable(
                name: "Books",
                newName: "Posts");

            migrationBuilder.RenameIndex(
                name: "IX_Books_UserId",
                table: "Posts",
                newName: "IX_Posts_UserId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Posts",
                table: "Posts",
                column: "Id");

            migrationBuilder.CreateTable(
                name: "TagPosts",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    BookId = table.Column<int>(type: "int", nullable: false),
                    DateCreated = table.Column<DateTime>(type: "datetime2", nullable: false),
                    DateDeleted = table.Column<DateTime>(type: "datetime2", nullable: true),
                    DateModified = table.Column<DateTime>(type: "datetime2", nullable: true),
                    Selected = table.Column<byte>(type: "tinyint", nullable: false),
                    Status = table.Column<byte>(type: "tinyint", nullable: false),
                    TagId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TagPosts", x => x.Id);
                    table.ForeignKey(
                        name: "FK_TagPosts_Posts_BookId",
                        column: x => x.BookId,
                        principalTable: "Posts",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_TagPosts_Tags_TagId",
                        column: x => x.TagId,
                        principalTable: "Tags",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_TagPosts_BookId",
                table: "TagPosts",
                column: "BookId");

            migrationBuilder.CreateIndex(
                name: "IX_TagPosts_TagId",
                table: "TagPosts",
                column: "TagId");

            migrationBuilder.AddForeignKey(
                name: "FK_Comments_Posts_BookId",
                table: "Comments",
                column: "BookId",
                principalTable: "Posts",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Likes_Posts_BookId",
                table: "Likes",
                column: "BookId",
                principalTable: "Posts",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Posts_UserDetail_UserId",
                table: "Posts",
                column: "UserId",
                principalTable: "UserDetail",
                principalColumn: "UserId",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
