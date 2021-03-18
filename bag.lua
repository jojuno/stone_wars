--attached to a bag that contains pieces
--this one is for the stone bag

function onObjectLeaveContainer(container, obj)
    if container == self then
      obj.setDescription("")
      local objClone = obj.clone({position = self.getPosition()})
      self.putObject(objClone)
    end
  end
  
  function filterObjectEnter(obj)
    if obj.getName() == "stone_flicking" then return true end --allow this item in bag
    return false --disallows from else from bag
  end