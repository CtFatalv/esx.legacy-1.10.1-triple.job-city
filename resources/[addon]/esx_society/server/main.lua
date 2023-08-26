local Jobs = setmetatable({}, {__index = function(_, key)
	return ESX.GetJobs()[key]
end
})
local RegisteredSocieties = {}
local SocietiesByName = {}

function GetSociety(name)
	return SocietiesByName[name]
end
exports("GetSociety", GetSociety)

function registerSociety(name, label, account, datastore, inventory, data)
	if SocietiesByName[name] then
		print(('[^3WARNING^7] society already registered, name: ^5%s^7'):format(name))
		return
	end

	local society = {
		name = name,
		label = label,
		account = account,
		datastore = datastore,
		inventory = inventory,
		data = data
	}

	SocietiesByName[name] = society
	table.insert(RegisteredSocieties, society)
end
AddEventHandler('esx_society:registerSociety', registerSociety)
exports("registerSociety", registerSociety)

AddEventHandler('esx_society:getSocieties', function(cb)
	cb(RegisteredSocieties)
end)

AddEventHandler('esx_society:getSociety', function(name, cb)
	cb(GetSociety(name))
end)

RegisterServerEvent('esx_society:checkSocietyBalance')
AddEventHandler('esx_society:checkSocietyBalance', function(society)
	local xPlayer = ESX.GetPlayerFromId(source)
	local society = GetSociety(society)

	if xPlayer.job.name ~= society.name then
		print(('esx_society: %s attempted to call checkSocietyBalance!'):format(xPlayer.identifier))
		return
	end

	TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
		TriggerClientEvent("esx:showNotification", xPlayer.source, TranslateCap('check_balance', ESX.Math.GroupDigits(account.money)))
	end)
end)

-- Double Job
RegisterServerEvent('esx_society:checkSocietyBalance2')
AddEventHandler('esx_society:checkSocietyBalance2', function(society)
	local xPlayer = ESX.GetPlayerFromId(source)
	local society = GetSociety(society)

	if xPlayer.job2.name ~= society.name then
		print(('esx_society: %s attempted to call checkSocietyBalance!'):format(xPlayer.identifier))
		return
	end

	TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
		TriggerClientEvent("esx:showNotification", xPlayer.source, TranslateCap('check_balance', ESX.Math.GroupDigits(account.money)))
	end)
end)

-- Triple Job
RegisterServerEvent('esx_society:checkSocietyBalance3')
AddEventHandler('esx_society:checkSocietyBalance3', function(society)
	local xPlayer = ESX.GetPlayerFromId(source)
	local society = GetSociety(society)

	if xPlayer.job3.name ~= society.name then
		print(('esx_society: %s attempted to call checkSocietyBalance!'):format(xPlayer.identifier))
		return
	end

	TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
		TriggerClientEvent("esx:showNotification", xPlayer.source, TranslateCap('check_balance', ESX.Math.GroupDigits(account.money)))
	end)
end)

RegisterServerEvent('esx_society:withdrawMoney')
AddEventHandler('esx_society:withdrawMoney', function(societyName, amount)
	local source = source
	local society = GetSociety(societyName)
	if not society then
		print(('[^3WARNING^7] Player ^5%s^7 attempted to withdraw from non-existing society - ^5%s^7!'):format(source, societyName))
		return
	end
	local xPlayer = ESX.GetPlayerFromId(source)
	amount = ESX.Math.Round(tonumber(amount))
	if xPlayer.job.name ~= society.name then
		return print(('[^3WARNING^7] Player ^5%s^7 attempted to withdraw from society - ^5%s^7!'):format(source, society.name))
	end

	TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
		if amount > 0 and account.money >= amount then
			account.removeMoney(amount)
			xPlayer.addMoney(amount, "Society Withdraw")
			xPlayer.showNotification(TranslateCap('have_withdrawn', ESX.Math.GroupDigits(amount)))
		else
			xPlayer.showNotification(TranslateCap('invalid_amount'))
		end
	end)
end)

-- Double Job
RegisterServerEvent('esx_society:withdrawMoney2')
AddEventHandler('esx_society:withdrawMoney2', function(societyName, amount)
	local source = source
	local society = GetSociety(societyName)
	if not society then
		print(('[^3WARNING^7] Player ^5%s^7 attempted to withdraw from non-existing society - ^5%s^7!'):format(source, societyName))
		return
	end
	local xPlayer = ESX.GetPlayerFromId(source)
	amount = ESX.Math.Round(tonumber(amount))
	if xPlayer.job2.name ~= society.name then
		return print(('[^3WARNING^7] Player ^5%s^7 attempted to withdraw from society - ^5%s^7!'):format(source, society.name))
	end

	TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
		if amount > 0 and account.money >= amount then
			account.removeMoney(amount)
			xPlayer.addMoney(amount, "Society Withdraw")
			xPlayer.showNotification(TranslateCap('have_withdrawn', ESX.Math.GroupDigits(amount)))
		else
			xPlayer.showNotification(TranslateCap('invalid_amount'))
		end
	end)
