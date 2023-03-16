return {
    settings = {
        formatCommand = { "yapf" },
        pylsp = {
            plugins = {
                pycodestyle = {
                    enabled = true,
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
