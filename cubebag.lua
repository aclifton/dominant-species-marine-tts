function onLoad()
    setDisplay()
end

function onObjectLeaveContainer(bag, obj)
    if bag~=self then return end
    setDisplay()
end

function onObjectEnterContainer(bag, obj)
    if bag~=self then return end
    setDisplay()
end

function setDisplay()
    if self.getButtons() == nil then
        self.createButton({
            click_function = "asdfasdfq",
            label          = self.getQuantity(),
            position       = {0, 0.35, -0.04},
            scale          = {2,2,2},
            rotation       = {0, 180, 0},
            width          = 0,
            height         = 0,
            font_size      = 170,
            color          = {0.5, 0.5, 0.5},
            font_color     = {r=1, g=1, b=1},
            tooltip        = "This text appears on mouseover.",
        })
    else
        self.editButton({index=0,label = self.getQuantity()})
    end
end