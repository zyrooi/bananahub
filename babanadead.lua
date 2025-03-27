if game.GameId == 7018190066 then
loadstring(game:HttpGet("https://raw.githubusercontent.com/zyrooi/bananahub/refs/heads/main/deadcode.lua"))()
else
    -- Nếu không phải game hỗ trợ, kick người chơi
    game.Players.LocalPlayer:Kick("[ BANANA HUB ]")
end
