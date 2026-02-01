--- @since 25.12.29

local function get_memory_available()
	local handle = io.popen("df --si . | tail -1 | awk '{print $4}'")
	if handle == nil then
		return ""
	end
	local disk_space = handle:read("*a"):gsub("%s+", "")
	handle:close()
	return disk_space
end

local function get_ui_line(size)
	return ui.Line({
		ui.Span("Memory available"):fg("bright cyan"),
		":",
		ui.Span(size):fg("magenta"),
		" ",
	})
end

---@class Options
---@field update_freq integer

---@param self Options
---@param opts Options
local function setup(self, opts)
	if opts == nil then
		self.update_freq = 5
	else
		self.update_freq = opts.update_freq
	end

	local last_update = ya.time()
	local cached_size = get_memory_available()

	local save = ya.sync(function()
		Status:children_add(function()
			local current_time = ya.time()

			if (current_time - last_update) >= self.update_freq then
				last_update = current_time
				cached_size = get_memory_available()
			end

			return get_ui_line(cached_size)
		end, 500, Status.RIGHT)
	end)

	save()
end

return {
	setup = setup,
}
