local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Button = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui

Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0,220,0,120)
Frame.Position = UDim2.new(0.4,0,0.4,0)
Frame.BackgroundColor3 = Color3.fromRGB(20,20,20)

Button.Parent = Frame
Button.Size = UDim2.new(0,180,0,50)
Button.Position = UDim2.new(0,20,0,35)
Button.Text = "HUY2012 FARM : OFF"
Button.BackgroundColor3 = Color3.fromRGB(40,40,40)

local farm = false

Button.MouseButton1Click:Connect(function()
	farm = not farm
	
	if farm then
		Button.Text = "HUY2012 FARM : ON"
		
		while farm do
			wait(1)

			for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
				if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
						v.HumanoidRootPart.CFrame * CFrame.new(0,0,3)
				end
			end

			local args = {
				[1] = "AddPoint",
				[2] = "Melee",
				[3] = 1
			}

			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		end
		
	else
		Button.Text = "HUY2012 FARM : OFF"
	end
end)
