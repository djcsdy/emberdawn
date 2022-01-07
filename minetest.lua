-- Declarations of Minetest built-ins to enable IDE autocompletion, etc.
-- Not used at runtime!

---@diagnostic disable-next-line: lowercase-global
minetest = {}

--- @class Position
--- @field x number
--- @field y number
--- @field z number

--- Queue all blocks in the area from `pos1` to `pos2`, inclusive, to be
--- asynchronously fetched from memory, loaded from disk, or if inexistent,
--- generates them.
---
--- If `callback` is a valid Lua function, this will be called for each block
--- emerged.
---
--- @param pos1 Position
--- @param pos2 Position
--- @param callback? EmergeAreaCallback
--- @param param? any
function minetest.emerge_area(pos1, pos2, callback, param) end

--- @alias EmergeAreaCallback fun(blockpos: Position, action: any, calls_remaining: number, param: any)