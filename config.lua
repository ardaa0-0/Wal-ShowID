Config = {}

-- EN: UI update interval in milliseconds (lower = smoother, higher = better performance. Recommended: 20 or 25)
-- TR: Arayüz güncelleme sıklığı (milisaniye cinsinden. Düşük = daha akıcı, Yüksek = daha yüksek performans. Önerilen: 20 veya 25)
Config.UpdateInterval = 25

-- EN: Framework selection: "auto" (auto detect), "qb" (QBCore), "esx" (ESX), "standalone"
-- TR: Framework seçimi: "auto" (otomatik tespit), "qb" (QBCore), "esx" (ESX), "standalone" (Düz)
Config.Framework = "auto"

-- EN: Allow players to see their own ID above their head (makes testing easier)
-- TR: Oyuncunun kendi kimliğini de kafasının üstünde görmesi (test etmeyi kolaylaştırır)
Config.ShowOwnID = true

-- EN: Visibility distance of identity cards (in meters)
-- TR: Kimlik kartlarının görünme mesafesi (metre cinsinden)
Config.DrawDistance = 10.0

-- EN: Maximum number of players to render on screen at the same time (optimizes performance)
-- TR: Aynı onda ekranda çizdirilecek maksimum oyuncu sayısı (performans optimizasyonu için)
Config.MaxDisplayedPlayers = 12

-- EN: Nearby player scanning distance (runs in the background for efficiency)
-- TR: Yakındaki oyuncuları tarama mesafesi (performans için arka planda çalışır)
Config.CacheDistance = 15.0

-- EN: Default key configuration (uses FiveM KeyMapping, player can change it in game settings)
-- EN: 'PRIOR' refers to the Page Up key on the keyboard
-- TR: Varsayılan tuş yapılandırması (FiveM KeyMapping kullanır, oyuncu ayarlardan değiştirebilir)
-- TR: 'PRIOR' klavyedeki Page Up tuşudur
Config.DefaultKey = 'PRIOR' 

-- EN: Command name to type in chat to show ID
-- TR: Sohbet kutusundan kimliği göstermek için yazılacak komut adı
Config.CommandName = 'showid'

-- EN: Duration for the cards to stay on screen when the command is run (milliseconds)
-- TR: Komut yazıldığında kartların ekranda kalma süresi (milisaniye)
Config.ToggleDuration = 5000

-- EN: Mask checking settings
-- TR: Maske kontrolü ayarları
Config.MaskCheck = true
Config.MaskedName = "Unknown"
Config.MaskedJob = "Masked Person"
Config.MaskedGang = "Unknown"

-- EN: Voice indicator proximity levels (defaults for PMA-Voice)
-- TR: Ses (Voice) gösterge yakınlık seviyeleri (PMA-Voice için varsayılanlar)
Config.Voice = {
    Levels = {
        [1] = { name = "Whisper", bars = 1, range = 1.5 },
        [2] = { name = "Normal", bars = 2, range = 3.0 },
        [3] = { name = "Shout", bars = 3, range = 8.0 }
    }
}

-- EN: Job colors and card styles (HEX and RGBA formats)
-- TR: Mesleklere göre renkler ve kart stilleri (HEX ve RGBA formatları)
Config.Jobs = {
    ["police"] = {
        color = "#1e90ff", -- EN: Vivid Blue (LSPD etc.) | TR: Canlı Mavi (LSPD vb.)
        glow = "rgba(30, 144, 255, 0.4)",
        label = "LSPD"
    },
    ["sheriff"] = {
        color = "#e9e50cff", -- EN: Sheriff Gold | TR: Şerif Sarısı
        glow = "rgba(235, 212, 7, 0.4)",
        label = "Sheriff"
    },
    ["ambulance"] = {
        color = "#ff453a", -- EN: Vivid Red (EMS) | TR: Canlı Kırmızı (EMS)
        glow = "rgba(255, 69, 58, 0.4)",
        label = "EMS"
    },
    ["mechanic"] = {
        color = "#ff9f0a", -- EN: Orange (Mechanic) | TR: Turuncu (Mekanik)
        glow = "rgba(255, 159, 10, 0.4)",
        label = "Mechanic"
    },
    ["emlak1"] = {
        color = "#86580eff", -- EN: Real Estate | TR: Emlakçı
        glow = "rgba(153, 105, 32, 0.4)",
        label = "Mechanic"
    },
    -- EN: Gang jobs can be added here
    -- TR: Çete işleri buraya eklenebilir
    ["vagos"] = {
        color = "#ffd60a", -- EN: Yellow | TR: Sarı
        glow = "rgba(255, 214, 10, 0.4)",
        label = "Vagos"
    },
    ["ballas"] = {
        color = "#bf5af2", -- EN: Purple | TR: Mor
        glow = "rgba(191, 90, 242, 0.4)",
        label = "Ballas"
    },
    ["grove"] = {
        color = "#30d158", -- EN: Green | TR: Yeşil
        glow = "rgba(48, 209, 88, 0.4)",
        label = "Grove"
    },
    -- EN: Default civilian settings
    -- TR: Varsayılan sivil ayarı
    ["civilian"] = {
        color = "#dcdcdfff", -- EN: Grey | TR: Gri
        glow = "rgba(224, 224, 224, 0.2)",
        label = "Civilian"
    }
}

-- EN: Character states (State Indicators)
-- TR: Karakter durumları (Durum Göstergeleri)
Config.States = {
    Dead = { enable = true, icon = "skull", label = "DEAD", tooltip = "Dead / Unconscious" },
    Injured = { enable = true, icon = "heart-broken", label = "INJURED", tooltip = "Injured" },
    Handcuffed = { enable = true, icon = "lock", label = "CUFFED", tooltip = "Handcuffed" }
}