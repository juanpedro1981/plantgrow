local HOUSE_SPAWN_INTERVAL = 10 --600
local HOUSE_SPAWN_CHANCE = 1 --10

local STRUCTURES_FILE1 = minetest.get_modpath("plantgrow")
    .. "/structures.txt"
local STRUCTURES_FILE2 = minetest.get_modpath("plantgrow")
    .. "/structures2.txt"
local STRUCTURES_FILE3 = minetest.get_modpath("plantgrow")
    .. "/structures3.txt"
local HOUSE_CONFIG_SEPARATOR = " "

dofile (minetest.get_modpath("plantgrow") .. "/nodes.lua")
dofile (minetest.get_modpath("plantgrow") .. "/split.lua")
dofile (minetest.get_modpath("plantgrow") .. "/api.lua")

local structure_count1 = 0
for line in io.lines(STRUCTURES_FILE1) do
    if line:sub(1, 1) == "#" then
	structure_count1 = structure_count1 + 1
    end
end
print(structure_count1 .. " structures loaded.")

local structure_count2 = 0
for line in io.lines(STRUCTURES_FILE2) do
    if line:sub(1, 1) == "#" then
	structure_count2 = structure_count2 + 1
    end
end
print(structure_count2 .. " structures loaded.")

local structure_count3 = 0
for line in io.lines(STRUCTURES_FILE3) do
    if line:sub(1, 1) == "#" then
	structure_count3 = structure_count3 + 1
    end
end
print(structure_count3 .. " structures loaded.")


minetest.register_abm({
    nodenames = "plantgrow:giantplant",
    interval = HOUSE_SPAWN_INTERVAL,
    chance = HOUSE_SPAWN_CHANCE,

    action = function(pos, _, _, _)
	minetest.env:remove_node(pos)
	local house_number = math.random(1, structure_count1)
	local counter = 0
	for line in io.lines(STRUCTURES_FILE1) do
	  if line:sub(1, 1) == "#" then
			counter = counter + 1
	  else
		if counter == house_number and line:sub(1, 1) ~= ";" then
		    local params = split(line, HOUSE_CONFIG_SEPARATOR)
		    local new_pos = {
			x = pos.x + params[1],
			y = pos.y + params[2],
			z = pos.z + params[3],
		    }
		    local node_name = params[4]
		    --minetest.env:remove_node(new_pos)
				local node = minetest.get_node(new_pos)	-- I added this
				if node.name == "air" then							-- I added this
		    	minetest.env:add_node(new_pos, { name = node_name })
				else
        local walkable = minetest.registered_nodes[node.name].walkable;
				local leaves = minetest.get_node_group(node.name, "leaves")
        if (walkable == false) or (leaves ~= 0) then
						minetest.env:remove_node(new_pos)
		    		minetest.env:add_node(new_pos, { name = node_name })
					end
				end
		    --minetest.env:add_node(new_pos, { name = node_name })
		    minetest.log("action", "Spawned " .. node_name
			.. " at " .. new_pos.x .. "," .. new_pos.y
			.. "," .. new_pos.z)
		end
	    end
	end
    end
})

minetest.register_abm({
    nodenames = "plantgrow:treedown",
    interval = HOUSE_SPAWN_INTERVAL,
    chance = HOUSE_SPAWN_CHANCE,

    action = function(pos, _, _, _)
	minetest.env:remove_node(pos)
	local house_number = math.random(1, structure_count2)
	local counter = 0
	for line in io.lines(STRUCTURES_FILE2) do
	  if line:sub(1, 1) == "#" then
			counter = counter + 1
	  else
		if counter == house_number and line:sub(1, 1) ~= ";" then
		    local params = split(line, HOUSE_CONFIG_SEPARATOR)
		    local new_pos = {
			x = pos.x + params[1],
			y = pos.y + params[2],
			z = pos.z + params[3],
		    }
		    local node_name = params[4]
		    --minetest.env:remove_node(new_pos)
				local node = minetest.get_node(new_pos)	-- I added this
				if node.name == "air" then							-- I added this
		    	minetest.env:add_node(new_pos, { name = node_name })
				else
        local walkable = minetest.registered_nodes[node.name].walkable;
				local leaves = minetest.get_node_group(node.name, "leaves")
        if (walkable == false) or (leaves ~= 0) then
						minetest.env:remove_node(new_pos)
		    		minetest.env:add_node(new_pos, { name = node_name })
					end
				end
		    --minetest.env:add_node(new_pos, { name = node_name })
		    minetest.log("action", "Spawned " .. node_name
			.. " at " .. new_pos.x .. "," .. new_pos.y
			.. "," .. new_pos.z)
		end
	    end
	end
    end
})
minetest.register_abm({
	nodenames = "plantgrow:pea",
  interval = 0,
  chance = 0,

	action = function(pos, _, _, _)
		local above = {
			x = pos.x,
			y = pos.y + 1,
			z = pos.z,
		}
		minetest.env:remove_node(pos)
		minetest.env:add_node(pos, { name = "plantgrow:podinside" })
		local mob = minetest.add_entity(above, "plantgrow:littleent")
	end
})

