--[[
    Bordo UI - Core (Core.lua)
    World of Warcraft 1.12.1 / Azeroth Survivors
    Modern UI Suite by Bordo
]]--
BordoUI = {};
AZSHelper = BordoUI; -- Backwards compatibility alias
BordoUI.version = "2.8.16";
-- Unit & Mob Tooltip: Anchor world/unit/add tooltips to bottom-right (or custom position)
local tipAnchor = CreateFrame("Frame", "BordoUI_TooltipAnchor", UIParent);
tipAnchor:SetWidth(200);
tipAnchor:SetHeight(80);
tipAnchor:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -12, 26);
tipAnchor:SetMovable(true);
tipAnchor:SetClampedToScreen(true);
tipAnchor:EnableMouse(false);
BordoUI.tipAnchor = tipAnchor;
local function PlaceTooltip(tooltip)
	if ( not tooltip ) then return; end
	if ( BordoUI and BordoUI.IsWindowEnabled and not BordoUI:IsWindowEnabled("tooltip") ) then
		tooltip:Hide();
		return;
	end
	tooltip:ClearAllPoints();
	if ( BordoUIDB and BordoUIDB.tooltipPos and BordoUIDB.tooltipPos.point ) then
		BordoUI:RestorePosition(tooltip, BordoUIDB.tooltipPos);
	else
		tooltip:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -12, 26);
	end
end
local orig_GameTooltip_SetDefaultAnchor = GameTooltip_SetDefaultAnchor;
function GameTooltip_SetDefaultAnchor(tooltip, parent)
	if ( BordoUI and BordoUI.IsWindowEnabled and not BordoUI:IsWindowEnabled("tooltip") ) then
		tooltip:Hide();
		return;
	end
	tooltip:SetOwner(parent, "ANCHOR_NONE");
	PlaceTooltip(tooltip);
	tooltip.default = 1;
end
if ( updateContainerFrameAnchors ) then
	local orig_updateContainerFrameAnchors = updateContainerFrameAnchors;
	updateContainerFrameAnchors = function()
		orig_updateContainerFrameAnchors();
		if ( GameTooltip:IsShown() and GameTooltip.default ) then
			PlaceTooltip(GameTooltip);
		end
	end
end
-- Default Settings
local defaults = {
    dmgScale   = 0.75,
    tableScale = 0.80,
    collapsed  = false,
    locked     = true, -- Global UI window lock (Default: always LOCKED on startup)
    hudPos     = { point = "CENTER", relativePoint = "CENTER", x = 0, y = -170 },
    centerHudPos = { point = "CENTER", relativePoint = "CENTER", x = 0, y = -170 },
    statsPos   = { point = "TOPLEFT", relativePoint = "TOPLEFT", x = 12, y = -14 },
    bossTrackerPos = { point = "TOPRIGHT", relativePoint = "TOPRIGHT", x = -12, y = -160 },
    multPanelPos = { point = "TOPLEFT", relativePoint = "TOPLEFT", x = 12, y = -120 },
    deathRecapPos = { point = "RIGHT", relativePoint = "CENTER", x = -260, y = 20 },
    encounterBarsPos = { point = "TOP", relativePoint = "TOP", x = 0, y = -132 },
    choiceAdvisorPos = { point = "TOP", relativePoint = "TOP", x = 0, y = -4 },
    lootAlertPos = { point = "TOP", relativePoint = "TOP", x = 0, y = -175 },
    tallyPos = nil, -- Defaults to centered under combat HUD
    microDockPos = nil, -- Defaults to bottom-right corner
    chatPos = { point = "BOTTOMLEFT", relativePoint = "BOTTOMLEFT", x = 14, y = 26 },
    partyPos = { point = "TOPLEFT", relativePoint = "TOPLEFT", x = 142, y = -120 },
    showParty = true,
    chestArrow = true,
    chestChat  = true,
    nameplateFilter = "all",
    friendlyNameplates = true,
    hideTotems = true,
    nameplateShowTarget = true,
};
local function InitDB()
    if ( not BordoUIDB ) then
        BordoUIDB = AZSHelperDB or {};
    end
    AZSHelperDB = BordoUIDB;
    for k, v in pairs(defaults) do
        if ( BordoUIDB[k] == nil ) then
            BordoUIDB[k] = v;
        end
    end
    -- Clean up legacy HUD positions (e.g. old BOTTOM y=200 anchor that pushed HUD down to bottom)
    local defaultHudPos = { point = "CENTER", relativePoint = "CENTER", x = 0, y = -170 };
    if ( not BordoUIDB.hudPos or (BordoUIDB.hudPos.point == "BOTTOM" and BordoUIDB.hudPos.y and BordoUIDB.hudPos.y == 200) ) then
        BordoUIDB.hudPos = defaultHudPos;
    end
    if ( not BordoUIDB.centerHudPos or (BordoUIDB.centerHudPos.point == "BOTTOM" and BordoUIDB.centerHudPos.y and BordoUIDB.centerHudPos.y == 200) ) then
        BordoUIDB.centerHudPos = defaultHudPos;
    end
    if ( AZSHelperDB ) then
        if ( not AZSHelperDB.rowPos or (AZSHelperDB.rowPos.point == "BOTTOM" and AZSHelperDB.rowPos.y and AZSHelperDB.rowPos.y == 200) ) then
            AZSHelperDB.rowPos = defaultHudPos;
        end
        if ( not AZSHelperDB.centerHudPos or (AZSHelperDB.centerHudPos.point == "BOTTOM" and AZSHelperDB.centerHudPos.y and AZSHelperDB.centerHudPos.y == 200) ) then
            AZSHelperDB.centerHudPos = defaultHudPos;
        end
    end
    if ( not BordoUIDB.deathRecapPos or (BordoUIDB.deathRecapPos.x and BordoUIDB.deathRecapPos.x > -250) ) then
        BordoUIDB.deathRecapPos = { point = "RIGHT", relativePoint = "CENTER", x = -260, y = 20 };
    end
    if ( BordoUIDB.itemCache ) then
        for k, entry in pairs(BordoUIDB.itemCache) do
            if ( entry and entry.tex ) then
                local lTex = string.lower(entry.tex);
                if ( string.find(lTex, "inv_jewelry_ring_40") ) then
                    entry.tex = "Interface\\Icons\\INV_Jewelry_Ring_35";
                elseif ( string.find(lTex, "inv_jewelry_ring_49") and not string.find(lTex, "naxxramas") ) then
                    entry.tex = "Interface\\Icons\\INV_Jewelry_Ring_49Naxxramas";
                elseif ( string.find(lTex, "inv_jewelry_ring_51") and not string.find(lTex, "naxxramas") ) then
                    entry.tex = "Interface\\Icons\\INV_Jewelry_Ring_51Naxxramas";
                end
            end
        end
    end
end
-- Formatting Utilities
function BordoUI:FormatNumber(n)
    if ( not n ) then return "0"; end
    n = math.floor(n);
    if ( n >= 1000000 ) then
        return string.format("%.1fM", n / 1000000);
    elseif ( n >= 10000 ) then
        return string.format("%.1fk", n / 1000);
    elseif ( n >= 1000 ) then
        local thousands = math.floor(n / 1000);
        local remainder = math.mod(n, 1000);
        return string.format("%d,%03d", thousands, remainder);
    else
        return tostring(n);
    end
end
function BordoUI:FormatTime(sec)
    if ( not sec or sec < 0 ) then return "0:00"; end
    local m = math.floor(sec / 60);
    local s = math.floor(math.mod(sec, 60));
    return string.format("%d:%02d", m, s);
end
function BordoUI:ApplyMaxCameraDistance()
    pcall(SetCVar, "cameraDistanceMax", "50");
    pcall(SetCVar, "cameraDistanceMaxFactor", "3.4");
    pcall(SetCVar, "cameraDistanceMaxFactor", "4");
end
-- Frame Movement & Lock Utility
function BordoUI:MakeMovable(frame, saveKey, callback)
    if ( not frame ) then return; end
    frame:SetMovable(true);
    frame:EnableMouse(true);
    frame:RegisterForDrag("LeftButton");
    frame:SetScript("OnDragStart", function()
        if ( BordoUIDB and BordoUIDB.locked ) then return; end
        this:StartMoving();
    end);
    frame:SetScript("OnDragStop", function()
        this:StopMovingOrSizing();
        if ( saveKey and BordoUIDB ) then
            local point, _, relPoint, x, y = this:GetPoint();
            BordoUIDB[saveKey] = { point = point, relativePoint = relPoint, x = x, y = y };
        end
        if ( callback ) then
            callback(this);
        end
    end);
    frame:SetScript("OnMouseDown", function()
        if arg1 == "RightButton" and MouselookStart then
            MouselookStart();
        end
    end);
    frame:SetScript("OnMouseUp", function()
        if arg1 == "RightButton" and MouselookStop then
            MouselookStop();
        end
    end);
end
function BordoUI:RestorePosition(frame, posData)
    if ( frame and posData and posData.point ) then
        frame:ClearAllPoints();
        frame:SetPoint(posData.point, UIParent, posData.relativePoint or posData.point, posData.x or 0, posData.y or 0);
    end
end
function BordoUI:SetLocked(locked)
    if ( not BordoUIDB ) then return; end
    BordoUIDB.locked = locked and true or false;
    if ( BordoUI.UpdateLockState ) then
        BordoUI:UpdateLockState();
    end
    if ( BordoUI.UpdatePartyFrames ) then
        BordoUI:UpdatePartyFrames();
    end
    if ( BordoUI.UpdateAllLockButtons ) then
        BordoUI:UpdateAllLockButtons();
    end
    if ( BordoUI.UpdateSCTAnchorVisibility ) then
        BordoUI:UpdateSCTAnchorVisibility();
    end
    if ( BordoUIDB.locked ) then
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ccffBordo UI|r: All UI windows are now |cffff3333[LOCKED]|r. Dragging is disabled.");
    else
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ccffBordo UI|r: All UI windows are now |cff55ff55[UNLOCKED]|r. You can freely drag and reposition Chat, Stats, Boss Bars, Damage Meter, Build & Minimap buttons.");
    end
end
function BordoUI:ToggleLock()
    local newState = not (BordoUIDB and BordoUIDB.locked);
    BordoUI:SetLocked(newState);
    return newState;
