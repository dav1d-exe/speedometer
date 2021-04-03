local fontId

Citizen.CreateThread(function()
  Citizen.Wait(1000)
  RegisterFontFile('wmk')
  fontId = RegisterFontId('Freedom Font')
    
  fontsLoaded = true
end)

function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(7)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    --SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
    DrawRect(x+0.05, y-0.01, 0.100, 0.093,0,0,0,100)
    DrawRect(x, y-0.01, 0.0025, 0.094,255,30,30,255)
  end

Citizen.CreateThread(function()
    while true do
          Citizen.Wait(0)
        if(IsPedInAnyVehicle(GetPlayerPed(-1), false))then
        local pulamea = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 3.78
        local benzinainrasamatii = GetVehicleFuelLevel(GetVehiclePedIsIn(GetPlayerPed(-1), false))
        local vitezacurentamortiimatii = GetVehicleCurrentGear(GetVehiclePedIsIn(GetPlayerPed(-1), false))
        local veh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
        if GetVehicleDoorLockStatus(veh) >= 2 then
          status = "~r~Locked"
        else
          status = "~g~Unlocked"
        end
        if pulamea < 60 then
        drawTxt(1.355, 1.217, 1.0,1.0,0.9, "~g~" .. math.ceil(pulamea) .. "", 255, 255, 255, 255)
        elseif pulamea > 60 and pulamea < 100 then
        drawTxt(1.355, 1.217, 1.0,1.0,0.9, "~y~" .. math.ceil(pulamea) .. "", 255, 255, 255, 255)
        elseif pulamea > 100 then
        drawTxt(1.355, 1.217, 1.0,1.0,0.9, "~r~" .. math.ceil(pulamea) .. "", 255, 255, 255, 255)
        end
        drawTxt(1.405, 1.244, 1.0,1.0,0.3, "KM/H", 255, 255, 255, 255)
        drawTxt(1.355, 1.264, 1.0,1.0,0.4, "FUEL: ~r~".. math.ceil(benzinainrasamatii) .." ~w~[C: 1L]", 255, 255, 255, 255)
        drawTxt(1.355, 1.284, 1.0,1.0,0.4, "DOORS: ".. status, 255, 255, 255, 255)
        if vitezacurentamortiimatii == 0 then
        drawTxt(1.355, 1.304, 1.0,1.0,0.4, "GEAR: ~r~Reverse", 255, 255, 255, 255)
        else
        drawTxt(1.355, 1.304, 1.0,1.0,0.4, "GEAR: ~r~".. math.ceil(vitezacurentamortiimatii), 255, 255, 255, 255)
        end
    end
  end
end)