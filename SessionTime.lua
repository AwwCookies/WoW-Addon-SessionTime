local f = CreateFrame('Frame', 'SessionTimeFrame')
local t = f:CreateFontString(nil, "OVERLAY", "GameFontNormalTiny")

t:SetTextColor(255, 255, 255, 0.7)
t:SetPoint("BOTTOMLEFT", CharacterMicroButton, "LEFT", -35, -4)
f:SetScript("OnUpdate", function()
    t:SetText(SecondsToTime(GetSessionTime(), true))
end)