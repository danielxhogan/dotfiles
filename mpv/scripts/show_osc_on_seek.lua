local timer = nil
local no_osc_sub_pos
local visibility = mp.get_property("osc")

mp.add_timeout(0.1, function ()
  no_osc_sub_pos = mp.get_property("sub-pos")

  if (no_osc_sub_pos == 100) then
    no_osc_sub_pos = 105
  end

  if (visibility == "yes") then
    mp.set_property("sub-pos", 100)
  else
    mp.set_property("sub-pos", no_osc_sub_pos)
  end

end)

function show_osc_on_seek()
  if timer then
    timer:kill()
    timer = nil
  else
    visibility = mp.get_property("osc")
    if (visibility == "yes") then
      return
    end
    no_osc_sub_pos = mp.get_property("sub-pos")
  end

  mp.set_property("osc", "yes")
  mp.set_property("sub-pos", 100)

  timer = mp.add_timeout(3, function ()
    mp.set_property("osc", "no")
    mp.set_property("sub-pos", no_osc_sub_pos)
    timer = nil
  end)
end

function seek_home()
  mp.command("seek 0 absolute")
  show_osc_on_seek()
end
function seek_previous_chapter()
  mp.command("add chapter -1")
  show_osc_on_seek()
end
function seek_next_chapter()
  mp.command("add chapter 1")
  show_osc_on_seek()
end
function seek_backward_60s()
  mp.command("seek -60")
  show_osc_on_seek()
end
function seek_backward_5s()
  mp.command("seek -5")
  show_osc_on_seek()
end
function seek_forward_5s()
  mp.command("seek 5")
  show_osc_on_seek()
end
function seek_forward_60s()
  mp.command("seek 60")
  show_osc_on_seek()
end

function toggle_osc()
  mp.command("cycle osc")
  visibility = mp.get_property("osc")

  if visibility == "yes" then
    no_osc_sub_pos = mp.get_property("sub-pos")
    mp.set_property("sub-pos", 100)
  else
    mp.set_property("sub-pos", no_osc_sub_pos)
  end
end

mp.add_key_binding("y", seek_home)
mp.add_key_binding("a", seek_previous_chapter)
mp.add_key_binding("g", seek_next_chapter)
mp.add_key_binding("w", seek_backward_60s)
mp.add_key_binding("e", seek_backward_5s)
mp.add_key_binding("LEFT", seek_backward_5s)
mp.add_key_binding("r", seek_forward_5s)
mp.add_key_binding("RIGHT", seek_forward_5s)
mp.add_key_binding("t", seek_forward_60s)

mp.add_key_binding("h", "string", toggle_osc)

mp.add_timeout(0.1, function ()
  show_osc_on_seek()
end)
