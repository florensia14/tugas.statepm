# tugas.statepm
to-do list

# To-Do List App

## ✔ Deskripsi Aplikasi
Aplikasi ini adalah aplikasi **to-do list sederhana**.  
Fungsinya untuk menambah, melihat, dan mengelola daftar tugas.  

- Pengguna bisa menambahkan tugas baru lewat halaman **AddTaskPage**.  
- Semua tugas akan ditampilkan di halaman **HomePage**.  
- Setiap tugas ditampilkan dengan widget khusus **TodoItem**.  
- Data tugas disimpan dan dikelola menggunakan **Provider** agar mudah diatur.  

Struktur folder sesuai project:

lib/
│
├── main.dart
│
├── models/
│   └── todo.dart
│
├── providers/
│   └── todo_provider.dart
│
├── screens/
│   ├── add_task_page.dart
│   ├── homepage.dart
│   └── todo_detail.dart
│
└── widgets/
    └── todo_item.dart


## ✔ Pendekatan State Management
Aplikasi ini menggunakan **Provider** untuk mengatur state.  

### Alasan Memilih Provider:
1. **Sederhana** → gampang dipakai dan cocok untuk aplikasi kecil.  
2. **Reaktif** → kalau ada perubahan data di `TodoProvider`, UI otomatis ikut berubah.  
3. **Rapi** → memisahkan logika (provider) dan tampilan (UI).  
4. **Mudah dikembangkan** → kalau nanti aplikasi tambah besar, Provider tetap bisa dipakai.  

<img width="1911" height="742" alt="Cuplikan layar 2025-09-06 064821" src="https://github.com/user-attachments/assets/e850f8cb-bfb5-49b6-a912-c2c1541fa7c6" />
<img width="1916" height="749" alt="Cuplikan layar 2025-09-06 064755" src="https://github.com/user-attachments/assets/02cd39d5-438e-4528-8510-64eacee831da" />
<img width="1919" height="830" alt="Cuplikan layar 2025-09-06 064747" src="https://github.com/user-attachments/assets/8b2a6cfb-edaa-4fb6-9b4f-e9fd88fb0cbd" />
<img width="1914" height="882" alt="Cuplikan layar 2025-09-06 064705" src="https://github.com/user-attachments/assets/258e6952-7ec0-48e3-a6fd-2574afb4857a" />
<img width="1914" height="878" alt="Cuplikan layar 2025-09-06 074137" src="https://github.com/user-attachments/assets/b47ddd8c-8fe3-4630-97b0-8f2acd212fb8" />

























---

