local M = {}

---@param opts conform.setupOpts
function M.setup(_, opts)
  for _, key in ipairs({ "format_on_save", "format_after_save" }) do
    if opts[key] then
      local msg = "Don't set `opts.%s` for `conform.nvim`.\n**LazyVim** will use the conform formatter automatically"
      LazyVim.warn(msg:format(key))
      ---@diagnostic disable-next-line: no-unknown
      opts[key] = nil
    end
  end
  ---@diagnostic disable-next-line: undefined-field
  if opts.format then
    LazyVim.warn("**conform.nvim** `opts.format` is deprecated. Please use `opts.default_format_opts` instead.")
  end
  require("conform").setup(opts)
end

return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["html"] = { "prettier" },
        ["python"] = { "black" },
      },
    },
  },
}
