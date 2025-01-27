return {
  "neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true, -- tampilkan semua item (termasuk yang difilter)
        hide_gitignored = false, -- jangan sembunyikan file yang diabaikan git
        hide_dotfiles = false, -- jangan sembunyikan file dotfiles
        hide_by_name = {}, -- kosongkan daftar nama file yang akan disembunyikan
        never_show = {}, -- kosongkan daftar file/folder yang tidak akan pernah ditampilkan
      },
    },
  },
}
