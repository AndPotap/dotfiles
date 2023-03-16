return {
    settings = {
        formatCommand = { "yapf" },
        pylsp = {
            plugins = {
                pycodestyle = {
                    enabled = true,
                    ignore = { "E301" },
                    maxLineLength = 100
                },
                yapf = {
                    enabled = true
                },
                autopep8 = {
                    enabled = false
                }
            }
        }
    }
}
