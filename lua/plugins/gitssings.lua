return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre", -- ファイルを開く前に読み込む
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require('gitsigns').setup {
      signs = {
        add          = { text = '+' },
        change       = { text = '~' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
      },
      current_line_blame = true, -- インラインで誰が書いたか表示
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 行末に表示
        delay = 500,           -- 0.5秒後に表示
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        -- キーマップ例
        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        map('n', ']h', gs.next_hunk)
        map('n', '[h', gs.prev_hunk)
        map({ 'n', 'v' }, '<leader>hs', gs.stage_hunk)
        map({ 'n', 'v' }, '<leader>hr', gs.reset_hunk)
        map('n', '<leader>hS', gs.stage_buffer)
        map('n', '<leader>hu', gs.undo_stage_hunk)
        map('n', '<leader>hR', gs.reset_buffer)
        map('n', '<leader>hp', gs.preview_hunk)
        map('n', '<leader>hb', function() gs.blame_line { full = true } end)
      end,
    }
  end
}
