term.clear()

term.setBackgroundColor(colors.gray)
term.clear()

function loadAnim()
    for count = 1, 3 do
        for dot = 1, 3 do
            term.clear()
            term.setCursorPos(1, 15)
            print("Loading " .. string.rep(".", dot))
            sleep(1)  -- Adjust the sleep duration as needed
        end
    end
    dofile("/OS/main/BG.lua")
end

loadAnim()
