-- projects 0.1.7 by paramat
-- For Minetest
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
})

minetest.register_node("projects:flats", {
	description = "Spawn Flat South",
	drawtype = "airlike",
	paramtype = "light",
	sunlight_propagates = true,
})

minetest.register_node("projects:flate", {
	description = "Spawn Flat East",
	drawtype = "airlike",
	paramtype = "light",
	sunlight_propagates = true,
})

minetest.register_node("projects:flatw", {
	description = "Spawn Flat West",
	drawtype = "airlike",
	paramtype = "light",
	sunlight_propagates = true,
})

minetest.register_node("projects:horin", {
	description = "Spawn Horizontal North",
	drawtype = "airlike",
	paramtype = "light",
	sunlight_propagates = true,
})

minetest.register_node("projects:horis", {
	description = "Spawn Horizontal South",
	drawtype = "airlike",
	paramtype = "light",
	sunlight_propagates = true,
})

minetest.register_node("projects:horie", {
	description = "Spawn Horizontal East",
	drawtype = "airlike",
	paramtype = "light",
	sunlight_propagates = true,
})

minetest.register_node("projects:horiw", {
	description = "Spawn Horizontal West",
	drawtype = "airlike",
	paramtype = "light",
	sunlight_propagates = true,
})

minetest.register_node("projects:verta", {
	description = "Spawn Vertical Above",
	tiles = {"default_sandstone_brick.png"},
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("projects:vertopa", {
	description = "Spawn Vertical Top Above",
	tiles = {"default_sandstone_brick.png"},
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("projects:vertenta", {
	description = "Spawn Vertical Entrance Above",
	tiles = {"default_sandstone_brick.png"},
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
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

-- horizontal space north. spawn node is at west end of 4 wide doorway

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
		--local c_horis = minetest.get_content_id("projects:horis")
		--local c_horie = minetest.get_content_id("projects:horie")
		--local c_horiw = minetest.get_content_id("projects:horiw")

		local len = math.random(16, 64)
		local vm = minetest.get_voxel_manip()
		local pos1 = {x=x-1, y=y-1, z=z+1}
		local pos2 = {x=x+4, y=y+3, z=z+len}
		local emin, emax = vm:read_from_map(pos1, pos2)
		local area = VoxelArea:new({MinEdge=emin, MaxEdge=emax})
		local data = vm:get_data()

		for vi in area:iterp(pos1, pos2) do
			local nodid = data[vi]
			if nodid ~= c_air and nodid ~= c_ignore then
				for i = 0, 3 do
				for j = 0, 2 do
					minetest.add_node({x=x+i, y=y+j, z=z}, {name="default:sandstonebrick"})
				end
				end
				return
			end
		end

		for i = -1, 4 do
		for j = -1, 3 do
		for k = 1, len do
			local vi = area:index(x + i, y + j, z + k)
			if i == -1 or i == 4 or j == -1 or (j == 3 and (i <= 0 or i >= 3)) then
				data[vi] = c_brick
			elseif j == 3 or k == len then
				data[vi] = c_glass
			end
		end
		end
		end

		for k = 1, len do
			if k < len and math.random() < 0.1 then
				local vi = area:index(x - 1, y, z + k)
				data[vi] = c_flatw
				local vi = area:index(x - 1, y + 1, z + k)
				data[vi] = c_air
			end
			if k < len and math.random() < 0.1 then
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

-- horizontal space south. spawn node is at west end of 4 wide doorway

minetest.register_abm({
	nodenames = {"projects:horis"},
	interval = 23,
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
		--local c_horis = minetest.get_content_id("projects:horis")
		--local c_horie = minetest.get_content_id("projects:horie")
		--local c_horiw = minetest.get_content_id("projects:horiw")

		local len = math.random(16, 64)
		local vm = minetest.get_voxel_manip()
		local pos1 = {x=x-1, y=y-1, z=z-len}
		local pos2 = {x=x+4, y=y+3, z=z-1}
		local emin, emax = vm:read_from_map(pos1, pos2)
		local area = VoxelArea:new({MinEdge=emin, MaxEdge=emax})
		local data = vm:get_data()

		for vi in area:iterp(pos1, pos2) do
			local nodid = data[vi]
			if nodid ~= c_air and nodid ~= c_ignore then
				for i = 0, 3 do
				for j = 0, 2 do
					minetest.add_node({x=x+i, y=y+j, z=z}, {name="default:sandstonebrick"})
				end
				end
				return
			end
		end

		for i = -1, 4 do
		for j = -1, 3 do
		for k = 1,len do
			local vi = area:index(x + i, y + j, z - k)
			if i == -1 or i == 4 or j == -1 or (j == 3 and (i <= 0 or i >= 3)) then
				data[vi] = c_brick
			elseif j == 3 or k == len then
				data[vi] = c_glass
			end
		end
		end
		end

		for k = 1, len do
			if k < len and math.random() < 0.1 then
				local vi = area:index(x - 1, y, z - k)
				data[vi] = c_flatw
				local vi = area:index(x - 1, y + 1, z - k)
				data[vi] = c_air
			end
			if k < len and math.random() < 0.1 then
				local vi = area:index(x + 4, y, z - k)
				data[vi] = c_flate
				local vi = area:index(x + 4, y + 1, z - k)
				data[vi] = c_air
			end
		end

		vm:set_data(data)
		vm:write_to_map()
		vm:update_map()

		minetest.add_node(pos, {name="air"})
	end,
})

-- horizontal space east. spawn node is at south end of 4 wide doorway

minetest.register_abm({
	nodenames = {"projects:horie"},
	interval = 29,
	chance = 1,
	action = function(pos, node)
		local x = pos.x
		local y = pos.y
		local z = pos.z
		local c_air = minetest.get_content_id("air")
		local c_ignore = minetest.get_content_id("ignore")
		local c_brick = minetest.get_content_id("default:sandstonebrick")
		local c_glass = minetest.get_content_id("default:obsidian_glass")
		local c_flatn = minetest.get_content_id("projects:flatn")
		local c_flats = minetest.get_content_id("projects:flats")
		--local c_horin = minetest.get_content_id("projects:horin")
		--local c_horis = minetest.get_content_id("projects:horis")
		--local c_horie = minetest.get_content_id("projects:horie")
		--local c_horiw = minetest.get_content_id("projects:horiw")

		local len = math.random(16, 64)
		local vm = minetest.get_voxel_manip()
		local pos1 = {x=x+1, y=y-1, z=z-1}
		local pos2 = {x=x+len, y=y+3, z=z+4}
		local emin, emax = vm:read_from_map(pos1, pos2)
		local area = VoxelArea:new({MinEdge=emin, MaxEdge=emax})
		local data = vm:get_data()

		for vi in area:iterp(pos1, pos2) do
			local nodid = data[vi]
			if nodid ~= c_air and nodid ~= c_ignore then
				for k = 0, 3 do
				for j = 0, 2 do
					minetest.add_node({x=x, y=y+j, z=z+k}, {name="default:sandstonebrick"})
				end
				end
				return
			end
		end

		for i = 1, len do
		for j = -1, 3 do
		for k = -1, 4 do
			local vi = area:index(x + i, y + j, z + k)
			if k == -1 or k == 4 or j == -1 or (j == 3 and (k <= 0 or k >= 3)) then
				data[vi] = c_brick
			elseif j == 3 or i == len then
				data[vi] = c_glass
			end
		end
		end
		end

		for i = 1, len do
			if i < len and math.random() < 0.1 then
				local vi = area:index(x + i, y, z - 1)
				data[vi] = c_flats
				local vi = area:index(x + i, y + 1, z - 1)
				data[vi] = c_air
			end
			if i < len and math.random() < 0.1 then
				local vi = area:index(x + i, y, z + 4)
				data[vi] = c_flatn
				local vi = area:index(x + i, y + 1, z + 4)
				data[vi] = c_air
			end
		end

		vm:set_data(data)
		vm:write_to_map()
		vm:update_map()

		minetest.add_node(pos, {name="air"})
	end,
})

-- horizontal space west. spawn node is at south end of 4 wide doorway

minetest.register_abm({
	nodenames = {"projects:horiw"},
	interval = 31,
	chance = 1,
	action = function(pos, node)
		local x = pos.x
		local y = pos.y
		local z = pos.z
		local c_air = minetest.get_content_id("air")
		local c_ignore = minetest.get_content_id("ignore")
		local c_brick = minetest.get_content_id("default:sandstonebrick")
		local c_glass = minetest.get_content_id("default:obsidian_glass")
		local c_flatn = minetest.get_content_id("projects:flatn")
		local c_flats = minetest.get_content_id("projects:flats")
		--local c_horin = minetest.get_content_id("projects:horin")
		--local c_horis = minetest.get_content_id("projects:horis")
		--local c_horie = minetest.get_content_id("projects:horie")
		--local c_horiw = minetest.get_content_id("projects:horiw")

		local len = math.random(16, 64)
		local vm = minetest.get_voxel_manip()
		local pos1 = {x=x-len, y=y-1, z=z-1}
		local pos2 = {x=x-1, y=y+3, z=z+4}
		local emin, emax = vm:read_from_map(pos1, pos2)
		local area = VoxelArea:new({MinEdge=emin, MaxEdge=emax})
		local data = vm:get_data()

		for vi in area:iterp(pos1, pos2) do
			local nodid = data[vi]
			if nodid ~= c_air and nodid ~= c_ignore then
				for k = 0, 3 do
				for j = 0, 2 do
					minetest.add_node({x=x, y=y+j, z=z+k}, {name="default:sandstonebrick"})
				end
				end
				return
			end
		end

		for i = 1, len do
		for j = -1, 3 do
		for k = -1, 4 do
			local vi = area:index(x - i, y + j, z + k)
			if k == -1 or k == 4 or j == -1 or (j == 3 and (k <= 0 or k >= 3)) then
				data[vi] = c_brick
			elseif j == 3 or i == len then
				data[vi] = c_glass
			end
		end
		end
		end

		for i = 1, len do
			if i < len and math.random() < 0.1 then
				local vi = area:index(x - i, y, z - 1)
				data[vi] = c_flats
				local vi = area:index(x - i, y + 1, z - 1)
				data[vi] = c_air
			end
			if i < len and math.random() < 0.1 then
				local vi = area:index(x - i, y, z + 4)
				data[vi] = c_flatn
				local vi = area:index(x - i, y + 1, z + 4)
				data[vi] = c_air
			end
		end

		vm:set_data(data)
		vm:write_to_map()
		vm:update_map()

		minetest.add_node(pos, {name="air"})
	end,
})

-- vertical space above. spawn node is below minimum point

minetest.register_abm({
	nodenames = {"projects:verta"},
	interval = 37,
	chance = 1,
	action = function(pos, node)
		local x = pos.x
		local y = pos.y
		local z = pos.z
		local c_air = minetest.get_content_id("air")
		local c_brick = minetest.get_content_id("default:sandstonebrick")
		local c_slab = minetest.get_content_id("stairs:slab_stonebrick")
		local c_glass = minetest.get_content_id("default:obsidian_glass")
		local c_horin = minetest.get_content_id("projects:horin")
		local c_horis = minetest.get_content_id("projects:horis")
		local c_verta = minetest.get_content_id("projects:verta")
		local c_vertopa = minetest.get_content_id("projects:vertopa")

		local vm = minetest.get_voxel_manip()
		local pos1 = {x=x, y=y+1, z=z}
		local pos2 = {x=x+19, y=y+6, z=z+29}
		local emin, emax = vm:read_from_map(pos1, pos2)
		local area = VoxelArea:new({MinEdge=emin, MaxEdge=emax})
		local data = vm:get_data()

		for i = 0, 19 do
		for j = 1, 5 do
		for k = 0, 29 do
			local vi = area:index(x + i, y + j, z + k)
			if k == 0 or k == 29
			or ((j == 1 or j == 5) and (k <= 9 or k >= 20))
			or ((i == 9 or i == 10) and (k >= 9 and k <= 20)) then
				data[vi] = c_brick
			elseif i == 0 or i == 19 then
				data[vi] = c_glass
			end
		end
		end
		end

		for ramp = 0, 4 do
			for ii = 1, 8 do
			for jj = 1, 2 do
			for kk = 0, 1 do
				local vi = area:index(x + ii, y + ramp + jj, z + 10 + ramp * 2 + kk)
				local vie = area:index(x + 19 - ii, y + ramp + jj, z + 19 - ramp * 2 - kk)
				if jj == 1 then
					data[vi] = c_brick
					data[vie] = c_brick
				elseif (jj == 2 and kk == 1) then
					data[vi] = c_slab
					data[vie] = c_slab
				end
			end
			end
			end
		end

		local horini = math.random(1, 15)
		for i = horini, horini + 3 do
		for j = 2, 4 do
			local vi = area:index(x + i, y + j, z + 29)
			if i == horini and j == 2 then
				data[vi] = c_horin
			else
				data[vi] = c_air
			end
		end
		end

		local horisi = math.random(1, 15)
		for i = horisi, horisi + 3 do
		for j = 2, 4 do
			local vi = area:index(x + i, y + j, z)
			if i == horisi and j == 2 then
				data[vi] = c_horis
			else
				data[vi] = c_air
			end
		end
		end

		local vi = area:index(x, y + 5, z)
		if math.random() < 0.9 then
			data[vi] = c_verta
		else
			data[vi] = c_vertopa
		end

		vm:set_data(data)
		vm:write_to_map()
		vm:update_map()

		minetest.add_node(pos, {name="default:sandstonebrick"})
	end,
})

-- vertical space entrance above. spawn node is below minimum point

minetest.register_abm({
	nodenames = {"projects:vertenta"},
	interval = 43,
	chance = 1,
	action = function(pos, node)
		local x = pos.x
		local y = pos.y
		local z = pos.z
		local c_brick = minetest.get_content_id("default:sandstonebrick")
		local c_slab = minetest.get_content_id("stairs:slab_stonebrick")
		local c_glass = minetest.get_content_id("default:obsidian_glass")
		local c_verta = minetest.get_content_id("projects:verta")

		local vm = minetest.get_voxel_manip()
		local pos1 = {x=x, y=y+1, z=z}
		local pos2 = {x=x+19, y=y+6, z=z+29}
		local emin, emax = vm:read_from_map(pos1, pos2)
		local area = VoxelArea:new({MinEdge=emin, MaxEdge=emax})
		local data = vm:get_data()

		for i = 0, 19 do
		for j = 1, 5 do
		for k = 0, 29 do
			local vi = area:index(x + i, y + j, z + k)
			if j == 1 or i == 0 or i == 19
			or (j == 5 and (k <= 9 or k >= 20))
			or ((i == 9 or i == 10) and (k >= 9 and k <= 20)) then
				data[vi] = c_brick
			end
		end
		end
		end

		for ramp = 0, 4 do
			for ii = 1, 8 do
			for jj = 1, 2 do
			for kk = 0, 1 do
				local vi = area:index(x + ii, y + ramp + jj, z + 10 + ramp * 2 + kk)
				local vie = area:index(x + 19 - ii, y + ramp + jj, z + 19 - ramp * 2 - kk)
				if jj == 1 then
					data[vi] = c_brick
					data[vie] = c_brick
				elseif (jj == 2 and kk == 1) then
					data[vi] = c_slab
					data[vie] = c_slab
				end
			end
			end
			end
		end

		local vi = area:index(x, y + 5, z)
		data[vi] = c_verta

		vm:set_data(data)
		vm:write_to_map()
		vm:update_map()

		minetest.add_node(pos, {name="default:sandstonebrick"})
	end,
})

-- vertical space roof above. spawn node is below minimum point

minetest.register_abm({
	nodenames = {"projects:vertopa"},
	interval = 41,
	chance = 1,
	action = function(pos, node)
		local x = pos.x
		local y = pos.y
		local z = pos.z
		local c_air = minetest.get_content_id("air")
		local c_brick = minetest.get_content_id("default:sandstonebrick")
		local c_glass = minetest.get_content_id("default:obsidian_glass")
		local c_horin = minetest.get_content_id("projects:horin")
		local c_horis = minetest.get_content_id("projects:horis")

		local vm = minetest.get_voxel_manip()
		local pos1 = {x=x, y=y+1, z=z}
		local pos2 = {x=x+19, y=y+5, z=z+29}
		local emin, emax = vm:read_from_map(pos1, pos2)
		local area = VoxelArea:new({MinEdge=emin, MaxEdge=emax})
		local data = vm:get_data()

		for i = 0, 19 do
		for j = 1, 5 do
		for k = 0, 29 do
			local vi = area:index(x + i, y + j, z + k)
			if k == 0 or k == 29
			or ((j == 1 or j == 5) and (k <= 9 or k >= 20))
			or ((i == 9 or i == 10) and (k >= 9 and k <= 20)) then
				data[vi] = c_brick
			elseif i == 0 or i == 19 or j == 5 then
				data[vi] = c_glass
			end
		end
		end
		end

		local horini = math.random(1, 15)
		for i = horini, horini + 3 do
		for j = 2, 4 do
			local vi = area:index(x + i, y + j, z + 29)
			if i == horini and j == 2 then
				data[vi] = c_horin
			else
				data[vi] = c_air
			end
		end
		end

		local horisi = math.random(1, 15)
		for i = horisi, horisi + 3 do
		for j = 2, 4 do
			local vi = area:index(x + i, y + j, z)
			if i == horisi and j == 2 then
				data[vi] = c_horis
			else
				data[vi] = c_air
			end
		end
		end

		vm:set_data(data)
		vm:write_to_map()
		vm:update_map()

		minetest.add_node(pos, {name="default:sandstonebrick"})
	end,
})
