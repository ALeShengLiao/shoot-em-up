local Asteroid =  require("Asteroid")
local Meteor = {}

Meteor.new = function()
    local asteroid = Asteroid.new("Meteors/Tiny/2")
    asteroid:enablePhysics()
    return asteroid
end

return Meteor