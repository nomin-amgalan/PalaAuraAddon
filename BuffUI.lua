local _, core = ...
core.BuffUI = {}

local BuffUI = core.BuffUI
local Buffs

function core:GetImage(name)
  return "Interface\\AddOns\\PalaAura\\"..name
end

function BuffUI:Toggle()
	local menu = Buffs or BuffUI:Create();
	menu:SetShown(not menu:IsShown());
end

function BuffUI:Create()

-- Main UI Frame --

  Buffs = CreateFrame("Frame", "Buffss", UIParent)
  Buffs:ClearAllPoints()
  Buffs:SetSize(180, 45)
  Buffs:SetPoint("CENTER", UIParent, "CENTER", 0, -170)

  Buffs:SetBackdrop({
  bgFile = "Interface/Tooltips/UI-Tooltip-Background",
                                          edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
                                          tile = true, tileSize = 16, edgeSize = 16,
                                          insets = { left = 4, right = 4, top = 4, bottom = 4 }})
  Buffs:SetBackdropColor(0, 0, 0, 0.1, 0)
  Buffs:SetBackdropBorderColor(0, 0, 0)
  Buffs:SetFrameLevel(0)
  Buffs:SetAlpha(1)

-- Frame for the Buffs--

-- Frame for Crusader --
  CrusadeFrame = CreateFrame("Frame", "CrusadeFrame", Buffs)
  CrusadeFrame:SetPoint("LEFT", Buffs, "LEFT", 2, 0)
  CrusadeFrame:SetSize(45, 45)
  CrusadeFrame:SetFrameStrata("BACKGROUND")
  CrusadeFrame:SetFrameLevel(0)

-- Texture for Crusader --
  CrusadeTexture = CrusadeFrame:CreateTexture("CrusadeTexture", "ARTWORK", nil, 1)
  CrusadeTexture:SetAllPoints(CrusadeFrame)
  CrusadeTexture:SetTexture("Interface\\Icons\\Ability_Paladin_SanctifiedWrath.blp")
  -- CrusadeTexture:SetColorTexture(243/255,98/255,35/255,1)
  CrusadeTexture:SetAlpha(0.4)
  
  
  -- Frame for Divine Steed --
  SteedFrame = CreateFrame("Frame", "SteedFrame", Buffs)
  SteedFrame:SetPoint("LEFT", "CrusadeFrame", "RIGHT")
  SteedFrame:SetSize(45, 45)
  SteedFrame:SetFrameStrata("BACKGROUND")

-- Texture for Divine Steed --
  SteedTexture = SteedFrame:CreateTexture("SteedTexture", "ARTWORK", nil, 1)
  SteedTexture:SetAllPoints(SteedFrame)
  SteedTexture:SetTexture("Interface\\Icons\\Ability_Paladin_DivineSteed.blp")
  SteedTexture:SetAlpha(0.4)
  -- SteedTexture:SetColorTexture(245/255,198/255,117/255,1)
 
-- Frame for Greater Blessing of Kings
  KingsFrame = CreateFrame("Frame", "KingsFrame", Buffs)
  KingsFrame:SetPoint("LEFT", "SteedFrame", "RIGHT")
  KingsFrame:SetSize(45, 45)
  KingsFrame:SetFrameStrata("BACKGROUND")
  
  KingsTexture = KingsFrame:CreateTexture("KingsTexture", "ARTWORK", nil, 1)
  KingsTexture:SetAllPoints(KingsFrame)
  KingsTexture:SetTexture("Interface\\Icons\\Spell_Magic_GreaterBlessingofKings.blp")
  KingsTexture:SetAlpha(0.4)
  
 -- Frame for Greater Blessing of Wisdom
  WisdomFrame = CreateFrame("Frame", "WisdomFrame", Buffs)
  WisdomFrame:SetPoint("LEFT", "KingsFrame", "RIGHT")
  WisdomFrame:SetSize(45, 45)
  WisdomFrame:SetFrameStrata("BACKGROUND")
  
  WisdomTexture = WisdomFrame:CreateTexture("WisdomTexture", "ARTWORK", nil, 1)
  WisdomTexture:SetAllPoints(WisdomFrame)
  WisdomTexture:SetTexture("Interface\\Icons\\Spell_Holy_GreaterBlessingofWisdom.blp")
  WisdomTexture:SetAlpha(0.4)
  
  Buffs:Hide();
	return Buffs;
end
