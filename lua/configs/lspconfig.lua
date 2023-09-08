local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
  return
end

lspconfig.pylsp.setup{
    settings = {
        pylsp = {
            plugins = {
                flake8 = { 
                    enabled = false
                },
                pylint = {
                    enabled = true
                },
                pycodestyle = {
                    enabled = true, -- already enabled by default
                    maxLineLength = 120,
                    indentSize = 4,
                    hangClosing = false
                },
                jedi_completion = {
                    enabled = true
                }
            }
        }
    }
}

