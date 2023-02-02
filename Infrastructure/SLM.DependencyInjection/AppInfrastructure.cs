﻿using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.IdentityModel.Protocols;
using SLM.Bussiness.DataServices;
using SLM.Bussiness.DataServices.Interfaces;
using SLM.Data;
using SLM.Data.Interfaces;
using System.Runtime.CompilerServices;

namespace SLM.DependencyInjection
{
    public static class AppInfrastructure
    {
        public static void AppDISetup (this IServiceCollection services, IConfiguration configuration )
        {
           

            //Configure entity framework
            services.AddDbContext<SLManagementDbContext>(
            options => options.
            UseSqlServer(configuration.GetConnectionString("DbConnection")));

            //repositories configuration
            services.AddScoped(typeof (IRepository<>), typeof(Repository<>));

            //all of the custom configuration
            services.AddScoped<ICourseService, CoursesService>();
        }

    }
}