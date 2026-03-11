mp.register_event("file-loaded", function()
  local options = mp.get_property_native("script-opts")
  if options["show-stats"] == "yes" then
    mp.command("script-binding stats/display-stats-toggle")
  end
end)