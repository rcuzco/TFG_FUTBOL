using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using TFG_FUTBOL.DataContext;
using TFG_FUTBOL.Helpers;

namespace TFG_FUTBOL
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddControllersWithViews();
            services.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());
            services.AddDbContext<TfgFutbolDataContext>(options => options.UseSqlServer(Configuration.GetConnectionString("MyDbCnx_Futbol")));
            // configure basic authentication 
            services.AddAuthentication("BasicAuthentication").AddScheme<AuthenticationSchemeOptions, BasicAuthenticationHandler>("BasicAuthentication", null);
            services.AddDistributedMemoryCache(); //This way ASP.NET Core will use a Memory Cache to store session variables
            services.AddSession(options =>
            {
                options.IdleTimeout = TimeSpan.FromDays(1); // It depends on user requirements.
                options.Cookie.Name = ".My.Session"; // Give a cookie name for session which will be visible in request payloads.
            });
            services.AddHttpContextAccessor();

        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
            }
            app.UseStaticFiles();

            app.UseRouting();
            app.UseSession();
            app.UseAuthentication();
            app.UseAuthorization();            
            app.UseEndpoints(endpoints =>
            {
                //endpoints.MapGet("/login", async context =>
                //{
                //    context.Response.Redirect("/USUARIOS/Login");
                //});
                endpoints.MapControllerRoute(name: "default", pattern: "{controller=USUARIOS}/{action=login}/{id?}");
                endpoints.MapControllerRoute(name: "default", pattern: "{controller=USUARIOS}/{action=login}/{dni?}/{id?}");                

            });
        }
    }
}