end)

-- Triple Job
RegisterServerEvent('esx_society:withdrawMoney3')
AddEventHandler('esx_society:withdrawMoney3', function(societyName, amount)
	local source = source
	local society = GetSociety(societyName)
	if not society then
		print(('[^3WARNING^7] Player ^5%s^7 attempted to withdraw from non-existing society - ^5%s^7!'):format(source, societyName))
		return
	end
	local xPlayer = ESX.GetPlayerFromId(source)
	amount = ESX.Math.Round(tonumber(amount))
	if xPlayer.job3.name ~= society.name then
		return print(('[^3WARNING^7] Player ^5%s^7 attempted to withdraw from society - ^5%s^7!'):format(source, society.name))
	end

	TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
		if amount > 0 and account.money >= amount then
			account.removeMoney(amount)
			xPlayer.addMoney(amount, "Society Withdraw")
			xPlayer.showNotification(TranslateCap('have_withdrawn', ESX.Math.GroupDigits(amount)))
		else
			xPlayer.showNotification(TranslateCap('invalid_amount'))
		end
	end)
end)

RegisterServerEvent('esx_society:depositMoney')
AddEventHandler('esx_society:depositMoney', function(societyName, amount)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local society = GetSociety(societyName)
	if not society then
		print(('[^3WARNING^7] Player ^5%s^7 attempted to deposit to non-existing society - ^5%s^7!'):format(source, societyName))
		return
	end
	amount = ESX.Math.Round(tonumber(amount))

	if xPlayer.job.name ~= society.name then
		return print(('[^3WARNING^7] Player ^5%s^7 attempted to deposit to society - ^5%s^7!'):format(source, society.name))
	end
	if amount > 0 and xPlayer.getMoney() >= amount then
		TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
			xPlayer.removeMoney(amount, "Society Deposit")
			xPlayer.showNotification(TranslateCap('have_deposited', ESX.Math.GroupDigits(amount)))
			account.addMoney(amount)
		end)
	else
		xPlayer.showNotification(TranslateCap('invalid_amount'))
	end
end)

-- Double Job
RegisterServerEvent('esx_society:depositMoney2')
AddEventHandler('esx_society:depositMoney2', function(societyName, amount)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local society = GetSociety(societyName)
	if not society then
		print(('[^3WARNING^7] Player ^5%s^7 attempted to deposit to non-existing society - ^5%s^7!'):format(source, societyName))
		return
	end
	amount = ESX.Math.Round(tonumber(amount))

	if xPlayer.job2.name ~= society.name then
		return print(('[^3WARNING^7] Player ^5%s^7 attempted to deposit to society - ^5%s^7!'):format(source, society.name))
	end
	if amount > 0 and xPlayer.getMoney() >= amount then
		TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
			xPlayer.removeMoney(amount, "Society Deposit")
			xPlayer.showNotification(TranslateCap('have_deposited', ESX.Math.GroupDigits(amount)))
			account.addMoney(amount)
		end)
	else
		xPlayer.showNotification(TranslateCap('invalid_amount'))
	end
end)

-- triple Job
RegisterServerEvent('esx_society:depositMoney3')
AddEventHandler('esx_society:depositMoney3', function(societyName, amount)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local society = GetSociety(societyName)
	if not society then
		print(('[^3WARNING^7] Player ^5%s^7 attempted to deposit to non-existing society - ^5%s^7!'):format(source, societyName))
		return
	end
	amount = ESX.Math.Round(tonumber(amount))

	if xPlayer.job3.name ~= society.name then
		return print(('[^3WARNING^7] Player ^5%s^7 attempted to deposit to society - ^5%s^7!'):format(source, society.name))
	end
	if amount > 0 and xPlayer.getMoney() >= amount then
		TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
			xPlayer.removeMoney(amount, "Society Deposit")
			xPlayer.showNotification(TranslateCap('have_deposited', ESX.Math.GroupDigits(amount)))
			account.addMoney(amount)
		end)
	else
		xPlayer.showNotification(TranslateCap('invalid_amount'))
	end
end)

