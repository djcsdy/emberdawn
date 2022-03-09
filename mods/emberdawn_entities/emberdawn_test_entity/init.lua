local TestEntity = {
    initial_properties = {
        physical = true,
        collide_with_objects = true,
        collision_box = {-0.3, -0.3, -0.3, 0.3, 0.3, 0.3},
        visual = "mesh",
        mesh = "emberdawn_druid.b3d",
        texture = {"emberdawn_fantasy_characters_01a"}
    }
}

minetest.register_entity("emberdawn_test_entity:TestEntity", TestEntity)
