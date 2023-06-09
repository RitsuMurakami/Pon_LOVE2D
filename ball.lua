local maid64 = require 'maid64'
local ball = {}

ball.new = function(_x, _y, _vx, _vy, _r)
    -- コンストラクタ関数
    local self = {}

    self.x = _x
    self.y = _y
    self.vec = {_vx, _vy}
    self.r = _r
    self.img = maid64.newImage('/img/ball.png', 4, 4)
    self.value = 1.4
    self.out_of_frame = false

    self.control = function()
        -- 座標変化
        self.x = self.x + self.vec[1]
        self.y = self.y + self.vec[2]

        -- 壁にぶつかると、跳ね返る
        --self.reflect_wall()
    end

    self.reflect_wall = function()
        -- 壁にぶつかると、跳ね返る
        if self.y < 0 or self.y > 144 -4 then
            self.vec[2] = - self.vec[2]
            return false
        end
        -- if self.x < 0 or self.x > 160 - 4 then
        --     self.vec[1] = - self.vec[1]
        -- end
        if self.x < 0  then
            self.out_of_frame = true
            return 'r'
        end
        if self.x > 166-4 then
            self.out_of_frame = true
            return 'l'
        end
    end

    self.reflect_bar = function(LR, pos, v)
        -- barにぶつかったら
        self.value = self.value + v
        self.r = pos * 180
        if LR then
            self.r = -(self.r - 90)
        else
            self.r = -self.r - 90
        end
        self.rad = math.rad(self.r)

        self.vec[1] = self.value * math.cos(self.rad)
        if LR then
            self.vec[2] = -self.value * math.sin(self.rad)
        else
            self.vec[2] = self.value * math.sin(self.rad)
        end
    end

    self.draw = function ()
        -- 描画関数
        love.graphics.draw(self.img, self.x, self.y)
    end

    return self

end

return ball
