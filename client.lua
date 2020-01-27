AddEventHandler('baseevents:enteredVehicle', function(currentVehicle, currentSeat, carName)
    currentCar = currentVehicle
end)

AddEventHandler('baseevents:leftVehicle', function(currentVehicle, currentSeat, carName)
    currentCar = 0

    PollUI()
end)

currentCar = 0

isSpeedometerShowing = false
currentSpeed = 0
deductRev = 1045220557
currentRev = 0
currentGear = 1

CreateThread(function()
    while true do
        Wait(50)

        if currentCar > 0 then
            currentSpeed = math.floor(GetCarSpeed(currentCar, _s) * 5) * 1.25
            currentRev = GetVehicleEngineRevs(currentCar)
            if currentRev ~= false then currentRev = math.floor(((currentRev - deductRev) / 100000) * 1.4) else currentRev = 0 end

            currentGear = GetVehicleGear(currentCar)
            if currentGear ~= false then currentGear = math.floor(GetVehicleGear(currentCar)) else currentGear = -1 end
            PollUI()
        end
    end
end)

AddUIHandler('currentSpeed', function(data, cb)
    cb(currentSpeed)
end)

AddUIHandler('currentRev', function(data, cb)
    cb(currentRev)
end)

AddUIHandler('currentGear', function(data, cb)
    cb(currentGear)
end)

AddUIHandler('inVehicle', function(data, cb)
    if currentCar > 0 then
        cb(true)
    else
        cb(false)
    end
end)