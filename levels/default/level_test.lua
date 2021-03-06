local move = require("move")
local Sublevel = require("Sublevel")
local EnemyPlane = require("enemies.EnemyPlane")
local gameConfig = require("gameConfig")
local sublevel = Sublevel.new("9999999-002", "2-st level", "keviner2004", {duration = 3000})

function sublevel:show(options)
    local speed = 50
    --New enemy
    for i = 1, 6 do
        self:addTimer(300*i, function()
            local enemy = EnemyPlane.new()
            enemy.x = gameConfig.contentWidth/4*3
            enemy.y = - enemy.height
            --Move enemy
            enemy:setScaleLinearVelocity(0, speed)
            --Remove enemy if out of bound
            enemy:addTimer(100 , function()
                enemy:callWhenInStage(
                    function()
                        enemy:enableAutoDestroy()
                    end
                )
            end)
            self.view:insert(enemy)
        end)
    end

    for i = 1, 6 do
        self:addTimer(300*(i+4), function()
            local enemy = EnemyPlane.new()
            enemy.x = gameConfig.contentWidth/4
            enemy.y = - enemy.height
            --Move enemy
            enemy:setScaleLinearVelocity(0, speed)
            --Remove enemy if out of bound
            enemy:addTimer(100 , function()
                enemy:callWhenInStage(
                    function()
                        enemy:enableAutoDestroy()
                    end
                )
            end)
            self.view:insert(enemy)
        end)
    end
end

return sublevel
