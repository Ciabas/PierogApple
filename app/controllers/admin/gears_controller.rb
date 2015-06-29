class Admin::GearsController < Admin::AdminController
  
  def index
    @basegears = Gear.base
  end

  def modelindex
    @gears = Gear.notbase
  end

end
