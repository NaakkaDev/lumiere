local lumiere = require "lumiere.lumiere"

local PRG = {}

function PRG.init(self)
	print("basic")
end

function PRG.update(self, dt)
	lumiere.clear(lumiere.clear_color())
	lumiere.set_view_projection()
	lumiere.draw_graphics2d(view, projection)
	lumiere.set_screen_projection()
	lumiere.draw_gui()
end

return PRG