RegisterServerEvent('esx_society:washMoney')
AddEventHandler('esx_society:washMoney', function(society, amount)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local account = xPlayer.getAccount('black_money')
	amount = ESX.Math.Round(tonumber(amount))

	if xPlayer.job.name ~= society then
		return print(('[^3WARNING^7] Player ^5%s^7 attempted to wash money in society - ^5%s^7!'):format(source, society))
	end
	if amount and amount > 0 and account.money >= amount then
		xPlayer.removeAccountMoney('black_money', amount, "Washing")

		MySQL.insert('INSERT INTO society_moneywash (identifier, society, amount) VALUES (?, ?, ?)', {xPlayer.identifier, society, amount},
		function(rowsChanged)
			xPlayer.showNotification(TranslateCap('you_have', ESX.Math.GroupDigits(amount)))
		end)
	else
		xPlayer.showNotification(TranslateCap('invalid_amount'))
	end
end)

-- Double Job
RegisterServerEvent('esx_society:washMoney2')
AddEventHandler('esx_society:washMoney2', function(society, amount)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local account = xPlayer.getAccount('black_money')
	amount = ESX.Math.Round(tonumber(amount))

	if xPlayer.job2.name ~= society then
		return print(('[^3WARNING^7] Player ^5%s^7 attempted to wash money in society - ^5%s^7!'):format(source, society))
	end
	if amount and amount > 0 and account.money >= amount then
		xPlayer.removeAccountMoney('black_money', amount, "Washing")

		MySQL.insert('INSERT INTO society_moneywash (identifier, society, amount) VALUES (?, ?, ?)', {xPlayer.identifier, society, amount},
		function(rowsChanged)
			xPlayer.showNotification(TranslateCap('you_have', ESX.Math.GroupDigits(amount)))
		end)
	else
		xPlayer.showNotification(TranslateCap('invalid_amount'))
	end
end)

-- Triple Job
RegisterServerEvent('esx_society:washMoney3')
AddEventHandler('esx_society:washMoney3', function(society, amount)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local account = xPlayer.getAccount('black_money')
	amount = ESX.Math.Round(tonumber(amount))

	if xPlayer.job3.name ~= society then
		return print(('[^3WARNING^7] Player ^5%s^7 attempted to wash money in society - ^5%s^7!'):format(source, society))
	end
	if amount and amount > 0 and account.money >= amount then
		xPlayer.removeAccountMoney('black_money', amount, "Washing")

		MySQL.insert('INSERT INTO society_moneywash (identifier, society, amount) VALUES (?, ?, ?)', {xPlayer.identifier, society, amount},
		function(rowsChanged)
			xPlayer.showNotification(TranslateCap('you_have', ESX.Math.GroupDigits(amount)))
		end)
	else
		xPlayer.showNotification(TranslateCap('invalid_amount'))
	end
end)

RegisterServerEvent('esx_society:putVehicleInGarage')
AddEventHandler('esx_society:putVehicleInGarage', function(societyName, vehicle)
	local source = source
	local society = GetSociety(societyName)
	if not society then
		print(('[^3WARNING^7] Player ^5%s^7 attempted to put vehicle in non-existing society garage - ^5%s^7!'):format(source, societyName))
		return
	end
	TriggerEvent('esx_datastore:getSharedDataStore', society.datastore, function(store)
		local garage = store.get('garage') or {}
		table.insert(garage, vehicle)
		store.set('garage', garage)
	end)
end)

RegisterServerEvent('esx_society:removeVehicleFromGarage')
AddEventHandler('esx_society:removeVehicleFromGarage', function(societyName, vehicle)
	local source = source
	local society = GetSociety(societyName)
	if not society then
		print(('[^3WARNING^7] Player ^5%s^7 attempted to remove vehicle from non-existing society garage - ^5%s^7!'):format(source, societyName))
		return
	end
	TriggerEvent('esx_datastore:getSharedDataStore', society.datastore, function(store)
		local garage = store.get('garage') or {}

		for i=1, #garage, 1 do
			if garage[i].plate == vehicle.plate then
				table.remove(garage, i)
				break
			end
		end

		store.set('garage', garage)
	end)
end)

ESX.RegisterServerCallback('esx_society:getSocietyMoney', function(source, cb, societyName)
	local society = GetSociety(societyName)
	if not society then
		print(('[^3WARNING^7] Player ^5%s^7 attempted to get money from non-existing society - ^5%s^7!'):format(source, societyName))
		return cb(0)
	end
	if not society then
		return cb(0)
	end
	TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
		cb(account.money or 0)
	end)
end)

