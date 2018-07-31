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


function getTimeLeft(buff)
  local name, _, _, _, _, exTime = UnitBuff("player", buff)
  return (exTime - GetTime())
  -- update the core.buffs[spell]
  -- give string as hrs if hrs is available 
  -- as mins if no hrs but mins abailable
  -- as secs if no hrs and mins available
  
end

-- [Spell name] = {on/off, [duration] = {hrs, mins, secs}}

-- execution sentence
-- Judgment on enemy

core.buffs = {
  ["Righteous Verdict"] = {false, ["duration"] = {0, 0, 0}}, 
  ["Divine Steed"] = {false, ["duration"] = {0, 0, 0}}, 
  ["Avenging Wrath"] = {false, ["duration"] = {0, 0, 0}}, 
  ["Greater Blessing of Kings"] = {false, ["duration"] = {0, 0, 0}}, 
  ["Greater Blessing of Wisdom"] = {false, ["duration"] = {0, 0, 0}}, 
  ["Sacred Judgment"] = {false, ["duration"] = {0,0,0}},
  ["Divine Judgment"] = {false, ["duration"] = {0,0,0}},
  ["Inquisition"] = {false, ["duration"] = {0,0,0}}
}

function isint(n)
  return n==math.floor(n)
end

function core:inCombat(...)
  core.StartTime = timer()
  core.BuffUI:Toggle()
end

function core:outCombat(...)
  core.EndTime = timer()
  core.Duration = core.EndTime - core.StartTime
  core.BuffUI:Toggle()
end

function core:showUI(...)
  core.BuffUI:Toggle()
  core.BuffUI2:Toggle()
end

function core:updateBuff(...)
  local currentBuffs = {}
  for i = 1, 40 do
    tempBuff = UnitBuff("player", i)
    if tempBuff then
      table.insert(currentBuffs, tempBuff)
      currentBuffs[tempBuff] = true
    end
   end
   for buff, info in pairs(core.buffs) do
    if currentBuffs[buff]~= nil then
      core.buffs[buff][1] = true
      core:addBuff(buff)
    elseif currentBuffs[buff] == nil then
      core.buffs[buff][1] = false
      core:removeBuff(buff)
    end
  end
end

function core:addBuff(buff)
  if buff == "Divine Steed" then
    SteedTexture:SetAlpha(1)
  elseif buff == "Crusade" then
    CrusadeTexture:SetAlpha(1)
  elseif buff == "Greater Blessing of Kings" then
    KingsTexture:SetAlpha(1)
  elseif buff == "Greater Blessing of Wisdom" then
    WisdomTexture:SetAlpha(1)
  elseif buff == "Righteous Verdict" then
    VerdictTexture:SetAlpha(1)
  elseif buff == "Sacred Judgment" then
    SacredTexture:SetAlpha(1)
  elseif buff == "Divine Judgment" then
    DivineTexture:SetAlpha(1)
  elseif buff == "Inquisition" then
    InquisitionTexture:SetAlpha(1)
  end
end
  
function core:removeBuff(buff)
  if buff == "Divine Steed" then
    SteedTexture:SetAlpha(0.4)
  elseif buff == "Crusade" then
    CrusadeTexture:SetAlpha(0.4)
  elseif buff == "Greater Blessing of Kings" then
    KingsTexture:SetAlpha(0.4)
  elseif buff == "Greater Blessing of Wisdom" then
    WisdomTexture:SetAlpha(0.4)
  elseif buff == "Righteous Verdict" then
    VerdictTexture:SetAlpha(0.4)
  elseif buff == "Sacred Judgment" then
    SacredTexture:SetAlpha(0.4)
  elseif buff == "Divine Judgment" then
    DivineTexture:SetAlpha(0.4)
  elseif buff == "Inquisition" then
    InquisitionTexture:SetAlpha(0.4)
  end
end