end
-- =========================================================================
-- Universal Window Lock Button Engine
-- =========================================================================
BordoUI.LockButtons = {};
function BordoUI:UpdateAllLockButtons()
    -- Individual window lock icons removed per user request.
    -- Moving and locking is centrally controlled via /bordo, /lock, /unlock.
    for i = 1, table.getn(BordoUI.LockButtons) do
        if ( BordoUI.LockButtons[i] ) then
            BordoUI.LockButtons[i]:Hide();
        end
    end
end
function BordoUI:AttachLockButton(parent, anchorPoint, relFrame, relPoint, x, y)
    -- Individual window lock icons removed per user request.
    return nil;
end
-- Event Listener Frame
local eventFrame = CreateFrame("Frame", "BordoUI_CoreEventFrame");
eventFrame:RegisterEvent("VARIABLES_LOADED");
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD");
eventFrame:SetScript("OnEvent", function()
    if ( event == "VARIABLES_LOADED" or event == "PLAYER_ENTERING_WORLD" ) then
        InitDB();
        if ( BordoUI.UpdateAllLockButtons ) then
            BordoUI:UpdateAllLockButtons();
        end
        if ( BordoUI.ApplyAllWindowScales ) then
            BordoUI:ApplyAllWindowScales();
        end
        if ( event == "PLAYER_ENTERING_WORLD" ) then
            BordoUIDB.locked = true;
            BordoUI.moveModeActive = false;
            if ( BordoUI.controlBar ) then
                BordoUI.controlBar:Hide();
            end
            if ( BordoUI.MoveOverlays ) then
                for i = 1, table.getn(BordoUI.MoveOverlays) do
                    if ( BordoUI.MoveOverlays[i] ) then
                        if ( BordoUI.MoveOverlays[i].StopDrag ) then
                            BordoUI.MoveOverlays[i]:StopDrag();
                        end
                        BordoUI.MoveOverlays[i]:Hide();
                    end
                end
            end
            if ( BordoUI_SnapLineH ) then BordoUI_SnapLineH:Hide(); end
            if ( BordoUI_SnapLineV ) then BordoUI_SnapLineV:Hide(); end
            if ( BordoUI.UpdateSCTAnchorVisibility ) then
                BordoUI:UpdateSCTAnchorVisibility();
            end
            if ( BordoUI.UpdateAllLockButtons ) then
                BordoUI:UpdateAllLockButtons();
            end
            pcall(SetCVar, "hudFlag", "0");
            if ( AZS_SetHudShown and AZS_IsHudShown and AZS_IsHudShown("flag") ) then
                AZS_SetHudShown("flag", false);
            end
            DEFAULT_CHAT_FRAME:AddMessage("|cff00ccffBordo UI|r loaded (Modern UI Suite, Miniboss Timer, Chest Radar & Boss Highlight). Type |cffffd100/bordo|r or |cffffd100/azs|r.");
            BordoUI:ApplyMaxCameraDistance();
            if ( BordoUI.ApplyModernDamageText ) then
                BordoUI:ApplyModernDamageText();
            end
            if ( BordoUI.ApplySquareMinimapStyle ) then
                BordoUI:ApplySquareMinimapStyle();
            end
            if ( BordoUI.UpdateLockState ) then
                BordoUI:UpdateLockState();
            end
            if ( BordoUI_ChatBox ) then
                BordoUI_ChatBox:ClearAllPoints();
                BordoUI_ChatBox:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 14, 26);
                if ( AZSHelper and AZSHelper.DockAllChatFrames ) then AZSHelper:DockAllChatFrames(); end
            end
        end
    end
end);
-- Slash Commands
SLASH_BORDOU1 = "/bordo";
SLASH_BORDOU2 = "/bordoui";
SLASH_BORDOU3 = "/bu";
SLASH_BORDOU4 = "/azs";
SLASH_BORDOU5 = "/survivor";
SlashCmdList["BORDOU"] = function(msg)
    msg = string.lower(msg or "");
    local _, _, cmd, val = string.find(msg, "^(%a+)%s*(.*)$");

    -- The bare /bordo command is the layout editor entry point.
    if ( not cmd or cmd == "" ) then
        BordoUI:SetLocked(false);
        BordoUI:ToggleMoveMode(true);
        return;
    end
    
    if ( cmd == "scale" or cmd == "dmg" or cmd == "damage" or cmd == "numbers" or cmd == "combattext" ) then
        local num = tonumber(val);
        if ( num and num >= 0.4 and num <= 1.5 ) then
            if ( BordoUI.SetDamageScale ) then
                BordoUI:SetDamageScale(num);
            else
                BordoUIDB.dmgScale = num;
                if ( BordoUI.ApplyModernDamageText ) then
                    BordoUI:ApplyModernDamageText();
                end
            end
            DEFAULT_CHAT_FRAME:AddMessage(string.format("|cff00ccffBordo UI|r: Floating combat text scale set to %.0f%%.", num * 100));
        else
            DEFAULT_CHAT_FRAME:AddMessage("|cff00ccffBordo UI|r: Usage: /bordo dmg [0.4 - 1.5] to set floating damage text scale.");
        end
    elseif ( cmd == "size" or cmd == "table" ) then
        local num = tonumber(val);
        if ( num and num >= 0.4 and num <= 1.5 ) then
            if ( BordoUI.SetTableScale ) then
                BordoUI:SetTableScale(num);
            end
            DEFAULT_CHAT_FRAME:AddMessage(string.format("|cff00ccffBordo UI|r: Stats table scale set to %.0f%%.", num * 100));
        else
            DEFAULT_CHAT_FRAME:AddMessage("|cff00ccffBordo UI|r: Usage: /bordo size 0.75 (value between 0.4 and 1.5)");
        end
    elseif ( cmd == "death" or cmd == "recap" or cmd == "tod" ) then
        if ( BordoUI.ShowDeathRecap ) then
            BordoUI:ShowDeathRecap();
        end
    elseif ( cmd == "boss" or cmd == "timer" ) then
        if ( AZSHelper_BossSchedulePanel ) then
            if ( AZSHelper_BossSchedulePanel:IsShown() ) then
                AZSHelper_BossSchedulePanel:Hide();
                DEFAULT_CHAT_FRAME:AddMessage("|cff00ccffBordo UI|r: Boss timer list hidden.");
            else
                AZSHelper_BossSchedulePanel:Show();
                DEFAULT_CHAT_FRAME:AddMessage("|cff00ccffBordo UI|r: Boss timer list shown.");
            end
        end
    elseif ( cmd == "window" or cmd == "windows" ) then
        if BordoUI.HandleWindowCommand then BordoUI:HandleWindowCommand(val); end
    elseif ( cmd == "filter" or cmd == "statsfilter" or cmd == "statfilter" ) then
        if BordoUI_ToggleStatsConfig then
            BordoUI_ToggleStatsConfig();
        elseif BordoUI and BordoUI.ToggleStatsConfig then
            BordoUI:ToggleStatsConfig();
        end
    elseif ( cmd == "stats" or cmd == "statswindow" ) then
        if BordoUI.SetWindowEnabled then
            local current = BordoUI:IsWindowEnabled("stats");
            local target;
            if val == "on" then target = true;
            elseif val == "off" then target = false;
            else target = not current; end
            BordoUI:SetWindowEnabled("stats", target);
            DEFAULT_CHAT_FRAME:AddMessage("|cff00ccffBordo UI|r: Stats Window " .. (target and "|cff55ff55[SHOWN]|r" or "|cffff3333[HIDDEN]|r") .. ".");
        end
    elseif ( cmd == "crit" or cmd == "highestcrit" ) then
        if BordoUI.SetWindowEnabled then
            local current = BordoUI:IsWindowEnabled("crit");
            local target;
            if val == "on" then target = true;
            elseif val == "off" then target = false;
            else target = not current; end
            BordoUI:SetWindowEnabled("crit", target);
            DEFAULT_CHAT_FRAME:AddMessage("|cff00ccffBordo UI|r: Highest Crit Window " .. (target and "|cff55ff55[SHOWN]|r" or "|cffff3333[HIDDEN]|r") .. ".");
        end
    elseif ( cmd == "loot" or cmd == "testloot" ) then
        if ( BordoUI.TestLootAlert ) then
            BordoUI:TestLootAlert(val);
        end
    elseif ( cmd == "lowhp" or cmd == "heartbeat" ) then
        if ( BordoUI.ToggleLowHealthWarning ) then
            BordoUI:ToggleLowHealthWarning();
        end
    elseif ( cmd == "testlowhp" ) then
        if ( BordoUI.TestLowHealthWarning ) then
            BordoUI:TestLowHealthWarning();
        end
    elseif ( cmd == "runrecap" or cmd == "recap" or cmd == "testrecap" ) then
        if ( BordoUI.ToggleRunRecap ) then
            BordoUI:ToggleRunRecap(val);
        end

    elseif ( cmd == "test" or cmd == "preview" ) then
        BordoUI.TestBossPreview = not BordoUI.TestBossPreview;
        local st = BordoUI.TestBossPreview and "enabled (Hogger test boss)" or "disabled";
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ccffBordo UI|r: Boss HP preview " .. st .. ".");
    elseif ( cmd == "zoom" or cmd == "cam" or cmd == "camera" ) then
        BordoUI:ApplyMaxCameraDistance();
        local yards = tonumber(val) or 35;
        pcall(CameraZoomOut, yards);
        DEFAULT_CHAT_FRAME:AddMessage(string.format("|cff00ccffBordo UI|r: Max camera zoom unlocked (factor 4 / 50 yards). Zoomed out by %d yards. You can now zoom out further using your mouse wheel!", yards));
    elseif ( cmd == "party" or cmd == "group" ) then
        if ( BordoUI.TogglePartyFrames ) then
            BordoUI:TogglePartyFrames(val);
        end
    elseif ( cmd == "plates" or cmd == "nameplates" or cmd == "teammates" or cmd == "threat" ) then
        if ( val == "all" or val == "boss" or val == "bosses" or val == "off" ) then
            local targetFilter = (val == "boss" or val == "bosses") and "bosses" or val;
            if ( BordoUI.SetNameplateFilter ) then
                BordoUI:SetNameplateFilter(targetFilter);
            end
        elseif ( val == "cycle" ) then
            if ( BordoUI.CycleNameplateFilter ) then
                BordoUI:CycleNameplateFilter();
            end
        elseif ( val == "ally" or val == "party" or val == "friendly" ) then
            if ( BordoUI.ToggleFriendlyNameplates ) then
                BordoUI:ToggleFriendlyNameplates();
            end
        else
            if ( BordoUI.ToggleNameplatesWindow ) then
                BordoUI:ToggleNameplatesWindow();
            elseif ( BordoUI.EnsureNameplates ) then
                BordoUI:EnsureNameplates();
            end
        end
    elseif ( cmd == "totem" or cmd == "totems" ) then
        BordoUIDB = BordoUIDB or {};
        BordoUIDB.hideTotems = true;
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ccffBordo UI|r: Totem health bars are permanently hidden.");
    elseif ( cmd == "lock" ) then
        BordoUI:ToggleMoveMode(false);
        BordoUI:SetLocked(true);
    elseif ( cmd == "unlock" ) then
        BordoUI:SetLocked(false);
        BordoUI:ToggleMoveMode(true);
    elseif ( cmd == "move" or cmd == "togglelock" ) then
        BordoUI:ToggleMoveMode();
    elseif ( cmd == "help" ) then
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ccffBordo UI Commands:|r");
        DEFAULT_CHAT_FRAME:AddMessage("  |cffffd100/bordo|r - Open UI Move Mode");
        DEFAULT_CHAT_FRAME:AddMessage("  |cffffd100/bordo party|r - Toggle Modern Party Frames (/bordo party test)");
        DEFAULT_CHAT_FRAME:AddMessage("  |cffffd100/bordo plates|r - Open Nameplates Settings (/bordo plates all|bosses|off)");
        DEFAULT_CHAT_FRAME:AddMessage("  |cffffd100/bordo totems|r - Totem health bars stay permanently hidden");
        DEFAULT_CHAT_FRAME:AddMessage("  |cffffd100/bordo lock|r - Lock all UI windows (disables dragging)");
        DEFAULT_CHAT_FRAME:AddMessage("  |cffffd100/bordo unlock|r - Unlock all UI windows (freely drag & reposition)");
        DEFAULT_CHAT_FRAME:AddMessage("  |cffffd100/bordo meter|r - Toggle BordoUI Damage Meter");
        DEFAULT_CHAT_FRAME:AddMessage("  |cffffd100/bordo filter|r - Configure visible stats (show/hide)");
        DEFAULT_CHAT_FRAME:AddMessage("  |cffffd100/bordo stats [on|off]|r - Toggle 4-Section Stats Window");
        DEFAULT_CHAT_FRAME:AddMessage("  |cffffd100/bordo crit [on|off]|r - Toggle Highest Crit Window");
        DEFAULT_CHAT_FRAME:AddMessage("  |cffffd100/bordo window|r - Open Window Control Panel (toggle any window ON/OFF)");
        DEFAULT_CHAT_FRAME:AddMessage("  |cffffd100/bordo move|r - Toggle lock / unlock state");
        DEFAULT_CHAT_FRAME:AddMessage("  |cffffd100/bordo reset|r - Reset all window positions to defaults");
        DEFAULT_CHAT_FRAME:AddMessage("  |cffffd100/bordo recap|r - View Death Recap & Recent Damage");
        DEFAULT_CHAT_FRAME:AddMessage("  |cffffd100/bordo dmg <0.4-1.5>|r - Set floating damage font scale");
        DEFAULT_CHAT_FRAME:AddMessage("  |cffffd100/bordo size <0.4-1.5>|r - Set stats table scale");
        DEFAULT_CHAT_FRAME:AddMessage("  |cffffd100/bordo zoom [yards]|r - Unlock & set max camera distance");
    elseif ( cmd == "guide" or cmd == "buildguide" or cmd == "metabuild" or cmd == "builds" ) then
        if BordoUI_ToggleBuildAdvisor then
            BordoUI_ToggleBuildAdvisor();
        end
    elseif ( cmd == "testglow" or cmd == "choice" ) then
        if SlashCmdList["BORDOBUILDGUIDE"] then
            SlashCmdList["BORDOBUILDGUIDE"]("test");
        end
    elseif ( cmd == "meter" or cmd == "dps" ) then
        if ( val and string.find(val, "scale") ) then
            local _, _, sVal = string.find(val, "scale%s+(%S+)");
            local num = tonumber(sVal);
            if num and BordoUI_SetMeterScale then
                if num > 10 then num = num / 100; end
                BordoUI_SetMeterScale(num);
                DEFAULT_CHAT_FRAME:AddMessage("|cff00ccffBordo UI|r: Damage Meter scale set to " .. math.floor(num * 100 + 0.5) .. "%.");
            else
                DEFAULT_CHAT_FRAME:AddMessage("|cff00ccffBordo UI|r: Usage: |cffffd100/bordo meter scale 0.8|r (55% to 160%).");
            end
        elseif ( BordoUI_ToggleMeter ) then
            BordoUI_ToggleMeter();
        elseif ( SurvivorUI_ToggleMeter ) then
            SurvivorUI_ToggleMeter();
        end
    elseif ( cmd == "partymeter" or cmd == "partydps" ) then
        if BordoUI_TogglePartyMeter then
            BordoUI_TogglePartyMeter();
        end
    elseif ( cmd == "reset" ) then
        BordoUI:ResetToDefaultLayout();
    elseif ( cmd == "chest" or cmd == "chests" or cmd == "cl" or cmd == "kiste" or cmd == "kisten" ) then
        if ( SlashCmdList["AZSCHESTLIGHT"] ) then
            SlashCmdList["AZSCHESTLIGHT"](val);
        end
    else
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ccffBordo UI|r: Unknown command. Type |cffffd100/bordo help|r for commands.");
    end
