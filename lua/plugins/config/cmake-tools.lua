require("cmake-tools").setup {
  cmake_command = "cmake",
  cmake_build_directory = "",
  cmake_build_directory_prefix = "build/",
  cmake_generate_options = { "-D", "CMAKE_EXPORT_COMPILE_COMMANDS=1" },
  cmake_build_options = {},
  cmake_console_size = 10,
  cmake_console_position = "belowright",
  cmake_show_console = "always",
  cmake_dap_configuration = {
    name = "Launch",
    type = "lldb",
    request = "launch"
  },
  cmake_variants_message = {
    short = { show = true },
    long = { show = true, max_length = 40 }
  }
}
