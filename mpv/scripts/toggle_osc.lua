-- local no_osc_sub_pos = 105

-- function adapt_subtitle_position()
--   mp.command("cycle osc")
--   visibility = mp.get_property("osc")

--   if visibility == "yes" then
--     no_osc_sub_pos = mp.get_property("sub-pos")
--     mp.set_property("sub-pos", 100)
--   else
--     mp.set_property("sub-pos", no_osc_sub_pos)
--   end
-- end

-- mp.add_key_binding("h", "string", adapt_subtitle_position)