end;
-- Standalone Slash Commands for Locking / Unlocking
SLASH_BORDOLOCK1 = "/lock";
SlashCmdList["BORDOLOCK"] = function()
    BordoUI:SetLocked(true);
end;
SLASH_BORDOUNLOCK1 = "/unlock";
SlashCmdList["BORDOUNLOCK"] = function()
    BordoUI:SetLocked(false);
end;
SLASH_BORDOMETER1 = "/meter";
SLASH_BORDOMETER2 = "/dps";
SlashCmdList["BORDOMETER"] = function(msg)
    local cmd = string.lower(msg or "");
    local _, _, sub, arg = string.find(cmd, "%s*(%S+)%s*(%S*)");
    if ( sub == "scale" and arg and arg ~= "" ) then
        local num = tonumber(arg);
        if num and BordoUI_SetMeterScale then
            if num > 10 then num = num / 100; end
            BordoUI_SetMeterScale(num);
            DEFAULT_CHAT_FRAME:AddMessage("|cff00ccffBordo UI|r: Damage Meter scale set to " .. math.floor(num * 100 + 0.5) .. "%.");
        end
    elseif ( sub == "party" or sub == "partymeter" ) then
        if BordoUI_TogglePartyMeter then BordoUI_TogglePartyMeter(); end
    elseif ( sub == "reset" ) then
        if BordoUI_ResetMeterPosition then BordoUI_ResetMeterPosition(); end
        if BordoUI_ResetPartyMeterPosition then BordoUI_ResetPartyMeterPosition(); end
        if BordoUI_ResetMeter then BordoUI_ResetMeter(); end
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ccffBordo UI|r: Damage & Party Meter positions and data reset.");
    else
        if BordoUI_ToggleMeter then
            BordoUI_ToggleMeter();
        elseif SurvivorUI_ToggleMeter then
            SurvivorUI_ToggleMeter();
        end
    end
end;
SLASH_BORDOPLATES1 = "/plates";
SlashCmdList["BORDOPLATES"] = function(msg)
    local cmd = string.lower(msg or "");
    local _, _, sub = string.find(cmd, "%s*(%S+)");
    if ( sub == "all" or sub == "boss" or sub == "bosses" or sub == "off" ) then
        local targetFilter = (sub == "boss" or sub == "bosses") and "bosses" or sub;
        if ( BordoUI.SetNameplateFilter ) then
            BordoUI:SetNameplateFilter(targetFilter);
        end
    elseif ( sub == "cycle" ) then
        if ( BordoUI.CycleNameplateFilter ) then
            BordoUI:CycleNameplateFilter();
        end
    elseif ( sub == "ally" or sub == "party" or sub == "friendly" ) then
        if ( BordoUI.ToggleFriendlyNameplates ) then
            BordoUI:ToggleFriendlyNameplates();
        end
    else
        if ( BordoUI.ToggleNameplatesWindow ) then
            BordoUI:ToggleNameplatesWindow();
        elseif ( BordoUI.EnsureNameplates ) then
            BordoUI:EnsureNameplates();
        end
    end
end;
-- Lair Marks Helpers (used by BossTracker, MapPins, Guardians)
local MARK_KINDS = 8;
local MARK_NAMES = { "Crossed swords", "Shield", "Crown", "Chalice", "Fleur-de-lis", "War hammer", "Tower", "Helm" };
function SurvivorUI_LairMarks(lairs)
    local marks = {};
    lairs = lairs or (AZS_GetLairs and AZS_GetLairs()) or AZS_LAIRS or {};
    local places = {};
    for k, l in pairs(lairs) do
        if type(l) == "table" then
            local idx = tonumber(l.index or l[1]) or tonumber(k);
            if idx then
                table.insert(places, idx);
            end
        end
    end
    table.sort(places);
    for rank = 1, table.getn(places) do
        marks[places[rank]] = math.mod(rank - 1, MARK_KINDS) + 1;
    end
    return marks;
end
function SurvivorUI_SetLairMark(texture, mark, dim)
    if ( not mark or not texture ) then
        if ( texture ) then texture:Hide(); end
        return;
    end
    local column = math.mod(mark - 1, 4);
    local line = math.floor((mark - 1) / 4);
    texture:SetTexture("Interface\\AddOns\\BordoUI\\Art\\LairMarks.tga");
    texture:SetTexCoord(column / 4, (column + 1) / 4, line / 2, (line + 1) / 2);
    if ( dim ) then
        texture:SetVertexColor(0.5, 0.5, 0.5, 0.8);
    else
        texture:SetVertexColor(1, 1, 1, 1);
    end
    texture:Show();
end
function SurvivorUI_LairMarkName(mark)
    return mark and MARK_NAMES[mark] or nil;
end
-- =========================================================================
-- Visual Move Mode & Universal Layout System with Magnetic Snapping
-- =========================================================================
BordoUI.MoveOverlays = {};