ESX.RegisterServerCallback('esx_society:getEmployees', function(source, cb, society)
	local employees = {}

	local xPlayers = ESX.GetExtendedPlayers('job', society)
	for i=1, #(xPlayers) do 
		local xPlayer = xPlayers[i]

		local name = xPlayer.name
		if Config.EnableESXIdentity and name == GetPlayerName(xPlayer.source) then
			name = xPlayer.get('firstName') .. ' ' .. xPlayer.get('lastName')
		end

		table.insert(employees, {
			name = name,
			identifier = xPlayer.identifier,
			job = {
				name = society,
				label = xPlayer.job.label,
				grade = xPlayer.job.grade,
				grade_name = xPlayer.job.grade_name,
				grade_label = xPlayer.job.grade_label
			}
		})
	end
		
	local query = "SELECT identifier, job_grade FROM `users` WHERE `job`= ? ORDER BY job_grade DESC"

	if Config.EnableESXIdentity then
		query = "SELECT identifier, job_grade, firstname, lastname FROM `users` WHERE `job`= ? ORDER BY job_grade DESC"
	end

	MySQL.query(query, {society},
	function(result)
		for k, row in pairs(result) do
			local alreadyInTable
			local identifier = row.identifier

			for k, v in pairs(employees) do
				if v.identifier == identifier then
					alreadyInTable = true
				end
			end

			if not alreadyInTable then
				local name = "Name not found." -- maybe this should be a locale instead ¯\_(ツ)_/¯

				if Config.EnableESXIdentity then
					name = row.firstname .. ' ' .. row.lastname 
				end
				
				table.insert(employees, {
					name = name,
					identifier = identifier,
					job = {
						name = society,
						label = Jobs[society].label,
						grade = row.job_grade,
						grade_name = Jobs[society].grades[tostring(row.job_grade)].name,
						grade_label = Jobs[society].grades[tostring(row.job_grade)].label
					}
				})
			end
		end

		cb(employees)
	end)

end)

-- Second Job
ESX.RegisterServerCallback('esx_society:getEmployees2', function(source, cb, society)
	local employees = {}

	local xPlayers = ESX.GetExtendedPlayers('job2', society)
	for i=1, #(xPlayers) do 
		local xPlayer = xPlayers[i]

		local name = xPlayer.name
		if Config.EnableESXIdentity and name == GetPlayerName(xPlayer.source) then
			name = xPlayer.get('firstName') .. ' ' .. xPlayer.get('lastName')
		end

		table.insert(employees, {
			name = name,
			identifier = xPlayer.identifier,
			job2 = {
				name = society,
				label = xPlayer.job2.label,
				grade = xPlayer.job2.grade,
				grade_name = xPlayer.job2.grade_name,
				grade_label = xPlayer.job2.grade_label
			}
		})
	end
		
	local query = "SELECT identifier, job2_grade FROM `users` WHERE `job2`= ? ORDER BY job2_grade DESC"

	if Config.EnableESXIdentity then
		query = "SELECT identifier, job2_grade, firstname, lastname FROM `users` WHERE `job2`= ? ORDER BY job2_grade DESC"
	end

	MySQL.query(query, {society},
	function(result)
		for k, row in pairs(result) do
			local alreadyInTable
			local identifier = row.identifier

			for k, v in pairs(employees) do
				if v.identifier == identifier then
					alreadyInTable = true
				end
			end

			if not alreadyInTable then
				local name = "Name not found." -- maybe this should be a locale instead ¯\_(ツ)_/¯

				if Config.EnableESXIdentity then
					name = row.firstname .. ' ' .. row.lastname 
				end
				
				table.insert(employees, {
					name = name,
					identifier = identifier,
					job2 = {
						name = society,
						label = Jobs[society].label,
						grade = row.job2_grade,
						grade_name = Jobs[society].grades[tostring(row.job2_grade)].name,
						grade_label = Jobs[society].grades[tostring(row.job2_grade)].label
					}
				})
			end
		end

		cb(employees)
	end)

end)

