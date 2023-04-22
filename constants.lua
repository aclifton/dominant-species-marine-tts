RESEED_BUTTON = "15f5b0"

EVOLUTION_DECK_ZONE = "771647"
EVOLUTION_RESERVE_ZONE = "22f9c7"
ASTEROID_CARD = "9fe901"
TRAIT_DECK = "c5d0ec"
CENTER_SCRIPTING_ZONE = "e4f818"

ABUNDANCE_ZONE = "c982e7"
AUTOTROPHS_ZONE = "c4e77b"
DEPLETION_ZONE = "e23076"
ADAPTION_ZONE = "b70e29"
REGRESSION_ZONE = "91fe74"
SPECIATION_ZONE = "075fb0"
WANDERLUST_ZONE = "def2ff"
COMPETITION_ZONE = "90e44c"
EVOLUTION_ZONE = "91934c"

ELEMENT_TAG = "element"
WANDERLUST_TAG = "wanderlust"
TERRAIN_TAG = "terrain"
SPECIES_TAG = "species"
ACTION_PAWN_TAG = "action_pawn"

CRUSTACEANS_TAG = "crustaceans"
FISHES_TAG = "fishes"
CEPHALOPODS_TAG = "cephalopods"
REPTILES_TAG = "reptiles"

COMMON_COMPONENTS = {
    wander_lust_bag = "7d9337",
    element_bag = "e81219",
    terrain_bag = "ed6578",
    box_bag = "6d9eef",
    special_pawn_plankton = "bd25f7",
    special_pawn_worms = "7a63a2",
    special_pawn_sponges = "5172a7",
    special_pawn_gastropods = "bf11a4",
    special_pawn_algae = "c12749",
    special_pawn_sun = "c046bd",
    control_marker_plankton = "dce92f",
    control_marker_worms = "557086",
    control_marker_sponges = "e92662",
    control_marker_gastropods = "54bb45",
    control_marker_algae = "0f9861",
    control_marker_sun = "32bf2b",
    food_chain_start_zone = "9ba132",
}

PLAYER_COMPONENTS = {
    [Player.Brown.color] = {
        tag = CRUSTACEANS_TAG,
        vp = "17f953",
        boards = {"85e368", "b5c87e"},
        food_chain_zone = "d9b5af",
        food_chain_start_position = {-11.32, 1.35, 8.67},
        food_chain_end_position = {-9.41, 1.29, 8.68},
        gene_pool_bag = "cd7b0d",
        action_pawn_position_first = {-25.21, 1.26, -8.93},
        control_marker_zone = "fb935b",
        eliminated_species = "9ebfda",
    },
    [Player.Blue.color] = {
        tag = FISHES_TAG,
        vp = "3f075f",
        boards = {"bf4314", "578c29"},
        food_chain_zone = "01090b",
        food_chain_start_position = {-11.31, 1.35, 9.74},
        food_chain_end_position = {-9.41, 1.29, 9.74},
        gene_pool_bag = "ea715b",
        action_pawn_position_first = {-10.93, 1.26, -9.04},
        control_marker_zone = "6d7f31",
        eliminated_species = "3c5002",
    },
    [Player.Orange.color] = {
        tag = CEPHALOPODS_TAG,
        vp = "bbb44d",
        boards = {"c01aba", "24c905"},
        food_chain_zone = "8aaf18",
        food_chain_start_position = {-11.32, 1.35, 10.74},
        food_chain_end_position = {-9.40, 1.29, 10.74},
        gene_pool_bag = "93c7b1",
        action_pawn_position_first = {4.00, 1.26, -8.96},
        control_marker_zone = "de4c5c",
        eliminated_species = "72d935",
    },
    [Player.Purple.color] = {
        tag = REPTILES_TAG,
        vp = "e40bf9",
        boards = {"76a1b4", "7c5462"},
        food_chain_zone = "93093b",
        food_chain_start_position = {-11.30, 1.35, 11.76},
        food_chain_end_position = {-9.39, 1.29, 11.78},
        gene_pool_bag = "253bcb",
        action_pawn_position_first = {17.44, 1.26, -8.95},
        control_marker_zone = "bb6f78",
        eliminated_species = "8167d6",
    },
}

ELEMENT_TYPE_ALGAE = "algae"
ELEMENT_TYPE_GASTROPODS = "gastropods"
ELEMENT_TYPE_WORMS = "worms"
ELEMENT_TYPE_PLANKTON = "plankton"
ELEMENT_TYPE_SPONGES = "sponges"
ELEMENT_TYPE_SUN = "sun"

