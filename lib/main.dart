import 'package:flutter/material.dart';

// 1. Tạo class Student gồm String name, String? email, String? phone.
class Student {
  String name;
  String? email;
  String? phone;

  Student(this.name, this.email, this.phone);
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StudentListScreen(),
    );
  }
}

class StudentListScreen extends StatelessWidget {
  // 2. Tạo list 5 sinh viên, trong đó có vài người thiếu email hoặc số điện thoại (null).
  final List<Student> students = [
    Student('Nguyễn Văn An', 'an@sv.edu.vn', '0901 234 567'),
    Student('Trần Thị Bình', null, '0912 888 999'),
    Student('Lê Minh Chi', 'chi@sv.edu.vn', null),
    Student('Phạm Quốc Dũng', null, null),
    Student('Võ Thanh Em', 'em@sv.edu.vn', '0933 111 222'),
  ];

  StudentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 5. Dùng for để đếm số sinh viên thiếu email
    int missingEmailCount = 0;
    for (var student in students) {
      if (student.email == null) {
        missingEmailCount++;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách sinh viên'),
        backgroundColor: const Color(0xFF274374), // Màu xanh đen như thiết kế
        foregroundColor: Colors.white,
      ),
      body: Container(
        color: const Color(0xFFF3F4F6), // Màu nền xám nhạt
        child: Column(
          children: [
            const SizedBox(height: 16),
            // 3. Dùng for để tạo các thẻ sinh viên trong danh sách
            for (var student in students)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      student.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    // 4. Nếu một trường bị null thì hiện chữ "Chưa cập nhật", dùng toán tử ??
                    Row(
                      children: [
                        const Text(
                          'Email: ',
                          style: TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                        Text(
                          student.email ?? 'Chưa cập nhật',
                          style: TextStyle(
                            color: student.email == null
                                ? Colors.red
                                : Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Text(
                          'SĐT: ',
                          style: TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                        Text(
                          student.phone ?? 'Chưa cập nhật',
                          style: TextStyle(
                            color: student.phone == null
                                ? Colors.red
                                : Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

            const SizedBox(height: 16),

            // Phần hiển thị tổng kết ở cuối danh sách
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F0FE), // Màu nền xanh nhạt
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tổng: ${students.length} sinh viên',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF274374),
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        'Thiếu email: ',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF274374),
                        ),
                      ),
                      Text(
                        '$missingEmailCount',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
