# 📇 `wal-showid`

<p align="center">
  <img src="https://img.shields.io/badge/FiveM-Resource-orange?style=for-the-badge&logo=fivem&logoColor=white" alt="FiveM">
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
    <img src="https://i.imgur.com/PvrpiQG.png" alt="ShowID Masked System Preview" width="800" style="border-radius: 8px; box-shadow: 0 4px 20px rgba(0,0,0,0.5); border: 2px solid #ff9f0a;">
  </a><br>
  <em>🎭 Highlight: Masked Character Identity Protection / Maske Kontrolü ve Gizlilik Sistemi</em>
</p>

---

## 📖 Table of Contents / İçindekiler
1. [English Description](#english-description)
   - [Core Features](#core-features)
   - [Installation Guide](#installation-guide)
   - [Configuration Guide (`config.lua`)](#configuration-guide-configlua)
2. [Türkçe Açıklama](#türkçe-açıklama)
   - [Temel Özellikler](#temel-özellikler)
   - [Kurulum Kılavuzu](#kurulum-kılavuzu)
   - [Yapılandırma Kılavuzu (`config.lua`)](#yapılandırma-kılavuzu-configlua)
3. [🖼️ Showcase & Screenshots / Canlı Önizlemeler](#%EF%B8%8F-showcase--screenshots--canlı-önizlemeler)

---

## English Description

`wal-showid` is a next-generation head-up display (HUD) player identity card script designed for FiveM servers running QBCore, ESX, or Standalone setups. It enables players to view nearby players' server IDs, character names, job titles, ranks, gang details, voice levels, and current statuses (such as Dead, Injured, or Handcuffed) floating perfectly above their heads with beautiful, hardware-accelerated animations.

### Core Features
- **🔌 Intelligent Auto-Framework Detection:** Instantly detects and integrates with **QBCore** or **ESX**. Automatically falls back to **Standalone** mode if no framework is found.
- **🎨 Elite Glassmorphism UI:** Features gorgeous modern styling with harmony-based job colors, talking state glows, dynamic scaling based on distance, and crisp SVG indicators.
- **🛡️ Mask & Masked Names System:** Dynamically hides player identities when wearing a mask, displaying customizable generic masked labels (e.g., "Unknown").
- **🔊 Integrated Voice Indicators:** Fully compatible with `pma-voice`. Showcases speaker activity and custom voice range visualization in real-time.
- **💔 Minimalist Character States:** Elegant, clean status badges for:
  - 💀 **Dead / Unconscious** (`DEAD`)
  - 💔 **Injured** (`INJURED`)
  - 🔒 **Handcuffed** (`CUFFED`)

### Installation Guide
1. **Download & Extract:** Place the folder inside your server's `resources` directory.
2. **Rename Directory:** The resource folder **must** be named exactly `wal-showid`.
3. **Configure Startup:** Add the following line to your `server.cfg`:
   ```cfg
   ensure wal-showid
   ```
4. **Usage:** Start your server, hold your default hotkey (**Page Up / PRIOR**), or type `/showid` in chat!

### Configuration Guide (`config.lua`)
You can configure Mesmes (Jobs) and design elements inside the [config.lua](config.lua) file. Here is how custom job styling works:

```lua
Config.Jobs = {
    ["police"] = {
        color = "#1e90ff", -- Hex color code for badges and text
        glow = "rgba(30, 144, 255, 0.4)", -- Glow overlay effect (RGBA format)
        label = "LSPD" -- Display text for the job label
    },
    ["ambulance"] = {
        color = "#ff453a",
        glow = "rgba(255, 69, 58, 0.4)",
        label = "EMS"
    }
}
```
* **Job Mapping:** The index key (e.g. `["police"]`) must match your QBCore or ESX job name in the database.
* **Custom States:** Enable or disable status indicators (Dead, Injured, Handcuffed) easily under the `Config.States` table.

---

## Türkçe Açıklama

`wal-showid`, FiveM roleplay sunucuları için sıfırdan tasarlanmış yeni nesil, modern ve ultra optimize bir baş üstü (overhead) oyuncu kimlik kartı sistemidir. QBCore, ESX veya Standalone altyapılarını otomatik olarak tespit eder. Yakındaki oyuncuların ID, karakter ismi, meslek, rütbe, çete detayları, PMA-Voice ses seviyeleri ve güncel karakter durumlarını (Ölü, Yaralı, Kelepçeli) kusursuz donanım hızlandırmalı geçiş efektleriyle görüntüler.

### Temel Özellikler
- **🔌 Akıllı Framework Algılama:** **QBCore** ve **ESX** altyapılarını anında tespit ederek entegre olur. Altyapı bulunamazsa otomatik olarak **Standalone** moduna geçer.
- **🎨 Premium Glassmorphism Tasarım:** Göz yormayan modern yazı tipleri, konuşma durumunda meslek rengiyle parlayan ID rozetleri, mesafeye göre küçülen dinamik kartlar.
- **🎭 Maske Kontrolü & Gizlilik:** Maskeli oyuncuların isimlerini, mesleklerini ve çete detaylarını gizleyerek özelleştirilebilir genel başlıklar gösterir ("Bilinmiyor" vb.).
- **🔊 Entegre Ses Düzeyleri:** `pma-voice` ile tam uyumludur. Konuşma aktivitesini ve ses seviyelerini canlı olarak görselleştirir.
- **💔 Sadeleştirilmiş Karakter Durumları:** Sadece en gerekli durumları gösteren hafif tasarım:
  - 💀 **Vefat / Baygın** (`DEAD`)
  - 💔 **Yaralı** (`INJURED`)
  - 🔒 **Kelepçeli** (`CUFFED`)

### Kurulum Kılavuzu
1. **İndirin ve Çıkartın:** Script klasörünü sunucunuzun `resources` dizinine yükleyin.
2. **Klasör İsmini Doğrulayın:** Klasör adı tam olarak **`wal-showid`** olmalıdır.
3. **CFG Yapılandırması:** `server.cfg` dosyanıza şu satırı ekleyin:
   ```cfg
   ensure wal-showid
   ```
4. **Başlangıç:** Sunucunuzu başlatın ve varsayılan tuş olan (**Page Up**) tuşuna basılı tutarak veya sohbete `/showid` yazarak sistemi kullanmaya başlayın!

### Yapılandırma Kılavuzu (`config.lua`)
Mesleklere (Jobs) özel renk ve kart stillerini [config.lua](config.lua) içerisinden kolayca özelleştirebilirsiniz:

```lua
Config.Jobs = {
    ["police"] = {
        color = "#1e90ff", -- Kart kenarlıkları ve yazı rengi (HEX)
        glow = "rgba(30, 144, 255, 0.4)", -- Konuşma durumunda aktif olan parıltı (RGBA)
        label = "LSPD" -- Ekranda görünecek meslek başlığı
    },
    ["ambulance"] = {
        color = "#ff453a",
        glow = "rgba(255, 69, 58, 0.4)",
        label = "EMS"
    }
}
```
* **Meslek Eşleştirme:** Köşeli parantez içindeki meslek anahtarı (Örn: `["police"]`), veritabanınızdaki QBCore veya ESX meslek adı (job name) ile tam olarak eşleşmelidir.
* **Karakter Durumları:** Dead (Vefat), Injured (Yaralı) ve Handcuffed (Kelepçeli) ikon göstergelerini `Config.States` tablosundan aktif/pasif hale getirebilirsiniz.

---

## 🖼️ Showcase & Screenshots / Canlı Önizlemeler

<p align="center">
  <img src="https://i.imgur.com/PvrpiQG.png" alt="ShowID Masked System Preview" width="800" style="border-radius: 8px; box-shadow: 0 4px 15px rgba(0,0,0,0.3);"><br>
  <em>🎭 Masked Identity System / Maskeli Karakter Gizleme Sistemi ("Unknown")</em>
</p>

<br>

<p align="center">
  <img src="https://i.imgur.com/6kAAu0e.png" alt="ShowID Overhead Preview" width="800" style="border-radius: 8px; box-shadow: 0 4px 15px rgba(0,0,0,0.3);"><br>
  <em>Overhead Identity Cards / Baş Üstü Kimlik Kartı Genel Görünümü</em>
</p>

<br>

<p align="center">
  <img src="https://i.imgur.com/QgGZsTm.png" alt="ShowID Status Badge Preview" width="800" style="border-radius: 8px; box-shadow: 0 4px 15px rgba(0,0,0,0.3);"><br>
  <em>Detailed Job and Status HUD / Detaylı Meslek, Ses Seviyesi ve Durum Göstergeleri</em>
</p>

<p align="center">
  <img src="https://i.imgur.com/a/hqxZLBd" alt="ShowID Status Badge Preview" width="800" style="border-radius: 8px; box-shadow: 0 4px 15px rgba(0,0,0,0.3);"><br>
</p>

<br>

<p align="center">
  <a href="https://imgur.com/a/rGKns8b" target="_blank" style="font-weight: bold; color: #ff9f0a; text-decoration: none; font-size: 16px;">
    🔗 Click Here to View the Full Imgur Album / Albümü Görüntülemek İçin Tıklayın
  </a>
</p>
