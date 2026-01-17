local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
	Name = "Froggy",
	LoadingTitle = "xxx",
	LoadingSubtitle = "by Finalelele",
	ConfigurationSaving = {
		Enabled = false,
		FolderName = nil, -- Create a custom folder for your hub/game
		FileName = "Big Hub"
	},

	ToggleUIKeybind = "k", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

	Discord = {
		Enabled = false,
		Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
		RememberJoins = true -- Set this to false to make them join the discord every time they load it up
	},
	KeySystem = false, -- Set this to true to use our key system
	KeySettings = {
		Title = "Untitled",
		Subtitle = "Key System",
		Note = "No method of obtaining the key is provided",
		FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
		SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
		GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
		Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local Tab = Window:CreateTab("Esp", 4483362458) -- Title, Image
local Toggle = Tab:CreateToggle({
	Name = "Esp Frog",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		if Value then
			for _, v in pairs (workspace:GetDescendants()) do
				if v:IsA("Accessory") and v.Name == "KillerWeapon" then
					local frog = v.Parent
					local hg = Instance.new("Highlight")
					hg.DepthMode = "AlwaysOnTop"
					hg.Parent = frog
					hg.FillColor = Color3.fromRGB(255, 0, 0)
					hg.Name = "frogEsp"
				end
			end
		else
			for _, v in pairs (workspace:GetDescendants()) do
				if v.Name == "frogEsp" then
					v:Destroy()
				end
			end
		end
	end,
})

local Toggle = Tab:CreateToggle({
	Name = "Esp Players",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		if Value then
			local lp = game.Players.LocalPlayer
			local lpName = lp.Name
			for _, v in pairs (workspace:GetDescendants()) do
				if v.Name == "Body Colors" and v.Parent.Name ~= lpName then
					local hg = Instance.new("Highlight")
					hg.DepthMode = "AlwaysOnTop"
					hg.Parent = v.Parent
					hg.FillColor = Color3.fromRGB(0, 255, 0)
					hg.Name = "playerEsp"
				end
			end
		else
			for _, v in pairs (workspace:GetDescendants()) do
				if v.Name == "playerEsp" then
					v:Destroy()
				end
			end
		end
	end,
})

local Tab = Window:CreateTab("Player", 4483362458) -- Title, Image
local Toggle = Tab:CreateToggle({
   Name = "Player Speed",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   if Value then
		local SpeedBox = Instance.new("BoxHandleAdornment")
		SpeedBox.Parent = workspace
		SpeedBox.Name = "SpedBox"
		while SpeedBox.Parent == workspace do
			wait()
			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 25
		end
	else
		local SpedBox = workspace.SpedBox
		SpedBox.Parent = nil
		wait(0.1)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 14
	end
end
})
