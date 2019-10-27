version       = "0.1.0"
author        = "Oskari Timperi"
description   = "A new awesome nimble package"
license       = "Zlib"

requires "nim >= 1.0.2"
requires "nimgen >= 0.5.1"

var
  name = "raylib"
  cmd = when defined(Windows): "cmd /c " else: ""

task setup, "Generate wrapper with nimgen":
    if gorgeEx(cmd & "nimgen").exitCode != 0:
        withDir(".."):
            exec "nimble install nimgen -y"
    exec cmd & "nimgen " & name & ".cfg"

before install:
    setupTask()
