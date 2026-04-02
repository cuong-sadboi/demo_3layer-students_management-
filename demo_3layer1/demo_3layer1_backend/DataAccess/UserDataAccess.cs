using demo_3layer1.Models;
using System;
using System.Linq;
using demo_3layer1.Security;

namespace demo_3layer1.DataAccess
{
    public class UserDataAccess
    {
        private readonly AppDbContext _context = new AppDbContext();

        public User GetUser(string username, string password)
        {
            var user = _context.Users.FirstOrDefault(u => u.Username == username);
            if (user == null)
                return null;

            string stored = user.Password ?? string.Empty;

            if (PasswordHasher.IsHashed(stored))
            {
                return PasswordHasher.Verify(stored, password) ? user : null;
            }

            // Legacy plaintext support: compare then upgrade on success
            if (string.Equals(stored, password, StringComparison.Ordinal))
            {
                user.Password = PasswordHasher.HashPassword(password);
                _context.SaveChanges();
                return user;
            }

            return null;
        }

        public User GetByUsername(string username)
        {
            username = (username ?? string.Empty).Trim();
            if (username.Length == 0)
                return null;

            return _context.Users.FirstOrDefault(u => u.Username == username);
        }

        public User EnsureStudentUser(string username, out bool createdNewUser, out string errorMessage)
        {
            createdNewUser = false;
            errorMessage = string.Empty;

            username = (username ?? string.Empty).Trim();
            if (username.Length == 0)
            {
                errorMessage = "Username dang nhap khong hop le.";
                return null;
            }

            var user = GetByUsername(username);
            if (user != null)
            {
                if (!string.Equals(user.Role, "Student", StringComparison.OrdinalIgnoreCase))
                {
                    errorMessage = "Username nay da ton tai nhung khong phai tai khoan Student.";
                    return null;
                }

                return user;
            }

            user = new User
            {
                Username = username,
                Password = PasswordHasher.HashPassword("123456"),
                Role = "Student"
            };

            _context.Users.Add(user);
            _context.SaveChanges();
            createdNewUser = true;
            return user;
        }

        public void SeedDefaultUsers()
        {
            if (!_context.Users.Any())
            {
                _context.Users.Add(new User { Id = 1, Username = "admin1", Password = PasswordHasher.HashPassword("123456"), Role = "Admin" });
                _context.Users.Add(new User { Id = 2, Username = "teacher1", Password = PasswordHasher.HashPassword("123456"), Role = "Teacher" });
                _context.Users.Add(new User { Id = 3, Username = "student1", Password = PasswordHasher.HashPassword("123456"), Role = "Student" });
                _context.SaveChanges();
            }

            // Đảm bảo account Student seed luôn có hồ sơ Student liên kết để đăng nhập được.
            var seededStudent = _context.Users.FirstOrDefault(u => u.Username == "student1");
            if (seededStudent != null && !_context.Students.Any(s => s.UserId == seededStudent.Id))
            {
                _context.Students.Add(new Student
                {
                    Name = "Student Demo",
                    ClassName = "SE-01",
                    Email = "student1@example.local",
                    UserId = seededStudent.Id
                });
                _context.SaveChanges();
            }
        }
    }
}
