local maid64 = require"maid64"
local timer = {}

timer.new = function ()
    -- コンストラクタ関数
    local self = {}
    self.flag = false

    self.set_timer = function(_t)
        self.t = _t
        self.flag = true
        self.start_time = love.timer.getTime()
    end

    self.timer = function()
        self.current_time = love.timer.getTime() - self.start_time
        if self.flag then
            if self.t < self.current_time then
                self.flag = false
            end
        end
    end

    return self
end

return timer

