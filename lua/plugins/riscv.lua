return{
  "henry-hsieh/riscv-asm-vim",
  ft = { "riscv_asm" },
}




-- return {
--   {
--     "henry-hsieh/riscv-asm-vim",
--     config = function()
--       -- Disable asm.vim's indentation logic
--       vim.api.nvim_create_autocmd("FileType", {
--         pattern = "asm,riscv",
--         callback = function()
--           -- Clear indentexpr and related settings
--           --vim.opt_local.indentexpr = ""
--           --vim.opt_local.indentkeys = ""
--           --vim.opt_local.autoindent = false
--           --vim.opt_local.smartindent = false
--           --vim.opt_local.cindent = false
--           -- Disable asm.vim logic explicitly
--           -- vim.g.did_load_filetypes = 0
--         end,
--       })
--     end,
--   },
-- }
-- 
-- 
