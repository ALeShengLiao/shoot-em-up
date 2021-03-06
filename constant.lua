--[[
|                   |                  |  1  |  2  |  4  |  8  |  16  |  32  |  64  |  SUM   |
|-------------------|------------------|-----|-----|-----|-----|------|------|------|--------|
| Player            | category         | O   |     |     |     |      |      |      |        |
|                   | ---------------- | --- | --- | --- | --- | ---- | ---- | ---- | -----  |
|                   | collision with   |     | x   | x   |     | x    |      |      | 18     |
|-------------------|------------------|-----|-----|-----|-----|------|------|------|--------|
| Enemy / FIRSTBOSS | category         |     | O/O |     |     |      |      |      |        |
|                   | ---------------- | --- | --- | --- | --- | ---- | ---- | ---- | -----  |
|                   | collision with   | x/x | n/x | x/x |     |      | n/x  |      | 5 / 39 |
|-------------------|------------------|-----|-----|-----|-----|------|------|------|--------|
| bullet            | category         |     |     | O/O |     |      |      |      |        |
|                   | ---------------- | --- | --- | --- | --- | ---- | ---- | ---- | -----  |
|                   | collision with   | n/x | x/n |     |     |      |      |      | 2/1    |
|-------------------|------------------|-----|-----|-----|-----|------|------|------|--------|
| asteroid          | category         |     |     |     | O   |      |      |      |        |
|                   | ---------------- | --- | --- | --- | --- | ---- | ---- | ---- | -----  |
|                   | collision with   | x   | x   | x   | x   |      |      |      |        |
|-------------------|------------------|-----|-----|-----|-----|------|------|------|--------|
| item              | category         |     |     |     |     | O    |      |      |        |
|                   | ---------------- | --- | --- | --- | --- | ---- | ---- | ---- | -----  |
|                   | collision with   | x   |     |     |     |      |      |      |        |
|-------------------|------------------|-----|-----|-----|-----|------|------|------|--------|
| wall              | category         |     |     |     |     |      | o    |      |        |
|                   | ---------------- | --- | --- | --- | --- | ---- | ---- | ---- | -----  |
|                   | collision with   |     | x   |     |     |      |      |      | 2      |
|-------------------|------------------|-----|-----|-----|-----|------|------|------|--------|
| missile           | category         |     |     |     |     |      |      | o    | 64     |
|                   | ---------------- | --- | --- | --- | --- | ---- | ---- | ---- | -----  |
|                   | collision with   | o   | o   |     |     |      |      | o    |        |
|-------------------|------------------|-----|-----|-----|-----|------|------|------|--------|
--]]
local constant = {}

PHYSIC_CATEGORY_CHARACTER = 1
PHYSIC_CATEGORY_ENEMY = 2
PHYSIC_CATEGORY_BULLET = 4
PHYSIC_CATEGORY_ASTEROID = 8
PHYSIC_CATEGORY_ITEM = 16
PHYSIC_CATEGORY_WALL = 32
PHYSIC_CATEGORY_MISSILE = 64
PHYSIC_CATEGORY_VICTIM = 128
PHYSIC_CATEGORY_SHIELD = 256
PHYSIC_CATEGORY_FIELD = 512

return constant