-- Triple Job
ESX.RegisterServerCallback('esx_society:getEmployees3', function(source, cb, society)
	local employees = {}

	local xPlayers = ESX.GetExtendedPlayers('job3', society)
	for i=1, #(xPlayers) do 
		local xPlayer = xPlayers[i]

		local name = xPlayer.name
		if Config.EnableESXIdentity and name == GetPlayerName(xPlayer.source) then
			name = xPlayer.get('firstName') .. ' ' .. xPlayer.get('lastName')
		end

		table.insert(employees, {
			name = name,
			identifier = xPlayer.identifier,
			job3 = {
				name = society,
				label = xPlayer.job3.label,
				grade = xPlayer.job3.grade,
				grade_name = xPlayer.job3.grade_name,
				grade_label = xPlayer.job3.grade_label
			}
		})
	end
		
	local query = "SELECT identifier, job3_grade FROM `users` WHERE `job3`= ? ORDER BY job3_grade DESC"

	if Config.EnableESXIdentity then
		query = "SELECT identifier, job3_grade, firstname, lastname FROM `users` WHERE `job3`= ? ORDER BY job3_grade DESC"
	end

	MySQL.query(query, {society},
	function(result)
		for k, row in pairs(result) do
			local alreadyInTable
			local identifier = row.identifier

			for k, v in pairs(employees) do
				if v.identifier == identifier then
					alreadyInTable = true
				end
			end

			if not alreadyInTable then
				local name = "Name not found." -- maybe this should be a locale instead ¯\_(ツ)_/¯

				if Config.EnableESXIdentity then
					name = row.firstname .. ' ' .. row.lastname 
				end
				
				table.insert(employees, {
					name = name,
					identifier = identifier,
					job3 = {
						name = society,
						label = Jobs[society].label,
						grade = row.job3_grade,
						grade_name = Jobs[society].grades[tostring(row.job3_grade)].name,
						grade_label = Jobs[society].grades[tostring(row.job3_grade)].label
					}
				})
			end
		end

		cb(employees)
	end)

end)

ESX.RegisterServerCallback('esx_society:getJob', function(source, cb, society)
	if not Jobs[society] then
		return cb(false)
	end

	local job = json.decode(json.encode(Jobs[society]))
	local grades = {}

	for k,v in pairs(job.grades) do
		table.insert(grades, v)
	end

	table.sort(grades, function(a, b)
		return a.grade < b.grade
	end)

	job.grades = grades

	cb(job)
end)

-- Double Job
ESX.RegisterServerCallback('esx_society:getJob2', function(source, cb, society)
	if not Jobs[society] then
		return cb(false)
	end

	local job2 = json.decode(json.encode(Jobs[society]))
	local grades = {}

	for k,v in pairs(job2.grades) do
		table.insert(grades, v)
	end

	table.sort(grades, function(a, b)
		return a.grade < b.grade
	end)

	job2.grades = grades

	cb(job2)
end)

-- Triple Job
ESX.RegisterServerCallback('esx_society:getJob3', function(source, cb, society)
	if not Jobs[society] then
		return cb(false)
	end

	local job3 = json.decode(json.encode(Jobs[society]))
	local grades = {}

	for k,v in pairs(job3.grades) do
		table.insert(grades, v)
	end

	table.sort(grades, function(a, b)
		return a.grade < b.grade
	end)

	job3.grades = grades

	cb(job3)
end)

ESX.RegisterServerCallback('esx_society:setJob', function(source, cb, identifier, job, grade, actionType)
	local xPlayer = ESX.GetPlayerFromId(source)
	local isBoss = xPlayer.job.grade_name == 'boss'
	local xTarget = ESX.GetPlayerFromIdentifier(identifier)

	if not isBoss then
		print(('[^3WARNING^7] Player ^5%s^7 attempted to setJob for Player ^5%s^7!'):format(source, xTarget.source))
		return cb()
	end

	if not xTarget then
		MySQL.update('UPDATE users SET job = ?, job_grade = ? WHERE identifier = ?', {job, grade, identifier},
		function()
			cb()
		end)
		return
	end

	xTarget.setJob(job, grade)

	if actionType == 'hire' then
		xTarget.showNotification(TranslateCap('you_have_been_hired', job))
		xPlayer.showNotification(TranslateCap("you_have_hired", xTarget.getName()))
	elseif actionType == 'promote' then
		xTarget.showNotification(TranslateCap('you_have_been_promoted'))
		xPlayer.showNotification(TranslateCap("you_have_promoted", xTarget.getName(), xTarget.getJob().label))
	elseif actionType == 'fire' then
		xTarget.showNotification(TranslateCap('you_have_been_fired', xTarget.getJob().label))
		xPlayer.showNotification(TranslateCap("you_have_fired", xTarget.getName()))
	end

	cb()
end)

