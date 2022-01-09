-- Declarations of Minetest built-ins to enable IDE autocompletion, etc.
-- Not used at runtime!

---@diagnostic disable-next-line: lowercase-global
minetest = {}

--- @class Position
--- @field x number
--- @field y number
--- @field z number

--- @class MapNode
--- @field name string
--- @field prob number
--- @field param1 number
--- @field param2 number
--- @field force_place boolean

--- A helper class for voxel areas.
--- 
--- The coordinates are *inclusive*, like most other things in Minetest.
--- @class VoxelArea
--- @field ystride number
--- @field zstride number
VoxelArea = {}

--- Creates a new VoxelArea.
--- @param MinEdge Position
--- @param MaxEdge Position
--- @return VoxelArea
function VoxelArea:new(MinEdge, MaxEdge) end

--- Returns a 3D vector containing the size of the area formed by `MinEdge`
--- and `MaxEdge`.
--- @return Position
function VoxelArea:getExtent() end

--- Returns the volume of the area formed by `MinEdge` and `MaxEdge`.
--- @return number
function VoxelArea:getVolume() end

--- Returns the index of an absolute position in a flat array starting at `1`.
---
--- `x`, `y`, and `z` must be integers to avoid an incorrect index result.
---
--- The position (`x`, `y`, `z`) is not checked for being inside the area volume,
--- being outside can cause an incorrect index result.
---
--- Useful for things like `VoxelManip`, raw Schematic specifiers,
--- `PerlinNoiseMap:get2d`/`3dMap`, and so on.
--- @param x number
--- @param y number
--- @param z number
--- @return number
function VoxelArea:index(x, y, z) end

--- Returns the index of an absolute position in a flat array starting at `1`.
---
--- The position `p` is not checked for being inside the area volume,
--- being outside can cause an incorrect index result.
---
--- Useful for things like `VoxelManip`, raw Schematic specifiers,
--- `PerlinNoiseMap:get2d`/`3dMap`, and so on.
--- @param p Position
--- @return number
function VoxelArea:indexp(p) end

--- Returns the absolute poisition vector corresponding to index `i`.
--- @param i number
--- @return Position
function VoxelArea:position(i) end

--- Check if (`x`, `y`, `z`) is inside area formed by `MinEdge` and `MaxEdge`.
--- @param x number
--- @param y number
--- @param z number
--- @return boolean
function VoxelArea:contains(x, y, z) end

--- Check if position `p` is inside area formed by `MinEdge` and `MaxEdge`.
--- @param p Position
--- @return boolean
function VoxelArea:containsp(p) end

--- Check if index `i` is inside area formed by `MinEdge` and `MaxEdge`.
--- @param i number
--- @return boolean
function VoxelArea:containsi(i) end

--- Returns an iterator that returns indices from (`minx`, `miny`, `minz`)
--- to (`maxx`, `maxy`, `maxz`) in the order of `[z [y [x]]]`.
--- @param minx number
--- @param miny number
--- @param minz number
--- @param maxx number
--- @param maxy number
--- @param maxz number
--- @return fun(): number
function VoxelArea:iter(minx, miny, minz, maxx, maxy, maxz) end

--- Returns an iterator that returns indices from `minp` to `maxp` in the
--- order of `[z [y [x]]]`.
--- @param minp Position
--- @param maxp Position
--- @return fun(): number
function VoxelArea:iterp(minp, maxp) end

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