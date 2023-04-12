local maid64 = require "maid64"
local bar = {}

bar.new = function (x, y, LR)
    local self = {}

    self.x = x
    self.y = y
    self.LR = LR  -- どっちのプレイヤーか
    self.img = maid64.newImage('/img/bar.png', 16, 16)

    self.draw = function()
        love.graphics.draw(self.img, self.x, self.y)
    end

    --return bar
    return self
end

return bar
