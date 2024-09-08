return {
  'windwp/nvim-autopairs',
  event = "InsertEnter",
  opts = {
    check_ts = true,
    is_config = {
      lua = { "string" },
      javascript = { "template_string" },
      java = false,
    }
  },
}