-- Double Job
ESX.RegisterServerCallback('esx_society:setJob2', function(source, cb, identifier, job2, grade2, actionType)
	local xPlayer = ESX.GetPlayerFromId(source)
	local isBoss = xPlayer.job2.grade_name == 'boss'
	local xTarget = ESX.GetPlayerFromIdentifier(identifier)

	if not isBoss then
		print(('[^3WARNING^7] Player ^5%s^7 attempted to setJob2 for Player ^5%s^7!'):format(source, xTarget.source))
		return cb()
	end

	if not xTarget then
		MySQL.update('UPDATE users SET job2 = ?, job2_grade = ? WHERE identifier = ?', {job2, grade2, identifier},
		function()
			cb()
		end)
		return
	end

	xTarget.setJob2(job2, grade2)

	if actionType == 'hire' then
		xTarget.showNotification(TranslateCap('you_have_been_hired', job2))
		xPlayer.showNotification(TranslateCap("you_have_hired", xTarget.getName()))
	elseif actionType == 'promote' then
		xTarget.showNotification(TranslateCap('you_have_been_promoted'))
		xPlayer.showNotification(TranslateCap("you_have_promoted", xTarget.getName(), xTarget.getJob2().label))
	elseif actionType == 'fire' then
		xTarget.showNotification(TranslateCap('you_have_been_fired', xTarget.getJob2().label))
		xPlayer.showNotification(TranslateCap("you_have_fired", xTarget.getName()))
	end

	cb()
end)

-- Triple Job
ESX.RegisterServerCallback('esx_society:setJob3', function(source, cb, identifier, job3, grade3, actionType)
	local xPlayer = ESX.GetPlayerFromId(source)
	local isBoss = xPlayer.job3.grade_name == 'boss'
	local xTarget = ESX.GetPlayerFromIdentifier(identifier)

	if not isBoss then
		print(('[^3WARNING^7] Player ^5%s^7 attempted to setJob3 for Player ^5%s^7!'):format(source, xTarget.source))
		return cb()
	end

	if not xTarget then
		MySQL.update('UPDATE users SET job3 = ?, job3_grade = ? WHERE identifier = ?', {job3, grade3, identifier},
		function()
			cb()
		end)
		return
	end

	xTarget.setJob3(job3, grade3)

	if actionType == 'hire' then
		xTarget.showNotification(TranslateCap('you_have_been_hired', job3))
		xPlayer.showNotification(TranslateCap("you_have_hired", xTarget.getName()))
	elseif actionType == 'promote' then
		xTarget.showNotification(TranslateCap('you_have_been_promoted'))
		xPlayer.showNotification(TranslateCap("you_have_promoted", xTarget.getName(), xTarget.getJob3().label))
	elseif actionType == 'fire' then
		xTarget.showNotification(TranslateCap('you_have_been_fired', xTarget.getJob3().label))
		xPlayer.showNotification(TranslateCap("you_have_fired", xTarget.getName()))
	end

	cb()
end)


ESX.RegisterServerCallback('esx_society:setJobSalary', function(source, cb, job, grade, salary)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == job and xPlayer.job.grade_name == 'boss' then
		if salary <= Config.MaxSalary then
			MySQL.update('UPDATE job_grades SET salary = ? WHERE job_name = ? AND grade = ?', {salary, job, grade},
			function(rowsChanged)
				Jobs[job].grades[tostring(grade)].salary = salary
				ESX.RefreshJobs()
				Wait(1)
				local xPlayers = ESX.GetExtendedPlayers('job', job)
				for _, xTarget in pairs(xPlayers) do

					if xTarget.job.grade == grade then
						xTarget.setJob(job, grade)
					end
				end
				cb()
			end)
		else
			print(('[^3WARNING^7] Player ^5%s^7 attempted to setJobSalary over the config limit for ^5%s^7!'):format(source, job))
			cb()
		end
	else
		print(('[^3WARNING^7] Player ^5%s^7 attempted to setJobSalary for ^5%s^7!'):format(source, job))
		cb()
	end
end)

-- Second Job
ESX.RegisterServerCallback('esx_society:setJobSalary2', function(source, cb, job2, grade, salary)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job2.name == job2 and xPlayer.job2.grade_name == 'boss' then
		if salary <= Config.MaxSalary then
			MySQL.update('UPDATE job_grades SET salary = ? WHERE job_name = ? AND grade = ?', {salary, job2, grade},
			function(rowsChanged)
				Jobs[job2].grades[tostring(grade)].salary = salary
				ESX.RefreshJobs()
				Wait(1)
				local xPlayers = ESX.GetExtendedPlayers('job2', job2)
				for _, xTarget in pairs(xPlayers) do

					if xTarget.job2.grade == grade then
						xTarget.setJob(job2, grade)
					end
				end
				cb()
			end)
		else
			print(('[^3WARNING^7] Player ^5%s^7 attempted to setJobSalary2 over the config limit for ^5%s^7!'):format(source, job2))
			cb()
		end
	else
		print(('[^3WARNING^7] Player ^5%s^7 attempted to setJobSalary2 for ^5%s^7!'):format(source, job2))
		cb()
	end
end)

