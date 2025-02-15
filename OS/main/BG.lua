-- Graphical OS Main Menu for CC: Tweaked
-- Supports color, LMB & RMB, and interactive buttons

local w, h = term.getSize()
local running = true

-- Check if the terminal supports color
local hasColor = term.isColor()

-- Define Colors
local bgColor = hasColor and colors.cyan or colors.gray
local textColor = hasColor and colors.white or colors.black
local buttonColor = hasColor and colors.blue or colors.lightGray
local highlightColor = hasColor and colors.green or colors.white

-- Button list
local buttons = {
    {label = "File Manager", x = 5, y = 5, width = 15, height = 3, action = function() print("Opening File Manager...") sleep(1) end},
    {label = "Settings", x = 5, y = 10, width = 15, height = 3, action = function() print("Opening Settings...") sleep(1) end},
    {label = "Exit", x = 5, y = 15, width = 15, height = 3, action = function() running = false end}
}

-- Function to draw a button
local function drawButton(btn, highlighted)
    term.setBackgroundColor(highlighted and highlightColor or buttonColor)
    term.setTextColor(textColor)
    for i = 0, btn.height - 1 do
        term.setCursorPos(btn.x, btn.y + i)
        term.write(string.rep(" ", btn.width))
    end
    term.setCursorPos(btn.x + (btn.width - #btn.label) // 2, btn.y + btn.height // 2)
    term.write(btn.label)
end

-- Function to render the menu
local function drawMenu()
    term.setBackgroundColor(bgColor)
    term.clear()
    term.setTextColor(textColor)
    term.setCursorPos(w // 2 - 5, 2)
    term.write("MosS")

    for _, btn in ipairs(buttons) do
        drawButton(btn, false)
    end
end

-- Function to check if a button was clicked
local function handleClick(x, y, button)
    for _, btn in ipairs(buttons) do
        if x >= btn.x and x < btn.x + btn.width and y >= btn.y and y < btn.y + btn.height then
            if button == 1 then -- Left Click
                drawButton(btn, true)
                sleep(0.2)
                drawButton(btn, false)
                btn.action()
            elseif button == 2 then -- Right Click
                print("Right Clicked on: " .. btn.label)
            end
        end
    end
end

-- Main event loop
drawMenu()
while running do
    local event, p1, p2, p3 = os.pullEvent()
    if event == "mouse_click" then
        handleClick(p2, p3, p1)
    elseif event == "key" and p1 == keys.q then
        running = false
    end
end

term.setBackgroundColor(colors.black)
term.clear()
term.setCursorPos(1, 1)
print("Exited MosS.")
