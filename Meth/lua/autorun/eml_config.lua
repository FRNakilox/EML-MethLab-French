--[[--------------------------------------------------------
  -- DISTANCE DE DESSIN 3D2D --
-----------------------------------------------------------]]
EML_DrawDistance = 300


--[[--------------------------------------------------------
  -- CONFIGURATION DU POÊLE --
-----------------------------------------------------------]]
EML_Stove_Consumption = 1         -- Consommation en fonction de la quantité de chaleur
EML_Stove_Heat = 1                -- Quantité de chaleur produite
EML_Stove_Storage = 200           -- Quantité de gaz stockée
EML_Stove_GravityGun = true       -- Peut-on saisir avec le pistolet gravité ?
EML_Stove_ExplosionType = 2       -- 0=indestructible, 1=détruit sans explosion, 2=explose après dégâts
EML_Stove_Health = 100            -- Points de vie si destructible
EML_Stove_ExplosionDamage = 50    -- Dégâts causés par l'explosion
EML_Stove_SmokeColor_R = 100      -- Couleur rouge de la fumée
EML_Stove_SmokeColor_G = 100      -- Couleur verte de la fumée
EML_Stove_SmokeColor_B = 0        -- Couleur bleue de la fumée
EML_Stove_IndicatorColor = Color(255, 222, 0, 255)  -- Couleur de l'indicateur du poêle


--[[--------------------------------------------------------
  -- PHOSPHORE ROUGE --
-----------------------------------------------------------]]
EML_Pot_StartTime = 60             -- Temps standard de préparation (en secondes)
EML_Pot_OnAdd_MuriaticAcid = 8    -- Temps ajouté par 1 acide chlorhydrique
EML_Pot_OnAdd_LiquidSulfur = 8    -- Temps ajouté par 1 soufre liquide
EML_Pot_OnAdd_Water = 8            -- Temps ajouté par 1 eau
EML_Pot_DestroyEmpty = true        -- Vrai = les ingrédients disparaissent à vide


--[[--------------------------------------------------------
  -- MÉTHAMPHÉTAMINE --
-----------------------------------------------------------]]
EML_SpecialPot_StartTime = 120               -- Temps standard de cuisson
EML_SpecialPot_OnAdd_RedPhosphorus = 12     -- Temps ajouté par 1 phosphore rouge
EML_SpecialPot_OnAdd_CrystallizedIodine = 10 -- Temps ajouté par 1 iode cristallisé
EML_SpecialPot_OnAdd_Salt = 8                 -- Temps ajouté par 1 sel
EML_SpecialPot_DestroyEmpty = true            -- Vrai = les ingrédients disparaissent à vide


--[[--------------------------------------------------------
  -- QUANTITÉS ET COULEURS DES INGREDIENTS --
-----------------------------------------------------------]]
EML_Sulfur_Amount = 4
EML_Sulfur_Color = Color(243, 213, 19, 255)

EML_MuriaticAcid_Amount = 6
EML_MuriaticAcid_Color = Color(160, 221, 99, 255)

EML_Iodine_Amount = 2
EML_Iodine_Color = Color(150, 80, 60, 255)

EML_Water_Amount = 5
EML_Water_Color = Color(133, 202, 219, 255)

EML_Salt_Amount = 5
EML_Salt_Color = Color(133, 202, 219, 255)

EML_Pathos_Color = Color(90, 255, 0, 220)  -- Couleur du chiffre pour la quantité restante


--[[--------------------------------------------------------
  -- CONFIGURATION VENTE MÉTH --
-----------------------------------------------------------]]
EML_Meth_ValueModifier = 9200         -- Prix d'un cristal de meth (1500/lbs)
EML_Meth_UseSalesman = true         -- Utiliser un PNJ vendeur
EML_Meth_MakeWanted = true          -- Mettre en recherche si vendu

-- Texte au-dessus de la tête du vendeur
EML_Meth_SalesmanText = true
EML_Meth_Salesman_Name = "Acheteur de Meth"
EML_Meth_Salesman_Name_Color = Color(25, 220, 60, 260)

-- Phrases quand le joueur n'a pas de meth (chat)
EML_Meth_Salesman_NoMeth = {
  "Dégage ! Et ne revenez pas sans de la meth !",
  "Es-tu une aubergine ? Où est mon MATT !",
  "Vous pensez tricher ?!?! AAAaa",
}

-- Sons quand le joueur n'a pas de meth
EML_Meth_Salesman_NoMeth_Sound = {
  "vo/npc/male01/gethellout.wav",
  "vo/npc/male01/no02.wav",
  "vo/npc/male01/no01.wav",
  "vo/npc/male01/ohno.wav"
}

-- Phrases quand le joueur a de la meth (chat)
EML_Meth_Salesman_GotMeth = {
  "Parfait",
  "On va bien s'amuser",
  "Le lard, c'est mieux",
  "Je vais crever maintenant"
}


-- Sons quand le joueur a de la meth
EML_Meth_Salesman_GotMeth_Sound = {
  "vo/npc/male01/yeah02.wav",
  "vo/npc/male01/finally.wav",
  "vo/npc/male01/oneforme.wav",
}


--[[--------------------------------------------------------
  -- CONFIGURATION AGITATION DU BOCAL --
-----------------------------------------------------------]]
EML_Jar_StartProgress = 4       -- Démarre à 4%
EML_Jar_MinShake = 25           -- Vitesse minimale d'agitation (valeur basse)
EML_Jar_MaxShake = 500          -- Vitesse maximale d'agitation (valeur haute)
EML_Jar_CorrectShake = 6        -- Progression correcte d'agitation
EML_Jar_WrongShake = 2          -- Progression mauvaise agitation
EML_Jar_DestroyEmpty = true     -- Ingrédients disparaissent à vide


--[[--------------------------------------------------------
  -- CONFIGURATION CARTOUCHE DE GAZ --
-----------------------------------------------------------]]
EML_Gas_Amount = 1000           -- Quantité de gaz
EML_Gas_ExplosionType = 1       -- 0 = indestructible, 1 = détruit sans explosion, 2 = explosion instantanée
EML_Gas_Remove = true           -- Enlever en cas de panne de gaz


--[[--------------------------------------------------------
  -- COULEUR DIVERS --
-----------------------------------------------------------]]
EML_OC_Color = Color(90, 255, 0, 220)