local function EnsureSnapLines()
    if ( not BordoUI_SnapLineH ) then
        local lineH = CreateFrame("Frame", "BordoUI_SnapLineH", UIParent);
        lineH:SetFrameStrata("TOOLTIP");
        lineH:SetFrameLevel(120);
        lineH:SetHeight(2);
        local texH = lineH:CreateTexture(nil, "OVERLAY");
        texH:SetAllPoints(lineH);
        texH:SetTexture(0.0, 0.90, 1.0, 0.85);
        lineH.tex = texH;
        lineH:Hide();
    end
    if ( not BordoUI_SnapLineV ) then
        local lineV = CreateFrame("Frame", "BordoUI_SnapLineV", UIParent);
        lineV:SetFrameStrata("TOOLTIP");
        lineV:SetFrameLevel(120);
        lineV:SetWidth(2);
        local texV = lineV:CreateTexture(nil, "OVERLAY");
        texV:SetAllPoints(lineV);
        texV:SetTexture(0.0, 0.90, 1.0, 0.85);
        lineV.tex = texV;
        lineV:Hide();
    end
end

local function GetFrameUIRect(f)
    if ( not f or not f:IsVisible() ) then return nil; end
    local left = f:GetLeft();
    local bottom = f:GetBottom();
    local right = f:GetRight();
    local top = f:GetTop();
    if ( not left or not bottom or not right or not top ) then return nil; end
    local effScale = f:GetEffectiveScale() or 1;
    local uScale = UIParent:GetEffectiveScale() or 1;
    local ratio = effScale / uScale;
    return {
        left   = left * ratio,
        right  = right * ratio,
        bottom = bottom * ratio,
        top    = top * ratio,
        width  = (right - left) * ratio,
        height = (top - bottom) * ratio,
        midX   = (left + right) * 0.5 * ratio,
        midY   = (bottom + top) * 0.5 * ratio,
    };
end

