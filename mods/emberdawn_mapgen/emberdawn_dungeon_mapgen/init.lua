minetest.register_alias("mapgen_singlenode", "mcl_core:stone")

local room_min = {x=-2, y=0, z=-2}
local room_max = {x=2, y=3, z=4}

minetest.register_on_generated(function(minp, maxp, blockseed)
    local voxel_manip = minetest.get_voxel_manip(room_min, room_max)
    local manip_min, manip_max = voxel_manip:get_emerged_area()
    local manip_area = VoxelArea:new({MinEdge = manip_min, MaxEdge = manip_max})
    local content_ids = voxel_manip:get_data()
    local light_data = voxel_manip:get_light_data()
    
    for i in manip_area:iterp(room_min, room_max) do
        content_ids[i] = minetest.CONTENT_AIR
        light_data[i] = 255
    end

    voxel_manip:set_data(content_ids)
    voxel_manip:set_light_data(light_data)
    voxel_manip:write_to_map(false)
end)
