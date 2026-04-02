using demo_3layer1.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using demo_3layer1.DataAccess;

namespace demo_3layer1.Business
{
    public class StudentBusiness
    {
        private readonly StudentDataAccess _data = new StudentDataAccess();
        private readonly UserDataAccess _userData = new UserDataAccess();
        public Student GetByUserId(int userId) => _data.GetByUserId(userId);

        // Lấy tất cả sinh viên
        public List<Student> GetAllStudents()
        {
            return _data.GetAllStudents();
        }

        // Lấy sinh viên theo ID
        public Student GetStudentById(int id)
        {
            return _data.GetStudentById(id);
        }

        // Thêm sinh viên – có kiểm tra logic nghiệp vụ
        public string AddStudent(Student s, string username)
        {
            if (s == null)
                return "Du lieu sinh vien khong hop le.";

            username = (username ?? string.Empty).Trim();

            if (string.IsNullOrWhiteSpace(s.Name) && string.IsNullOrWhiteSpace(s.ClassName) && string.IsNullOrWhiteSpace(s.Email))
            {
                return "Vui lòng nhập dữ liệu.";
            }
            if (string.IsNullOrWhiteSpace(username))
                return "Username dang nhap khong duoc de trong.";

            if (!IsValidUsername(username))
                return "Username chi duoc gom chu cai, so, dau cham, gach duoi, gach ngang (4-30 ky tu).";

            // Kiểm tra dữ liệu
            if (string.IsNullOrWhiteSpace(s.Name))
                return "Tên sinh viên không được để trống.";

            if (string.IsNullOrWhiteSpace(s.Email))
                return "Email không được để trống.";

            if (!IsValidEmail(s.Email))
                return "Định dạng email không hợp lệ.";

            // Kiểm tra trùng email (nếu có)

            var existing = _data.GetAllStudents()
             .FirstOrDefault(x => x.Email.Equals(s.Email, StringComparison.OrdinalIgnoreCase));
            if (existing != null)
                return "Email này đã được sử dụng.";

            bool createdNewUser;
            string userError;
            var user = _userData.EnsureStudentUser(username, out createdNewUser, out userError);
            if (user == null)
                return userError;

            var linkedStudent = _data.GetByUserId(user.Id);
            if (linkedStudent != null)
                return "Username nay da duoc lien ket voi mot sinh vien khac.";

            s.UserId = user.Id;

            // Hợp lệ → thêm mới
            _data.AddStudent(s);
            if (createdNewUser)
                return "Thêm sinh viên thành công! Da tao tai khoan dang nhap Student voi mat khau mac dinh 123456.";

            return "Thêm sinh viên thành công!";
        }

        public string AddStudent(Student s)
        {
            return AddStudent(s, string.Empty);
        }

        // Cập nhật sinh viên – có kiểm tra logic
        public string UpdateStudent(Student s)
        {
            if (string.IsNullOrWhiteSpace(s.Name) && string.IsNullOrWhiteSpace(s.ClassName) && string.IsNullOrWhiteSpace(s.Email))
            {
                return "Vui lòng không để trống dữ liệu.";
            }
            if (string.IsNullOrWhiteSpace(s.Name))
                return "Tên sinh viên không được để trống.";

            if (string.IsNullOrWhiteSpace(s.Email))
                return "Email không được để trống.";

            if (!IsValidEmail(s.Email))
                return "Định dạng email không hợp lệ.";

            _data.UpdateStudent(s);
            return "Cập nhật thông tin sinh viên thành công!";
        }

        // Xóa sinh viên
        public string DeleteStudent(int id)
        {
            var existing = _data.GetStudentById(id);
            if (existing == null)
                return "Không tìm thấy sinh viên cần xóa.";

            _data.DeleteStudent(id);
            return "Đã xóa sinh viên thành công.";
        }

        // Hàm kiểm tra định dạng email
        private bool IsValidEmail(string email)
        {
            if (string.IsNullOrEmpty(email)) return false;
            return Regex.IsMatch(email, @"^[^@\s]+@[^@\s]+\.[^@\s]+$");
        }

        private bool IsValidUsername(string username)
        {
            return Regex.IsMatch(username, @"^[a-zA-Z0-9._-]{4,30}$");
        }
    }
}
