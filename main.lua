local maid64 = require "maid64"
local ball = require "ball"
local score = require "score"

function love.load()
    window_settings()
end

function love.update()

end

function love.draw()

end


function window_settings()
    -- 画面サイズ(ゲームボーイに倣う)
    love.window.setMode(160 * 5, 144 * 5)  -- 画面サイズ指定

    -- maid64の初期化
    maid64.setup(160, 144)
end
