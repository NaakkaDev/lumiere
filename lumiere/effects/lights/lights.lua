local lumiere = require "lumiere.lumiere"

local M = {}

local AMBIENT_LIGHT = vmath.vector4(0.1, 0.1, 0.1, 1.0)

function M.create(ambient_light, intensity_min, intensity_max)
	local instance = {}
	instance.ambient_light = ambient_light or AMBIENT_LIGHT
	instance.intensity_min = intensity_min or 90
	instance.intensity_max = intensity_max or 100

	local render_target = nil
	local lights_predicate = nil
	local apply_lights_predicate = nil
	
	function instance.init()
		assert(not RT)
		lights_predicate = lumiere.predicate({ hash("light") })
		apply_lights_predicate = lumiere.predicate({ hash("apply_lights") })
		render_target = lumiere.create_render_target("apply_lights", true, false, false)
	end

	function instance.final()
		lumiere.delete_render_target(render_target)
		render_target = nil
	end

	function instance.update()
		lumiere.enable_render_target(render_target)
		lumiere.set_constant("intensity", vmath.vector4(math.random(instance.intensity_min, instance.intensity_max) / 100))
		lumiere.clear(instance.ambient_light)
		lumiere.draw(lights_predicate)
		lumiere.disable_render_target()
		lumiere.reset_constant("intensity")
	end

	function instance.apply(input, output)
		assert(input, "You must provide a render target to apply lights to")

		if output then lumiere.enable_render_target(output) end

		lumiere.set_identity_view_projection()
		lumiere.clear(lumiere.BLACK)
		lumiere.enable_texture(0, render_target)
		lumiere.enable_texture(1, input)
		lumiere.draw(apply_lights_predicate)
		lumiere.disable_texture(0)
		lumiere.disable_texture(1)

		if output then lumiere.disable_render_target() end
	end

	function instance.render_target()
		return render_target
	end

	return instance
end

local singleton = M.create(AMBIENT_LIGHT)

function M.init()
	singleton.init()
end

function M.final()
	singleton.final()
end

function M.update()
	singleton.update()
end

function M.apply(input, output)
	singleton.apply(input, output)
end

function M.render_target()
	return singleton.render_target()
end



return M