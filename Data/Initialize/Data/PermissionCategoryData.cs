using System;
using System.Collections.Generic;
using System.Linq;
using Core.Enums;
using Data.Entities.Identity;

namespace Data.Initialize.Data
{
    public static partial class InitializeData
    {

        public static List<PermissionCategory> BuildPermissionCategories(ApplicationDbContext context)
        {
            var permissions = context.Permissions.ToList();
            List<PermissionCategory> categories = new List<PermissionCategory>();





            return categories;
        }


    }
}
