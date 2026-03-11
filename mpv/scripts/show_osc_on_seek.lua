local timer = nil

function show_osc()
  if timer then
    timer:kill()
    timer = nil
  else
    visibility = mp.get_property("osc")
    if (visibility == "yes") then
      return
    end
  end

  mp.set_property("osc", "yes")
  mp.set_property("sub-pos", 105)
  timer = mp.add_timeout(3, function ()
    mp.set_property("osc", "no")
    mp.set_property("sub-pos", 110)
    timer = nil
  end)
end

function seek_home()
  mp.command("seek 0 absolute")
  show_osc()
end

function seek_previous_chapter()
  mp.command("add chapter -1")
  show_osc()
end

function seek_next_chapter()
  mp.command("add chapter 1")
  show_osc()
end

function seek_backward_60s()
  mp.command("seek -60")
  show_osc()
end

function seek_backward_5s()
  mp.command("seek -5")
  show_osc()
end

function seek_forward_5s()
  mp.command("seek 5")
  show_osc()
end

function seek_forward_60s()
  mp.command("seek 60")
  show_osc()
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

show_osc()
