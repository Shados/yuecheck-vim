# yuecheck-vim

Setup/usage:
1. Install the `yuecheck` executable script using luarocks, e.g.
   `luarocks install https://raw.githubusercontent.com/Shados/yuecheck-vim/master/yuecheck-vim-scm-1.rockspec`.
2. Already have [ALE](https://github.com/dense-analysis/ale/) installed and configured in (neo)vim.
3. Add this repository as a vim plugin, using whatever plugin manager or other approach you like.
4. Optionally configure it by setting `g:ale_yue_yuecheck_executable` and
   `g:ale_yue_yuecheck_options` appropriately. yuecheck passes on received
   options to luacheck internally, and it also specifies the following options
   and arguments by default, which you should *not* override: `--codes
   --formatter plain --no-max-line-length -`

   You can also set the `YUE_TARGET` and `YUE_PATH` environment variables to
   configure the targeted Lua version for Yuescript, and the additional Lua
   search path, respectively.

Note: This relies on the Yuescript compiler's mapping of output Lua line
numbers to Yuescript source line numbers, which is *not* always perfect. There
are various situations which can cause stated line numbers to be off by one, at
least.
