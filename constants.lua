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
    ["https://drive.google.com/u/0/uc?id=1edbTLtxIaUlGrP8P_d0X7dpk01gDeplC&export=download"] = ELEMENT_TYPE_ALGAE,
    ["https://drive.google.com/u/0/uc?id=1mcuHRxZjB4eU040p43UO69KQ_l8-GsTh&export=download"] = ELEMENT_TYPE_GASTROPODS,
    ["https://drive.google.com/u/0/uc?id=1pPFksMnB8gaiuaVRCXDcVE_TPqxu6qus&export=download"] = ELEMENT_TYPE_PLANKTON,
    ["https://drive.google.com/u/0/uc?id=1IUzidKRhXawtVystK65o3zCtYacvVmsj&export=download"] = ELEMENT_TYPE_SPONGES,
    ["https://drive.google.com/u/0/uc?id=1b5meM5kY2SE21MBBedYH8M8DgAEwRlC0&export=download"] = ELEMENT_TYPE_SUN,
    ["https://drive.google.com/u/0/uc?id=18G3TJ44EXq3Y4ipGtnBNwkmxZuY78s0b&export=download"] = ELEMENT_TYPE_WORMS,
}

WANDERLUST_RESOURCE_TO_NAME_MAP = {
    ["https://drive.google.com/u/0/uc?id=1JGVsWPFdiO0Zl7Ud7APLri8SEjZA5Xpt&export=download"] = WANDERLUST_TILE_VENT,
    ["https://drive.google.com/u/0/uc?id=1UGOB3kS9p_Wp7fe8SuaUMW_nF3mZ6RCS&export=download"] = WANDERLUST_TILE_OCEAN,
    ["https://drive.google.com/u/0/uc?id=1MC-KhhQHcq8e7-SnU0SJjcqqI9OlAAnz&export=download"] = WANDERLUST_TILE_SAND,
    ["https://drive.google.com/u/0/uc?id=1Kkdm34ugyOa6CdNGwuPb2w9g1_iQ3vnp&export=download"] = WANDERLUST_TILE_SEAGRASS,
    ["https://drive.google.com/u/0/uc?id=1ZlWCAQ0QiY2twxowqvoBZs8ugjsBH5xg&export=download"] = WANDERLUST_TILE_SEAMOUNT,
    ["https://drive.google.com/u/0/uc?id=1sSgRIM8tWOpwB_lfVyazQr2ak3p6gLlp&export=download"] = WANDERLUST_TILE_CORAL,
    ["https://drive.google.com/u/0/uc?id=1_OuwQOxTTHu3MrDUKIqTIyRnxRUOQoHm&export=download"] = WANDERLUST_TILE_KELP,
    ["https://drive.google.com/u/0/uc?id=1Ty8YRbJUgOtStvnwD3o79Z4u2f4-krpj&export=download"] = WANDERLUST_TILE_LAND,
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
    ["https://drive.google.com/u/0/uc?id=1mUyj208x0GyLU9grbPcjwmHEh748LI19&export=download"] = WANDERLUST_TILE_VENT,
    ["https://drive.google.com/u/0/uc?id=1hRuq1nIRF5Dxm3dCZljB2ZVizVUFVh8h&export=download"] = WANDERLUST_TILE_OCEAN,
    ["https://drive.google.com/u/0/uc?id=1PcUBBGu2mU8E4gMQcfDIkPWUZg1d9OZ4&export=download"] = WANDERLUST_TILE_SAND,
    ["https://drive.google.com/u/0/uc?id=1AuUqu9XPcsbLkXbGdZS007V1KlcfuQNi&export=download"] = WANDERLUST_TILE_SEAGRASS,
    ["https://drive.google.com/u/0/uc?id=1OTWrqhiialprKchzLD5jI6JCS_td9Hon&export=download"] = WANDERLUST_TILE_SEAMOUNT,
    ["https://drive.google.com/u/0/uc?id=1DmdlavqNvewhWZRGJUP9ybsD1-Rg0eyz&export=download"] = WANDERLUST_TILE_CORAL,
    ["https://drive.google.com/u/0/uc?id=1tnZdmRPvE6BXwGakPIGKom4cqQtOy_SW&export=download"] = WANDERLUST_TILE_KELP,
    ["https://drive.google.com/u/0/uc?id=17o3lySKXkTTAd-8TfHgrxnV06jKZ5nJh&export=download"] = WANDERLUST_TILE_LAND,
}