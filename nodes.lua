
minetest.register_node("plantgrow:giantjungletree", {
	description = "Giant Jungle Tree",
	tiles = {"default_jungletree_top.png", "default_jungletree_top.png", "default_jungletree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree=1,choppy=2,oddly_breakable_by_hand=1,flammable=2},
	sounds = {
		footstep = {name="default_wood_footstep", gain=0.5},
		dig = {name="default_wood_footstep", gain=0.5},
		dug = {name="default_wood_footstep", gain=1.0},
		place = {name="default_wood_footstep", gain=1.0},
	},
	on_place = minetest.rotate_node,
	on_dig = function(pos, node, digger)
		default.dig_tree(pos, node, "plantgrow:giantjungletree", digger, 12, 5)
	end,
})

minetest.register_node("plantgrow:giantjungleleaves", {
	description = "Giant Jungle Leaves",
	drawtype = "allfaces_optional",
	visual_scale = 1.3,
	tiles = {"plantgrow_giantjungleleaves.png"},
	paramtype = "light",
	waving = 1,
	is_ground_content = false,
	groups = {snappy=3, leafdecay=3, flammable=2, leaves=1},
	drop = {
		max_items = 1,
		items = {
			{
				-- player will get sapling with 1/150 chance
				items = {'plantgrow:giantplant'},
				rarity = 200,
			},
			{
				-- player will get sapling with 1/20 chance
				items = {'default:junglesapling'},
				rarity = 20,
			},
			{
				-- player will get leaves only if he get no saplings,
				-- this is because max_items is 1
				items = {'plantgrow:giantjungleleaves'},
			}
		}
	},
	sounds = {
		footstep = {name="default_grass_footstep", gain=0.35},
		dug = {name="default_grass_footstep", gain=0.85},
		dig = {name="default_dig_crumbly", gain=0.4},
		place = {name="default_place_node", gain=1.0}
	}
})

minetest.register_node("plantgrow:treedown", {
    description = "Tree Down",
    tile_images = {
	"default_jungletree.png",
	"default_jungletree.png",
	"default_jungletree.png",
    },
    groups = { tree=1,choppy=2,oddly_breakable_by_hand=1,flammable=2 },
		walkable = true,
		--sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("plantgrow:podblock", {
	description = "Pod Block",
	tile_images = {"plantgrow_pod.png"},
	groups = { choppy=2, oddly_breakable_by_hand=2, flammable=2 },
	walkable = true,
	drop = {
		max_items = 1,
		items = {
			{
				-- player will get sapling with 1/50 chance
				items = {'plantgrow:pea'},
				rarity = 50,
			},
			{
				-- player will get leaves only if he get no saplings,
				-- this is because max_items is 1
				items = {'plantgrow:podblock'},
			}
		}
	},
	sounds = {
		footstep = {name="default_place_node_hard", gain=0.25},
		dig = {name="default_place_node_hard", gain=0.5},
		dug = {name="default_dug_node", gain=0.25},
		place = {name="default_place_node_hard", gain=1.0},
	}
})

minetest.register_node("plantgrow:podinside", {
	description = "Pod Inside",
	drawtype = "glasslike",
	tile_images = {"plantgrow_podinside.png"},
	groups = { oddly_breakable_by_hand=3, flammable=2 },
	alpha = 100,
	paramtype = "light",
	light_source = 8,
	walkable = false,
	--pointable = false,
	diggable = true,
	climbable = true,
	buildable_to = true,
	drop = "plantgrow:podinside",
	sounds = {
		footstep = {name="default_grass_footstep", gain=0.35},
		dig = {name="default_dig_crumbly", gain=0.4},
		dug = {name="default_grass_footstep", gain=0.85},
		place = {name="default_place_node", gain=1.0},
	}
})

minetest.register_node("plantgrow:pea", {
	description = "Pea",
	tile_images = {
		"plantgrow_pea_top.png",
		"plantgrow_pea.png",
	},
	groups = { choppy=2, oddly_breakable_by_hand=2, flammable=2 },
	walkable = true,
	sounds = {
		footstep = {name="default_place_node_hard", gain=0.25},
		dig = {name="default_place_node_hard", gain=0.5},
		dug = {name="default_dug_node", gain=0.25},
		place = {name="default_place_node_hard", gain=1.0},
	}
})

minetest.register_node("plantgrow:pod", {
    description = "Pod",
    tile_images = {"plantgrow_pod.png"},
    groups = { choppy=2, oddly_breakable_by_hand=2, flammable=2 },
		walkable = true,
		--sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("plantgrow:giantplant", {
	description = "Giant Plant",
	tile_images = {
		"default_jungletree.png",
		"default_jungletree.png",
		"default_jungletree.png",
	},
	groups = { tree=1,choppy=2,oddly_breakable_by_hand=1,flammable=2 },
	walkable = true,
		--sounds = default.node_sound_wood_defaults(),
})
