import raylib/raylib

InitWindow(800, 600, "basic example")

SetTargetFPS(60)

while not WindowShouldClose():
    BeginDrawing()

    ClearBackground(White)

    DrawText("Hello World!", 100, 100, 20, Black)

    EndDrawing()