local function CreateMoveOverlay(targetFrame, labelText, saveFunc, scaleKey, targetKey)
    if ( not targetFrame ) then return nil; end
    local overlay = CreateFrame("Button", nil, UIParent);
    overlay:SetFrameStrata("TOOLTIP");
    overlay:SetFrameLevel(100);
    overlay:SetAllPoints(targetFrame);
    overlay.targetFrame = targetFrame;
    overlay.labelText = labelText;
    overlay.scaleKey = scaleKey;
    overlay.targetKey = targetKey;
    
    overlay:SetBackdrop({
        bgFile   = "Interface\\ChatFrame\\ChatFrameBackground",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile     = true,
        tileSize = 8,
        edgeSize = 8,
        insets   = { left = 1, right = 1, top = 1, bottom = 1 }
    });
    overlay:SetBackdropColor(0.10, 0.45, 0.90, 0.40);
    overlay:SetBackdropBorderColor(0.20, 0.85, 1.00, 1.00);
    local txt = overlay:CreateFontString(nil, "OVERLAY", "GameFontHighlight");
    txt:SetFont("Fonts\\FRIZQT__.TTF", 11, "OUTLINE");
    txt:SetPoint("CENTER", overlay, "CENTER", 0, 0);
    txt:SetTextColor(1, 1, 1, 1);
    txt:SetText(labelText);
    overlay.text = txt;
    overlay:EnableMouse(true);
    overlay:RegisterForDrag("LeftButton");

    -- Corner Resize Grip (Bottom-Right) - Blue 3-Line Icon on Every Window in /bordo
    local grip = CreateFrame("Button", nil, overlay);
    grip:SetWidth(20);
    grip:SetHeight(20);
    grip:SetPoint("BOTTOMRIGHT", overlay, "BOTTOMRIGHT", -1, 1);
    grip:SetFrameLevel(overlay:GetFrameLevel() + 20);
    grip:EnableMouse(true);
    grip:EnableMouseWheel(true);
    grip:RegisterForClicks("LeftButtonUp", "RightButtonUp");
    grip.lines = {};
    for rIdx = 1, 3 do
        local line = grip:CreateTexture(nil, "OVERLAY");
        line:SetTexture("Interface\\ChatFrame\\ChatFrameBackground");
        line:SetVertexColor(0.0, 0.75, 1.0, 0.90);
        line:SetHeight(2);
        line:SetWidth(4 * rIdx + 2);
        line:SetPoint("BOTTOMRIGHT", grip, "BOTTOMRIGHT", -1, (rIdx - 1) * 4 + 1);
        table.insert(grip.lines, line);
    end
    overlay.resizeGrip = grip;

    local function ApplyWindowScale(newScale, origRect)
        local target = overlay.targetFrame;
        if ( not target or not newScale or not origRect ) then return; end

        target:SetScale(newScale);

        local newX = origRect.left / newScale;
        local newY = origRect.top / newScale;
        target:ClearAllPoints();
        target:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", math.floor(newX + 0.5), math.floor(newY + 0.5));

        if ( (target == BordoUI_MeterFrame or target == SurvivorUIMeter) and BordoUI_PartyMeterFrame ) then
            BordoUI_PartyMeterFrame:SetScale(newScale);
        end

        overlay:ClearAllPoints();
        overlay:SetAllPoints(target);
        local pct = math.floor(newScale * 100 + 0.5);
        overlay.text:SetText(string.format("%s (%d%%)", overlay.labelText, pct));
    end

    grip.StopResize = function(self)
        if ( not self.isResizing ) then return; end
        self.isResizing = false;
        overlay:SetBackdropBorderColor(0.20, 0.85, 1.00, 1.00);
        overlay.text:SetText(overlay.labelText);
        overlay:ClearAllPoints();
        overlay:SetAllPoints(overlay.targetFrame);

        BordoUIDB = BordoUIDB or {};
        if ( overlay.targetKey == "meterPos" ) then
            if ( BordoUI_SaveMeterPlace ) then BordoUI_SaveMeterPlace(); end
        elseif ( overlay.scaleKey ) then
            local curScale = overlay.targetFrame:GetScale() or 1.0;
            BordoUIDB[overlay.scaleKey] = curScale;
        end
        if ( saveFunc ) then
            saveFunc(overlay.targetFrame);
        end
        if ( PlaySound ) then PlaySound("igMainMenuOptionCheckBoxOn"); end
    end;

    grip:SetScript("OnEnter", function()
        GameTooltip:SetOwner(this, "ANCHOR_RIGHT");
        GameTooltip:ClearLines();
        GameTooltip:AddLine("|cff00ccff" .. overlay.labelText .. " Size|r", 1, 1, 1);
        local curPct = math.floor((overlay.targetFrame:GetScale() or 1.0) * 100 + 0.5);
        GameTooltip:AddLine(string.format("Current Scale: |cff55ff55%d%%|r", curPct), 0.9, 0.9, 0.9);
        GameTooltip:AddLine(" ", 1, 1, 1);
        GameTooltip:AddLine("|cffffd100Mouse Wheel:|r Scale +/- 5%", 0.8, 0.8, 0.8);
        GameTooltip:AddLine("|cffffd100Left-Click:|r Scale -10%", 0.8, 0.8, 0.8);
        GameTooltip:AddLine("|cffffd100Right-Click:|r Scale +10%", 0.8, 0.8, 0.8);
        GameTooltip:AddLine("|cffffd100Drag Corner:|r Smooth scale in place", 0.8, 0.8, 0.8);
        GameTooltip:Show();
        for i = 1, table.getn(this.lines) do
            this.lines[i]:SetVertexColor(0.25, 1.00, 0.40, 1.00);
        end
    end);

    grip:SetScript("OnLeave", function()
        GameTooltip:Hide();
        for i = 1, table.getn(this.lines) do
            this.lines[i]:SetVertexColor(0.0, 0.75, 1.0, 0.90);
        end
    end);

    grip:SetScript("OnMouseWheel", function()
        local delta = arg1;
        local target = overlay.targetFrame;
        if ( not target ) then return; end
        local curRect = GetFrameUIRect(target);
        if ( not curRect ) then return; end

        if ( overlay.targetKey == "meterPos" and (target == BordoUI_MeterFrame or target == SurvivorUIMeter) ) then
            local curLines = (BordoUIDB and BordoUIDB.meterLines) or 6;
            local newLines = math.max(3, math.min(10, curLines + delta));
            if ( BordoUI_SetMeterLines ) then BordoUI_SetMeterLines(newLines); end
            BordoUIDB = BordoUIDB or {};
            BordoUIDB.meterLines = newLines;

            target:ClearAllPoints();
            target:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", math.floor(curRect.left + 0.5), math.floor(curRect.top + 0.5));

            overlay:ClearAllPoints();
            overlay:SetAllPoints(target);
            overlay.text:SetText(string.format("Damage Meter (%d lines)", newLines));
            if ( Draw ) then Draw(); end
            if ( BordoUI_DrawPartyMeter ) then BordoUI_DrawPartyMeter(); end
            if ( BordoUI_SaveMeterPlace ) then BordoUI_SaveMeterPlace(); end
            PlaySound("igMainMenuOptionCheckBoxOn");
            return;
        end

        local curScale = target:GetScale() or 1.0;
        local step = (delta > 0) and 0.05 or -0.05;
        local newScale = math.max(0.50, math.min(1.80, math.floor((curScale + step) * 100 + 0.5) / 100));

        ApplyWindowScale(newScale, curRect);

        BordoUIDB = BordoUIDB or {};
        if ( overlay.scaleKey ) then
            BordoUIDB[overlay.scaleKey] = newScale;
        end
        if ( saveFunc ) then
            saveFunc(target);
        end
        PlaySound("igMainMenuOptionCheckBoxOn");
    end);

    grip:SetScript("OnClick", function()
        if ( this.hasDragged ) then return; end
        local target = overlay.targetFrame;
        if ( not target ) then return; end
        local curRect = GetFrameUIRect(target);
        if ( not curRect ) then return; end

        if ( overlay.targetKey == "meterPos" and (target == BordoUI_MeterFrame or target == SurvivorUIMeter) ) then
            local curLines = (BordoUIDB and BordoUIDB.meterLines) or 6;
            local lineStep = (arg1 == "RightButton") and 1 or -1;
            local newLines = math.max(3, math.min(10, curLines + lineStep));
            if ( BordoUI_SetMeterLines ) then BordoUI_SetMeterLines(newLines); end
            BordoUIDB = BordoUIDB or {};
            BordoUIDB.meterLines = newLines;

            target:ClearAllPoints();
            target:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", math.floor(curRect.left + 0.5), math.floor(curRect.top + 0.5));

            overlay:ClearAllPoints();
            overlay:SetAllPoints(target);
            overlay.text:SetText(string.format("Damage Meter (%d lines)", newLines));
            if ( Draw ) then Draw(); end
            if ( BordoUI_DrawPartyMeter ) then BordoUI_DrawPartyMeter(); end
            if ( BordoUI_SaveMeterPlace ) then BordoUI_SaveMeterPlace(); end
            PlaySound("igMainMenuOptionCheckBoxOn");
            return;
        end

        local step = (arg1 == "RightButton") and 0.10 or -0.10;
        local curScale = target:GetScale() or 1.0;
        local newScale = math.max(0.50, math.min(1.80, math.floor((curScale + step) * 100 + 0.5) / 100));

        ApplyWindowScale(newScale, curRect);

        BordoUIDB = BordoUIDB or {};
        if ( overlay.scaleKey ) then
            BordoUIDB[overlay.scaleKey] = newScale;
        end
        if ( saveFunc ) then
            saveFunc(target);
        end
        PlaySound("igMainMenuOptionCheckBoxOn");
    end);

    grip:SetScript("OnMouseDown", function()
        if ( arg1 == "LeftButton" ) then
            local uScale = UIParent:GetEffectiveScale() or 1;
            local cx, cy = GetCursorPosition();
            cx = cx / uScale;
            cy = cy / uScale;

            local curRect = GetFrameUIRect(overlay.targetFrame);
            if ( not curRect ) then return; end

            this.isResizing = true;
            this.hasDragged = false;
            this.startCursorX = cx;
            this.startCursorY = cy;
            this.origRect = curRect;
            this.origScale = overlay.targetFrame:GetScale() or 1.0;
            
            local dx = cx - curRect.left;
            local dy = curRect.top - cy;
            local dist = math.sqrt(dx * dx + dy * dy);
            this.origDist = math.max(10, dist);

            overlay:SetBackdropBorderColor(0.0, 1.0, 0.5, 1.0);
        end
    end);

    grip:SetScript("OnMouseUp", function()
        if ( this.isResizing ) then
            this:StopResize();
        end
    end);

    grip:SetScript("OnUpdate", function()
        if ( not this.isResizing ) then return; end

        local uScale = UIParent:GetEffectiveScale() or 1;
        local cx, cy = GetCursorPosition();
        cx = cx / uScale;
        cy = cy / uScale;

        local moveDist = math.abs(cx - this.startCursorX) + math.abs(cy - this.startCursorY);
        if ( moveDist > 3 ) then
            this.hasDragged = true;
        end
        if ( not this.hasDragged ) then return; end

        local target = overlay.targetFrame;
        local targetKey = overlay.targetKey;

        if ( targetKey == "meterPos" and (target == BordoUI_MeterFrame or target == SurvivorUIMeter) ) then
            local newW = math.max(160, math.min(480, this.origRect.width + (cx - this.startCursorX)));
            local newH = math.max(50, math.min(600, this.origRect.height - (cy - this.startCursorY)));
            if ( BordoUI_UpdateMeterWidth ) then
                BordoUI_UpdateMeterWidth(newW - 8);
            end
            local fitLines = math.floor((newH - 36) / 20);
            fitLines = math.max(3, math.min(10, fitLines));
            if ( BordoUI_SetMeterLines ) then
                BordoUI_SetMeterLines(fitLines);
            end
            BordoUIDB = BordoUIDB or {};
            BordoUIDB.meterWidth = newW;
            BordoUIDB.meterLines = fitLines;
            
            target:ClearAllPoints();
            target:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", math.floor(this.origRect.left + 0.5), math.floor(this.origRect.top + 0.5));
            
            overlay:ClearAllPoints();
            overlay:SetAllPoints(target);
            overlay.text:SetText(string.format("Damage Meter (%d lines)", fitLines));
            if ( Draw ) then Draw(); end
            if ( BordoUI_DrawPartyMeter ) then BordoUI_DrawPartyMeter(); end
        else
            local dx = cx - this.origRect.left;
            local dy = this.origRect.top - cy;
            local curDist = math.sqrt(dx * dx + dy * dy);
            local scaleFactor = curDist / this.origDist;
            local minS = 0.50;
            local maxS = 1.80;
            local newScale = math.max(minS, math.min(maxS, this.origScale * scaleFactor));
            newScale = math.floor(newScale * 50 + 0.5) / 50;

            ApplyWindowScale(newScale, this.origRect);
        end
    end);

    overlay.StopDrag = function(self)
        if ( self.resizeGrip and self.resizeGrip.isResizing ) then
            self.resizeGrip:StopResize();
        end
        if ( not self.isDragging ) then return; end
        self.isDragging = false;
        self.lastSnapped = false;
        if ( BordoUI_SnapLineH ) then BordoUI_SnapLineH:Hide(); end
        if ( BordoUI_SnapLineV ) then BordoUI_SnapLineV:Hide(); end
        self:SetBackdropBorderColor(0.20, 0.85, 1.00, 1.00);
        self.text:SetText(self.labelText);
        self:ClearAllPoints();
        self:SetAllPoints(self.targetFrame);
        if ( saveFunc ) then
            saveFunc(self.targetFrame);
        end
    end;

    overlay:SetScript("OnDragStart", function()
        if ( this.resizeGrip and this.resizeGrip.isResizing ) then return; end
        local cx, cy = GetCursorPosition();
        local uScale = UIParent:GetEffectiveScale() or 1;
        cx = cx / uScale;
        cy = cy / uScale;
        
        local curRect = GetFrameUIRect(this.targetFrame);
        if ( not curRect ) then return; end
        this.dragOffsetX = cx - curRect.left;
        this.dragOffsetY = cy - curRect.bottom;
        this.isDragging = true;
        this.lastSnapped = false;
        EnsureSnapLines();
    end);

    overlay:SetScript("OnDragStop", function()
        this:StopDrag();
    end);
    overlay:SetScript("OnMouseUp", function()
        if ( not arg1 or arg1 == "LeftButton" ) then
            this:StopDrag();
        end
    end);

    overlay:SetScript("OnUpdate", function()
        if ( not this.isDragging ) then return; end

        local uScale = UIParent:GetEffectiveScale() or 1;
        local cx, cy = GetCursorPosition();
        cx = cx / uScale;
        cy = cy / uScale;

        local curRect = GetFrameUIRect(this.targetFrame);
        local w = curRect and curRect.width or (this.targetFrame:GetWidth() or 100);
        local h = curRect and curRect.height or (this.targetFrame:GetHeight() or 50);

        local rawLeft = cx - this.dragOffsetX;
        local rawBottom = cy - this.dragOffsetY;

        -- True monitor width and height in UIParent coordinate points
        local screenW = UIParent:GetRight();
        if ( not screenW or screenW <= 0 ) then
            screenW = (GetScreenWidth and GetScreenWidth() / uScale) or (UIParent:GetWidth() or 1024);
        end
        local screenH = UIParent:GetTop();
        if ( not screenH or screenH <= 0 ) then
            screenH = (GetScreenHeight and GetScreenHeight() / uScale) or (UIParent:GetHeight() or 768);
        end
        if ( GetScreenWidth ) then
            local sw = GetScreenWidth() / uScale;
            if ( sw > screenW ) then screenW = sw; end
        end
        if ( GetScreenHeight ) then
            local sh = GetScreenHeight() / uScale;
            if ( sh > screenH ) then screenH = sh; end
        end

        rawLeft = math.max(0, math.min(rawLeft, screenW - w));
        rawBottom = math.max(0, math.min(rawBottom, screenH - h));

        local rawRight = rawLeft + w;
        local rawTop = rawBottom + h;
        local rawMidX = rawLeft + w * 0.5;
        local rawMidY = rawBottom + h * 0.5;

        local snapLeft = rawLeft;
        local snapBottom = rawBottom;
        local isSnappedX = false;
        local isSnappedY = false;
        local guideX = nil;
        local guideY = nil;

        if ( not IsShiftKeyDown() ) then
            local SNAP_DIST = 14;
            local bestDiffX = SNAP_DIST;
            local bestDiffY = SNAP_DIST;

            local targets = BordoUI.RegisteredTargets or {};
            for j = 1, table.getn(targets) do
                local tDef = targets[j];
                local other = tDef and tDef.frame;
                local overlayJ = BordoUI.MoveOverlays and BordoUI.MoveOverlays[j];
                local isEnabled = (not tDef) or (not tDef.windowKey) or (not BordoUI.IsWindowEnabled) or BordoUI:IsWindowEnabled(tDef.windowKey);
                if ( other and other ~= this.targetFrame and isEnabled and overlayJ and overlayJ:IsShown() ) then
                    local oR = GetFrameUIRect(overlayJ) or GetFrameUIRect(other);
                    if ( oR and oR.width > 5 and oR.height > 5 ) then
                        local yOverlap = not (rawTop < oR.bottom - 40 or rawBottom > oR.top + 40);
                        if ( yOverlap ) then
                            -- Adjacent Right (touching left edge to other right edge, 0px)
                            local d = math.abs(rawLeft - oR.right);
                            if ( d < bestDiffX ) then
                                bestDiffX = d;
                                snapLeft = oR.right;
                                guideX = oR.right;
                                isSnappedX = true;
                            end
                            -- Adjacent Right with 2px gap
                            d = math.abs(rawLeft - (oR.right + 2));
                            if ( d < bestDiffX ) then
                                bestDiffX = d;
                                snapLeft = oR.right + 2;
                                guideX = oR.right + 2;
                                isSnappedX = true;
                            end
                            -- Adjacent Left (touching right edge to other left edge, 0px)
                            d = math.abs(rawRight - oR.left);
                            if ( d < bestDiffX ) then
                                bestDiffX = d;
                                snapLeft = oR.left - w;
                                guideX = oR.left;
                                isSnappedX = true;
                            end
                            -- Adjacent Left with 2px gap
                            d = math.abs(rawRight - (oR.left - 2));
                            if ( d < bestDiffX ) then
                                bestDiffX = d;
                                snapLeft = oR.left - 2 - w;
                                guideX = oR.left - 2;
                                isSnappedX = true;
                            end
                        end

                        local yNear = not (rawTop < oR.bottom - 100 or rawBottom > oR.top + 100);
                        if ( yNear ) then
                            -- Flush Left & Flush Right
                            local dFL = math.abs(rawLeft - oR.left);
                            if ( dFL < bestDiffX ) then
                                bestDiffX = dFL;
                                snapLeft = oR.left;
                                guideX = oR.left;
                                isSnappedX = true;
                            end
                            local dFR = math.abs(rawRight - oR.right);
                            if ( dFR < bestDiffX ) then
                                bestDiffX = dFR;
                                snapLeft = oR.right - w;
                                guideX = oR.right;
                                isSnappedX = true;
                            end
                            -- Center X alignment
                            local dCX = math.abs(rawMidX - oR.midX);
                            if ( dCX < bestDiffX ) then
                                bestDiffX = dCX;
                                snapLeft = oR.midX - w * 0.5;
                                guideX = oR.midX;
                                isSnappedX = true;
                            end
                        end

                        local xOverlap = not (rawRight < oR.left - 40 or rawLeft > oR.right + 40);
                        if ( xOverlap ) then
                            -- Adjacent Top (touching bottom edge to other top edge, 0px)
                            local d = math.abs(rawBottom - oR.top);
                            if ( d < bestDiffY ) then
                                bestDiffY = d;
                                snapBottom = oR.top;
                                guideY = oR.top;
                                isSnappedY = true;
                            end
                            -- Adjacent Top with 2px gap
                            d = math.abs(rawBottom - (oR.top + 2));
                            if ( d < bestDiffY ) then
                                bestDiffY = d;
                                snapBottom = oR.top + 2;
                                guideY = oR.top + 2;
                                isSnappedY = true;
                            end
                            -- Adjacent Bottom (touching top edge to other bottom edge, 0px)
                            d = math.abs(rawTop - oR.bottom);
                            if ( d < bestDiffY ) then
                                bestDiffY = d;
                                snapBottom = oR.bottom - h;
                                guideY = oR.bottom;
                                isSnappedY = true;
                            end
                            -- Adjacent Bottom with 2px gap
                            d = math.abs(rawTop - (oR.bottom - 2));
                            if ( d < bestDiffY ) then
                                bestDiffY = d;
                                snapBottom = oR.bottom - 2 - h;
                                guideY = oR.bottom - 2;
                                isSnappedY = true;
                            end
                        end

                        local xNear = not (rawRight < oR.left - 100 or rawLeft > oR.right + 100);
                        if ( xNear ) then
                            -- Flush Bottom & Flush Top
                            local dFB = math.abs(rawBottom - oR.bottom);
                            if ( dFB < bestDiffY ) then
                                bestDiffY = dFB;
                                snapBottom = oR.bottom;
                                guideY = oR.bottom;
                                isSnappedY = true;
                            end
                            local dFT = math.abs(rawTop - oR.top);
                            if ( dFT < bestDiffY ) then
                                bestDiffY = dFT;
                                snapBottom = oR.top - h;
                                guideY = oR.top;
                                isSnappedY = true;
                            end
                            -- Center Y alignment
                            local dCY = math.abs(rawMidY - oR.midY);
                            if ( dCY < bestDiffY ) then
                                bestDiffY = dCY;
                                snapBottom = oR.midY - h * 0.5;
                                guideY = oR.midY;
                                isSnappedY = true;
                            end
                        end
                    end
                end
            end

            -- Screen Edges and Center Axes
            local dScrL0 = math.abs(rawLeft - 0);
            if ( dScrL0 < bestDiffX ) then
                bestDiffX = dScrL0;
                snapLeft = 0;
                guideX = 0;
                isSnappedX = true;
            end
            local dScrL12 = math.abs(rawLeft - 12);
            if ( dScrL12 < bestDiffX ) then
                bestDiffX = dScrL12;
                snapLeft = 12;
                guideX = 12;
                isSnappedX = true;
            end
            local dScrR0 = math.abs(rawRight - screenW);
            if ( dScrR0 < bestDiffX ) then
                bestDiffX = dScrR0;
                snapLeft = screenW - w;
                guideX = screenW;
                isSnappedX = true;
            end
            local dScrR12 = math.abs(rawRight - (screenW - 12));
            if ( dScrR12 < bestDiffX ) then
                bestDiffX = dScrR12;
                snapLeft = screenW - 12 - w;
                guideX = screenW - 12;
                isSnappedX = true;
            end
            local dScrMidX = math.abs(rawMidX - (screenW * 0.5));
            if ( dScrMidX < bestDiffX ) then
                bestDiffX = dScrMidX;
                snapLeft = (screenW - w) * 0.5;
                guideX = screenW * 0.5;
                isSnappedX = true;
            end

            local dScrB0 = math.abs(rawBottom - 0);
            if ( dScrB0 < bestDiffY ) then
                bestDiffY = dScrB0;
                snapBottom = 0;
                guideY = 0;
                isSnappedY = true;
            end
            local dScrB12 = math.abs(rawBottom - 12);
            if ( dScrB12 < bestDiffY ) then
                bestDiffY = dScrB12;
                snapBottom = 12;
                guideY = 12;
                isSnappedY = true;
            end
            local dScrB26 = math.abs(rawBottom - 26);
            if ( dScrB26 < bestDiffY ) then
                bestDiffY = dScrB26;
                snapBottom = 26;
                guideY = 26;
                isSnappedY = true;
            end
            local dScrT0 = math.abs(rawTop - screenH);
            if ( dScrT0 < bestDiffY ) then
                bestDiffY = dScrT0;
                snapBottom = screenH - h;
                guideY = screenH;
                isSnappedY = true;
            end
            local dScrT12 = math.abs(rawTop - (screenH - 12));
            if ( dScrT12 < bestDiffY ) then
                bestDiffY = dScrT12;
                snapBottom = screenH - 12 - h;
                guideY = screenH - 12;
                isSnappedY = true;
            end
            local dScrMidY = math.abs(rawMidY - (screenH * 0.5));
            if ( dScrMidY < bestDiffY ) then
                bestDiffY = dScrMidY;
                snapBottom = (screenH - h) * 0.5;
                guideY = screenH * 0.5;
                isSnappedY = true;
            end
        end

        local tEffScale = this.targetFrame:GetEffectiveScale() or 1;
        local scaleRatio = tEffScale / uScale;
        if ( scaleRatio <= 0 ) then scaleRatio = 1; end
        local finalX = snapLeft / scaleRatio;
        local finalY = snapBottom / scaleRatio;

        local origW = this.targetFrame:GetWidth();
        local origH = this.targetFrame:GetHeight();
        if ( origW and origW > 0 ) then this.targetFrame:SetWidth(origW); end
        if ( origH and origH > 0 ) then this.targetFrame:SetHeight(origH); end

        this.targetFrame:ClearAllPoints();
        this.targetFrame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", math.floor(finalX + 0.5), math.floor(finalY + 0.5));

        this:ClearAllPoints();
        this:SetAllPoints(this.targetFrame);

        if ( isSnappedX and guideX ) then
            BordoUI_SnapLineV:ClearAllPoints();
            BordoUI_SnapLineV:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", math.floor(guideX - 1 + 0.5), 0);
            BordoUI_SnapLineV:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", math.floor(guideX - 1 + 0.5), screenH);
            BordoUI_SnapLineV:Show();
        else
            if ( BordoUI_SnapLineV ) then BordoUI_SnapLineV:Hide(); end
        end

        if ( isSnappedY and guideY ) then
            BordoUI_SnapLineH:ClearAllPoints();
            BordoUI_SnapLineH:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 0, math.floor(guideY - 1 + 0.5));
            BordoUI_SnapLineH:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMLEFT", screenW, math.floor(guideY - 1 + 0.5));
            BordoUI_SnapLineH:Show();
        else
            if ( BordoUI_SnapLineH ) then BordoUI_SnapLineH:Hide(); end
        end

        local anySnapped = isSnappedX or isSnappedY;
        if ( anySnapped and not this.lastSnapped ) then
            PlaySound("igMainMenuOptionCheckBoxOn");
        end
        this.lastSnapped = anySnapped;

        if ( anySnapped ) then
            this:SetBackdropBorderColor(0.25, 1.00, 0.40, 1.00);
            this.text:SetText(this.labelText .. " |cff55ff55[SNAPPED]|r");
        else
            this:SetBackdropBorderColor(0.20, 0.85, 1.00, 1.00);
            this.text:SetText(this.labelText);
        end
    end);

    overlay:Hide();
    return overlay;
