if not game:IsLoaded() then
    game.Loaded:Wait()
end

pcall(function()
    if getconnections then
        for _,v in pairs(getconnections(game:GetService('ScriptContext').Error)) do
            v:Disable();
        end
    end
end)

loadstring([[
    function LPH_NO_VIRTUALIZE(f) return f end;
]])();

loadstring([[
    function LPH_ENCSTR(f) return f end;
]])();

loadstring([[
    LPH_OBFUSCATED = false;
]])();

pcall(loadstring([[if not HXD_HWID then HXD_HWID="STUB_HWID" HXD_DISCORD_ID="123456789" HXD_EXPIRES_AT=os.time()+2592000 HXD_STATUS="active" HXD_EXECUTION_COUNT=1 HXD_SECONDS_LEFT=2592000 HXD_UserNote="beta" end]]));
pcall(loadstring([[if not HXD_SANITIZE then function HXD_SANITIZE(value,pattern)if not value or not pattern then return""end;value=tostring(value)local charset=pattern:match("%[(.-)%]")if not charset then return""end;local _,max=pattern:match("{%s*(%d+)%s*,%s*(%d+)%s*}")local max_len=tonumber(max)or#value;local extra_chars="→←↑↓★☆"charset=charset:gsub("%]","%%]")value=value:gsub("[^"..charset..extra_chars.."]","")return value:sub(1,max_len)end end]]));
pcall(loadstring([[if not HXD_SEND_WEBHOOK then function HXD_SEND_WEBHOOK(url,data)local req=http_request or request or syn.request;if not req then warn("[STUB] Webhook:",url)return true end;local HttpService=game:GetService("HttpService")local headers={["Content-Type"]="application/json"}local body=HttpService:JSONEncode(data)local response=req({Url=url,Method="POST",Headers=headers,Body=body})return response end end]]));

local Required = {
	"hookfunction",
	"getconnections",
	"hookmetamethod",
	"bit32",
	"getgenv",
	"setmetatable",
    "clonefunction",
    "cloneref",
    "getconnections",
    "fireclickdetector",
    "checkcaller"
}

local Kick = clonefunction and clonefunction(game:GetService("Players").LocalPlayer.Kick) or game:GetService("Players").LocalPlayer.Kick
for i = 1, #Required do
	local v = Required[i]
	if not getgenv()[v] then
        Kick(game:GetService("Players").LocalPlayer, `Your executor does not support [{v}], which is required to use Xeron.sol @ Rogue Lineage Battlegrounds.`)
	end
end

local function process_string(str, salt)
    salt = salt or 27
    if not bit32 or not bit32.bxor then
        warn("bit32.bxor not available")
        return str
    end
    local chars = {}
    for i = 1, #str do
        local char = string.byte(str, i)
        local processedChar = bit32.bxor(char, salt + (i % 7))
        chars[i] = string.char(processedChar)
    end
    return table.concat(chars)
end

local function encode(str, salt) return process_string(str, salt) end
local function decode(str, salt) return process_string(str, salt) end

local function generate_key()
    local p = game.PlaceId
    local j = game.JobId
    local u = game:GetService("Players").LocalPlayer.UserId
    return encode(p.."_"..j:sub(1,5).."_"..tostring(u):sub(-4))
end

local key = generate_key()
if game.PlaceId == 100010170789226 then
    if getgenv()[key] and type(getgenv()[key]) == "table" then return end
    getgenv()[key] = setmetatable({}, { __tostring = function() return "nil" end })

    local success, err = xpcall(function()
        
    do -- Adonis Anti-Cheat Bypass
 
        LPH_NO_VIRTUALIZE(function()
            if game and not game:IsLoaded() then
                repeat wait() until game:IsLoaded()
            end

            local old_identity = getthreadidentity()

            setthreadidentity(2) -- prevents "Adonis_0x16471" kick

            task.spawn(function()
                local patched = 0

                for _, func in ipairs(getgc(true)) do
                    if typeof(func) == "function" and islclosure(func) then
                        local ok, consts = pcall(debug.getconstants, func)
                        if ok and consts and #consts <= 2 then
                            for i, c in ipairs(consts) do
                                if tostring(c):lower():find("script") == nil and tostring(c):lower():find("rbx") == nil then
                                    local src = debug.info(func, "s") or ""
                                    if src:find("Anti") or src:lower():find("core") then
                                        hookfunction(func, function(...)
                                            warn("dont crash my nigga")
                                            return
                                        end)
                                        patched += 1
                                    end
                                end
                            end
                        end
                    end
                end
                warn("crash loop patch complete:", patched)
            end)

            task.defer(function()
                for _, v in getgc(true) do
                    if typeof(v) == "table" and rawget(v, "Kill") and typeof(v.Kill) == "function" then
                        hookfunction(v.Kill, function(...)
                            warn("kill() blocked imagine")
                            return
                        end)
                    end
                end
            end)

            local old_debug_info = debug.info
            hookfunction(debug.info, newcclosure(function(func, what)
                if typeof(func) == "function" and debug.info(func, "s") and debug.info(func, "s"):find("Core.Anti") then
                    if what == "n" then return "Detected" end
                    if what == "f" then return func end
                    if what == "s" then return debug.info(func, "s") end
                    if what == "l" then return debug.info(func, "l") end
                    if what == "a" then return debug.info(func, "a") end
                end
                return old_debug_info(func, what)
            end))

            setthreadidentity(old_identity) -- restore the old identity
        end)()
    end

    local start = os.clock()
    do
        makefolder("Xeron")
        makefolder("Xeron\\configs")
    end

    local cloneref = (cloneref or clonereference or function(instance: any)
        return instance
    end)

    -- Services
    local cas  = cloneref(game:GetService("ContextActionService"))
    local vim  = cloneref(game:GetService("VirtualInputManager"))
    local mem  = cloneref(game:GetService("MemStorageService"))
    local rps  = cloneref(game:GetService("ReplicatedStorage"))
    local cs   = cloneref(game:GetService("CollectionService"))
    local uis  = cloneref(game:GetService("UserInputService"))
    local tps  = cloneref(game:GetService("TeleportService"))
    local txt  = cloneref(game:GetService("TextChatService"))
    local ts   = cloneref(game:GetService("TweenService"))
    local vs   = cloneref(game:GetService("VirtualUser"))
    local sui  = cloneref(game:GetService("StarterGui"))
    local httt = cloneref(game:GetService("HttpService"))
    local rs   = cloneref(game:GetService("RunService"))
    local gui  = cloneref(game:GetService("GuiService"))
    local lit  = cloneref(game:GetService("Lighting"))
    local plrs = cloneref(game:GetService("Players"))
    local ws   = cloneref(game:GetService("Workspace"))
    local deb  = cloneref(game:GetService("Debris"))
    local cg   = cloneref(game:GetService("CoreGui"))

    -- Local
    local plr = plrs.LocalPlayer
    local mouse = cloneref(plr:GetMouse())

    -- Alias
    local FindFirstChild = game.FindFirstChild
    local WaitForChild = game.WaitForChild
    local FindFirstChildWhichIsA = game.FindFirstChildWhichIsA
    local FindFirstChildOfClass = game.FindFirstChildOfClass

    local persisted_config_name = nil
    if mem and mem:HasItem("loaded_config") then
        persisted_config_name = mem:GetItem("loaded_config")
    end
    
    local ui = tostring(identifyexecutor()) == "Volt" and cg or (gethui and gethui() or cg)
    local flagged_chats = {'clipped','exploiter','banned','blacklisted','clip','hacker'}
    local hidden_folder = Instance.new("Folder", ui)
    local area_markers = ws:WaitForChild("AreaMarkers")

    local get_mouse_remote = rps:WaitForChild("Networking").Requests.GetMouse
    local dialogue_remote = rps:WaitForChild("Networking").Requests.Dialogue


    local join_server -- fill this

    local live_folder = ws:WaitForChild("Live")
    local headers = {["content-type"] = "application/json"}

    local teleport_failed = false
    local teleport_fail_reason = ""
    tps.TeleportInitFailed:Connect(function(player, teleportResult, errorMessage)
        teleport_failed = true
        teleport_fail_reason = errorMessage or "Unknown error"
        warn(string.format("[TELEPORT FAILED] %s - Retrying serverhop...", teleport_fail_reason))
    end)

    local is_gaia = game.PlaceId == 100010170789226;
    local is_khei = game.PlaceId == 3541987450 or game.PlaceId == 14341521240;

    local updatePlayerLabel, getPlayerColor
    local last_area_restore = nil
    local ingredient_folder = nil
    local was_noclip_enabled = false
    local mana_overlay = {}
    local transparent_parts = {}
    local original_names = {}
    local original_days = {}
    local original_materials = {}
    local old_remote = nil
    local old_hastag = nil
    local old_newindex = nil
    local old_find_first_child = nil
    local watched_guis = {}
    local hooked_connections = {}
    local playerLabels = {}

    local proximity_gui
    local proximity_label
    local proximity_connection

    local streamer_connections = {}
    local ragoozer_frame = nil
    local disabled_connections = {}

    local done = false
    local busy = false

    -- Global Tables
    local game_client = {}
    local library = {}
    local utility = {}
    local shared = {
        is_unloading = false,
        drawing_containers = {
            menu = {},
            notification = {},
            esp = {},
            status = {},
        },
        connections = {},
        hidden_connections = {},
        blatant_features = {"flight", "better_flight", "no_fall", "no_killbrick", "auto_bag", "NoStun", "PerfloraTeleport", "parry_ignore_visibility", "forcefield", "anti_globus", "fling", "loop_orderly", "start_path", "test_path", "enable_aa_bypass"},
        blatant_toggles = {},
        -- pointers table removed - now using Library.Options and Library.Toggles
        theme = {
            inline = Color3.fromRGB(3, 3, 3),
            dark = Color3.fromRGB(24, 24, 24),
            text = Color3.fromRGB(155, 155, 155),
            section = Color3.fromRGB(60, 60, 60),
            accent = Color3.fromRGB(255,0,0),
        },
        accents = {},
        moveKeys = {
            ["Movement"] = {
                ["Up"] = "Up",
                ["Down"] = "Down"
            },
            ["Action"] = {
                ["Left"] = "Left",
                ["Right"] = "Right"
            }
        },
        allowedKeyCodes = {"Q","W","E","R","T","Y","U","I","O","P","A","S","D","F","G","H","J","K","L","Z","X","C","V","B","N","M","One","Two","Three","Four","Five","Six","Seven","Eight","Nine","Zero","F1","F2","F3","F4","F5","F6","F7","F8","F9","F10","F11","F12","KeypadOne","KeypadTwo","KeypadThree","KeypadFour","KeypadFive","KeypadSix","KeypadSeven","KeypadEight","KeypadNine","KeypadZero","KeypadPeriod","KeypadDivide","KeypadMultiply","KeypadMinus","KeypadPlus","KeypadEnter","Insert","Tab","Home","End","LeftAlt","LeftControl","LeftShift","RightAlt","RightControl","RightShift","CapsLock","Return","Up","Down","Left","Right"},
        allowedInputTypes = {"MouseButton1","MouseButton2","MouseButton3"},
        shortenedInputs = {
            -- Control Keys
            ["LeftControl"] = 'left control',
            ["RightControl"] = 'right control',
            ["LeftShift"] = 'left shift',
            ["RightShift"] = 'right shift',

            -- Numberbar
            ["Backquote"] = "grave",
            ["Tilde"] = "~",
            ["At"] = "@",
            ["Hash"] = "#",
            ["Dollar"] = "$",
            ["Percent"] = "%",
            ["Caret"] = "^",
            ["Ampersand"] = "&",
            ["Asterisk"] = "*",
            ["LeftParenthesis"] = "(",
            ["RightParenthesis"] = ")",

            ["Underscore"] = '_',
            ["Minus"] = '-',
            ["Plus"] = '+',
            ["Period"] = '.',
            ["Slash"] = '/',
            ["BackSlash"] = '\\',
            ["Question"] = '?',

            -- Super
            ["PageUp"] = "pgup",
            ["PageDown"] = "pgdwn",

            -- Keyboard
            ["Comma"] = ",",
            ["Period"] = ".",
            ["Semicolon"] = ",",
            ["Colon"] = ":",
            ["GreaterThan"] = ">",
            ["LessThan"] = "<",
            ["LeftBracket"] = "[",
            ["RightBracket"] = "]",
            ["LeftCurly"] = "{",
            ["RightCurly"] = "}",
            ["Pipe"] = "|",

            -- Numberpad
            ["NumLock"] = "num lock",
            ["KeypadNine"] = "num 9",
            ["KeypadEight"] = "num 8",
            ["KeypadSeven"] = "num 7",
            ["KeypadSix"] = "num 6",
            ["KeypadFive"] = "num 5",
            ["KeypadFour"] = "num 4",
            ["KeypadThree"] = "num 3",
            ["KeypadTwo"] = "num 2",
            ["KeypadOne"] = "num 1",
            ["KeypadZero"] = "num 0",

            ["KeypadMultiply"] = "num multiply",
            ["KeypadDivide"] = "num divide",
            ["KeypadPeriod"] = "num decimal",
            ["KeypadPlus"] = "num plus",
            ["KeypadMinus"] = "num sub",
            ["KeypadEnter"] = "num enter",
            ["KeypadEquals"] = "num equals",

            -- Mouse
            ["MouseButton1"] = 'mouse1',
            ["MouseButton2"] = 'mouse2',
            ["MouseButton3"] = 'mouse3',
        },
        colors = {Color3.fromRGB(255, 0, 0), Color3.fromRGB(255, 100, 0), Color3.fromRGB(255, 200, 0), Color3.fromRGB(210, 255, 0), Color3.fromRGB(110, 255, 0), Color3.fromRGB(10, 255, 0), Color3.fromRGB(0, 255, 90), Color3.fromRGB(0, 255, 190), Color3.fromRGB(0, 220, 255), Color3.fromRGB(0, 120, 255), Color3.fromRGB(0, 20, 255), Color3.fromRGB(80, 0, 255), Color3.fromRGB(180, 0, 255), Color3.fromRGB(255, 0, 230), Color3.fromRGB(255, 0, 130), Color3.fromRGB(255, 255, 255), Color3.fromRGB(0, 0, 0)},
        windowActive = true,
        notifications = {},
    }
    local cheat_client = {
        config = {
            perflora_teleport = false, -- Combat Chunk
            auto_misogi = false,
            anti_backfire_viribus = false,
            hold_block = false,
            hold_block_delay = 0,
            no_stun = false,
            anti_confusion = false,

            auto_perfect_block = false,
            parry_viribus = false,
            parry_owlslash = false,
            parry_shadowrush = false,
            parry_verdien = false,
            parry_grapple = false,

            parry_ping_adjust = true,
            parry_custom_delay = false,
            custom_delay = 0,
            parry_fov_angle = 180,
            parry_disable_when_unfocused = true,
            parry_ignore_visibility = false,
            parry_semi_blatant_block = false,

            silent_aim = false,
            fov = 80,
            aimbot_hitboxes = 1,
            ignore_blocking = false,
            hide_fov_circle = false,
        }
    }

    -- Minimal UI wiring for the test script.
    -- These keep the existing silent-aim logic working even when the full menu layer is not present.
    Toggles = Toggles or {}
    Options = Options or {}
    Toggles.SilentAim = Toggles.SilentAim or { Value = cheat_client.config.silent_aim }
    Toggles.IgnoreBlocking = Toggles.IgnoreBlocking or { Value = cheat_client.config.ignore_blocking }
    Toggles.HideFovCircle = Toggles.HideFovCircle or { Value = cheat_client.config.hide_fov_circle }
    Options.SilentAimFov = Options.SilentAimFov or { Value = cheat_client.config.fov }

    local function sync_silent_aim_controls()
        if Toggles and Toggles.SilentAim then
            Toggles.SilentAim.Value = cheat_client.config.silent_aim
        end
        if Toggles and Toggles.IgnoreBlocking then
            Toggles.IgnoreBlocking.Value = cheat_client.config.ignore_blocking
        end
        if Toggles and Toggles.HideFovCircle then
            Toggles.HideFovCircle.Value = cheat_client.config.hide_fov_circle
        end
        if Options and Options.SilentAimFov then
            Options.SilentAimFov.Value = cheat_client.config.fov
        end
    end

    sync_silent_aim_controls()

            -- Grapple Parry
            local function setup_grapple_parry()
                if not plr.Character then return end

                utility:Connection(plr.Character.DescendantAdded, function(child)
                    if not (Toggles and Toggles.AutoPerfectBlock and Toggles.AutoPerfectBlock.Value and Options.ParryAbilities.Value["Grapple"]) then return end
                    if not (child:IsA("Attachment") and child.Name == "Attachment2") then return end

                    local enemyPlayer = nil
                    local should_parry = true

                    task.wait(0.05)

                    for _, player in ipairs(plrs:GetPlayers()) do
                        if player == plr or not player.Character then continue end

                        local leftArm = FindFirstChild(player.Character, "Left Arm")
                        if not leftArm then continue end

                        local cord = FindFirstChild(leftArm, "Cord")
                        if not cord or not cord:IsA("Beam") or cord.Attachment1 ~= child then continue end
                        enemyPlayer = player

                        local ignoreVisibility = Toggles.ParryIgnoreVisibility and Toggles.ParryIgnoreVisibility.Value
                        if not ignoreVisibility then
                            local enemyHRP = FindFirstChild(player.Character, "HumanoidRootPart")
                            if enemyHRP then
                                should_parry = is_on_screen_visible(enemyHRP)
                            end
                        end
                        break
                    end

                    if not enemyPlayer then return end
                    if plr.Character and FindFirstChild(plr.Character, "HumanoidRootPart") and enemyPlayer.Character then
                        local playerHRP = plr.Character.HumanoidRootPart
                        local enemyHRP = FindFirstChild(enemyPlayer.Character, "HumanoidRootPart")

                        if enemyHRP then
                            local distance = (playerHRP.Position - enemyHRP.Position).Magnitude
                            local semiBlatantBlock = Toggles.ParrySemiBlatantBlock and Toggles.ParrySemiBlatantBlock.Value
                            if not semiBlatantBlock and distance > 60 then
                                return
                            end
                        end
                    end

                    if should_parry then
                        performAutoParry(0, 0.25, true, enemyPlayer)
                    end
                end)
            end

            if plr.Character then
                setup_grapple_parry()
            end

            utility:Connection(plr.CharacterAdded, function()
                task.wait(0.5)
                setup_grapple_parry()
            end)

            connect_players()
        end

        do -- Silent Aim
            local valid_tools = { 
                Celeritas = true, 
                Armis = true, 
                Vulnere = true, 
                ["Dagger Throw"] = true, 
                Arguere = true, 
                Grapple = true, 
                ["Autumn Rain"] = true, 
                Ignis = true, 
                Percutiens = true 
            }

            local get_nearest_player = LPH_NO_VIRTUALIZE(function()
                local players_list = plrs:GetPlayers()
                local camera = ws.CurrentCamera
                local smallest_distance = math.huge
                local nearest
            
                local plr_humanoid_root_part = plr.Character and FindFirstChild(plr.Character, "HumanoidRootPart")
                local mouse_position = uis:GetMouseLocation()
            
                if not plr_humanoid_root_part then
                    return nil, nil
                end
            
                local fov_radius = (Options and Options.SilentAimFov and Options.SilentAimFov.Value) or 100
                local hitparts = {
                    ["Head"] = true,
                    ["HumanoidRootPart"] = true
                }
            
                local function is_visible_from_camera(part, target_character)
                    local camera_position = camera.CFrame.Position
                    local direction = (part.Position - camera_position).Unit
                    local distance = (part.Position - camera_position).Magnitude

                    local raycast_params = RaycastParams.new()
                    raycast_params.FilterDescendantsInstances = {plr.Character, target_character}
                    raycast_params.FilterType = Enum.RaycastFilterType.Blacklist

                    local result = workspace:Raycast(camera_position, direction * distance, raycast_params)

                    if not result then
                        return true
                    end

                    if result.Instance == part then
                        return true
                    end

                    if result.Instance.Transparency > 0.9 and not result.Instance.CanCollide then
                        return true
                    end

                    local hit_distance = (result.Position - camera_position).Magnitude
                    local target_distance = (part.Position - camera_position).Magnitude

                    return math.abs(hit_distance - target_distance) < 1
                end
            
                for _, target_player in ipairs(players_list) do
                    if target_player ~= plr and not cheat_client:is_friendly(target_player) then
                        local target_character = target_player.Character
                        if target_character then
                            local ignore_blocking = Toggles and Toggles.IgnoreBlocking and Toggles.IgnoreBlocking.Value
                            if ignore_blocking and FindFirstChild(target_character, "Blocking") then
                                continue
                            end

                            local closest_part = nil
                            local closest_part_distance = math.huge
                            
                            for part_name, _ in next, hitparts do
                                local part = FindFirstChild(target_character, part_name)
                                if part then
                                    local screen_position, on_screen = camera:WorldToScreenPoint(part.Position)
                                    
                                    if on_screen then
                                        local target_screen_position = Vector2.new(screen_position.X, screen_position.Y)
                                        local distance_to_mouse = (mouse_position - target_screen_position).Magnitude
                                        
                                        if distance_to_mouse <= fov_radius and distance_to_mouse < closest_part_distance then
                                            if is_visible_from_camera(part, target_character) then
                                                closest_part = part
                                                closest_part_distance = distance_to_mouse
                                            end
                                        end
                                    end
                                end
                            end
                            
                            if closest_part and closest_part_distance <= fov_radius and closest_part_distance < smallest_distance then
                                smallest_distance = closest_part_distance
                                nearest = target_player
                                cheat_client.aimbot.silent_instance = closest_part
                                cheat_client.aimbot.silent_position = closest_part.Position
                            end
                        end
                    end
                end
                return nearest, cheat_client.aimbot.silent_instance
            end)
            
            local function start_silent_aim_rendering()
                if cheat_client.feature_connections.silent_aim then return end

                cheat_client.feature_connections.silent_aim = utility:Connection(rs.Heartbeat, LPH_NO_VIRTUALIZE(function()
                    local isHideFovCircleEnabled = Toggles and Toggles.HideFovCircle and Toggles.HideFovCircle.Value or false
                    local mouse_pos = uis:GetMouseLocation()
                    aimbot_fov_circle.Position = mouse_pos
                    aimbot_fov_circle.Radius = (Options and Options.SilentAimFov and Options.SilentAimFov.Value) or 100
                    aimbot_fov_circle.Visible = cheat_client.window_active and not isHideFovCircleEnabled

                    local nearest_player, nearest_part = get_nearest_player()
                    if cheat_client and cheat_client.aimbot then
                        cheat_client.aimbot.current_target = nearest_player
                    end
                end))
            end

            local function stop_silent_aim_rendering()
                -- Disconnect heartbeat
                if cheat_client.feature_connections.silent_aim then
                    cheat_client.feature_connections.silent_aim:Disconnect()
                    cheat_client.feature_connections.silent_aim = nil
                end
                
                -- Cleanup aimbot data
                if cheat_client.aimbot then
                    cheat_client.aimbot.silent_instance = nil
                    cheat_client.aimbot.silent_position = nil
                    cheat_client.aimbot.current_target = nil
                end
                
                -- Hide FOV circle
                if aimbot_fov_circle then
                    aimbot_fov_circle.Visible = false
                end
                
                -- CRITICAL: Unhook the namecall
                if cheat_client.silent_aim_hook and cheat_client.silent_aim_original_namecall then
                    pcall(function()
                        hookmetamethod(game, "__namecall", cheat_client.silent_aim_original_namecall)
                    end)
                    cheat_client.silent_aim_hook = nil
                    cheat_client.silent_aim_original_namecall = nil
                end
            end

            -- Store the original namecall BEFORE hooking
            cheat_client.silent_aim_original_namecall = hookmetamethod(game, "__namecall", function(self, ...)
                local method = getnamecallmethod()
                local args = {...}
                
                if method == "FireServer" and self.Name == "Network" then
                    local cmd = args[1]
                    local data = args[2]
                    
                    if type(cmd) == "string" and cmd == "Click" and type(data) == "table" then
                        -- Add safety checks to prevent errors when unloaded
                        local safe_to_modify = pcall(function()
                            return Toggles and Toggles.SilentAim and Toggles.SilentAim.Value 
                                and cheat_client and cheat_client.aimbot
                        end)
                        
                        if safe_to_modify then
                            local tool = data.Tool
                            
                            if tool and valid_tools[tool.Name] then
                                if cheat_client.aimbot.current_target 
                                and cheat_client.aimbot.silent_instance 
                                and cheat_client.aimbot.silent_position then
                                    
                                    if data.ClientData and data.ClientData.Mouse then
                                        local pos = cheat_client.aimbot.silent_position
                                        
                                        data.ClientData.Mouse = {
                                            ["Instance"] = cheat_client.aimbot.silent_instance,
                                            ["Position"] = pos
                                        }
                                    end
                                end
                            end
                        end
                    end
                end
                
                return cheat_client.silent_aim_original_namecall(self, ...)
            end)
            
            -- Mark that hook is active
            cheat_client.silent_aim_hook = true

            cheat_client.start_silent_aim_rendering = start_silent_aim_rendering
            cheat_client.stop_silent_aim_rendering = stop_silent_aim_rendering

            if Toggles and Toggles.SilentAim and Toggles.SilentAim.Value then
                start_silent_aim_rendering()
            end
        end
    end)

    -- Minimal in-game UI for the silent-aim toggle and FOV slider.
    local function create_silent_aim_ui()
        local gui = Instance.new("ScreenGui")
        gui.Name = "XeronSilentAimUI"
        gui.Parent = (gethui and gethui()) or game:GetService("CoreGui")

        local main = Instance.new("Frame")
        main.Name = "Main"
        main.Size = UDim2.new(0, 260, 0, 120)
        main.Position = UDim2.new(0, 18, 0, 18)
        main.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
        main.BorderSizePixel = 0
        main.Parent = gui

        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 8)
        corner.Parent = main

        local title = Instance.new("TextLabel")
        title.Size = UDim2.new(1, -16, 0, 24)
        title.Position = UDim2.new(0, 8, 0, 8)
        title.BackgroundTransparency = 1
        title.Text = "Silent Aim"
        title.TextColor3 = Color3.fromRGB(255, 255, 255)
        title.TextXAlignment = Enum.TextXAlignment.Left
        title.Font = Enum.Font.SourceSansBold
        title.TextSize = 18
        title.Parent = main

        local toggle = Instance.new("TextButton")
        toggle.Size = UDim2.new(1, -16, 0, 28)
        toggle.Position = UDim2.new(0, 8, 0, 40)
        toggle.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
        toggle.Text = "Silent Aim: OFF"
        toggle.Font = Enum.Font.SourceSans
        toggle.TextSize = 15
        toggle.Parent = main

        local corner2 = Instance.new("UICorner")
        corner2.CornerRadius = UDim.new(0, 6)
        corner2.Parent = toggle

        local sliderLabel = Instance.new("TextLabel")
        sliderLabel.Size = UDim2.new(0, 70, 0, 18)
        sliderLabel.Position = UDim2.new(0, 8, 0, 76)
        sliderLabel.BackgroundTransparency = 1
        sliderLabel.Text = "FOV"
        sliderLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
        sliderLabel.TextXAlignment = Enum.TextXAlignment.Left
        sliderLabel.Font = Enum.Font.SourceSans
        sliderLabel.TextSize = 13
        sliderLabel.Parent = main

        local sliderBg = Instance.new("Frame")
        sliderBg.Size = UDim2.new(1, -88, 0, 8)
        sliderBg.Position = UDim2.new(0, 82, 0, 82)
        sliderBg.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        sliderBg.Parent = main

        local sliderFill = Instance.new("Frame")
        sliderFill.Size = UDim2.new(0, 0, 1, 0)
        sliderFill.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
        sliderFill.Parent = sliderBg

        local sliderKnob = Instance.new("Frame")
        sliderKnob.Size = UDim2.new(0, 12, 0, 12)
        sliderKnob.Position = UDim2.new(0, -6, 0.5, -6)
        sliderKnob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        sliderKnob.Parent = sliderBg

        local sliderCorner = Instance.new("UICorner")
        sliderCorner.CornerRadius = UDim.new(0, 4)
        sliderCorner.Parent = sliderBg

        local sliderKnobCorner = Instance.new("UICorner")
        sliderKnobCorner.CornerRadius = UDim.new(1, 0)
        sliderKnobCorner.Parent = sliderKnob

        local valueLabel = Instance.new("TextLabel")
        valueLabel.Size = UDim2.new(0, 52, 0, 18)
        valueLabel.Position = UDim2.new(1, -56, 0, 76)
        valueLabel.BackgroundTransparency = 1
        valueLabel.Text = "80"
        valueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        valueLabel.TextXAlignment = Enum.TextXAlignment.Right
        valueLabel.Font = Enum.Font.SourceSans
        valueLabel.TextSize = 13
        valueLabel.Parent = main

        local function updateToggleLabel()
            toggle.Text = cheat_client.config.silent_aim and "Silent Aim: ON" or "Silent Aim: OFF"
        end

        local function updateSlider()
            local value = math.clamp(cheat_client.config.fov or 80, 0, 200)
            local pct = value / 200
            sliderFill.Size = UDim2.new(pct, 0, 1, 0)
            sliderKnob.Position = UDim2.new(math.clamp(pct, 0, 1), -6, 0.5, -6)
            valueLabel.Text = tostring(value)
        end

        local dragging = false
        local function setFovFromMouse(x)
            local startX = sliderBg.AbsolutePosition.X
            local width = sliderBg.AbsoluteSize.X
            local pct = math.clamp((x - startX) / math.max(width, 1), 0, 1)
            local value = math.floor(pct * 200 + 0.5)
            cheat_client.config.fov = value
            Options = Options or {}
            Options.SilentAimFov = Options.SilentAimFov or {}
            Options.SilentAimFov.Value = value
            updateSlider()
        end

        toggle.MouseButton1Click:Connect(function()
            cheat_client.config.silent_aim = not cheat_client.config.silent_aim
            Toggles = Toggles or {}
            Toggles.SilentAim = Toggles.SilentAim or {}
            Toggles.SilentAim.Value = cheat_client.config.silent_aim
            updateToggleLabel()

            if cheat_client.config.silent_aim then
                if cheat_client.start_silent_aim_rendering then
                    cheat_client.start_silent_aim_rendering()
                end
            else
                if cheat_client.stop_silent_aim_rendering then
                    cheat_client.stop_silent_aim_rendering()
                end
            end
        end)

        sliderKnob.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = true
            end
        end)

        sliderBg.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = true
                setFovFromMouse(input.Position.X)
            end
        end)

        game:GetService("UserInputService").InputChanged:Connect(function(input)
            if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                setFovFromMouse(input.Position.X)
            end
        end)

        game:GetService("UserInputService").InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = false
            end
        end)

        updateToggleLabel()
        updateSlider()
    end

    create_silent_aim_ui()