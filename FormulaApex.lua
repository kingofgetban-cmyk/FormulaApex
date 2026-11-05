-- ==============================================================================
-- MINTRAZERX SECURITY GATEWAY — FORMULA APEX RACING
-- Target: Formula Apex (All 38 Circuits & Sub-Places Supported)
-- Universe ID: 2153167977 | Main Place ID: 5976159288
-- ==============================================================================

local PRIMARY_LOADER = "https://mintrazerx-keysystem-wf4n.onrender.com/mintrazerx.lua"
local BACKUP_LOADER  = "https://raw.githubusercontent.com/kingofgetban-cmyk/TheLostFront/main/mintrazerx.lua"

pcall(function()
    local StarterGui = game:GetService("StarterGui")
    StarterGui:SetCore("SendNotification", {
        Title = "MintraZERX Hub",
        Text = "Loading Formula Apex Suite (All Maps Supported)...",
        Duration = 4
    })
end)

-- Attempt Primary Render Server Loader, with instant fallback to GitHub CDN if server asleep
local loaderScript = nil
local ok, res = pcall(function()
    return game:HttpGet(PRIMARY_LOADER)
end)

if ok and res and #res > 500 then
    loaderScript = res
else
    local okBackup, resBackup = pcall(function()
        return game:HttpGet(BACKUP_LOADER)
    end)
    if okBackup and resBackup and #resBackup > 500 then
        loaderScript = resBackup
    end
end

if loaderScript then
    local fn = (loadstring or load)(loaderScript)
    if fn then fn() end
else
    warn("[MintraZERX Error] Failed to retrieve loader from both primary and backup gateways.")
end
