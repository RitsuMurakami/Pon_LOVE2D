local maid64 = require "maid64"
local ball = require "ball"
local score = require "score"
local bar = require "bar"
local timer = require "timer"

local scene = 0

function love.load()
    window_settings()

    -- player
    playerL = bar.new(5, 144/2-16, true)
    playerR = bar.new(160-5-16, 144/2-16, false)

    -- ball
    Ball = ball.new(160/2, 144/2, 0.75, 0.75, 30)

    -- score
    scoreL = score.new(80/2, 144/7, true)
    scoreR = score.new(160 * 2 / 3, 144/7, false)

    -- timer
    time = timer.new()
end

function love.update()

end

function love.draw()
    maid64.start()  -- レンダリング開始

    scene_switch(scene)

    maid64.finish()  -- レンダリング終了
end


function window_settings()
    -- 画面サイズ(ゲームボーイに倣う)
    love.window.setMode(160 * 5, 144 * 5)  -- 画面サイズ指定

    -- maid64の初期化
    maid64.setup(160, 144)
end

function scene_switch(_scene)
    if _scene == 0 then
        -- 待機
        playerL.control(1.5)
        playerR.control(1.5)

        -- timerで、2秒待機
        if not time.flag then
            time.set_timer(2)
        end

        if time.flag then
            time.timer()
            if not time.flag then
                scene = scene + 1
            end
        end


        -- 描画
        playerL.draw()
        playerR.draw()
        Ball.draw()
        scoreL.draw()
        scoreR.draw()

    elseif _scene == 1 then
        -- プレイヤーの操作受付
        playerL.control(1.5)
        playerR.control(1.5)
        playerL.reflect_ball(Ball)
        playerR.reflect_ball(Ball)

        -- 描画
        playerL.draw()
        playerR.draw()

        Ball.control(1)
        Ball.draw()

    elseif _scene == 2 then
        -- 得点表示

        -- プレイヤーの操作受付
        playerL.control(1.5)
        playerR.control(1.5)

        -- 描画
        playerL.draw()
        playerR.draw()

    end
end
