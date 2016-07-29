local Item = {}
local GameObject = require("GameObject")
local Glory = require("effects.Glory")
local Explosion = require("effects.StarExplosion3")
local Sprite = require("Sprite")
local sfx = require("sfx")
local logger = require("logger")

Item.new = function(sprites, options)
    local TAG = "item"
    local item = GameObject.new()
    local sprite = Sprite.new(sprites)
    item:insert(sprite)
    item.type = "item"
    item.name = "item"
    item.enabled = true
    item.droppable = true
    item.power = 0
    item.shootSpeed = 0
    item.score = 0
    item.apearDuration = (options and options.apearDuration) or 5000
    item:belongTo(PHYSIC_CATEGORY_ITEM)
    item:collideWith(PHYSIC_CATEGORY_CHARACTER)
    item:enablePhysics()

    function item:effect(receiver)
        self:disableAutoDestroy()
        self:visualEffect()
        self:playGotSound()
        self:mentalEffect()
        print("Item effect the receiver")
    end

    function item:playGotSound()
        sfx:play("scoreUp")
    end

    function item:visualEffect()
        local effect = Explosion.new({time=800})
        self.parent:insert(effect)
        effect.x = self.x
        effect.y = self.y
    end

    function item:mentalEffect()
        
    end

    function item:idleEffect()
        local effect = Glory.new({
            time = -1}
        )
        self:insert(effect)
    end

    function item:undoDrop()
        logger:info(TAG, "undoDrop")
        self:setLinearVelocity(0 ,0)
        if self.timerId then
            item:cancelTimer(self.timerId)
        end
    end

    function item:dropped(receiver)
        --random move
        --math.randomseed(os.time())
        --degree = math.random(1, 360)
        self:dropEffect()
        self:onDrop()
    end
    
    function item:dropEffect(receiver)
        local degree = 0
        local speed = math.random(10, 30)
        for i = 0, math.floor(speed / 10) do
            degree = math.random(1, 360)
        end
        local vx = math.cos(math.rad(degree))*speed
        local vy = math.cos(math.rad(degree))*speed
        logger:info(TAG, "random move items %d %d", vx, vy)
        
        self:setLinearVelocity(vx , vy)
        --self:enableAutoDestroy()
        if self.apearDuration > 0 then
            self.timerId = item:addTimer(self.apearDuration, function()
                transition.to(item, {
                    time = 500,
                    alpha = 0,
                    onComplete = function()
                        item:removeSelf()
                    end
                })
            end)
        end        
    end

    function item:onDrop(receiver)
        
    end

    function item:needKeep(receiver)
        local result = receiver:testUpdateAttr(self)
        if result.change then
            return true         
        end
        return false
    end

    item:idleEffect()
    sprite:toFront()

    return item
end

return Item
