local maid64 = require "maid64"
local bar = {}

bar.new = function (_x, _y, _LR)
    local self = {}

    self.x = _x
    self.y = _y
    self.LR = _LR  -- どちらのプレイヤーか(True or False) True => L
    self.img = maid64.newImage('/img/bar.png', 16, 16)

    self.draw = function()
        love.graphics.draw(self.img, self.x, self.y)
        love.graphics.draw(self.img, self.x, self.y + 16)
    end


    self.control = function(value)
        -- 操作系
        if (not self.LR) and love.keyboard.isDown('up') and self.y > 0 then
            self.y = self.y - value
        elseif (not self.LR) and love.keyboard.isDown('down') and self.y < 144-32 then
            self.y = self.y + value
        end

        if self.LR and love.keyboard.isDown('w') and self.y > 0 then
            self.y = self.y - value
        elseif self.LR and love.keyboard.isDown('s') and self.y < 144-32 then
            self.y = self.y + value
        end
    end

    self.reflect_ball = function(ball)
        -- ボールとぶつかったら
        if ball.x > self.x and ball.x < self.x + 10 then
            if ball.y > self.y and ball.y < self.y + 32 then
                ball.reflect_bar(self.LR, (ball.y - self.y) / 32)
            end
        end
    end
    --return bar
    return self
end

return bar
