local meniu = true

RegisterNetEvent('opendisplay')
AddEventHandler('opendisplay',function(user_id, faction, name, money, bmoney)
	while true do
        Citizen.Wait(0)
        if (meniu)then
            DisableControlAction(0,24,true)
            DisableControlAction(0,47,true)
            DisableControlAction(0,58,true)
            DisableControlAction(0,263,true)
            DisableControlAction(0,264,true)
            DisableControlAction(0,257,true)
            DisableControlAction(0,140,true)
            DisableControlAction(0,141,true)
            DisableControlAction(0,142,true)
            DisableControlAction(0,143,true)
            DisableControlAction(0, 1, true)
            DisableControlAction(0, 2, true)

            DrawRect(0.50,0.50,0.4,0.4,0,0,0,180)
            drawScreenText(0.50, 0.310+0.0010, 0,0, 0.8, "~b~bun ~w~venit!", 255, 255, 255, 230, 1, 7, 1)
            drawScreenText(0.50, 0.370+0.0010, 0,0, 0.4, "~b~ID-ul tau: "..user_id, 255, 255, 255, 230, 1, 0, 1)
            drawScreenText(0.50, 0.410+0.0010, 0,0, 0.4, "~y~Loc de munca: "..faction, 255, 255, 255, 230, 1, 0, 1)
            drawScreenText(0.50, 0.450+0.0010, 0,0, 0.4, "~p~Nume: "..name, 255, 255, 255, 230, 1, 0, 1)
            drawScreenText(0.50, 0.490+0.0010, 0,0, 0.4, "~r~Bani: ~g~"..banuti(money), 255, 255, 255, 230, 1, 0, 1)
            drawScreenText(0.50, 0.530+0.0010, 0,0, 0.4, "~c~Bani in banca: ~g~"..banuti(bmoney), 255, 255, 255, 230, 1, 0, 1)
        end
    end
end)

Citizen.CreateThread(function()
    if meniu == true then
      Citizen.Wait(10000)
      meniu = false
    end
end)

function banuti(amount)
    local left,num,right = string.match(tostring(amount),'^([^%d]*%d)(%d*)(.-)$')
    return left..(num:reverse():gsub('(%d%d%d)','%1.'):reverse())..right
end

function drawScreenText(x,y ,width,height,scale, text, r,g,b,a, outline, font, center)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextCentre(center)
    if(outline)then
        SetTextOutline()
    end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
  end

