local maid64 = require"maid64"
local score = {}

score.new = function (_x, _y, _LR)
    -- コンストラクタ関数
    local self = {}
    self.score = 0
    self.x = _x
    self.y = _y
    self.LR = _LR
    self.img = maid64.newImage("/img/numbers.png")
    self.tile = maid64.newTileSet(self.img, 16, 32)

    self.draw = function ()
        love.graphics.draw(self.img, self.tile[self.score], self.x, self.y)
    end

    return self
end

return score
