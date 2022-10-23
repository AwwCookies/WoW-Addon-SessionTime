local f = CreateFrame('Frame', 'SessionTimeFrame')
local t = f:CreateFontString(nil, "OVERLAY", "GameFontNormalTiny")
f:RegisterEvent("ADDON_LOADED")

local defaultSettings = {
    fontSize = 10,
    offsetX = -5,
    offsetY = -1
}

SessionTimeVars = SessionTimeVars or defaultSettings

-- AddOn Settings
local function createAddonSetting()
    local category = Settings.RegisterVerticalLayoutCategory("Session Time")

    -- Font Size
    do
        local variable = "fontSize"
        local name = "Font Size"
        local tooltip = "Control the font size"
        local defaultValue = SessionTimeVars.fontSize
        local setting = Settings.RegisterProxySetting(
            category, "variable", SessionTimeVars, type(defaultValue), name, defaultValue
        )
        local options = Settings.CreateSliderOptions(1, 100, 1)
        options:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right);
        Settings.CreateSlider(category, setting, options, tooltip)
     end
     -- offset x
    do
        local variable = "offsetX"
        local name = "Offset X"
        local tooltip = "Move the Text left or right"
        local defaultValue = SessionTimeVars.offsetX
        local setting = Settings.RegisterProxySetting(
            category, variable, SessionTimeVars, type(defaultValue), name, defaultValue
        )
        local options = Settings.CreateSliderOptions(-100, 100, 1)
        options:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right);
        Settings.CreateSlider(category, setting, options, tooltip)
     end
      -- offset y
    do
        local variable = "offsetY"
        local name = "Offset Y"
        local tooltip = "Move the Text up or down"
        local defaultValue = SessionTimeVars.offsetY
        local setting = Settings.RegisterProxySetting(
            category, variable, SessionTimeVars, type(defaultValue), name, defaultValue
        )
        local options = Settings.CreateSliderOptions(-100, 100, 1)
        options:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right);
        Settings.CreateSlider(category, setting, options, tooltip)
     end

    Settings.RegisterAddOnCategory(category)
end

-- f:SetScript("OnEvent", function(self, event, addonName)
--     if (event == "ADDON_LOADED" and addonName == "SessionTime") then
--         createAddonSetting()
--     end
-- end)

QueueStatusButtonIcon:HookScript("OnShow", function()
    SessionTimeVars.offsetX = SessionTimeVars.offsetX - 32
end)

QueueStatusButtonIcon:HookScript("OnHide", function()
    SessionTimeVars.offsetX = SessionTimeVars.offsetX + 32
end)

f:SetScript("OnUpdate", function()
    t:SetTextColor(255, 255, 255, 0.7)
    t:SetPoint("RIGHT", CharacterMicroButton, "LEFT", SessionTimeVars.offsetX, SessionTimeVars.offsetY)
    t:SetFont("Fonts\\FRIZQT__.TTF", SessionTimeVars.fontSize, nil)
    t:SetText(SecondsToTime(GetSessionTime(), true))
end)