minetest.register_abm({
    nodenames = "plantgrow:pod",
    interval = HOUSE_SPAWN_INTERVAL,
    chance = HOUSE_SPAWN_CHANCE,

    action = function(pos, _, _, _)
	minetest.env:remove_node(pos)
	local house_number = math.random(1, structure_count3)
	local counter = 0
	for line in io.lines(STRUCTURES_FILE3) do
	  if line:sub(1, 1) == "#" then
			counter = counter + 1
	  else
		if counter == house_number and line:sub(1, 1) ~= ";" then
		    local params = split(line, HOUSE_CONFIG_SEPARATOR)
		    local new_pos = {
			x = pos.x + params[1],
			y = pos.y + params[2],
			z = pos.z + params[3],
		    }
		    local node_name = params[4]
		    --minetest.env:remove_node(new_pos)
				local node = minetest.get_node(new_pos)	-- I added this
--				if node.name == "plantgrow:podblock" then
--					local spawnpos = {
--						x = new_pos.x,
--						y = new_pos.y + 2,
--						z = new_pos.z,
--					}
--					local spawnnode = minetest.get_node(spawnpos)
--					if spawnnode.name == "plantgrow:podinside" then
--						local mob = minetest.add_entity(spawnpos, "lottmobs:orc")
--						if mob == false then
--							print ("[mobs]" .. "lottmobs:orc" .. " failed to spawn at "
--							.. minetest.pos_to_string(spawnpos))
--						end
--					end
--				end
				if node.name == "air" then							-- I added this
		    	minetest.env:add_node(new_pos, { name = node_name })
				else
        local walkable = minetest.registered_nodes[node.name].walkable;
				local leaves = minetest.get_node_group(node.name, "leaves")
        if (walkable == false) or (leaves ~= 0) then
						minetest.env:remove_node(new_pos)
		    		minetest.env:add_node(new_pos, { name = node_name })
					end
				end
		    --minetest.env:add_node(new_pos, { name = node_name })
		    minetest.log("action", "Spawned " .. node_name
			.. " at " .. new_pos.x .. "," .. new_pos.y
			.. "," .. new_pos.z)
		end
	    end
	end
    end
})

plantgrow:register_mob("plantgrow:littleent", {
	type = "npc",
	hp_min = 30,
	hp_max = 40,
	collisionbox = {-0.3,-1.0,-0.3, 0.3,0.8,0.3},
	textures = {
		{"plantgrow_littleent.png"},
	},
	visual_size = {x=1,y=1},
	visual = "mesh",
	mesh = "plantgrow_littleent.b3d",
	view_range = 20,
	makes_footstep_sound = true,
	walk_velocity = 1,
	run_velocity = 1.5,
	armor = 100,
	damage = 3,
	drops = {
		{name = "default:junglesapling",
		chance = 5,
		min = 1,
		max = 3,},
		{name = "plantgrow:pea",
		chance = 50,
		min = 1,
		max = 1,},
		{name = "plantgrow:giantplant",
		chance = 250,
		min = 1,
		max = 1,},
	},
	light_resistant = true,
	drawtype = "front",
	water_damage = 0,
	lava_damage = 60,
	light_damage = 0,
	attack_type = "dogfight",
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 1,
		stand_end = 80,
		walk_start = 168,
		walk_end = 188,
		run_start = 168,
		run_end = 188,
		punch_start = 189,
		punch_end = 199,
	},
	jump = true,
	sounds = {
		war_cry = "mobs_die_yell",
		death = "mobs_yeti_death",
		attack = "default_punch2",
	},
	attacks_monsters = true,
	peaceful = true,
	group_attack = true,
	step = 1,
})
plantgrow:register_spawn("plantgrow:littleent", {"plantgrow:giantjungletree"}, 20, -1, 6000, 3, 31000)
