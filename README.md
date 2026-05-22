# 📇 `wal-showid`

<p align="center">
  <img src="https://img.shields.io/badge/FiveM-Resource-orange?style=for-the-badge&logo=fivem&logoColor=white" alt="FiveM">
  <img src="https://img.shields.io/badge/Optimized-0.00ms-brightgreen?style=for-the-badge&logo=cpu-core" alt="Optimized">
  <img src="https://img.shields.io/badge/UI-Premium-purple?style=for-the-badge&logo=css3" alt="UI Style">
  <img src="https://img.shields.io/badge/License-MIT-blue?style=for-the-badge" alt="License">
</p>

<p align="center">
  <strong>Premium & Highly Optimized Overhead Player Identity HUD for FiveM Roleplay Servers</strong><br>
  <em>FiveM Roleplay Sunucuları için Gelişmiş, Yüksek Derecede Optimize Edilmiş ve Premium Baş Üstü Kimlik Kartı Sistemi</em>
</p>

---

## 📸 Preview / Önizleme

<p align="center">
  <a href="https://imgur.com/a/rGKns8b" target="_blank">
    <img src="https://i.imgur.com/6kAAu0e.png" alt="ShowID Premium Preview" width="800" style="border-radius: 8px; box-shadow: 0 4px 20px rgba(0,0,0,0.4);">
  </a>
</p>

---