end

function BordoUI:ToggleMoveMode(enable)
    if ( enable == nil ) then
        enable = not BordoUI.moveModeActive;
    end
    BordoUI.moveModeActive = enable;
    if ( not BordoUI.controlBar ) then
        local bar = CreateFrame("Frame", "BordoUI_MoveControlBar", UIParent);
        bar:SetWidth(480);
        bar:SetHeight(38);
        bar:SetPoint("TOP", UIParent, "TOP", 0, -25);
        bar:SetFrameStrata("TOOLTIP");
        bar:SetFrameLevel(105);
        bar:SetBackdrop({
            bgFile   = "Interface\\ChatFrame\\ChatFrameBackground",
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            tile     = true,
            tileSize = 8,
            edgeSize = 8,
            insets   = { left = 2, right = 2, top = 2, bottom = 2 }
        });
        bar:SetBackdropColor(0.04, 0.04, 0.06, 0.95);
        bar:SetBackdropBorderColor(1.00, 0.82, 0.00, 1.00);

        local lockBtn = CreateFrame("Button", nil, bar);
        lockBtn:SetWidth(140);
        lockBtn:SetHeight(22);
        lockBtn:SetPoint("LEFT", bar, "LEFT", 8, 0);
        lockBtn:SetBackdrop({
            bgFile   = "Interface\\ChatFrame\\ChatFrameBackground",
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            edgeSize = 6,
        });
        lockBtn:SetBackdropColor(0.12, 0.35, 0.15, 0.90);
        lockBtn:SetBackdropBorderColor(0.30, 0.95, 0.30, 0.90);
        local lTxt = lockBtn:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall");
        lTxt:SetPoint("CENTER", lockBtn, "CENTER", 0, 0);
        lTxt:SetText("Lock All Windows");
        lockBtn:SetScript("OnClick", function()
            BordoUI:ToggleMoveMode(false);
            BordoUI:SetLocked(true);
        end);

        local snapInfo = bar:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall");
        snapInfo:SetPoint("CENTER", bar, "CENTER", 0, 0);
        snapInfo:SetText("|cff55ff55Magnet Snap: ON|r\n|cffaaaaaa(Shift = Free Drag)|r");

        local resetBtn = CreateFrame("Button", nil, bar);
        resetBtn:SetWidth(140);
        resetBtn:SetHeight(22);
        resetBtn:SetPoint("RIGHT", bar, "RIGHT", -8, 0);
        resetBtn:SetBackdrop({
            bgFile   = "Interface\\ChatFrame\\ChatFrameBackground",
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            edgeSize = 6,
        });
        resetBtn:SetBackdropColor(0.35, 0.15, 0.15, 0.90);
        resetBtn:SetBackdropBorderColor(0.95, 0.30, 0.30, 0.90);
        local rTxt = resetBtn:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall");
        rTxt:SetPoint("CENTER", resetBtn, "CENTER", 0, 0);
        rTxt:SetText("Reset Default Layout");
        resetBtn:SetScript("OnClick", function()
            BordoUI:ResetToDefaultLayout();
        end);
        BordoUI.controlBar = bar;
    end

    local targets = {
        { frame = SurvivorUIRow, name = "Combat HUD (Drag Me)", key = "hudPos", scaleKey = "hudScale", windowKey = "hud" },
        { frame = BordoUI_StatsWindowFrame, name = "Stats Window (Drag Me)", key = "statsPos", scaleKey = "statsScale", windowKey = "stats" },
        { frame = BordoUI_BossTrackerFrame or AZSHelper_BossSchedulePanel, name = "Boss Tracker (Drag Me)", key = "bossTrackerPos", scaleKey = "bossTrackerScale", windowKey = "boss" },
        { frame = SurvivorUIBuild, name = "Build & Jewelry (Drag Me)", key = "buildPos", scaleKey = "buildScale", windowKey = "build" },
        { frame = SurvivorUIParty, name = "Party Frames (Drag Me)", key = "partyPos", scaleKey = "partyScale", windowKey = "party" },
        { frame = AZSHelper_TallyFrame, name = "Kills & Gold (Drag Me)", key = "tallyPos", scaleKey = "tallyScale", windowKey = "kills" },
        { frame = BordoUI_MinimapDock, name = "Minimap Action Buttons (Drag Me)", key = "minimapDockPos", scaleKey = "minimapDockScale", windowKey = "dock" },
        { frame = BordoUI_MeterFrame or SurvivorUIMeter, name = "Damage Meter (Drag Me)", key = "meterPos", scaleKey = "meterScale", windowKey = "meter" },
        { frame = BordoUI_PartyMeterFrame or SurvivorUIPartyMeter, name = "Party Damage Meter (Drag Me)", key = "partyMeterPos", scaleKey = "partyMeterScale", windowKey = "partymeter" },
		{ frame = BordoUI_TooltipAnchor, name = "Mob Tooltip (Drag Me)", key = "tooltipPos", scaleKey = "tooltipScale", windowKey = "tooltip" },
		{ frame = BordoUI_LootAlertFrame, name = "Boss Loot Alert (Drag Me)", key = "lootAlertPos", scaleKey = "lootAlertScale", windowKey = "loot" },
		{ frame = BordoUI_ProcTrackerFrame, name = "Procs & Buffs HUD (Drag Me)", key = "procTrackerPos", scaleKey = "procTrackerScale", windowKey = "procs" },
        { frame = AZSHelper_BossEncounterContainer, name = "Boss HP Bars (Drag Me)", key = "encounterBarsPos", scaleKey = "encounterBarsScale", windowKey = "bossbar" },
        { frame = BordoUI_ChoiceAdvisorHUD, name = "Custom Build HUD (Drag Me)", key = "choiceAdvisorPos", scaleKey = "choiceAdvisorScale", windowKey = "guide" },
        { frame = BordoUI_ChatBox or ChatFrame1, name = "Chat Window (Drag Me)", key = "chatPos", scaleKey = "chatScale", windowKey = "chat" },
        { frame = BordoUI_HighestCritFrame, name = "Crit Banner (Drag Me)", key = "highestCritPos", scaleKey = "highestCritScale", windowKey = "crit" },
        { frame = AZSHelper_StatsTableFrame, name = "Stats Table (Drag Me)", key = "statsTablePos", scaleKey = "statsTableScale", windowKey = "table" },
    };
    BordoUI.RegisteredTargets = targets;

    for i = 1, table.getn(targets) do
        local t = targets[i];
        if ( t.frame ) then
            if ( not BordoUI.MoveOverlays[i] ) then
                local saveKey = t.key;
                BordoUI.MoveOverlays[i] = CreateMoveOverlay(t.frame, t.name, function(f)
                    local pt, _, relPt, x, y = f:GetPoint();
                    BordoUIDB = BordoUIDB or {};
                    if ( saveKey == "hudPos" ) then
                        local pos = { point = pt, relativePoint = relPt or pt, x = math.floor(x + 0.5), y = math.floor(y + 0.5) };
                        BordoUIDB.hudPos = pos;
                        BordoUIDB.centerHudPos = pos;
                        AZSHelperDB = AZSHelperDB or {};
                        AZSHelperDB.rowPos = pos;
                        AZSHelperDB.centerHudPos = pos;
                        f:ClearAllPoints();
                        f:SetPoint(pos.point, UIParent, pos.relativePoint, pos.x, pos.y);
                    elseif ( saveKey == "meterPos" ) then
                        if ( BordoUI_SaveMeterPlace ) then
                            BordoUI_SaveMeterPlace();
                        else
                            local pos = { point = pt, relativePoint = relPt or pt, x = math.floor(x + 0.5), y = math.floor(y + 0.5), isCustom = true };
                            BordoUIDB.meterPos = pos;
                            BordoUIDB.meterIsCustom = true;
                            BordoUIDB.meterRight = math.floor(f:GetRight() + 0.5);
                            BordoUIDB.meterBottom = math.floor(f:GetBottom() + 0.5);
                        end
                    elseif ( saveKey == "partyMeterPos" ) then
                        if ( BordoUI_SavePartyMeterPlace ) then
                            BordoUI_SavePartyMeterPlace();
                        else
                            local pos = { point = pt, relativePoint = relPt or pt, x = math.floor(x + 0.5), y = math.floor(y + 0.5), isCustom = true };
                            BordoUIDB.partyMeterPos = pos;
                            BordoUIDB.partyMeterIsCustom = true;
                        end
                    elseif ( saveKey == "buildPos" ) then
                        local pos = { point = pt, relativePoint = relPt or pt, x = math.floor(x + 0.5), y = math.floor(y + 0.5) };
                        BordoUIDB.buildPos = pos;
                        BordoUIDB.buildLeft = math.floor(f:GetLeft() + 0.5);
                        BordoUIDB.buildTop = math.floor(f:GetTop() + 0.5);
                        f:ClearAllPoints();
                        f:SetPoint(pos.point, UIParent, pos.relativePoint, pos.x, pos.y);
                    elseif ( saveKey == "chatPos" ) then
                        local pos = { point = pt, relativePoint = relPt or pt, x = math.floor(x + 0.5), y = math.floor(y + 0.5) };
                        BordoUIDB.chatPos = pos;
                        f:ClearAllPoints();
                        f:SetPoint(pos.point, UIParent, pos.relativePoint, pos.x, pos.y);
                        if ( AZSHelper and AZSHelper.DockAllChatFrames ) then AZSHelper:DockAllChatFrames(); end
                    else
                        BordoUIDB[saveKey] = { point = pt, relativePoint = relPt, x = x, y = y };
                    end
                end, t.scaleKey, t.key);
            end
            BordoUI.MoveOverlays[i].targetFrame = t.frame;
            local isEnabled = (not t.windowKey) or (not BordoUI.IsWindowEnabled) or BordoUI:IsWindowEnabled(t.windowKey);
            if ( enable and isEnabled ) then
                BordoUI.MoveOverlays[i]:ClearAllPoints();
                BordoUI.MoveOverlays[i]:SetAllPoints(t.frame);
                BordoUI.MoveOverlays[i]:Show();
            else
                if ( BordoUI.MoveOverlays[i].resizeGrip and BordoUI.MoveOverlays[i].resizeGrip.StopResize ) then
                    BordoUI.MoveOverlays[i].resizeGrip:StopResize();
                end
                if ( BordoUI.MoveOverlays[i].StopDrag ) then
                    BordoUI.MoveOverlays[i]:StopDrag();
                end
                BordoUI.MoveOverlays[i]:Hide();
            end
        end
    end
    if ( enable ) then
        if ( BordoUI.ApplyAllWindowScales ) then BordoUI:ApplyAllWindowScales(); end
        BordoUI.controlBar:Show();
        BordoUIDB.locked = false;
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ccffBordo UI|r: Move Mode |cff55ff55[ACTIVE]|r with Magnetic Snapping. Drag any colored box to reposition. Windows snap to edges & axes (hold |cffffd100Shift|r for free drag). Click |cffffd100[Lock All Windows]|r or type |cffffd100/lock|r when done.");
    else
        BordoUI.controlBar:Hide();
        BordoUIDB.locked = true;
        if ( BordoUI_SnapLineH ) then BordoUI_SnapLineH:Hide(); end
        if ( BordoUI_SnapLineV ) then BordoUI_SnapLineV:Hide(); end
        if ( AZSHelper and AZSHelper.DockAllChatFrames ) then AZSHelper:DockAllChatFrames(); end
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ccffBordo UI|r: Move Mode |cffff3333[OFF]|r. All window positions saved.");
    end
    if ( BordoUI.UpdateSCTAnchorVisibility ) then
        BordoUI:UpdateSCTAnchorVisibility();
    end
    if ( BordoUI.UpdateAllLockButtons ) then
        BordoUI:UpdateAllLockButtons();
    end
    if ( BordoUI_UpdateMeterResizeGrip ) then
        BordoUI_UpdateMeterResizeGrip();
    end
    if ( BordoUI_DrawPartyMeter ) then
        BordoUI_DrawPartyMeter();
    end
