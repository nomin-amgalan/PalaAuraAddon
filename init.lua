local _, core = ...; -- Namespace

--------------------------------------
-- Custom Slash Command
--------------------------------------
core.commands = {
	["config"] = core.Config.Toggle, -- this is a function (no knowledge of Config object)

	["help"] = function()
		print(" ");
		core:Print("List of slash commands:")
		core:Print("|cff00cc66/pa config|r - shows config menu");
		core:Print("|cff00cc66/pa help|r - shows help info");
		print(" ");
	end,

	["example"] = {
		["test"] = function(...)
			core:Print("My Value:", tostringall(...));
		end
	}
};

local function HandleSlashCommands(str)
	if (#str == 0) then
		-- User just entered "/at" with no additional args.
		core.commands.help();
		return;
	end

	local args = {};
	for _, arg in ipairs({ string.split(' ', str) }) do
		if (#arg > 0) then
			table.insert(args, arg);
		end
	end

	local path = core.commands; -- required for updating found table.

	for id, arg in ipairs(args) do
		if (#arg > 0) then -- if string length is greater than 0.
			arg = arg:lower();
			if (path[arg]) then
				if (type(path[arg]) == "function") then
					-- all remaining args passed to our function!
					path[arg](select(id + 1, unpack(args)));
					return;
				elseif (type(path[arg]) == "table") then
					path = path[arg]; -- another sub-table found!
				end
			else
				-- does not exist!
				core.commands.help();
				return;
			end
		end
	end
end

function core:Print(...)
    local hex = select(4, self.Config:GetThemeColor());
    local prefix = string.format("|cff%s%s|r", hex:upper(), "Pala Aura:");
    DEFAULT_CHAT_FRAME:AddMessage(string.join(" ", prefix, ...));
end

-- WARNING: self automatically becomes events frame!

function core:init(event, name)
	if (name ~= "PalaAura") then return end
	-- allows using left and right buttons to move through chat 'edit' box
	for i = 1, NUM_CHAT_WINDOWS do
		_G["ChatFrame"..i.."EditBox"]:SetAltArrowKeyMode(false);
	end

	----------------------------------
	-- Register Slash Commands!
	----------------------------------
	SLASH_RELOADUI1 = "/rl"; -- new slash command for reloading UI
	SlashCmdList.RELOADUI = ReloadUI;

	SLASH_FRAMESTK1 = "/fs"; -- new slash command for showing framestack tool
	SlashCmdList.FRAMESTK = function()
		LoadAddOn("Blizzard_DebugTools");
		FrameStackTooltip_Toggle();
	end
	SLASH_PalaAura1 = "/pa";
	SlashCmdList.PalaAura = HandleSlashCommands;

  core:Print("Welcome back", UnitName("player").."!");
end

--- Load addon ---

local addonLoadEvent = CreateFrame("Frame")

addonLoadEvent:RegisterEvent("ADDON_LOADED")
addonLoadEvent:SetScript("OnEvent", core.init)

--- Combat status ---

local frame, events = CreateFrame("Frame"), {};

-- function events:PLAYER_REGEN_DISABLED(...)
	--core.combatStatus = true
	--core:inCombat()
--end 

--function events:PLAYER_REGEN_ENABLED(...)
	--core.combatStatus = false
	--core:outCombat()
--end

function events:PLAYER_ENTERING_WORLD(...)
  core.showUI()
end

function events:UNIT_AURA(...)
	core:updateBuff(...)
end

frame:SetScript("OnEvent", function(self, event, ...)
 events[event](self, ...); -- call one of the functions above
end);

for k, v in pairs(events) do
 frame:RegisterEvent(k); -- Register all events for which handlers have been defined
end
