_G.AugroupStore = {}

return setmetatable({}, {
	__call = function(_, ...)
		local name, commands = ...
		local aucmds = {}

		for _, c in ipairs(commands) do
			local command = c.command
			if type(command) == "function" then
				AugroupStore[name] = command
				command = ("lua AugroupStore['%s']()"):format(name)
			end

			table.insert(
				aucmds,
				string.format(
					"autocmd %s%s%s%s",
					c.events and table.concat(c.events, ",") .. " " or "",
					c.targets and table.concat(c.targets, ",") .. " " or "",
					c.modifiers and table.concat(c.modifiers, " ") .. " " or "",
					command
				)
			)
		end

		vim.cmd(string.format(
			[[
        augroup %s
          autocmd!
          %s
        augroup END
      ]],
			name,
			table.concat(aucmds, "\n")
		))
	end,
})
