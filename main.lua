local maid64 = require "maid64"
local ball = require "ball"
local score = require "score"
local bar = require "bar"

function love.load()
    window_settings()

    playerR = bar.new(5, 4, true)
    if playerR.x then
        print('is')
    end

end

function love.update()

end

function love.draw()
    maid64.start()

    if playerR then
        print('is')
    end
    playerR.draw(5, 6)

    maid64.finish()
end


function window_settings()
    -- 画面サイズ(ゲームボーイに倣う)
    love.window.setMode(160 * 5, 144 * 5)  -- 画面サイズ指定

    -- maid64の初期化
    maid64.setup(160, 144)
end
