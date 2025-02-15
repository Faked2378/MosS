local function passwordCheck()
	-- Grey Background Script
	local Password = "Password"
	
	-- Set the background color to grey
	term.setBackgroundColor(colors.gray)
	
	-- Clear the screen
	term.clear()

	-- Set the text color to a contrasting color (e.g., white)
	term.setTextColor(colors.white)

	-- Print a message on the grey background
	term.setCursorPos(16, 8)
	print("  Input Password:")
	
	term.setCursorPos(16, 9)
	term.setBackgroundColor(colors.black)
	print("                  ")
	
	term.setCursorPos(16, 9)
	-- Read password input without displaying it
	term.setTextColor(colors.white)
	local password = read("*")

	-- Check if the entered password is correct
	if password == Password then
	  term.setBackgroundColor(colors.black)
	  term.setCursorPos(16, 9)
	  print("Access Granted!")
	  sleep(1.5)
	  dofile("OS/Password/Preps.lua")
	else
	  term.setBackgroundColor(colors.black)
	  term.setCursorPos(16, 9)
	  print("Access Denied!")
	  sleep(1.5)  -- Pause for 4 seconds
	  term.clear()
	  passwordCheck()
	end
end

-- Call the passwordCheck function
passwordCheck()

-- Wait for a key press before exiting
os.pullEvent("key")
