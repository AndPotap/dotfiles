return {
    settings = {
        formatCommand = {"yapf"},
        pylsp = {
            plugins = {
                autopep8 = {
                    enabled = false
                },
                pycodestyle = {
                    enabled = false,
                    maxLineLength = 100
                },
                yapf = {
                    enabled = true
                }
            }
        }
    }
}
