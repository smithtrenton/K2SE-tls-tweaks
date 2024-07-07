-- Add more recipes to K2 advanced assembler
local advanced_assembler = data.raw["assembling-machine"]["kr-advanced-assembling-machine"]
table.insert(advanced_assembler.crafting_categories, "crushing")
table.insert(advanced_assembler.crafting_categories, "pulverising")
table.insert(advanced_assembler.crafting_categories, "core-fragment-processing")

-- Update K2 advanced assembler to have more fluid connections to enable normal core fragment processing
local original_input = advanced_assembler.fluid_boxes[1]
local original_output = advanced_assembler.fluid_boxes[2]
local input_positions = {
    { 1, -3 },
    { -1, -3},
    { -3, 1 },
    { -3, -1 },
}
local output_positions = {
    { 1, 3 },
    { -1, 3 },
    { 3, 1 },
    { 3, -1 },
}

local new_fluid_boxes = {}
for _, position in pairs(input_positions) do
    local new_input = table.deepcopy(original_input)
    new_input.pipe_connections[1].position = position
    table.insert(new_fluid_boxes, new_input)
end
for _, position in pairs(output_positions) do
    local new_output = table.deepcopy(original_output)
    new_output.pipe_connections[1].position = position
    table.insert(new_fluid_boxes, new_output)
end
new_fluid_boxes["off_when_no_fluid_recipe"] = true
advanced_assembler.fluid_boxes = new_fluid_boxes

-- Add more recipes to K2 advanced chemical plant
local advanced_chemical_plant = data.raw["assembling-machine"]["kr-advanced-chemical-plant"]
table.insert(advanced_chemical_plant.crafting_categories, "fuel-refinery")
table.insert(advanced_chemical_plant.crafting_categories, "atmosphere-condensation")
table.insert(advanced_chemical_plant.crafting_categories, "electrolysis")
table.insert(advanced_chemical_plant.crafting_categories, "fluid-filtration")
table.insert(advanced_chemical_plant.crafting_categories, "oil-processing")
table.insert(advanced_chemical_plant.crafting_categories, "fuel-refining")
table.insert(advanced_chemical_plant.crafting_categories, "vita-growth")
table.insert(advanced_chemical_plant.crafting_categories, "growing")
table.insert(advanced_chemical_plant.crafting_categories, "bioprocessing")

-- Add more recipes to K2 advanced furnace
local advanced_furnace = data.raw["assembling-machine"]["kr-advanced-furnace"]
table.insert(advanced_furnace.crafting_categories, 'casting')

-- Update space pipe underground length to match vanilla pipe
local vanilla_pipe_to_ground = data.raw["pipe-to-ground"]["pipe-to-ground"]
local space_pipe_to_ground = data.raw["pipe-to-ground"]["se-space-pipe-to-ground"]
local vanilla_distance = vanilla_pipe_to_ground.fluid_box.pipe_connections[2].max_underground_distance
space_pipe_to_ground.fluid_box.pipe_connections[2].max_underground_distance = vanilla_distance

-- Update space belt underground length to match express belt
local underground_belt_group = data.raw["underground-belt"]
local express_belt_underground = underground_belt_group["express-underground-belt"]
local space_belt_underground = underground_belt_group["se-space-underground-belt"]
local express_distance = express_belt_underground.max_distance
space_belt_underground.max_distance = express_distance

-- Update deep space belt underground length to match superior belt
local superior_belt_underground = underground_belt_group["kr-superior-underground-belt"]
local deep_space_underground_belt_prefix = "se-deep-space-underground-belt-"
local deep_space_belt_colors = {"black", "blue", "cyan", "green", "magenta", "red", "white", "yellow"}
local superior_distance = superior_belt_underground.max_distance
for _, color in pairs(deep_space_belt_colors) do
    local deep_space_belt_underground = underground_belt_group[deep_space_underground_belt_prefix .. color]
    if deep_space_belt_underground then
        deep_space_belt_underground.max_distance = superior_distance
    end
end
