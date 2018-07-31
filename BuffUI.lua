local _, core = ...
core.BuffUI = {}
core.BuffUI2 = {}

local BuffUI = core.BuffUI
local BuffUI2 = core.BuffUI2
local Buffs
local Buffs2

function core:GetImage(name)
  return "Interface\\AddOns\\PalaAura\\"..name
end

function BuffUI:Toggle()
	local menu = Buffs or BuffUI:Create();
	menu:SetShown(not menu:IsShown());
end

function BuffUI2:Toggle()
  local menu = Buffs2 or BuffUI2:Create();
  menu:SetShown(not menu:IsShown());
end


function BuffUI:Create()

-- Main UI Frame --

  Buffs = CreateFrame("Frame", "Buffss", UIParent)
  Buffs:ClearAllPoints()
  Buffs:SetSize(180, 45)
  Buffs:SetPoint("CENTER", UIParent, "CENTER", 120, -270)

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
  CrusadeFrame:SetPoint("LEFT", Buffs, "LEFT")
  CrusadeFrame:SetSize(45, 45)
  CrusadeFrame:SetFrameStrata("BACKGROUND")

-- Texture for Crusader --
  CrusadeTexture = CrusadeFrame:CreateTexture("CrusadeTexture", "ARTWORK", nil, 1)
  CrusadeTexture:SetAllPoints(CrusadeFrame)
  CrusadeTexture:SetTexture("Interface\\Icons\\SPELL_HOLY_AVENGINEWRATH.blp")
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

 
-- Frame for Greater Blessing of Kings
  KingsFrame = CreateFrame("Frame", "KingsFrame", Buffs)
  KingsFrame:SetPoint("LEFT", "SteedFrame", "RIGHT")
  KingsFrame:SetSize(45, 45)
  KingsFrame:SetFrameStrata("BACKGROUND")
  
  KingsTexture = KingsFrame:CreateTexture("KingsTexture", "ARTWORK", nil, 1)
  KingsTexture:SetAllPoints(KingsFrame)
  KingsTexture:SetTexture("Interface\\Icons\\Spell_Magic_GreaterBlessingofKings.blp")
  KingsTexture:SetAlpha(0.4)
  
-- Text for Blessing of Kings -- 
  KingsText = KingsFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
  KingsText:SetPoint("CENTER")
  KingsText:SetText(core.buffs["Greater Blessing of Kings"][2])
  
 -- Frame for Greater Blessing of Wisdom
  WisdomFrame = CreateFrame("Frame", "WisdomFrame", Buffs)
  WisdomFrame:SetPoint("LEFT", "KingsFrame", "RIGHT")
  WisdomFrame:SetSize(45, 45)
  WisdomFrame:SetFrameStrata("BACKGROUND")
  
  WisdomTexture = WisdomFrame:CreateTexture("WisdomTexture", "ARTWORK", nil, 1)
  WisdomTexture:SetAllPoints(WisdomFrame)
  WisdomTexture:SetTexture("Interface\\Icons\\Spell_Holy_GreaterBlessingofWisdom.blp")
  WisdomTexture:SetAlpha(0.4)
  
-- Text for Blessing of Wisdom -- 
  WisdomText = WisdomFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
  WisdomText:SetPoint("CENTER")
  WisdomText:SetText(core.buffs["Greater Blessing of Wisdom"][2])
  

  Buffs:Hide();
	return Buffs
end

function BuffUI2:Create()
  Buffs2 = CreateFrame("Frame", "Buffss2", UIParent)
  Buffs2:ClearAllPoints()
  Buffs2:SetSize(180, 45)
  Buffs2:SetPoint("CENTER", UIParent, "CENTER", -120, -270)

  Buffs2:SetBackdrop({
  bgFile = "Interface/Tooltips/UI-Tooltip-Background",
                                          edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
                                          tile = true, tileSize = 16, edgeSize = 16,
                                          insets = { left = 4, right = 4, top = 4, bottom = 4 }})
  Buffs2:SetBackdropColor(0, 0, 0, 0.1, 0)
  Buffs2:SetBackdropBorderColor(0, 0, 0)
  Buffs2:SetFrameLevel(0)
  Buffs2:SetAlpha(1)
  
  
  -- Frame for Righteous Verdict -- 
  VerdictFrame = CreateFrame("Frame", "VerdictFrame", Buffs2)
  VerdictFrame:SetPoint("LEFT", Buffs2, "LEFT", 2, 0)
  VerdictFrame:SetSize(45, 45)
  VerdictFrame:SetFrameStrata("BACKGROUND")

-- Texture for Righteous Verdict --
  VerdictTexture = VerdictFrame:CreateTexture("VerdictTexture", "ARTWORK", nil, 1)
  VerdictTexture:SetAllPoints(VerdictFrame)
  VerdictTexture:SetTexture("Interface\\Icons\\Spell_Paladin_templarsverdict.blp")
  VerdictTexture:SetAlpha(0.4)
  
-- Text for Righteous Verdict -- 
  VerdictText = VerdictFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
  VerdictText:SetPoint("CENTER")
  VerdictText:SetText(core.buffs["Righteous Verdict"][2])
  
-- Frame for Sacred Judgment -- 
  SacredFrame = CreateFrame("Frame", "SacredFrame", Buffs2)
  SacredFrame:SetPoint("LEFT", "VerdictFrame", "LEFT", 45, 0)
  SacredFrame:SetSize(45, 45)
  SacredFrame:SetFrameStrata("BACKGROUND")
 
-- Texture for Sacred Judgment -- 
  SacredTexture = SacredFrame:CreateTexture("SacredTexture", "ARTWORK", nil, 1)
  SacredTexture:SetAllPoints(SacredFrame)
  SacredTexture:SetTexture("Interface\\Icons\\Ability_Paladin_Conviction.blp")
  SacredTexture:SetAlpha(0.4)
  
-- Frame for Divine Judgment -- 
  DivineFrame = CreateFrame("Frame", "DivineFrame", Buffs2)
  DivineFrame:SetPoint("LEFT", "SacredFrame", "LEFT", 45, 0)
  DivineFrame:SetSize(45, 45)
  DivineFrame:SetFrameStrata("BACKGROUND")

-- Texture for Divine Judgment -- 
  DivineTexture = DivineFrame:CreateTexture("DivineTexture", "ARTWORK", nil, 1)
  DivineTexture:SetAllPoints(DivineFrame)
  DivineTexture:SetTexture("Interface\\Icons\\Ability_Paladin_GaurdedbytheLight.blp")
  DivineTexture:SetAlpha(0.4)
  
-- Frame for Inquisition -- 
  InquisitionFrame = CreateFrame("Frame", "InquisitionFrame", Buffs2)
  InquisitionFrame:SetPoint("LEFT", "DivineFrame", "LEFT", 43, 0)
  InquisitionFrame:SetSize(45, 40)
  InquisitionFrame:SetFrameStrata("BACKGROUND")

-- Texture for Inquisition -- 
  InquisitionTexture = InquisitionFrame:CreateTexture("InquisitionTexture", "ARTWORK", nil, 1)
  InquisitionTexture:SetAllPoints(InquisitionFrame)
  InquisitionTexture:SetTexture("Interface\\Icons\\Spell_Paladin_Inquisition.blp")
  InquisitionTexture:SetAlpha(0.4)


  Buffs2:Hide()
  return Buffs2
end
