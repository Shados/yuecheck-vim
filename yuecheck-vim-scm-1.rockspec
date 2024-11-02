package = "yuecheck-vim"
version = "scm-1"
source = {
  url = "git://github.com/Shados/yuecheck-vim",
  branch = "master",
}
description = {
  summary = "A wrapper around luacheck to allow it to handle Yuescript, integrated into vim via ALE",
  homepage = "https://github.com/Shados/yuecheck-vim",
  license = "MIT",
}
dependencies = {
  "lua >= 5.1",
  "luacheck >= 1.2.0",
  "luaposix >= 36.2.1",
}
build_dependencies = {
  "yuescript >= 0.26.0",
}
build = {
  type = "make",

  install_variables = {
    LUA_SHARE_DIR="$(LUADIR)",
    PREFIX="$(PREFIX)",
  },
}
rockspec_format = "3.0"