WANDERLUST_TILE_VENT = "WANDERLUST_TILE_VENT"
WANDERLUST_TILE_OCEAN = "WANDERLUST_TILE_OCEAN"
WANDERLUST_TILE_SAND = "WANDERLUST_TILE_SAND"
WANDERLUST_TILE_SEAGRASS = "WANDERLUST_TILE_SEAGRASS"
WANDERLUST_TILE_SEAMOUNT = "WANDERLUST_TILE_SEAMOUNT"
WANDERLUST_TILE_CORAL = "WANDERLUST_TILE_CORAL"
WANDERLUST_TILE_KELP = "WANDERLUST_TILE_KELP"
WANDERLUST_TILE_LAND = "WANDERLUST_TILE_LAND"

ELEMENT_RESOURCE_TO_NAME_MAP = {
    ["https://dsm-tts-assets.s3.eu-west-2.amazonaws.com/element/element-green.png"] = ELEMENT_TYPE_ALGAE,
    ["https://dsm-tts-assets.s3.eu-west-2.amazonaws.com/element/element-brown.png"] = ELEMENT_TYPE_GASTROPODS,
    ["https://dsm-tts-assets.s3.eu-west-2.amazonaws.com/element/element-blue.png"] = ELEMENT_TYPE_PLANKTON,
    ["https://dsm-tts-assets.s3.eu-west-2.amazonaws.com/element/element-yellow.png"] = ELEMENT_TYPE_SPONGES,
    ["https://dsm-tts-assets.s3.eu-west-2.amazonaws.com/element/element-red.png"] = ELEMENT_TYPE_SUN,
    ["https://dsm-tts-assets.s3.eu-west-2.amazonaws.com/element/element-purple.png"] = ELEMENT_TYPE_WORMS,
}

WANDERLUST_RESOURCE_TO_NAME_MAP = {
    ["https://dsm-tts-assets.s3.eu-west-2.amazonaws.com/tiles/hvent.png"] = WANDERLUST_TILE_VENT,
    ["https://dsm-tts-assets.s3.eu-west-2.amazonaws.com/tiles/wanderlust-open-ocean.png"] = WANDERLUST_TILE_OCEAN,
    ["https://dsm-tts-assets.s3.eu-west-2.amazonaws.com/tiles/wanderlust-sand.png"] = WANDERLUST_TILE_SAND,
    ["https://dsm-tts-assets.s3.eu-west-2.amazonaws.com/tiles/wanderlust-seasgrass.png"] = WANDERLUST_TILE_SEAGRASS,
    ["https://dsm-tts-assets.s3.eu-west-2.amazonaws.com/tiles/wanderlust-seasmount.png"] = WANDERLUST_TILE_SEAMOUNT,
    ["https://dsm-tts-assets.s3.eu-west-2.amazonaws.com/tiles/wanderlust-coral.png"] = WANDERLUST_TILE_CORAL,
    ["https://dsm-tts-assets.s3.eu-west-2.amazonaws.com/tiles/wanderlust-kelp.png"] = WANDERLUST_TILE_KELP,
    ["https://dsm-tts-assets.s3.eu-west-2.amazonaws.com/tiles/wanderlust-land.png"] = WANDERLUST_TILE_LAND,
}

WANDERLUST_TILE_SCORES = {
    [WANDERLUST_TILE_VENT] = {1,0,0,0},
    [WANDERLUST_TILE_OCEAN] = {2,1,0,0},
    [WANDERLUST_TILE_SAND] = {3,2,0,0},
    [WANDERLUST_TILE_SEAGRASS] = {4,2,0,0},
    [WANDERLUST_TILE_SEAMOUNT] = {5,3,2,0},
    [WANDERLUST_TILE_CORAL] = {6,3,2,0},
    [WANDERLUST_TILE_KELP] = {7,4,2,0},
    [WANDERLUST_TILE_LAND] = {8,4,2,1},
}

TERRAIN_RESOURCE_TO_NAME_MAP = {
    ["https://dsm-tts-assets.s3.eu-west-2.amazonaws.com/markers/terrain-vent.png"] = WANDERLUST_TILE_VENT,
    ["https://dsm-tts-assets.s3.eu-west-2.amazonaws.com/markers/terrain-ocean.png"] = WANDERLUST_TILE_OCEAN,
    ["https://dsm-tts-assets.s3.eu-west-2.amazonaws.com/markers/terrain-sand.png"] = WANDERLUST_TILE_SAND,
    ["https://dsm-tts-assets.s3.eu-west-2.amazonaws.com/markers/terrrain-grass.png"] = WANDERLUST_TILE_SEAGRASS,
    ["https://dsm-tts-assets.s3.eu-west-2.amazonaws.com/markers/terrain-mount.png"] = WANDERLUST_TILE_SEAMOUNT,
    ["https://dsm-tts-assets.s3.eu-west-2.amazonaws.com/markers/terrain-coral.png"] = WANDERLUST_TILE_CORAL,
    ["https://dsm-tts-assets.s3.eu-west-2.amazonaws.com/markers/terrain-kelp.png"] = WANDERLUST_TILE_KELP,
    ["https://dsm-tts-assets.s3.eu-west-2.amazonaws.com/markers/terrain-land.png"] = WANDERLUST_TILE_LAND,
}