end

function BordoUI:UpdateMoveOverlaysVisibility()
    if ( not BordoUI.moveModeActive or not BordoUI.RegisteredTargets or not BordoUI.MoveOverlays ) then
        return;
    end
    for i = 1, table.getn(BordoUI.RegisteredTargets) do
        local t = BordoUI.RegisteredTargets[i];
        local ov = BordoUI.MoveOverlays[i];
        if ( t and t.frame and ov ) then
            local isEnabled = (not t.windowKey) or (not BordoUI.IsWindowEnabled) or BordoUI:IsWindowEnabled(t.windowKey);
            if ( isEnabled ) then
                ov:ClearAllPoints();
                ov:SetAllPoints(t.frame);
                ov:Show();
            else
                if ( ov.resizeGrip and ov.resizeGrip.StopResize ) then
                    ov.resizeGrip:StopResize();
                end
                if ( ov.StopDrag ) then
                    ov:StopDrag();
                end
                ov:Hide();
            end
        end
    end
end

function BordoUI:ApplyAllWindowScales()
    if not BordoUIDB then return; end
    local targets = {
        { frame = SurvivorUIRow, scaleKey = "hudScale", def = 1.0 },
        { frame = BordoUI_StatsWindowFrame, scaleKey = "statsScale", def = 1.0 },
        { frame = BordoUI_BossTrackerFrame or AZSHelper_BossSchedulePanel, scaleKey = "bossTrackerScale", def = 1.0 },
        { frame = SurvivorUIBuild, scaleKey = "buildScale", def = 1.0 },
        { frame = SurvivorUIParty, scaleKey = "partyScale", def = 1.0 },
        { frame = AZSHelper_TallyFrame, scaleKey = "tallyScale", def = 1.0 },
        { frame = BordoUI_MinimapDock, scaleKey = "minimapDockScale", def = 1.0 },
        { frame = BordoUI_MeterFrame or SurvivorUIMeter, scaleKey = "meterScale", def = 1.0 },
        { frame = BordoUI_PartyMeterFrame or SurvivorUIPartyMeter, scaleKey = "partyMeterScale", def = 1.0 },
        { frame = BordoUI_TooltipAnchor, scaleKey = "tooltipScale", def = 1.0 },
        { frame = BordoUI_LootAlertFrame, scaleKey = "lootAlertScale", def = 1.0 },
        { frame = BordoUI_ProcTrackerFrame, scaleKey = "procTrackerScale", def = 1.0 },
        { frame = AZSHelper_BossEncounterContainer, scaleKey = "encounterBarsScale", def = 1.0 },
        { frame = BordoUI_ChoiceAdvisorHUD, scaleKey = "choiceAdvisorScale", def = 1.0 },
        { frame = BordoUI_ChatBox or ChatFrame1, scaleKey = "chatScale", def = 1.0 },
        { frame = BordoUI_HighestCritFrame, scaleKey = "highestCritScale", def = 1.0 },
        { frame = AZSHelper_StatsTableFrame, scaleKey = "statsTableScale", def = 0.80 },
    };
    for i = 1, table.getn(targets) do
        local t = targets[i];
        if ( t.frame ) then
            local s = (t.scaleKey and BordoUIDB[t.scaleKey]) or t.def or 1.0;
            s = tonumber(s) or 1.0;
            if ( s >= 0.50 and s <= 2.00 ) then
                t.frame:SetScale(s);
            end
        end
    end
