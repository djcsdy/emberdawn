-- Declarations of Minetest built-ins to enable IDE autocompletion, etc.
-- Not used at runtime!

---@diagnostic disable-next-line: lowercase-global
minetest = {}

--- @class Position
--- @field x integer
--- @field y integer
--- @field z integer

--- @class MapNode
--- @field name string
--- @field prob integer
--- @field param1 integer
--- @field param2 integer
--- @field force_place boolean

--- VoxelManip is a scripting interface to the internal 'Map Voxel Manipulator'
--- facility. The purpose of this object is for fast, low-level, bulk access to
--- reading and writing Map content. As such, setting map nodes through VoxelManip
--- will lack many of the higher level features and concepts you may be used to
--- with other methods of setting nodes. For example, nodes will not have their
--- construction and destruction callbacks run, and no rollback information is
--- logged.
---
--- It is important to note that VoxelManip is designed for speed, and *not* ease
--- of use or flexibility. If your mod requires a map manipulation facility that
--- will handle 100% of all edge cases, or the use of high level node placement
--- features, perhaps `minetest.set_node()` is better suited for the job.
---
--- In addition, VoxelManip might not be faster, or could even be slower, for your
--- specific use case. VoxelManip is most effective when setting large areas of map
--- at once - for example, if only setting a 3x3x3 node area, a
--- `minetest.set_node()` loop may be more optimal. Always profile code using both
--- methods of map manipulation to determine which is most appropriate for your
--- usage.
---
--- A recent simple test of setting cubic areas showed that `minetest.set_node()`
--- is faster than a VoxelManip for a 3x3x3 node cube or smaller.
--- @class VoxelManip
--- @param p1? Position
--- @param p2? Position
function VoxelManip(p1, p2) end

--- @param p1? Position
--- @param p2? Position
--- @return VoxelManip
function minetest.get_voxel_manip(p1, p2) end

--- Loads an area of the map into the VoxelManip.
---
--- Returns two position vectors. The region formed by these positions
--- indicate the minimum and maximum (respectively) positions of the area
--- actually loaded into the VoxelManip, which may be larger than the area
--- requested.
---
--- @param p1 Position
--- @param p2 Position
--- @return '{Position, Position}'
function VoxelManip:read_from_map(p1, p2) end

--- Writes data contained by the VoxelManip back to the map itself.
---
--- **Important**: Data must be set using `VoxelManip:set_data()` before
--- calling this method.
---
--- If `light` is true, then lighting is automatically recalculated. The
--- default value is true.
---
--- If `light` is false, then no light calculations happen, and you should
--- correct all modified blocks with `minetest.fix_light()` as soon as
--- possible. Keep in mind that modifying the map where light is incorrect
--- can cause more lighting bugs.
---
--- @param light? boolean
function VoxelManip:write_to_map(light) end

--- Gets an individual node at the specified coordinates.
--- @param pos Position
--- @return MapNode
function VoxelManip:get_node_at(pos) end

--- Sets a specific `MapNode` in the `VoxelManip` at the specified position.
--- @param pos Position
--- @param node MapNode
function VoxelManip:set_node_at(pos, node) end

--- Gets a flat array of the Content ID of each node contained by the
--- VoxelManip.
---
--- The values returned are a snapshot of the state of the VoxelManip at the
--- time of the call.
---
--- If the parameter `buffer` is present, then the provided buffer will be
--- used to store the result.
---
--- @param buffer? integer[]
--- @return integer[]
function VoxelManip:get_data(buffer) end

--- Sets the content ID of each node contained by the VoxelManip to the values
--- specified in the provided flat array.
---
--- Modifies the internal state of the VoxelManip, but does not write changes
--- to the map itself.
---
--- @param data integer[]
function VoxelManip:set_data(data) end

--- Does nothing, kept for compatibility.
--- @deprecated
function VoxelManip:update_map() end

--- Set the lighting within the `VoxelManip` to a uniform value.
---
--- To be used only with a `VoxelManip` object provided by
--- `minetest.get_mapgen_object`.
---
--- `p1` and `p2` specify the area in which lighting is set. The default is to
--- set lighting of every node contained by the `VoxelManip`.
---
--- @param light Light
--- @param p1? Position
--- @param p2? Position
function VoxelManip:set_lighting(light, p1, p2) end

