using Microsoft.EntityFrameworkCore;
using NursingHouseService.Models;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
string fpdb2ConnectionString = builder.Configuration.GetConnectionString("fpdb2"); //"Northwind"為連線字串名稱
builder.Services.AddDbContext<fpdb2Context>(options =>
{
    options.UseSqlServer(connectionString: fpdb2ConnectionString);
});

builder.Services.AddControllers();

string MyAllowOrigins = "AllowAny";
builder.Services.AddCors(options =>
{
    options.AddPolicy(
        name: MyAllowOrigins,
        policy => policy.WithOrigins("*").WithHeaders("*").WithMethods("*")
        );
});
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}
app.UseCors();
app.UseHttpsRedirection();

app.UseStaticFiles();

app.UseAuthorization();

app.MapControllers();

app.Run();
