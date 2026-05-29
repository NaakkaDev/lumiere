local lumiere = require "lumiere.lumiere"

local M = {}

local IDENTITY = vmath.matrix4()
local PREDICATE = nil
local DISTANCE = 4

local distance_vector = vmath.vector4(DISTANCE, 0, 0, 0)

function M.init()
	PREDICATE = render.predicate({ hash("blur") })
end

function M.final()
end

function M.apply(input)
	local constants = render.constant_buffer()
	constants.resolution = lumiere.resolution()
	constants.distance = distance_vector
	
	render.set_view(IDENTITY)
	render.set_projection(IDENTITY)
	render.clear({[graphics.BUFFER_TYPE_COLOR0_BIT] = lumiere.clear_color(), [graphics.BUFFER_TYPE_DEPTH_BIT] = 1})
	render.enable_texture(0, input, graphics.BUFFER_TYPE_COLOR0_BIT)
	render.draw(PREDICATE, { constants = constants })
	render.disable_texture(0)
end


return M