-- Triple Job
ESX.RegisterServerCallback('esx_society:setJobSalary3', function(source, cb, job3, grade, salary)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job3.name == job3 and xPlayer.job3.grade_name == 'boss' then
		if salary <= Config.MaxSalary then
			MySQL.update('UPDATE job_grades SET salary = ? WHERE job_name = ? AND grade = ?', {salary, job3, grade},
			function(rowsChanged)
				Jobs[job3].grades[tostring(grade)].salary = salary
				ESX.RefreshJobs()
				Wait(1)
				local xPlayers = ESX.GetExtendedPlayers('job3', job3)
				for _, xTarget in pairs(xPlayers) do

					if xTarget.job3.grade == grade then
						xTarget.setJob(job3, grade)
					end
				end
				cb()
			end)
		else
			print(('[^3WARNING^7] Player ^5%s^7 attempted to setJobSalary3 over the config limit for ^5%s^7!'):format(source, job3))
			cb()
		end
	else
		print(('[^3WARNING^7] Player ^5%s^7 attempted to setJobSalary3 for ^5%s^7!'):format(source, job3))
		cb()
	end
end)

ESX.RegisterServerCallback('esx_society:setJobLabel', function(source, cb, job, grade, label)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == job and xPlayer.job.grade_name == 'boss' then
			MySQL.update('UPDATE job_grades SET label = ? WHERE job_name = ? AND grade = ?', {label, job, grade},
			function(rowsChanged)
				Jobs[job].grades[tostring(grade)].label = label
				ESX.RefreshJobs()
				Wait(1)
				local xPlayers = ESX.GetExtendedPlayers('job', job)
				for _, xTarget in pairs(xPlayers) do

					if xTarget.job.grade == grade then
						xTarget.setJob(job, grade)
					end
				end
				cb()
			end)
	else
		print(('[^3WARNING^7] Player ^5%s^7 attempted to setJobLabel for ^5%s^7!'):format(source, job))
		cb()
	end
end)

-- Double Job
ESX.RegisterServerCallback('esx_society:setJobLabel2', function(source, cb, job2, grade, label)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job2.name == job2 and xPlayer.job2.grade_name == 'boss' then
			MySQL.update('UPDATE job_grades SET label = ? WHERE job_name = ? AND grade = ?', {label, job2, grade},
			function(rowsChanged)
				Jobs[job2].grades[tostring(grade)].label = label
				ESX.RefreshJobs()
				Wait(1)
				local xPlayers = ESX.GetExtendedPlayers('job2', job2)
				for _, xTarget in pairs(xPlayers) do

					if xTarget.job2.grade == grade then
						xTarget.setJob2(job2, grade)
					end
				end
				cb()
			end)
	else
		print(('[^3WARNING^7] Player ^5%s^7 attempted to setJobLabel2 for ^5%s^7!'):format(source, job2))
		cb()
	end
end)

-- Triple Job
ESX.RegisterServerCallback('esx_society:setJobLabel3', function(source, cb, job3, grade, label)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job3.name == job3 and xPlayer.job3.grade_name == 'boss' then
			MySQL.update('UPDATE job_grades SET label = ? WHERE job_name = ? AND grade = ?', {label, job3, grade},
			function(rowsChanged)
				Jobs[job3].grades[tostring(grade)].label = label
				ESX.RefreshJobs()
				Wait(1)
				local xPlayers = ESX.GetExtendedPlayers('job3', job3)
				for _, xTarget in pairs(xPlayers) do

					if xTarget.job3.grade == grade then
						xTarget.setJob3(job3, grade)
					end
				end
				cb()
			end)
	else
		print(('[^3WARNING^7] Player ^5%s^7 attempted to setJobLabel3 for ^5%s^7!'):format(source, job3))
		cb()
	end
end)

local getOnlinePlayers, onlinePlayers = false, {}
ESX.RegisterServerCallback('esx_society:getOnlinePlayers', function(source, cb)
	if getOnlinePlayers == false and next(onlinePlayers) == nil then -- Prevent multiple xPlayer loops from running in quick succession
		getOnlinePlayers, onlinePlayers = true, {}
		
		local xPlayers = ESX.GetExtendedPlayers()
		for i=1, #(xPlayers) do 
			local xPlayer = xPlayers[i]
			table.insert(onlinePlayers, {
				source = xPlayer.source,
				identifier = xPlayer.identifier,
				name = xPlayer.name,
				job = xPlayer.job
			})
		end
		cb(onlinePlayers)
		getOnlinePlayers = false
		Wait(1000) -- For the next second any extra requests will receive the cached list
		onlinePlayers = {}
		return
	end
	while getOnlinePlayers do Wait(0) end -- Wait for the xPlayer loop to finish
	cb(onlinePlayers)
end)

