  local isRadarExtended = false
  
  Citizen.CreateThread(function()
	  while true do
		  Wait( 1 )
		  -- extend minimap on keypress
		  if IsControlJustPressed( 0, 20 ) then
			  if not isRadarExtended then
				  SetRadarBigmapEnabled( true, false )
				  isRadarExtended = true
				  Citizen.CreateThread(function()
					  run = true
					  while run do
						  for i = 0, 500 do
							  Wait(1)
							  if not isRadarExtended then
								  run = false
								  break
							  end
						  end
						  SetRadarBigmapEnabled( false, false )
						  isRadarExtended = false
					  end
				  end)
			  else
				  SetRadarBigmapEnabled( false, false )
				  isRadarExtended = false
			  end
		  end
	  end
  end)