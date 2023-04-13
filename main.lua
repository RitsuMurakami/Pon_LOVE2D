local maid64 = require "maid64"
local ball = require "ball"
local score = require "score"
local bar = require "bar"

function love.load()
    window_settings()

    playerL = bar.new(5, 144/2-16, true)
    playerR = bar.new(160-5-16, 144/2-16, false)
    Ball = ball.new(160/80, 144/2, 1, 1)

end

function love.update()

end

function love.draw()
    maid64.start()  -- レンダリング開始

    -- プレイヤーの操作受付
    playerL.control(1.5)
    playerR.control(1.5)

    -- 描画
    playerL.draw()
    playerR.draw()

    Ball.draw()


    maid64.finish()  -- レンダリング終了
end


function window_settings()
    -- 画面サイズ(ゲームボーイに倣う)
    love.window.setMode(160 * 5, 144 * 5)  -- 画面サイズ指定

    -- maid64の初期化
    maid64.setup(160, 144)
end
