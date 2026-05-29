# Requirements Document

## Akses Legal Indonesia — Dashboard Web Application (Unified Corporate Edition)

---

## Introduction

Akses Legal Indonesia Dashboard adalah aplikasi web korporat yang menyediakan antarmuka terpadu bagi pelaku usaha untuk mengelola kepatuhan hukum, perizinan, perpajakan, konsultasi ahli, dan dokumen legal perusahaan. Aplikasi ini hadir dalam dua varian layout: **Desktop** (sidebar navigasi) dan **Mobile** (bottom navigation + FAB), dengan desain sistem yang konsisten menggunakan identitas korporat Akses Legal (Navy Blue #003466, tipografi Manrope/Inter).

Aplikasi mencakup 10 halaman utama yang sudah diimplementasikan sebagai prototipe HTML statis, dan requirements ini mendefinisikan perilaku fungsional, aksesibilitas, serta standar kualitas yang harus dipenuhi oleh implementasi final.

---

## Glossary

- **Dashboard**: Halaman Overview yang menjadi hub pusat navigasi aplikasi.
- **Sidebar**: Panel navigasi vertikal tetap di sisi kiri layar pada tampilan Desktop (lebar ≥ 1024px).
- **Bottom Navigation**: Bar navigasi horizontal tetap di bagian bawah layar pada tampilan Mobile (lebar < 768px).
- **FAB (Floating Action Button)**: Tombol aksi mengambang di pojok kanan bawah layar Mobile untuk akses cepat ke konsultasi.
- **Brankas Dokumen**: Halaman repositori dokumen legal perusahaan yang terenkripsi.
- **Klaim Benefit**: Proses pengajuan layanan legal (NIB, NPWP, SPT) melalui formulir multi-langkah.
- **Skor Kepatuhan**: Nilai numerik (0–100) yang merepresentasikan tingkat kepatuhan hukum perusahaan pengguna.
- **Stepper**: Komponen UI progress tracker multi-langkah pada formulir klaim.
- **NIB**: Nomor Induk Berusaha — identitas perizinan usaha dari sistem OSS.
- **NPWP**: Nomor Pokok Wajib Pajak — identitas perpajakan badan usaha.
- **SPT**: Surat Pemberitahuan Tahunan — laporan pajak tahunan.
- **KBLI**: Klasifikasi Baku Lapangan Usaha Indonesia — kode klasifikasi bidang usaha.
- **OSS**: Online Single Submission — sistem perizinan berusaha terintegrasi pemerintah Indonesia.
- **Modal Chat**: Jendela percakapan yang muncul di atas konten halaman tanpa berpindah halaman.
- **Specialist**: Konsultan hukum atau pajak yang tersedia untuk sesi konsultasi live.
- **Tenggat Pajak**: Batas waktu pelaporan atau pembayaran kewajiban perpajakan.
- **Invoice**: Dokumen tagihan resmi yang dapat diunduh dalam format PDF.
- **WCAG 2.1 AA**: Web Content Accessibility Guidelines versi 2.1 level AA — standar aksesibilitas web internasional.

---

## Requirements

---

### Requirement 1: Sistem Navigasi Desktop

**User Story:** Sebagai pengguna Desktop, saya ingin memiliki sidebar navigasi yang selalu terlihat, sehingga saya dapat berpindah antar halaman dengan cepat tanpa kehilangan konteks.

#### Acceptance Criteria

1. THE Dashboard SHALL menampilkan Sidebar dengan lebar 256px yang tetap (fixed) di sisi kiri layar pada viewport lebar ≥ 1024px.
2. THE Sidebar SHALL memuat tautan navigasi ke halaman: Overview, Konsultasi, Permohonan Saya, Dokumen Legal (Brankas), Billing & Harga, dan Pelaporan Pajak.
3. WHEN pengguna berada di halaman tertentu, THE Sidebar SHALL menampilkan tautan halaman aktif dengan latar belakang putih, teks berwarna #003466, dan indikator visual yang membedakannya dari tautan tidak aktif.
4. THE Sidebar SHALL menampilkan tombol "Mulai Konsultasi" atau "Layanan Baru" di bagian bawah panel navigasi.
5. THE Sidebar SHALL menampilkan tautan "Bantuan" dan "Keluar" di bagian paling bawah, terpisah dari menu utama.
6. WHEN pengguna mengklik tautan navigasi di Sidebar, THE Dashboard SHALL menavigasi ke halaman yang sesuai dalam waktu kurang dari 300ms.

---

### Requirement 2: Sistem Navigasi Mobile

**User Story:** Sebagai pengguna Mobile, saya ingin navigasi yang mudah dijangkau dengan ibu jari, sehingga saya dapat mengakses semua fitur utama tanpa kesulitan.

#### Acceptance Criteria

1. THE Dashboard SHALL menampilkan Bottom Navigation yang tetap (fixed) di bagian bawah layar pada viewport lebar < 768px.
2. THE Bottom Navigation SHALL memuat empat item: Beranda (Overview), Layanan, Dokumen, dan Profil.
3. WHEN pengguna berada di halaman tertentu, THE Bottom Navigation SHALL menampilkan item aktif dengan latar belakang secondary-container dan ikon terisi (filled).
4. THE Dashboard SHALL menampilkan FAB berukuran 56×56px di pojok kanan bawah layar, di atas Bottom Navigation, dengan ikon `support_agent`.
5. WHEN pengguna menekan FAB, THE Dashboard SHALL membuka akses cepat ke halaman atau modal Konsultasi Ahli.
6. THE Bottom Navigation SHALL memiliki tinggi minimum 56px dan setiap item sentuh SHALL memiliki area target minimum 44×44px sesuai WCAG 2.1 AA.

---

### Requirement 3: Top Bar (Header Aplikasi)

**User Story:** Sebagai pengguna, saya ingin header yang bersih dengan akses ke pencarian dan profil, sehingga saya dapat menemukan layanan dan mengelola akun dengan mudah.

#### Acceptance Criteria

1. THE Dashboard SHALL menampilkan Top Bar yang sticky (tetap di atas saat scroll) dengan tinggi 64px pada Desktop.
2. THE Top Bar SHALL menampilkan nama brand "Akses Legal Indonesia" atau "The Digital Jurist" di sisi kiri.
3. THE Top Bar SHALL menampilkan Search Bar dengan placeholder "Cari layanan..." di area tengah-kiri pada Desktop.
4. THE Top Bar SHALL menampilkan ikon notifikasi dan avatar profil pengguna di sisi kanan.
5. WHEN pengguna mengklik ikon notifikasi, THE Dashboard SHALL menampilkan indikator jumlah notifikasi yang belum dibaca.
6. THE Top Bar SHALL menggunakan efek `backdrop-blur` dengan latar belakang semi-transparan untuk mempertahankan keterbacaan konten di bawahnya saat di-scroll.

---

### Requirement 4: Halaman Overview (Dashboard Utama)

**User Story:** Sebagai pengguna, saya ingin melihat ringkasan status kepatuhan dan aksi cepat di satu halaman, sehingga saya dapat memantau kondisi legal perusahaan sekaligus mengambil tindakan segera.

#### Acceptance Criteria

1. THE Overview_Page SHALL menampilkan salam personal dengan nama pengguna dan status kepatuhan saat halaman dimuat.
2. THE Overview_Page SHALL menampilkan widget Skor Kepatuhan Hukum berupa circular progress dengan nilai numerik (0–100) dan label kategori (mis. "Sangat Baik").
3. THE Overview_Page SHALL menampilkan tiga kartu Aksi Cepat: Klaim NIB, Klaim NPWP, dan Lapor SPT, masing-masing dengan tombol "Klaim Sekarang".
4. WHEN pengguna mengklik tombol "Klaim Sekarang" pada kartu Aksi Cepat, THE Overview_Page SHALL menavigasi ke formulir klaim yang sesuai (klaimnib, klaimnpwp, atau klaimpelaporanspt).
5. THE Overview_Page SHALL menampilkan tabel Status Layanan dengan kolom: Nama Layanan, ID, Tanggal, dan Status.
6. THE Overview_Page SHALL menampilkan widget Tenggat Waktu Pajak yang menampilkan minimal dua tenggat pajak terdekat dengan tanggal dan nama kewajiban.
7. THE Overview_Page SHALL menampilkan widget promosi atau Legal Insight di sidebar kanan pada Desktop.
8. WHILE viewport lebar < 768px, THE Overview_Page SHALL menampilkan Skor Kepatuhan sebagai progress bar horizontal di bagian atas halaman, dan kartu Aksi Cepat dalam format carousel horizontal yang dapat di-scroll.

---

### Requirement 5: Formulir Klaim NIB

**User Story:** Sebagai pelaku usaha, saya ingin mengisi formulir klaim NIB secara terstruktur, sehingga saya dapat mendaftarkan Nomor Induk Berusaha tanpa kebingungan.

#### Acceptance Criteria

1. THE NIB_Form SHALL menampilkan Stepper progress tracker yang menunjukkan posisi langkah saat ini dari total langkah formulir.
2. THE NIB_Form SHALL memuat Section 1 (Identitas Pemilik) dengan field: Nomor KTP (NIK) 16 digit dan Nomor NPWP 15 digit.
3. THE NIB_Form SHALL memuat Section 2 (Detail Usaha) dengan field: Alamat Lengkap Usaha (textarea).
4. THE NIB_Form SHALL memuat Section 3 (Kontak & Keamanan) dengan field: Nomor HP Aktif (dengan prefix +62), Email, dan Password Pribadi.
5. THE NIB_Form SHALL memuat Section 4 (KBLI) dengan kemampuan menambahkan hingga 5 entri Kode KBLI beserta deskripsi usaha.
6. IF pengguna mengosongkan field wajib dan menekan tombol submit, THEN THE NIB_Form SHALL memblokir pengiriman formulir dan menampilkan pesan validasi inline di bawah setiap field wajib yang kosong tanpa berpindah halaman.
7. IF pengguna memasukkan NIK dengan jumlah digit selain 16, THEN THE NIB_Form SHALL menampilkan pesan error "NIK harus terdiri dari 16 digit".
8. THE NIB_Form SHALL menampilkan checkbox pernyataan kebenaran data yang harus dicentang sebelum pengiriman.
9. WHEN pengguna berhasil mengirim formulir, THE NIB_Form SHALL menavigasi ke halaman Klaim Berhasil.

---

### Requirement 6: Formulir Klaim NPWP

**User Story:** Sebagai pelaku usaha, saya ingin mengurus pendaftaran NPWP Badan melalui formulir digital, sehingga saya dapat memiliki identitas perpajakan tanpa hambatan birokrasi.

#### Acceptance Criteria

1. THE NPWP_Form SHALL menampilkan Stepper progress tracker yang menunjukkan posisi langkah saat ini.
2. THE NPWP_Form SHALL memuat field data identitas badan usaha: nama perusahaan, jenis badan usaha, dan nomor akta pendirian.
3. THE NPWP_Form SHALL memuat field data pengurus: nama direktur utama, NIK direktur, dan alamat domisili.
4. IF pengguna mengosongkan field wajib dan menekan tombol submit, THEN THE NPWP_Form SHALL memblokir pengiriman formulir dan menampilkan pesan validasi inline di bawah setiap field wajib yang kosong tanpa berpindah halaman.
5. WHEN pengguna berhasil mengirim formulir, THE NPWP_Form SHALL menavigasi ke halaman Klaim Berhasil.

---

### Requirement 7: Formulir Pelaporan SPT

**User Story:** Sebagai wajib pajak badan, saya ingin melaporkan SPT Tahunan melalui platform digital, sehingga saya dapat memenuhi kewajiban perpajakan tepat waktu.

#### Acceptance Criteria

1. THE SPT_Form SHALL menampilkan Stepper progress tracker yang menunjukkan posisi langkah saat ini.
2. THE SPT_Form SHALL memuat field: tahun pajak, jenis SPT (Tahunan/Masa), dan NPWP badan.
3. THE SPT_Form SHALL menyediakan mekanisme unggah dokumen pendukung (lampiran SPT).
4. IF pengguna mengosongkan field wajib dan menekan tombol submit, THEN THE SPT_Form SHALL memblokir pengiriman formulir dan menampilkan pesan validasi inline di bawah setiap field wajib yang kosong tanpa berpindah halaman.
5. WHEN pengguna berhasil mengirim formulir, THE SPT_Form SHALL menavigasi ke halaman Klaim Berhasil.

---

### Requirement 8: Halaman Klaim Berhasil

**User Story:** Sebagai pengguna yang baru mengirim formulir klaim, saya ingin mendapat konfirmasi yang jelas bahwa pengajuan saya berhasil, sehingga saya merasa yakin proses berjalan dengan benar.

#### Acceptance Criteria

1. THE Success_Page SHALL menampilkan ikon centang (check_circle) berukuran besar dengan animasi pulse saat halaman dimuat.
2. THE Success_Page SHALL menampilkan Transaction ID unik dalam format yang mudah dibaca (mis. AX-XXXXXXXXXX).
3. THE Success_Page SHALL menampilkan ringkasan pengajuan: jenis layanan, nama entitas, dan waktu pengiriman.
4. THE Success_Page SHALL menampilkan tombol "Download Legal Receipt" untuk mengunduh bukti pengajuan.
5. THE Success_Page SHALL menampilkan tombol "Kembali ke Dashboard" yang menavigasi ke halaman Overview.
6. THE Success_Page SHALL menampilkan Audit Trail Tracking yang menunjukkan tahapan proses: Validation → Entry → Seal Applied → Archiving.

---

### Requirement 9: Halaman Konsultasi Ahli

**User Story:** Sebagai pengguna, saya ingin berkonsultasi secara langsung dengan ahli hukum atau pajak melalui live chat, sehingga saya dapat mendapatkan solusi atas permasalahan legal perusahaan secara real-time.

#### Acceptance Criteria

1. THE Consultation_Page SHALL menampilkan daftar Specialist di panel kiri dengan informasi: foto, nama, spesialisasi, dan status ketersediaan (Online/Offline/LIVE).
2. THE Consultation_Page SHALL menampilkan filter kategori Specialist: Semua, Legal, Pajak, Notaris.
3. WHEN pengguna memilih Specialist dari daftar, THE Consultation_Page SHALL menampilkan area chat dengan Specialist tersebut di panel kanan.
4. THE Consultation_Page SHALL menampilkan riwayat pesan dalam area chat yang dapat di-scroll, dengan pesan masuk di kiri dan pesan keluar di kanan.
5. THE Consultation_Page SHALL menyediakan input area pesan dengan tombol kirim, tombol lampiran file, dan tombol sisipkan gambar.
6. THE Consultation_Page SHALL menampilkan tombol "Video Call" dan "Review Dokumen" di header area chat.
7. WHEN pengguna mengirim pesan, THE Consultation_Page SHALL menampilkan pesan baru di area chat dalam waktu kurang dari 500ms.
8. THE Consultation_Page SHALL menampilkan disclaimer enkripsi end-to-end di bawah area input pesan.
9. WHILE viewport lebar < 768px, THE Consultation_Page SHALL menampilkan daftar Specialist sebagai halaman terpisah, dan area chat sebagai halaman terpisah yang dapat diakses setelah memilih Specialist.

---

### Requirement 10: Halaman Permohonan Saya

**User Story:** Sebagai pengguna, saya ingin melihat semua permohonan layanan yang sedang berjalan dan riwayatnya, sehingga saya dapat memantau progres setiap pengajuan.

#### Acceptance Criteria

1. THE Applications_Page SHALL menampilkan kartu ringkasan status untuk layanan aktif: NIB (dengan nomor NIB), NPWP (dengan status validasi), dan SPT (dengan tahun pajak).
2. THE Applications_Page SHALL menampilkan tabel Aktivitas Terkini dengan kolom: Layanan/Dokumen, Tanggal, Status, dan Aksi.
3. THE Applications_Page SHALL menampilkan badge status dengan warna berbeda: hijau untuk "Selesai", biru untuk "Dalam Proses", kuning/amber untuk "Menunggu Dokumen", dan merah untuk "Action Required".
4. WHEN pengguna mengklik tombol aksi pada baris tabel, THE Applications_Page SHALL menampilkan aksi yang relevan: unduh dokumen (status Selesai), lihat detail (status Dalam Proses), atau unggah dokumen (status Menunggu Dokumen).
5. THE Applications_Page SHALL menampilkan widget Skor Kepatuhan Hukum di sidebar kanan pada Desktop.
6. THE Applications_Page SHALL menampilkan widget Tenggat Waktu dengan minimal dua tenggat terdekat.
7. WHILE viewport lebar < 768px, THE Applications_Page SHALL menampilkan kartu ringkasan status dalam layout satu kolom sesuai dengan aturan responsivitas umum pada Requirement 16.

---

### Requirement 11: Brankas Dokumen (Halaman Pemilihan Perusahaan)

**User Story:** Sebagai pengguna dengan beberapa entitas perusahaan, saya ingin melihat daftar semua perusahaan yang terdaftar, sehingga saya dapat memilih perusahaan yang ingin saya kelola dokumennya.

#### Acceptance Criteria

1. THE Document_Vault_Page SHALL menampilkan tabel daftar perusahaan dengan kolom: Nomor urut, Nama Layanan/Perusahaan, Tanggal Pengajuan, Status, dan Aksi.
2. THE Document_Vault_Page SHALL menampilkan ikon dan jenis badan usaha (PT, CV, Yayasan, Perkumpulan) di bawah nama perusahaan.
3. THE Document_Vault_Page SHALL menampilkan badge status "Selesai" berwarna hijau untuk perusahaan yang dokumennya lengkap.
4. WHEN pengguna mengklik tombol "Lihat Detail" pada baris perusahaan, THE Document_Vault_Page SHALL menavigasi ke halaman Detail Dokumen perusahaan tersebut.
5. THE Document_Vault_Page SHALL menampilkan pagination dengan informasi jumlah entitas yang ditampilkan dari total entitas.
6. WHILE viewport lebar < 768px, THE Document_Vault_Page SHALL menampilkan daftar perusahaan dalam format kartu (cards) sesuai dengan aturan responsivitas umum pada Requirement 16.

---

### Requirement 12: Halaman Detail Dokumen Perusahaan

**User Story:** Sebagai pengguna, saya ingin melihat semua dokumen legal satu perusahaan dalam satu halaman terpadu, sehingga saya dapat mengakses, mengunduh, atau memeriksa status setiap dokumen dengan mudah.

#### Acceptance Criteria

1. THE Document_Detail_Page SHALL menampilkan informasi identitas perusahaan: nama, jenis badan usaha, nomor akta, dan tanggal pendirian.
2. THE Document_Detail_Page SHALL menampilkan daftar dokumen legal yang terkait dengan perusahaan tersebut, termasuk: nama dokumen, tanggal terbit, dan status.
3. WHEN pengguna mengklik tombol unduh pada dokumen, THE Document_Detail_Page SHALL memulai proses unduh file dokumen tersebut.
4. THE Document_Detail_Page SHALL menampilkan breadcrumb navigasi: Dashboard → Brankas Dokumen → [Nama Perusahaan].
5. WHILE viewport lebar < 768px, THE Document_Detail_Page SHALL menampilkan daftar dokumen dalam format kartu (cards) sesuai dengan aturan responsivitas umum pada Requirement 16.

---

### Requirement 13: Halaman Billing & Harga

**User Story:** Sebagai pengguna berlangganan, saya ingin mengelola paket langganan, metode pembayaran, dan melihat riwayat tagihan, sehingga saya dapat mengontrol pengeluaran layanan legal perusahaan.

#### Acceptance Criteria

1. THE Billing_Page SHALL menampilkan kartu Langganan Aktif dengan nama paket, fitur yang termasuk, dan tombol "Ganti Paket" serta "Batalkan Langganan".
2. THE Billing_Page SHALL menampilkan kartu Tagihan Berikutnya dengan jumlah tagihan, tanggal jatuh tempo, dan metode pembayaran yang terpilih.
3. THE Billing_Page SHALL menampilkan daftar Metode Pembayaran yang tersimpan dengan kemampuan menambah metode baru.
4. THE Billing_Page SHALL menampilkan toggle Perpanjangan Otomatis yang dapat diaktifkan atau dinonaktifkan oleh pengguna.
5. THE Billing_Page SHALL menampilkan tabel Riwayat Tagihan dengan kolom: ID Transaksi, Tanggal, Deskripsi, Jumlah, Status, dan Aksi (unduh invoice).
6. WHEN pengguna mengklik tombol unduh invoice pada baris riwayat tagihan, THE Billing_Page SHALL memulai proses unduh file invoice dalam format PDF.
7. THE Billing_Page SHALL menampilkan pagination pada tabel Riwayat Tagihan dengan informasi jumlah transaksi yang ditampilkan dari total transaksi.
8. WHILE viewport lebar < 768px, THE Billing_Page SHALL menampilkan tabel Riwayat Tagihan dalam format kartu (cards) sesuai dengan aturan responsivitas umum pada Requirement 16, termasuk ketika tidak ada transaksi yang ditampilkan.

---

### Requirement 14: Halaman Pelaporan Pajak

**User Story:** Sebagai wajib pajak badan, saya ingin melihat ringkasan kewajiban pajak dan riwayat pelaporan, sehingga saya dapat memastikan semua kewajiban perpajakan terpenuhi tepat waktu.

#### Acceptance Criteria

1. THE Tax_Report_Page SHALL menampilkan ringkasan status kewajiban pajak aktif: PPh Pasal 21, PPN, dan SPT Tahunan.
2. THE Tax_Report_Page SHALL menampilkan kalender atau daftar tenggat pajak yang akan datang dalam 30 hari ke depan.
3. THE Tax_Report_Page SHALL menampilkan riwayat pelaporan pajak yang telah diselesaikan.
4. WHEN pengguna mengklik tombol "Lapor SPT", THE Tax_Report_Page SHALL menavigasi ke formulir Pelaporan SPT.
5. WHILE viewport lebar < 768px, THE Tax_Report_Page SHALL menampilkan ringkasan kewajiban pajak dalam format kartu (cards) sesuai dengan aturan responsivitas umum pada Requirement 16.

---

### Requirement 15: Desain Sistem & Identitas Visual

**User Story:** Sebagai pengguna, saya ingin antarmuka yang konsisten dan profesional di semua halaman, sehingga saya merasa percaya menggunakan platform legal ini.

#### Acceptance Criteria

1. THE Dashboard SHALL menggunakan warna utama Navy Blue #003466 untuk elemen brand dan #00518c untuk aksi utama (tombol CTA) di seluruh halaman.
2. THE Dashboard SHALL menggunakan tipografi Manrope untuk heading/display dan Inter untuk body/UI di seluruh halaman.
3. THE Dashboard SHALL menerapkan border-radius 8–12px (rounded-xl) pada semua kartu dan komponen kontainer.
4. THE Dashboard SHALL menerapkan shadow tipis (shadow-sm) pada kartu untuk memberikan kedalaman visual tanpa kesan berat.
5. THE Dashboard SHALL menggunakan token warna Material Design 3 yang konsisten (primary, secondary, tertiary, surface, outline-variant) di seluruh halaman.
6. THE Dashboard SHALL menggunakan ikon dari library Material Symbols Outlined secara konsisten di seluruh halaman.

---

### Requirement 16: Responsivitas & Adaptasi Layout

**User Story:** Sebagai pengguna yang mengakses dari berbagai perangkat, saya ingin tampilan yang optimal di Desktop maupun Mobile, sehingga saya dapat menggunakan semua fitur tanpa hambatan.

#### Acceptance Criteria

1. THE Dashboard SHALL menampilkan layout Sidebar + konten utama pada viewport lebar ≥ 1024px (Desktop).
2. THE Dashboard SHALL menampilkan layout Bottom Navigation + konten full-width pada viewport lebar < 768px (Mobile).
3. WHEN viewport berubah dari Desktop ke Mobile, THE Dashboard SHALL mengubah tabel data menjadi format kartu (cards) yang ditumpuk secara vertikal.
4. THE Dashboard SHALL menggunakan kolom yang ditumpuk (stacked columns) pada Mobile untuk semua grid layout yang menggunakan multi-kolom di Desktop.
5. THE Dashboard SHALL menggunakan logo, ikon, dan ilustrasi yang identik di Desktop dan Mobile.
6. WHEN pengguna mengakses halaman Konsultasi di Mobile, THE Dashboard SHALL menampilkan daftar Specialist dan area chat sebagai dua tampilan terpisah yang dapat dinavigasi.

---

### Requirement 17: Aksesibilitas (WCAG 2.1 AA)

**User Story:** Sebagai pengguna dengan kebutuhan aksesibilitas, saya ingin antarmuka yang dapat diakses dengan teknologi bantu, sehingga saya dapat menggunakan semua fitur tanpa hambatan.

#### Acceptance Criteria

1. THE Dashboard SHALL memastikan rasio kontras teks terhadap latar belakang minimal 4.5:1 untuk teks berukuran normal dan 3:1 untuk teks berukuran besar (≥ 18px atau ≥ 14px bold) di seluruh halaman.
2. THE Dashboard SHALL menggunakan elemen HTML semantik: `<nav>` untuk navigasi, `<main>` untuk konten utama, `<header>` untuk header, `<aside>` untuk sidebar, dan `<section>` untuk pengelompokan konten.
3. THE Dashboard SHALL menyertakan atribut `aria-label` atau `aria-labelledby` pada semua elemen navigasi, tombol ikon, dan komponen interaktif yang tidak memiliki teks label yang terlihat.
4. THE Dashboard SHALL memastikan semua elemen interaktif dapat diakses dan dioperasikan menggunakan keyboard (Tab, Enter, Space, Arrow keys).
5. THE Dashboard SHALL memastikan semua target sentuh pada Mobile memiliki ukuran minimum 44×44px.
6. THE Dashboard SHALL menyertakan atribut `alt` yang deskriptif pada semua elemen `<img>`.
7. IF konten bergerak atau animasi diputar otomatis, THEN THE Dashboard SHALL menyediakan mekanisme untuk menghentikan atau menonaktifkan animasi tersebut.

---

### Requirement 18: Performa & Pengalaman Pengguna

**User Story:** Sebagai pengguna, saya ingin aplikasi yang responsif dan cepat, sehingga saya tidak mengalami hambatan saat menggunakan layanan legal.

#### Acceptance Criteria

1. WHEN pengguna mengklik tautan navigasi, THE Dashboard SHALL merespons dengan transisi visual dalam waktu kurang dari 300ms.
2. THE Dashboard SHALL menerapkan micro-interaction (hover state, active state, focus state) pada semua elemen interaktif untuk memberikan umpan balik visual.
3. THE Dashboard SHALL menampilkan state loading yang jelas (skeleton screen atau spinner) WHEN konten sedang dimuat dari server.
4. IF koneksi jaringan terputus, THEN THE Dashboard SHALL menampilkan pesan error yang informatif dan tombol untuk mencoba ulang.
5. THE Dashboard SHALL menerapkan efek `backdrop-blur` pada Top Bar dan elemen overlay lainnya (modal, dropdown, panel mengambang) untuk mempertahankan konteks visual saat scroll atau saat overlay aktif.
