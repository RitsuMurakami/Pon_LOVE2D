local ball = {}

ball.new = function(_x, _y)
    local self = {}

    self.x = _x
    self.y = _y

    return self
end

return ball