--- @class Light
--- @field day integer Daytime light level from 0-15
--- @field night integer Night-time light level from 0-15

--- Gets a flat array of the light data of each node contained by the
--- VoxelManip.
---
--- Each integer in the array contains both the daytime and night-time light
--- levels. Each light level is a value in the range 0-15 and they are stored
--- together using the formula `light = day + (night * 16)`.
---
--- The values returned are a snapshot of the state of the VoxelManip at the
--- time of the call.
---
--- @return integer[]
function VoxelManip:get_light_data() end

--- Sets the light data of each node contained by the VoxelManip to the
--- values specified in the provided flat array.
---
--- Each integer in the array contains both the daytime and night-time light
--- levels. Each light level is a value in the range 0-15 and they are stored
--- together using the formula `light = day + (night * 16)`.
---
--- Modifies the internal state of the VoxelManip, but does not write changes
--- to the map itself.
---
--- @param data integer[]
function VoxelManip:set_light_data(data) end

--- Gets a flat array of the node type-dependent "param2" value of each node
--- contained by the VoxelManip.
---
--- Each value is an integer in the range 0-255.
---
--- If the parameter `buffer` is present, then the provided buffer will be
--- used to store the result.
---
--- The values returned are a snapshot of the state of the VoxelManip at the
--- time of the call.
---
--- @param buffer? integer[]
--- @return integer[]
function VoxelManip:get_param2_data(buffer) end

--- Sets the node type-dependent "param2" value of each node contained by the
--- VoxelManip to the values specified in the provided flat array.
---
--- Each value is an integer in the range 0-255.
---
--- Modifies the internal state of the VoxelManip, but does not write changes
--- to the map itself.
---
--- @param data integer[]
function VoxelManip:set_param2_data(data) end

--- Returns the minimum and maximum coordinates of the area loaded into the
--- VoxelManip.
--- @return '{Position, Position}'
function VoxelManip:get_emerged_area() end

--- Calculates lighting information for the nodes contained by the VoxelManip.
function VoxelManip:calc_lighting() end

--- A helper class for voxel areas.
---
--- The coordinates are *inclusive*, like most other things in Minetest.
--- @class VoxelArea
--- @field ystride integer
--- @field zstride integer
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
--- @return integer
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
--- @param x integer
--- @param y integer
--- @param z integer
--- @return integer
function VoxelArea:index(x, y, z) end

--- Returns the index of an absolute position in a flat array starting at `1`.
---
--- The position `p` is not checked for being inside the area volume,
--- being outside can cause an incorrect index result.
---
--- Useful for things like `VoxelManip`, raw Schematic specifiers,
--- `PerlinNoiseMap:get2d`/`3dMap`, and so on.
--- @param p Position
--- @return integer
function VoxelArea:indexp(p) end

--- Returns the absolute poisition vector corresponding to index `i`.
--- @param i integer
--- @return Position
function VoxelArea:position(i) end

--- Check if (`x`, `y`, `z`) is inside area formed by `MinEdge` and `MaxEdge`.
--- @param x integer
--- @param y integer
--- @param z integer
--- @return boolean
function VoxelArea:contains(x, y, z) end

--- Check if position `p` is inside area formed by `MinEdge` and `MaxEdge`.
--- @param p Position
--- @return boolean
function VoxelArea:containsp(p) end

--- Check if index `i` is inside area formed by `MinEdge` and `MaxEdge`.
--- @param i integer
--- @return boolean
function VoxelArea:containsi(i) end

--- Returns an iterator that returns indices from (`minx`, `miny`, `minz`)
--- to (`maxx`, `maxy`, `maxz`) in the order of `[z [y [x]]]`.
--- @param minx integer
--- @param miny integer
--- @param minz integer
--- @param maxx integer
--- @param maxy integer
--- @param maxz integer
--- @return fun(): integer
function VoxelArea:iter(minx, miny, minz, maxx, maxy, maxz) end

--- Returns an iterator that returns indices from `minp` to `maxp` in the
--- order of `[z [y [x]]]`.
--- @param minp Position
--- @param maxp Position
--- @return fun(): integer
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

--- @alias EmergeAreaCallback fun(blockpos: Position, action: any, calls_remaining: integer, param: any)
