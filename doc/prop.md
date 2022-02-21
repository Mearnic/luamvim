In general, using `vim.opt` will provide the expected result when the user is
used to interacting with editor |options| via `set`. There are still times
where the user may want to set particular options via a shorthand in Lua,
which is where |vim.o|, |vim.bo|, |vim.wo|, and |vim.go| come into play.

The behavior of |vim.o|, |vim.bo|, |vim.wo|, and |vim.go| is designed to
follow that of |:set|, |:setlocal|, and |:setglobal| which can be seen in the
table below:

    lua            command      global_value       local_value ~
vim.o           :set                set                set
vim.bo/vim.wo   :setlocal            -                 set
vim.go          :setglobal          set                 -

vim.o                                                   *vim.o*
        Get or set editor options, like |:set|. Invalid key is an error.
        Example: >
            vim.o.cmdheight = 4
            print(vim.o.columns)


vim.go                                                  *vim.go*
        Get or set an |option|. Invalid key is an error.

        This is a wrapper around |nvim_set_option()| and |nvim_get_option()|.

        NOTE: This is different than |vim.o| because this ONLY sets the global
        option, which generally produces confusing behavior for options with
        |global-local| values.

        Example: >
            vim.go.cmdheight = 4
<

vim.bo                                                  *vim.bo*
        Get or set buffer-scoped |local-options|. Invalid key is an error.

        This is a wrapper around |nvim_buf_set_option()| and
        |nvim_buf_get_option()|.

        Example: >
            vim.bo.buflisted = true
            print(vim.bo.comments)

vim.wo                                                  *vim.wo*
        Get or set window-scoped |local-options|. Invalid key is an error.

        This is a wrapper around |nvim_win_set_option()| and
        |nvim_win_get_option()|.

        Example: >
            vim.wo.cursorcolumn = true
            print(vim.wo.foldmarker)

