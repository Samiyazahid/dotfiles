local M = {}

local null_ls = require("null-ls")
local utils = require("dlvhdr.utils")
local lspconfigUtils = require("lspconfig.util")

local has_eslint_config = function()
  return lspconfigUtils.root_pattern(".eslintrc", ".eslintrc.json", ".eslintrc.js")(vim.fn.getcwd()) ~= nil
end

local function prettier_eslint_check()
  local has_eslint = false
  local cwd = vim.fn.getcwd()

  if has_eslint_config() then
    has_eslint = true
  else
    local rootJsonPath = lspconfigUtils.root_pattern("package.json")(cwd)
    if rootJsonPath then
      local rootJson = utils.read_json(lspconfigUtils.path.join(rootJsonPath, "package.json"))
      if rootJson.eslintConfig ~= nil then
        has_eslint = true
      end
    end

    local ancestorJsonPath = lspconfigUtils.find_package_json_ancestor()
    if ancestorJsonPath then
      local localJson = utils.read_json(ancestorJsonPath)
      if localJson.eslintConfig ~= nil then
        has_eslint = true
      end
    end
  end

  if has_eslint then
    local has_prettier_plugin = lspconfigUtils.root_pattern("node_modules/eslint-plugin-prettier/package.json")
    if has_prettier_plugin then
      return "eslint"
    end
  end

  return "prettier"
end

local jsFormatter = function()
  local formatter = prettier_eslint_check()

  if formatter == "eslint" then
    return null_ls.builtins.formatting.eslint_d.with({})
  else
    return null_ls.builtins.formatting.prettierd.with({
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "css",
        "scss",
        "less",
        "html",
        "json",
        "yaml",
        "yml",
        "markdown",
        "graphql",
      },
    })
  end
end

M.setup = function(opts)
  null_ls.setup({
    debug = true,
    root_dir = lspconfigUtils.root_pattern(".git"),
    sources = {
      null_ls.builtins.formatting.stylua.with({
        condition = function()
          return lspconfigUtils.root_pattern("stylua.toml")
        end,
      }),
      -- null_ls.builtins.formatting.prettier,
      jsFormatter,
      null_ls.builtins.diagnostics.eslint_d.with({
        condition = function()
          local has = has_eslint_config()
          return has
        end,
      }),
    },
    on_attach = opts.on_attach,
  })
end

return M

-- null_ls.builtins.diagnostics.golangci_lint.with({
--   args = { "run", "--fix=false", "--out-format=json", "$DIRNAME", "--path-prefix", "$ROOT" },
-- }),
-- null_ls.builtins.formatting.goimports,
-- null_ls.builtins.formatting.gofmt,

-- local local_utils = require("null-ls.utils").make_conditional_utils()
-- local use_prettier_override = {
--   "wix%-code%-code%-editor",
-- }
--
-- local path = vim.loop.fs_realpath(".")
--
-- for key, value in pairs(use_prettier_override) do
--   if path:find(value) ~= nil then
--     formatter = "prettier"
--     break
--   end
-- end
--
-- local use_eslint_override = {
--   "wix%-code%-devex",
-- }
--
-- for key, value in pairs(use_eslint_override) do
--   if path:find(value) ~= nil then
--     formatter = "eslint"
--     break
--   end
-- end
--
