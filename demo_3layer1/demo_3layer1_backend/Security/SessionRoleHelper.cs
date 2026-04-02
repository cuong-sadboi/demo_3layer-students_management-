using System;

namespace demo_3layer1.Security
{
    public static class SessionRoleHelper
    {
        public static string NormalizeRole(object roleValue)
        {
            return (roleValue as string ?? string.Empty).Trim();
        }

        public static bool IsInRole(object roleValue, params string[] allowedRoles)
        {
            string role = NormalizeRole(roleValue);
            if (role.Length == 0 || allowedRoles == null || allowedRoles.Length == 0)
            {
                return false;
            }

            for (int i = 0; i < allowedRoles.Length; i++)
            {
                if (string.Equals(role, allowedRoles[i], StringComparison.OrdinalIgnoreCase))
                {
                    return true;
                }
            }

            return false;
        }
    }
}
