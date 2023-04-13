local maid64 = require 'maid64'
local ball = {}

ball.new = function(_x, _y, _vx, _vy)
    -- コンストラクタ関数
    local self = {}

    self.x = _x
    self.y = _y
    self.vec = {_vx, _vy}
    self.img = maid64.newImage('/img/ball.png', 4, 4)

    self.draw = function ()
        -- 描画関数
        love.graphics.draw(self.img, x, y)
    end

    return self
end

return ball