end

function BordoUI:ResetToDefaultLayout()
    local defaultHudPos = { point = "CENTER", relativePoint = "CENTER", x = 0, y = -170 };
    BordoUIDB = BordoUIDB or {};
    BordoUIDB.hudPos = defaultHudPos;
    BordoUIDB.centerHudPos = defaultHudPos;
    BordoUIDB.statsPos = { point = "TOPLEFT", relativePoint = "TOPLEFT", x = 12, y = -14 };
    BordoUIDB.bossTrackerPos = { point = "TOPRIGHT", relativePoint = "TOPRIGHT", x = -12, y = -160 };
    BordoUIDB.buildLeft = nil;
    BordoUIDB.buildTop = nil;
    BordoUIDB.buildPos = nil;
    BordoUIDB.partyLeft = nil;
    BordoUIDB.partyBottom = nil;
    BordoUIDB.partyPos = nil;
    BordoUIDB.bottomBarPos = nil;
    BordoUIDB.tallyPos = nil;
    BordoUIDB.microDockPos = nil;
    BordoUIDB.tooltipPos = nil;
    BordoUIDB.lootAlertPos = { point = "TOP", relativePoint = "TOP", x = 0, y = -175 };
    BordoUIDB.multPanelPos = nil;
    BordoUIDB.nameplatesFramePos = nil;
    BordoUIDB.encounterBarsPos = { point = "TOP", relativePoint = "TOP", x = 0, y = -132 };
    BordoUIDB.choiceAdvisorPos = { point = "TOP", relativePoint = "TOP", x = 0, y = -4 };
    BordoUIDB.chatPos = { point = "BOTTOMLEFT", relativePoint = "BOTTOMLEFT", x = 14, y = 26 };
    BordoUIDB.buildPos = nil;
    BordoUIDB.buildLeft = nil;
    BordoUIDB.buildTop = nil;
    BordoUIDB.meterPos = nil;
    BordoUIDB.meterIsCustom = nil;
    BordoUIDB.meterWidth = nil;
    BordoUIDB.meterLines = nil;
    BordoUIDB.meterRight = nil;
    BordoUIDB.meterBottom = nil;
    BordoUIDB.meterScale = nil;
    BordoUIDB.partyMeterPos = nil;
    BordoUIDB.partyMeterIsCustom = nil;
    BordoUIDB.partyMeterScale = nil;
    BordoUIDB.hudScale = nil;
    BordoUIDB.statsScale = nil;
    BordoUIDB.bossTrackerScale = nil;
    BordoUIDB.buildScale = nil;
    BordoUIDB.partyScale = nil;
    BordoUIDB.tallyScale = nil;
    BordoUIDB.minimapDockScale = nil;
    BordoUIDB.tooltipScale = nil;
    BordoUIDB.lootAlertScale = nil;
    BordoUIDB.procTrackerScale = nil;
    BordoUIDB.encounterBarsScale = nil;
    BordoUIDB.choiceAdvisorScale = nil;
    BordoUIDB.chatScale = nil;
    BordoUIDB.highestCritScale = nil;
    BordoUIDB.statsTableScale = nil;
    if ( BordoUI.ApplyAllWindowScales ) then
        BordoUI:ApplyAllWindowScales();
    end
    BordoUIDB.sctOutgoingPos = nil;
    BordoUIDB.sctIncomingPos = nil;
    if ( BordoUI_SCT_OutgoingAnchor ) then
        BordoUI_SCT_OutgoingAnchor:ClearAllPoints();
        BordoUI_SCT_OutgoingAnchor:SetPoint("CENTER", UIParent, "CENTER", 145, 20);
    end
    if ( BordoUI_SCT_IncomingAnchor ) then
        BordoUI_SCT_IncomingAnchor:ClearAllPoints();
        BordoUI_SCT_IncomingAnchor:SetPoint("CENTER", UIParent, "CENTER", -145, 20);
    end
    if ( BordoUI.UpdateSCTAnchorVisibility ) then
        BordoUI:UpdateSCTAnchorVisibility();
    end
    if ( AZSHelperDB ) then
        AZSHelperDB.rowPos = defaultHudPos;
        AZSHelperDB.centerHudPos = defaultHudPos;
        AZSHelperDB.bottomBarPos = nil;
        AZSHelperDB.tallyPos = nil;
        AZSHelperDB.microDockPos = nil;
        AZSHelperDB.tooltipPos = nil;
    end
	if ( BordoUI_TooltipAnchor ) then
		BordoUI_TooltipAnchor:ClearAllPoints();
		BordoUI_TooltipAnchor:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -12, 26);
	end
    if ( BordoUI_ResetThemeUI ) then BordoUI_ResetThemeUI(); end
    if ( StatsUI and StatsUI.ResetPosition ) then StatsUI:ResetPosition(); end
    if ( TrackerUI and TrackerUI.ResetPosition ) then TrackerUI:ResetPosition(); end
    if ( BordoUI_ResetBuildPosition ) then BordoUI_ResetBuildPosition(); end
    if ( BordoUI_ResetMeterPosition ) then BordoUI_ResetMeterPosition(); end
    if ( BordoUI_ResetPartyMeterPosition ) then BordoUI_ResetPartyMeterPosition(); end
    if ( BordoUI_ResetPartyPosition ) then BordoUI_ResetPartyPosition(); end
    if ( BordoUI_ChatBox ) then
        BordoUI_ChatBox:ClearAllPoints();
        BordoUI_ChatBox:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 14, 26);
        if ( AZSHelper and AZSHelper.DockAllChatFrames ) then AZSHelper:DockAllChatFrames(); end
    end
    if ( AZSHelper_BossEncounterContainer ) then
        AZSHelper_BossEncounterContainer:ClearAllPoints();
        if ( BordoUI_ChoiceAdvisorHUD ) then
            AZSHelper_BossEncounterContainer:SetPoint("TOP", BordoUI_ChoiceAdvisorHUD, "BOTTOM", 0, -4);
        else
            AZSHelper_BossEncounterContainer:SetPoint("TOP", UIParent, "TOP", 0, -132);
        end
    end
    if ( BordoUI_ChoiceAdvisorHUD ) then
        BordoUI_ChoiceAdvisorHUD:ClearAllPoints();
        BordoUI_ChoiceAdvisorHUD:SetPoint("TOP", UIParent, "TOP", 0, -4);
    end
	if ( BordoUI_LootAlertFrame ) then
		BordoUI_LootAlertFrame:ClearAllPoints();
		BordoUI_LootAlertFrame:SetPoint("TOP", UIParent, "TOP", 0, -175);
	end

    if ( Minimap ) then
        Minimap:ClearAllPoints();
        Minimap:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -12, -12);
    end
    if ( BordoUI.moveModeActive ) then
        BordoUI:ToggleMoveMode(true);
    end
    DEFAULT_CHAT_FRAME:AddMessage("|cff00ccffBordo UI|r: All UI windows reset to standard layout matching reference screenshot!");
end

SLASH_BORDOUISTATSFILTER1 = "/statsfilter";
SlashCmdList["BORDOUISTATSFILTER"] = function()
    if BordoUI_ToggleStatsConfig then
        BordoUI_ToggleStatsConfig();
    elseif BordoUI and BordoUI.ToggleStatsConfig then
        BordoUI:ToggleStatsConfig();
    end
end;
