if game.GameId == 7018190066 then
loadstring(game:HttpGet("https://raw.githubusercontent.com/zyrooi/bananahub/refs/heads/main/cc.lua"))()
elseif game.GameId == 5830262966 then
    loadstring(game:HttpsGet("https://raw.githubusercontent.com/zyrooi/bananahub/refs/heads/main/Squid.lua.txt"))()
elseif game.GameId == 994732206 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/zyrooi/quanly/refs/heads/main/gay.lua"))()
else
    -- Nếu không phải game hỗ trợ, kick người chơi
    game.Players.LocalPlayer:Kick("[ BANANA HUB ]")
end
