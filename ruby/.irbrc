IRB.conf[:PROMPT][:DEV] = { # name of prompt mode
  :AUTO_INDENT => false,          # disables auto-indent mode
  :PROMPT_I =>  ">> ",            # simple prompt
  :PROMPT_S => nil,               # prompt for continuated strings
  :PROMPT_C => nil,               # prompt for continuated statement
  :RETURN => "    ==>%s\n"        # format to return value
}

#IRB.conf[:PROMPT_MODE] = :MY_PROMPT
#IRB.conf[:PROMPT_MODE] = :MY_PROMPT