-- Double Job
local getOnlinePlayers, onlinePlayers = false, {}
ESX.RegisterServerCallback('esx_society:getOnlinePlayers2', function(source, cb)
	if getOnlinePlayers == false and next(onlinePlayers) == nil then -- Prevent multiple xPlayer loops from running in quick succession
		getOnlinePlayers, onlinePlayers = true, {}
		
		local xPlayers = ESX.GetExtendedPlayers()
		for _, xPlayer in pairs(xPlayers) do
			table.insert(onlinePlayers, {
				source = xPlayer.source,
				identifier = xPlayer.identifier,
				name = xPlayer.name,
				job2 = xPlayer.job2
			})
		end
		cb(onlinePlayers)
		getOnlinePlayers = false
		Citizen.Wait(1000) -- For the next second any extra requests will receive the cached list
		onlinePlayers = {}
		return
	end
	while getOnlinePlayers do Citizen.Wait(10) end -- Wait for the xPlayer loop to finish
	cb(onlinePlayers)
end)

-- Triple Job
local getOnlinePlayers, onlinePlayers = false, {}
ESX.RegisterServerCallback('esx_society:getOnlinePlayers3', function(source, cb)
	if getOnlinePlayers == false and next(onlinePlayers) == nil then -- Prevent multiple xPlayer loops from running in quick succession
		getOnlinePlayers, onlinePlayers = true, {}
		
		local xPlayers = ESX.GetExtendedPlayers()
		for _, xPlayer in pairs(xPlayers) do
			table.insert(onlinePlayers, {
				source = xPlayer.source,
				identifier = xPlayer.identifier,
				name = xPlayer.name,
				job3 = xPlayer.job3
			})
		end
		cb(onlinePlayers)
		getOnlinePlayers = false
		Citizen.Wait(1000) -- For the next second any extra requests will receive the cached list
		onlinePlayers = {}
		return
	end
	while getOnlinePlayers do Citizen.Wait(10) end -- Wait for the xPlayer loop to finish
	cb(onlinePlayers)
end)

ESX.RegisterServerCallback('esx_society:getVehiclesInGarage', function(source, cb, societyName)
	local society = GetSociety(societyName)
	if not society then
		print(('[^3WARNING^7] Attempting To get a non-existing society - %s!'):format(societyName))
		return
	end
	TriggerEvent('esx_datastore:getSharedDataStore', society.datastore, function(store)
		local garage = store.get('garage') or {}
		cb(garage)
	end)
end)

ESX.RegisterServerCallback('esx_society:isBoss', function(source, cb, job)
	cb(isPlayerBoss(source, job))
end)

-- Double Job
ESX.RegisterServerCallback('esx_society:isBoss2', function(source, cb, job2)
	cb(isPlayerBoss2(source, job2))
end)

-- Triple Job
ESX.RegisterServerCallback('esx_society:isBoss3', function(source, cb, job3)
	cb(isPlayerBoss3(source, job3))
end)

function isPlayerBoss(playerId, job)
	local xPlayer = ESX.GetPlayerFromId(playerId)

	if xPlayer.job.name == job and xPlayer.job.grade_name == 'boss' then
		return true
	else
		print(('esx_society: %s attempted open a society boss menu!'):format(xPlayer.identifier))
		return false
	end
end

-- Double Job
function isPlayerBoss2(playerId, job2)
	local xPlayer = ESX.GetPlayerFromId(playerId)

	if xPlayer.job2.name == job2 and xPlayer.job2.grade_name == 'boss' then
		return true
	else
		print(('esx_society: %s attempted open a society boss2 menu!'):format(xPlayer.identifier))
		return false
	end
end

-- Triple Job
function isPlayerBoss3(playerId, job3)
	local xPlayer = ESX.GetPlayerFromId(playerId)

	if xPlayer.job3.name == job3 and xPlayer.job3.grade_name == 'boss' then
		return true
	else
		print(('esx_society: %s attempted open a society boss3 menu!'):format(xPlayer.identifier))
		return false
	end
end

function WashMoneyCRON(d, h, m)
	MySQL.query('SELECT * FROM society_moneywash', function(result)
		for i=1, #result, 1 do
			local society = GetSociety(result[i].society)
			local xPlayer = ESX.GetPlayerFromIdentifier(result[i].identifier)

			-- add society money
			TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
				account.addMoney(result[i].amount)
			end)

			-- send notification if player is online
			if xPlayer then
				xPlayer.showNotification(TranslateCap('you_have_laundered', ESX.Math.GroupDigits(result[i].amount)))
			end

		end
		MySQL.update('DELETE FROM society_moneywash')
	end)
end

TriggerEvent('cron:runAt', 3, 0, WashMoneyCRON)
