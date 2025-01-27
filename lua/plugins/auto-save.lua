return {
  "okuuva/auto-save.nvim",
  version = "^1.0.0", -- gunakan versi yang stabil
  cmd = "ASToggle", -- opsional, untuk lazy loading dengan perintah
  event = { "InsertLeave", "TextChanged" }, -- event untuk lazy loading
  opts = {
    enabled = true, -- aktifkan auto-save secara default
    trigger_events = {
      immediate_save = { "BufLeave", "FocusLost", "QuitPre", "VimSuspend" }, -- simpan segera pada event tertentu
      defer_save = { "InsertLeave", "TextChanged" }, -- simpan tertunda setelah delay
      cancel_deferred_save = { "InsertEnter" }, -- batalkan simpan tertunda pada event tertentu
    },
    condition = function(buf)
      return vim.bo[buf].modifiable and vim.bo[buf].buftype == ""
    end, -- pastikan hanya buffer yang bisa dimodifikasi dan bukan buffer khusus
    write_all_buffers = true, -- simpan semua buffer, bukan hanya buffer aktif
    noautocmd = false, -- jalankan autocommand saat menyimpan
    lockmarks = false, -- jangan kunci marks saat menyimpan
    debounce_delay = 1000, -- delay (ms) sebelum simpan otomatis
    debug = false, -- nonaktifkan log debug
  },
}

