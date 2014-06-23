-- projects 0.1.1 by paramat
-- For Minetest
-- Depends default
-- License: code WTFPL

-- rotation 0 90 180 270 is clockwise

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
	description = "Spawn Flat South",
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
		local x = pos.x
		local y = pos.y
		local z = pos.z
		local c_air = minetest.get_content_id("air")
		local c_ignore = minetest.get_content_id("ignore")
		local vm = minetest.get_voxel_manip()
		local pos1 = {x=x-6, y=y-1, z=z+1}
		local pos2 = {x=x+1, y=y+3, z=z+8}
		local emin, emax = vm:read_from_map(pos1, pos2)
		local area = VoxelArea:new({MinEdge=emin, MaxEdge=emax})
		local data = vm:get_data()
		for vi in area:iterp(pos1, pos2) do
			local nodid = data[vi]
			if nodid ~= c_air and nodid ~= c_ignore then
				minetest.add_node(pos, {name="default:sandstonebrick"})
				pos.y = pos.y + 1
				minetest.add_node(pos, {name="default:sandstonebrick"})
				return
			end
		end
		minetest.add_node(pos, {name="air"})
		local path = minetest.get_modpath("projects") .. "/schems/flat.mts"
		minetest.place_schematic({x=x-6, y=y-1, z=z+1}, path, 90, nil, true)
	end,
})

-- flat south

minetest.register_abm({
	nodenames = {"projects:flats"},
	interval = 14,
	chance = 1,
	action = function(pos, node)
		local x = pos.x
		local y = pos.y
		local z = pos.z
		local c_air = minetest.get_content_id("air")
		local c_ignore = minetest.get_content_id("ignore")
		local vm = minetest.get_voxel_manip()
		local pos1 = {x=x-1, y=y-1, z=z-8}
		local pos2 = {x=x+6, y=y+3, z=z-1}
		local emin, emax = vm:read_from_map(pos1, pos2)
		local area = VoxelArea:new({MinEdge=emin, MaxEdge=emax})
		local data = vm:get_data()
		for vi in area:iterp(pos1, pos2) do
			local nodid = data[vi]
			if nodid ~= c_air and nodid ~= c_ignore then
				minetest.add_node(pos, {name="default:sandstonebrick"})
				pos.y = pos.y + 1
				minetest.add_node(pos, {name="default:sandstonebrick"})
				return
			end
		end
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
		local x = pos.x
		local y = pos.y
		local z = pos.z
		local c_air = minetest.get_content_id("air")
		local c_ignore = minetest.get_content_id("ignore")
		local vm = minetest.get_voxel_manip()
		local pos1 = {x=x+1, y=y-1, z=z-1}
		local pos2 = {x=x+8, y=y+3, z=z+6}
		local emin, emax = vm:read_from_map(pos1, pos2)
		local area = VoxelArea:new({MinEdge=emin, MaxEdge=emax})
		local data = vm:get_data()
		for vi in area:iterp(pos1, pos2) do
			local nodid = data[vi]
			if nodid ~= c_air and nodid ~= c_ignore then
				minetest.add_node(pos, {name="default:sandstonebrick"})
				pos.y = pos.y + 1
				minetest.add_node(pos, {name="default:sandstonebrick"})
				return
			end
		end
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
		local x = pos.x
		local y = pos.y
		local z = pos.z
		local c_air = minetest.get_content_id("air")
		local c_ignore = minetest.get_content_id("ignore")
		local vm = minetest.get_voxel_manip()
		local pos1 = {x=x-8, y=y-1, z=z-6}
		local pos2 = {x=x-1, y=y+3, z=z+1}
		local emin, emax = vm:read_from_map(pos1, pos2)
		local area = VoxelArea:new({MinEdge=emin, MaxEdge=emax})
		local data = vm:get_data()
		for vi in area:iterp(pos1, pos2) do
			local nodid = data[vi]
			if nodid ~= c_air and nodid ~= c_ignore then
				minetest.add_node(pos, {name="default:sandstonebrick"})
				pos.y = pos.y + 1
				minetest.add_node(pos, {name="default:sandstonebrick"})
				return
			end
		end
		minetest.add_node(pos, {name="air"})
		local path = minetest.get_modpath("projects") .. "/schems/flat.mts"
		minetest.place_schematic({x=pos.x-8, y=pos.y-1, z=pos.z-6}, path, 0, nil, true)
	end,
})