## 📖 Table of Contents / İçindekiler
1. [English Description](#english-description)
   - [Core Features](#core-features)
   - [Installation Guide](#installation-guide)
   - [Configuration Showcase](#configuration-showcase)
   - [Performance Optimization](#performance-optimization)
2. [Türkçe Açıklama](#türkçe-açıklama)
   - [Temel Özellikler](#temel-özellikler)
   - [Kurulum Kılavuzu](#kurulum-kılavuzu)
   - [Yapılandırma Vitrini](#yapılandırma-vitrini)
   - [Performans Optimizasyonu](#performans-optimizasyonu)
3. [🖼️ How to Add Images / Resim Ekleme Kılavuzu](#%EF%B8%8F-how-to-add-images--resim-ekleme-kılavuzu)

---

## English Description

`wal-showid` is a next-generation head-up display (HUD) player identity card script designed for FiveM servers running QBCore, ESX, or Standalone setups. It enables players to view nearby players' server IDs, character names, job titles, ranks, gang details, voice levels, and current statuses (such as Dead, Injured, or Handcuffed) floating perfectly above their heads with beautiful, hardware-accelerated animations.

### Core Features
- **🔌 Intelligent Auto-Framework Detection:** Instantly detects and integrates with **QBCore** or **ESX**. Automatically falls back to **Standalone** mode if no framework is found.
- **🔒 Resource Name Lock Protection:** Built-in security check ensures the resource only executes when named `wal-showid` to maintain system consistency.
- **⚡ Built for Performance (0.00ms):** Employs player caching, state checks with separate tick rates, and line-of-sight checks throttled to 250ms to eliminate Resmon impact.
- **🎨 Elite Glassmorphism UI:** Features gorgeous modern styling with harmony-based job colors, talking state glows, dynamic scaling based on distance, and crisp SVG indicators.
- **🛡️ Mask & Masked Names System:** Dynamically hides player identities when wearing a mask, displaying customizable generic masked labels (e.g., "Unknown").
- **🔊 Integrated Voice Indicators:** Fully compatible with `pma-voice`. Showcases speaker activity and custom voice range visualization in real-time.
- **💔 Minimalist Character States:** Elegant, clean status badges for:
  - 💀 **Dead / Unconscious** (`DEAD`)
  - 💔 **Injured** (`INJURED`)
  - 🔒 **Handcuffed** (`CUFFED`)

### Installation Guide
1. **Download & Extract:** Place the folder inside your server's `resources` directory.
2. **Rename Directory:** **CRITICAL:** The resource folder **must** be named exactly `wal-showid`. If named otherwise, the script will self-terminate for security.
3. **Configure Startup:** Add the following line to your `server.cfg`:
   ```cfg
   ensure wal-showid
   ```
4. **Usage:** Start your server, hold your default hotkey (**Page Up / PRIOR**), or type `/showid` in chat!

### Configuration Showcase
Customize all parameters in the [config.lua](config.lua) file. It includes dual-language (`EN:` and `TR:`) comments for easy tweaking:
- Change default toggle key, chat commands, and visibility durations.
- Custom HEX/RGBA colors and glows for specific job titles (e.g., Police, Sheriff, EMS).
- Define visibility ranges and maximum displayed players to fit server preferences.

### Performance Optimization
- **Passive State (Idle):** `0.00 ms` (Throttled deep sleep when HUD is inactive).
- **Active Rendering (60 FPS):** `0.01 ms - 0.02 ms` (Uses local client caching and asynchronous DOM updates to deliver ultra-high framerates).

---

## Türkçe Açıklama

`wal-showid`, FiveM roleplay sunucuları için sıfırdan tasarlanmış yeni nesil, modern ve ultra optimize bir baş üstü (overhead) oyuncu kimlik kartı sistemidir. QBCore, ESX veya Standalone altyapılarını otomatik olarak tespit eder. Yakındaki oyuncuların ID, karakter ismi, meslek, rütbe, çete detayları, PMA-Voice ses seviyeleri ve güncel karakter durumlarını (Ölü, Yaralı, Kelepçeli) kusursuz donanım hızlandırmalı geçiş efektleriyle görüntüler.

### Temel Özellikler
- **🔌 Akıllı Framework Algılama:** **QBCore** ve **ESX** altyapılarını anında tespit ederek entegre olur. Altyapı bulunamazsa otomatik olarak **Standalone** moduna geçer.
- **🔒 Güvenli Klasör Kilidi:** Scriptin adının değiştirilmesini önleyen koruma sistemi. Klasör ismi `wal-showid` olmadığı sürece sistem güvenlik sebebiyle çalışmayı durdurur.
- **⚡ Üst Düzey Optimizasyon (0.00ms):** Native sorgularını yormayan akıllı önbellek yapısı, saniyede 4 kez çalışan raycast görüş kontrolü ve donanım hızlandırmalı CSS geçişleri.
- **🎨 Premium Glassmorphism Tasarım:** Göz yormayan modern yazı tipleri, konuşma durumunda meslek rengiyle parlayan ID rozetleri, mesafeye göre küçülen dinamik kartlar.
- **🎭 Maske Kontrolü & Gizlilik:** Maskeli oyuncuların isimlerini, mesleklerini ve çete detaylarını gizleyerek özelleştirilebilir genel başlıklar gösterir ("Bilinmiyor" vb.).
- **🔊 Entegre Ses Düzeyleri:** `pma-voice` ile tam uyumludur. Konuşma aktivitesini ve ses seviyelerini canlı olarak görselleştirir.
- **💔 Sadeleştirilmiş Karakter Durumları:** Sadece en gerekli durumları gösteren hafif tasarım:
  - 💀 **Vefat / Baygın** (`DEAD`)
  - 💔 **Yaralı** (`INJURED`)
  - 🔒 **Kelepçeli** (`CUFFED`)

### Kurulum Kılavuzu
1. **İndirin ve Çıkartın:** Script klasörünü sunucunuzun `resources` dizinine yükleyin.
2. **Klasör İsmini Doğrulayın:** **KRİTİK UYARI:** Klasör adı tam olarak **`wal-showid`** olmalıdır. Aksi halde script çalışmayacaktır.
3. **CFG Yapılandırması:** `server.cfg` dosyanıza şu satırı ekleyin:
   ```cfg
   ensure wal-showid
   ```
4. **Başlangıç:** Sunucunuzu başlatın ve varsayılan tuş olan (**Page Up**) tuşuna basılı tutarak veya sohbete `/showid` yazarak sistemi kullanmaya başlayın!

### Yapılandırma Vitrini
Tüm özelleştirmeleri [config.lua](config.lua) dosyası üzerinden gerçekleştirebilirsiniz. Tüm ayarlar Türkçe (`TR:`) ve İngilizce (`EN:`) açıklamalarla donatılmıştır:
- Gösterim tuşunu, sohbet komutunu ve ekranda kalma sürelerini değiştirebilirsiniz.
- Polis, Şerif, Doktor gibi meslek gruplarına özel parıltı (glow) ve HEX/RGBA renk kodları tanımlayabilirsiniz.
- Oyuncunun kendi kartını görüp göremeyeceğini ayarlayabilirsiniz.

### Performans Optimizasyonu
- **Pasif Durum (Boşta):** `0.00 ms` (Arayüz kapalıyken sıfır işlemci kullanımı).
- **Aktif Durum (Çizim Yaparken):** `0.01 ms - 0.02 ms` (Mesafe ve görüş kontrolleri arka planda önbelleğe alındığından FPS düşüşü yaşatmaz).

---

## 🖼️ How to Add Images / Resim Ekleme Kılavuzu

### 🇬🇧 English
To add preview images or gifs to your GitHub README, you can use these **three simple methods**:

#### Method 1: Local Upload (Recommended & Permanent)
1. Inside your `wal-showid` folder, create a new folder named `assets`.
2. Place your preview image (e.g. `preview.png`) inside this folder.
3. In your `README.md`, refer to it using a relative path like this:
   ```markdown
   ![Preview](assets/preview.png)
   ```
4. Commit and push the folder and README to GitHub. It will display perfectly!

#### Method 2: Drag & Drop on GitHub Issues/PRs (Quickest)
1. Go to your repository on GitHub.
2. Go to **Issues** and click **New Issue** (or a draft Pull Request).
3. **Drag and drop** your image directly into the text editor comment box.
4. GitHub will upload the image to their CDN and generate a markdown code like:
   `![image](https://github.com/user-attachments/assets/xxxxx-xxxxx)`
5. Copy that code and paste it directly into your `README.md`!

#### Method 3: Online Image Hosting
1. Upload your image to a free service like [Imgur](https://imgur.com) or [Postimages](https://postimages.org).
2. Copy the **Direct Link** (the URL ending with `.png`, `.jpg`, or `.gif`).
3. Paste it in your `README.md`:
   ```markdown
   ![Preview](https://i.imgur.com/your-image.png)
   ```

---

### 🇹🇷 Türkçe
GitHub üzerindeki README.md dosyanıza fotoğraf veya GIF eklemek için **üç kolay yöntemi** kullanabilirsiniz:

#### Yöntem 1: Yerel Yükleme (Önerilen ve Kalıcı)
1. `wal-showid` klasörünüzün içine `assets` adında yeni bir klasör oluşturun.
2. Önizleme fotoğrafınızı (örneğin `preview.png`) bu klasörün içine atın.
3. `README.md` dosyanızda şu şekilde göreceli yol vererek çağırın:
   ```markdown
   ![Preview](assets/preview.png)
   ```
4. Klasörü ve README dosyasını GitHub'a commitleyip pushlayın. Resim kalıcı olarak sorunsuz görüntülenecektir!

#### Yöntem 2: GitHub Issues/PR Üzerinden Sürükle-Bırak (En Hızlısı)
1. GitHub'da oluşturduğunuz script deposuna (repository) gidin.
2. **Issues** sekmesine girip **New Issue** deyin (merak etmeyin, yayınlamayacağız).
3. Resminizi bilgisayarınızdan tutup buradaki yazı yazma alanına **sürükleyip bırakın**.
4. GitHub resmi otomatik yükleyecek ve size şöyle bir kod üretecektir:
   `![image](https://github.com/user-attachments/assets/xxxxx-xxxxx)`
5. Bu kodu kopyalayıp doğrudan `README.md` dosyanızın istediğiniz yerine yapıştırın!

#### Yöntem 3: Harici Resim Servisleri
1. Resminizi [Imgur](https://imgur.com) veya [Postimages](https://postimages.org) gibi ücretsiz bir resim servisine yükleyin.
2. Resmin **Doğrudan Linkini (Direct Link)** kopyalayın (sonu `.png`, `.jpg` veya `.gif` ile biten link).
3. `README.md` dosyanıza şu şekilde ekleyin:
   ```markdown
   ![Preview](https://i.imgur.com/your-image.png)
   ```

---

## 🖼️ Actual Previews / Canlı Önizlemeler

<p align="center">
  <strong>Live Showcase from FiveM Server</strong>
</p>

<p align="center">
  <img src="https://i.imgur.com/6kAAu0e.png" alt="ShowID Overhead Preview" width="800" style="border-radius: 8px; box-shadow: 0 4px 15px rgba(0,0,0,0.3);"><br>
  <em>Overhead Identity Cards / Baş Üstü Kimlik Kartı Görünümü</em>
</p>

<br>

<p align="center">
  <img src="https://i.imgur.com/QgGZsTm.png" alt="ShowID Status Badge Preview" width="800" style="border-radius: 8px; box-shadow: 0 4px 15px rgba(0,0,0,0.3);"><br>
  <em>Detailed Job and Status HUD / Detaylı Meslek ve Durum Göstergesi</em>
</p>

<br>

<p align="center">
  <a href="https://imgur.com/a/rGKns8b" target="_blank" style="font-weight: bold; color: #1e90ff; text-decoration: none; font-size: 16px;">
    🔗 Click Here to View the Full Imgur Album / Albümü Görüntülemek İçin Tıklayın
  </a>
</p>
