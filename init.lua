-- projects 0.1.0 by paramat
-- For 
-- Depends default
-- License: code WTFPL

-- Parameters



-- Stuff

projects = {}

-- Nodes

minetest.register_node("projects:flatn", {
	description = "Spawn Flat North",
	drawtype = "airlike",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
})

minetest.register_node("projects:flats", {
	description = "Spawn Flat SOuth",
	drawtype = "airlike",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
})

minetest.register_node("projects:flate", {
	description = "Spawn Flat East",
	drawtype = "airlike",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
})

minetest.register_node("projects:flatw", {
	description = "Spawn Flat West",
	drawtype = "airlike",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
})

-- ABM

-- flat north

minetest.register_abm({
	nodenames = {"projects:flatn"},
	interval = 13,
	chance = 1,
	action = function(pos, node)
		minetest.add_node(pos, {name="air"})
		local path = minetest.get_modpath("projects") .. "/schems/flat.mts"
		minetest.place_schematic({x=pos.x-6, y=pos.y-1, z=pos.z+1}, path, 90, nil, true)
	end,
})

-- flat south

minetest.register_abm({
	nodenames = {"projects:flats"},
	interval = 14,
	chance = 1,
	action = function(pos, node)
		minetest.add_node(pos, {name="air"})
		local path = minetest.get_modpath("projects") .. "/schems/flat.mts"
		minetest.place_schematic({x=pos.x-1, y=pos.y-1, z=pos.z-8}, path, 270, nil, true)
	end,
})

-- flat east

minetest.register_abm({
	nodenames = {"projects:flate"},
	interval = 15,
	chance = 1,
	action = function(pos, node)
		minetest.add_node(pos, {name="air"})
		local path = minetest.get_modpath("projects") .. "/schems/flat.mts"
		minetest.place_schematic({x=pos.x+1, y=pos.y-1, z=pos.z-1}, path, 180, nil, true)
	end,
})

-- flat west

minetest.register_abm({
	nodenames = {"projects:flatw"},
	interval = 16,
	chance = 1,
	action = function(pos, node)
		minetest.add_node(pos, {name="air"})
		local path = minetest.get_modpath("projects") .. "/schems/flat.mts"
		minetest.place_schematic({x=pos.x-8, y=pos.y-1, z=pos.z-6}, path, 0, nil, true)
	end,
})
