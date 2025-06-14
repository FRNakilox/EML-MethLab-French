AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')

function spawnBuyer()
    -- Vérifie si le dossier "eml" existe dans les données, sinon le crée
    if not file.IsDir("eml", "DATA") then
        file.CreateDir("eml", "DATA")
    end

    -- Vérifie si le dossier spécifique à la map existe, sinon le crée
    if not file.IsDir("eml/methbuyer/"..string.lower(game.GetMap()), "DATA") then
        file.CreateDir("eml/methbuyer/"..string.lower(game.GetMap()), "DATA")
    end

    -- Parcourt tous les fichiers texte dans le dossier de la map
    for k, v in pairs(file.Find("eml/methbuyer/"..string.lower(game.GetMap()).."/*.txt", "DATA")) do
        local methPosFile = file.Read("eml/methbuyer/"..string.lower(game.GetMap()).."/"..v, "DATA")

        local spawnNumber = string.Explode(";", methPosFile)

        local methPos = Vector(spawnNumber[1], spawnNumber[2], spawnNumber[3])
        local methAngles = Angle(tonumber(spawnNumber[4]), spawnNumber[5], spawnNumber[6])

        local methBuyer = ents.Create("eml_buyer")
        methBuyer:SetPos(methPos)
        methBuyer:SetAngles(methAngles)
        methBuyer:Spawn()
    end
end
timer.Simple(1, spawnBuyer)

function spawnMethPos(ply, cmd, args)
    if (ply:IsAdmin() or ply:IsSuperAdmin()) then
        local fileMethName = args[1]

        if not fileMethName then
            ply:SendLua("local tab = {Color(1,241,249,255), [[|EML| ]], Color(255,255,255), [[Choisissez un nom pour votre PNJ accro à la meth !]] } chat.AddText(unpack(tab))")
            return
        end

        if file.Exists("eml/methbuyer/"..string.lower(game.GetMap()).."/meth_"..fileMethName..".txt", "DATA") then
            ply:SendLua("local tab = {Color(1,241,249,255), [[|EML| ]], Color(255,255,255), [[Ce nom est déjà utilisé, choisissez-en un autre ou supprimez-le avec la commande 'methbuyer_remove "..fileMethName.."' dans la console.]] } chat.AddText(unpack(tab))")
            return
        end

        local methVector = string.Explode(" ", tostring(ply:GetEyeTrace().HitPos))
        local methAngles = string.Explode(" ", tostring(ply:GetAngles()+Angle(0, -180, 0)))

        file.Write("eml/methbuyer/"..string.lower(game.GetMap()).."/meth_"..fileMethName..".txt", ""..(methVector[1])..";"..(methVector[2])..";"..(methVector[3])..";"..(methAngles[1])..";"..(methAngles[2])..";"..(methAngles[3]).."", "DATA")
        ply:SendLua("local tab = {Color(1,241,249,255), [[|EML| ]], Color(255,255,255), [[Nouvelle position pour le PNJ accro à la meth définie. Redémarrez votre serveur !]] } chat.AddText(unpack(tab))")
    else
        ply:SendLua("local tab = {Color(1,241,249,255), [[|EML| ]], Color(255,255,255), [[Seuls les admins et superadmins peuvent effectuer cette action.]] } chat.AddText(unpack(tab))")
    end
end
concommand.Add("methbuyer_setpos", spawnMethPos)

function removeMethPos(ply, cmd, args)
    if (ply:IsAdmin() or ply:IsSuperAdmin()) then
        local fileMethName = args[1]

        if not fileMethName then
            ply:SendLua("local tab = {Color(1,241,249,255), [[|EML| ]], Color(255,255,255), [[Veuillez entrer un nom de fichier !]] } chat.AddText(unpack(tab))")
            return
        end

        if file.Exists("eml/methbuyer/"..string.lower(game.GetMap()).."/meth_"..fileMethName..".txt", "DATA") then
            file.Delete("eml/methbuyer/"..string.lower(game.GetMap()).."/meth_"..fileMethName..".txt")
            ply:SendLua("local tab = {Color(1,241,249,255), [[|EML| ]], Color(255,255,255), [[Ce PNJ a été supprimé. Redémarrez votre serveur !]] } chat.AddText(unpack(tab))")
            return
        end

    else
        ply:SendLua("local tab = {Color(1,241,249,255), [[|EML| ]], Color(255,255,255), [[Seuls les admins et superadmins peuvent effectuer cette action.]] } chat.AddText(unpack(tab))")
    end
end
concommand.Add("methbuyer_remove", removeMethPos)

function ENT:Initialize()
    self:SetModel("models/Humans/Group02/male_03.mdl")
    self:SetHullType(HULL_HUMAN)
    self:SetHullSizeNormal()
    self:SetNPCState(NPC_STATE_SCRIPT)
    self:SetSolid(SOLID_BBOX)
    self:SetUseType(SIMPLE_USE)
    self:SetBloodColor(BLOOD_COLOR_RED)

    self.Removed = true

    if EML_Meth_SalesmanText then
        local buyerText = ents.Create("eml_buyer_text")
        buyerText:SetPos(self:GetPos() + Vector(0, 0, 72))
        buyerText:SetParent(self)
        buyerText:Spawn()
    end
end

function ENT:AcceptInput(name, activator, caller)
    if (not self.nextUse or CurTime() >= self.nextUse) then
        if (name == "Use" and caller:IsPlayer() and (caller:GetNWInt("player_meth") == 0)) then
            self:EmitSound("vo/npc/male01/gethellout.wav")
            caller:SendLua("local tab = {Color(1,241,249,255), [[Acheteur de Meth : ]], Color(255,255,255), [["..table.Random(EML_Meth_Salesman_NoMeth).."]] } chat.AddText(unpack(tab))")
            timer.Simple(0.25, function() self:EmitSound(table.Random(EML_Meth_Salesman_NoMeth_Sound), 100, 100) end)
        elseif (name == "Use" and caller:IsPlayer() and (caller:GetNWInt("player_meth") > 0)) then
            caller:addMoney(caller:GetNWInt("player_meth"))
            caller:SendLua("local tab = {Color(1,241,249,255), [[Acheteur de Meth : ]], Color(255,255,255), [["..table.Random(EML_Meth_Salesman_GotMeth)..", voici ton argent ]], Color(128, 255, 128), [["..caller:GetNWInt("player_meth").."$.]] } chat.AddText(unpack(tab))")
            caller:SetNWInt("player_meth", 0)
            if (EML_Meth_MakeWanted) then
                caller:wanted(nil, "Fabrication de Méthamphétamine")
            end
            timer.Simple(0.25, function() self:EmitSound(table.Random(EML_Meth_Salesman_GotMeth_Sound), 100, 100) end)
            timer.Simple(2.5, function() self:EmitSound("vo/npc/male01/moan0"..math.random(1, 5)..".wav") end)
        end
        self.nextUse = CurTime() + 1
    end
end

function ENT:OnTakeDamage(dmginfo)
    return false
end
