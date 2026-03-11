function adapt_subtitle_position()
  mp.command("cycle osc")
  visibility = mp.get_property("osc")

  if visibility == "yes" then
    mp.set_property("sub-pos", 105)
  else
    mp.set_property("sub-pos", 110)
  end
end
mp.add_key_binding("h", "string", adapt_subtitle_position)
