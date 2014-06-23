-- projects 0.1.2 by paramat
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

minetest.register_node("projects:horin", {
	description = "Spawn Horizontal North",
	drawtype = "airlike",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
})

minetest.register_node("projects:horis", {
	description = "Spawn Horizontal South",
	drawtype = "airlike",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
})

minetest.register_node("projects:horie", {
	description = "Spawn Horizontal East",
	drawtype = "airlike",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
})

minetest.register_node("projects:horiw", {
	description = "Spawn Horizontal West",
	drawtype = "airlike",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
})

minetest.register_node("projects:verta", {
	description = "Spawn Vertical Above",
	drawtype = "airlike",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
})

minetest.register_node("projects:entra", {
	description = "Spawn Entrance",
	drawtype = "airlike",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
})

-- ABM

-- flat north

minetest.register_abm({
	nodenames = {"projects:flatn"},
	interval = 7,
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
	interval = 11,
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
	interval = 13,
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
	interval = 17,
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

-- horizontal space north. spawn node is at left of 4 wide doorway

minetest.register_abm({
	nodenames = {"projects:horin"},
	interval = 19,
	chance = 1,
	action = function(pos, node)
		local x = pos.x
		local y = pos.y
		local z = pos.z
		local c_air = minetest.get_content_id("air")
		local c_ignore = minetest.get_content_id("ignore")
		local c_brick = minetest.get_content_id("default:sandstonebrick")
		local c_glass = minetest.get_content_id("default:obsidian_glass")
		local c_flate = minetest.get_content_id("projects:flate")
		local c_flatw = minetest.get_content_id("projects:flatw")
		--local c_horin = minetest.get_content_id("projects:horin")
		--local c_horie = minetest.get_content_id("projects:horie")
		--local c_horiw = minetest.get_content_id("projects:horiw")

		local vm = minetest.get_voxel_manip()
		local pos1 = {x=x-1, y=y-1, z=z+1}
		local pos2 = {x=x+4, y=y+3, z=z+32}
		local emin, emax = vm:read_from_map(pos1, pos2)
		local area = VoxelArea:new({MinEdge=emin, MaxEdge=emax})
		local data = vm:get_data()

		for vi in area:iterp(pos1, pos2) do
			local nodid = data[vi]
			if nodid ~= c_air and nodid ~= c_ignore then
				minetest.add_node(pos, {name="default:sandstonebrick"})
				minetest.add_node({x=x, y=y+1, z=z}, {name="default:sandstonebrick"})
				return
			end
		end

		for i = -1, 4 do
		for j = -1, 3 do
		for k = 1, 32 do
			local vi = area:index(x + i, y + j, z + k)
			if j == 3 and k <= 31 and (i == 1 or i == 2) then
				data[vi] = c_glass
			elseif i == -1 or i == 4 or j == -1 or j == 3 or k == 32 then
				data[vi] = c_brick
			end
		end
		end
		end

		for k = 1, 32 do
			if k <= 31 and math.random() < 0.1 then
				local vi = area:index(x - 1, y, z + k)
				data[vi] = c_flatw
				local vi = area:index(x - 1, y + 1, z + k)
				data[vi] = c_air
			end
			if k <= 31 and math.random() < 0.1 then
				local vi = area:index(x + 4, y, z + k)
				data[vi] = c_flate
				local vi = area:index(x + 4, y + 1, z + k)
				data[vi] = c_air
			end
		end

		vm:set_data(data)
		vm:write_to_map()
		vm:update_map()

		minetest.add_node(pos, {name="air"})
	end,
})
