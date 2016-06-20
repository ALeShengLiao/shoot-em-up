local Asteroid =  require("Asteroid")
local Meteor = {}

Meteor.new = function()
    local asteroid = Asteroid.new("Meteors/Small/1")
    asteroid:enablePhysics()
    return asteroid
end

return Meteor