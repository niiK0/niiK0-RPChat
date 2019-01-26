
function getIdentity(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
	if result[1] ~= nil then
		local identity = result[1]

		return {
			identifier = identity['identifier'],
			firstname = identity['firstname'],
			lastname = identity['lastname'],
			dateofbirth = identity['dateofbirth'],
			sex = identity['sex'],
			height = identity['height'],
			job = identity['job']
		}
	else
		return nil
	end
end

  AddEventHandler('chatMessage', function(source, name, message)
      if string.sub(message, 1, string.len("/")) ~= "/" then
        local name = getIdentity(source)
		TriggerClientEvent("sendProximityMessage", -1, source, name.firstname, message)
      end
      CancelEvent()
  end)

  TriggerEvent('es:addCommand', 'me', function(source, args, user)
      local name = getIdentity(source)
      TriggerClientEvent("sendProximityMessageMe", -1, source, name.firstname, table.concat(args, " "))
  end, {help = 'Escrever acoes. [IC]'})
  
  TriggerEvent('es:addCommand', 'looc', function(source, args, user)
      local name = getIdentity(source)
      TriggerClientEvent("sendProximityMessageLOOC", -1, source, name.firstname, table.concat(args, " "))
  end, {help = 'Enviar uma mensagem OOC local.'})

  TriggerEvent('es:addCommand', 'do', function(source, args, user)
      local name = getIdentity(source)
      TriggerClientEvent("sendProximityMessageDo", -1, source, name.firstname, table.concat(args, " "))
  end, {help = 'Escrever pensamentos. [IC]'})
 
 TriggerEvent('es:addCommand', 'alt', function(source, args, user)
      local name = getIdentity(source)
      TriggerClientEvent("sendProximityMessageAlt", -1, source, name.firstname, table.concat(args, " "))
  end, {help = 'Enviar um Altifalante. [IC]'})

  TriggerEvent('es:addCommand', 'twt', function(source, args, user)
	local name = getIdentity(source)
  	TriggerClientEvent('chatMessage', -1, "^0[^4Twitter^0] (^5@" .. name.firstname .. name.lastname .. "^0)", {30, 144, 255}, table.concat(args, " "))
  end, {help = 'Enviar um tweet. [IC]'})

  TriggerEvent('es:addCommand', 'ooc', function(source, args, user)
  	TriggerClientEvent('chatMessage', -1, "OOC | " .. GetPlayerName(source), {128, 128, 128}, table.concat(args, " "))
  end, {help = 'Enviar uma mensagem OOC geral.'})
   
   TriggerEvent('es:addCommand', 'anon', function(source, args, user)
  	TriggerClientEvent('chatMessage', -1, "^0[^9Anonimo^0]", {30, 144, 255}, table.concat(args, " "))
  end, {help = 'Enviar uma mensagem em Anonimo [IC] '})

-- AMMU JOB
   -- TriggerEvent('es:addCommand', 'ammu', function(source, args, user)
	-- local job = getIdentity(source)
	-- if job.job == 'ammu' then
		-- TriggerClientEvent('chatMessage', -1, "^0[^1AmmuNation^0] ", {30, 144, 255}, table.concat(args, " "))
	-- end
  -- end, {help = 'Enviar anuncio(Ammunation) [IC]'})
  
  TriggerEvent('es:addCommand', 'meca', function(source, args, user)
	local job = getIdentity(source)
	if job.job == 'mecano' then
		TriggerClientEvent('chatMessage', -1, "^0[^9Mecanico^0] (^5@" .. job.firstname .. job.lastname .. "^0)", {30, 144, 255}, table.concat(args, " "))
	end
  end, {help = 'Enviar anuncio(Mecanico) [IC]'}) 
  
  TriggerEvent('es:addCommand', 'psp', function(source, args, user)
	local job = getIdentity(source)
	if job.job == 'police' then
		TriggerClientEvent('chatMessage', -1, "^0[^5PSP^0] (^5@" .. job.firstname .. job.lastname .. "^0)", {30, 144, 255}, table.concat(args, " "))
	end
  end, {help = 'Enviar anuncio(Policia) [IC]'}) 
  
  TriggerEvent('es:addCommand', 'inem', function(source, args, user)
	local job = getIdentity(source)
	if job.job == 'ambulance' then
		TriggerClientEvent('chatMessage', -1, "^0[^1INEM^0] (^3@" .. job.firstname .. job.lastname .. "^0)", {30, 144, 255}, table.concat(args, " "))
	end
  end, {help = 'Enviar anuncio(INEM) [IC]'})
  
-- BAHAMAS JOB
  -- TriggerEvent('es:addCommand', 'baham', function(source, args, user)
	-- local job = getIdentity(source)
	-- if job.job == 'bahama' then
		-- TriggerClientEvent('chatMessage', -1, "^0[^9Bahamas^0]", {30, 144, 255}, table.concat(args, " "))
	-- end
  -- end, {help = 'Enviar anuncio(Bahamas) [IC]'}) 
  
function stringsplit(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t={} ; i=1
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		t[i] = str
		i = i + 1
	end
	return t
end
