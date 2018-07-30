local _, core = ...

core.StartTime = 0
core.EndTime = 0
core.Duration = 0
core.combatStatus = False

function timer() -- gives info on the time, measured in seconds

    WA_lastGetTime = WA_lastGetTime or 0
    WA_lastText = WA_lastText or ''
    t = t or 0

    if GetTime() > WA_lastGetTime then
       WA_lastGetTime = GetTime() + 1
        WA_lastText  = GetTime()
    end

    return tostring(WA_lastGetTime)
end

core.buffs = {
  ["Righteous Verdict"] = false,
  ["Divine Steed"] = false,
  ["Crusade"] = false,
  ["Greater Blessing of Kings"] = false,
  ["Greater Blessing of Wisdom"] = false,
}

function isint(n)
  return n==math.floor(n)
end

function core:inCombat(...)
  core.StartTime = timer()
  core.BuffUI:Toggle()
  -- show remaining time and stack
  end

function core:outCombat(...)
  core.EndTime = timer()
  core.Duration = core.EndTime - core.StartTime
  core.BuffUI:Toggle()
  end

function core:showUI(...)
  core.BuffUI:Toggle()
end

function core:updateBuff(...)
  -- print("_____")
  for buff in pairs(core.buffs) do
    if UnitBuff("player", buff, "PLAYER") then
      if not core.buffs[buff] then
        core.buffs[buff] = true
        core:addBuff(buff)
       end
    else
      if core.buffs[buff] then
        core.buffs[buff] = false
        core:removeBuff(buff)
      end
    end
  end
  -- print("_____")
end

function core:addBuff(buff)
  if buff == "Divine Steed" then
    SteedTexture:SetAlpha(1)
  elseif buff == "Crusader" then
    CrusadeTexture:SetAlpha(1)
  elseif buff == "Greater Blessing of Kings" then
    KingsTexture:SetAlpha(1)
  elseif buff == "Greater Blessing of Wisdom" then
    WisdomTexture:SetAlpha(1)
  end
end
  
function core:removerBuff(buff)
  if buff == "Divine Steed" then
    SteedTexture:SetAlpha(0.4)
  elseif buff == "Crusader" then
    CrusadeTexture:SetAlpha(0.4)
  elseif buff == "Greater Blessing of Kings" then
    KingsTexture:SetAlpha(0.4)
  elseif buff == "Greater Blessing of Wisdom" then
    WisdomTexture:SetAlpha(0.4)
  end
end