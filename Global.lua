--[[ Lua code. See documentation: https://api.tabletopsimulator.com/ --]]

--[[ The onLoad event is called after the game save finishes loading. --]]
function onLoad()
end

colors = {"Teal", "Orange", "Purple", "Blue", "White", "Black"}

--[[ The onUpdate event is called once per frame. --]]
function onUpdate()
  playerList = Player.getPlayers()
  --first, with two players
  --write test scripts
  for _, playerReference in ipairs(playerList) do
    --print(playerReference.steam_name)
    --getHoldingObjects() is a table that always has something
    --[1] returns all the objects in the player's hand
    --if player is a spectator, this will return nil
    if playerReference.getHoldingObjects() ~= nil then
      if playerReference.getHoldingObjects()[1] ~= nil then
        if playerReference.getHoldingObjects()[1].getName() == "starting_target" then
          --nothing
        elseif playerReference.getHoldingObjects()[1].getName() == "d4" then
          --nothing
        --clear all pieces if "clear" object is held
        elseif playerReference.getHoldingObjects()[1].getDescription() == "clear_card" then
          allObjects = getObjects()
          --remove every piece that has a color in its description
          for _, object in pairs(allObjects) do
            --go through all the colors
            --if the description matches a color then
            --delete it
            for _, color in pairs(colors) do
              if object.getDescription() == color then
                destroyObject(object)
              end
            end
          end
        elseif playerReference.getHoldingObjects()[1].getDescription() ~= "" then
          --piece is already assigned to a player
          --nothing
        --assign color
        --assign description
        else
          playerReference.getHoldingObjects()[1].setColorTint(playerReference.color)
          playerReference.getHoldingObjects()[1].setDescription(playerReference.color)
        end
      end
    end
  end
end