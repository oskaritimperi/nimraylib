# Package

version       = "0.1.0"
author        = "Oskari Timperi"
description   = "A new awesome nimble package"
license       = "Zlib"
srcDir        = "src"



# Dependencies

requires "nim >= 1.0.2"
requires "nimgen >= 0.5.1"

var
  name = "nimraylib"
  cmd = when defined(Windows): "cmd /c " else: ""
  ext = when defined(Windows): ".exe" else: ""
  ldpath = when defined(Linux): "LD_LIBRARY_PATH=x64 " else: ""

# mkDir(name)

task setup, "Checkout and generate":
    if gorgeEx(cmd & "nimgen").exitCode != 0:
        withDir(".."):
            exec "nimble install nimgen -y"
    exec cmd & "nimgen " & name & ".cfg"

before install:
    setupTask()

# task test, "Test nimbass":
#   exec "nim c -d:nimDebugDlOpen tests/basstest.nim"
#   withDir("nimbass"):
#     exec ldpath & "../tests/basstest" & ext
