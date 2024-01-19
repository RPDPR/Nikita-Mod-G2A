
instance NIK_8987_NIKITA(Npc_Default)
{
	name[0] = "Никита";
	guild = GIL_NIK;
	id = 8987;
	voice = 20;
	flags = 0;
	npcType = npctype_main;
	level = 100;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	protection[PROT_EDGE] = 200;
    protection[PROT_BLUNT] = 200;
    protection[PROT_POINT] = 200;
    protection[PROT_FIRE] = 100;
    protection[PROT_MAGIC] = 100;
	fight_tactic = FAI_HUMAN_MASTER;
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,7);
	B_SetFightSkills(self,70);
	EquipItem(self,itmw_nikita_piercer);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",FACE_N_NIKITA,BodyTex_N,ITAR_Bau_M);
	Mdl_SetModelFatness(self,2);
	daily_routine = rtn_start_8987;
};


func void rtn_start_8987()
{
	TA_Practice_Sword(8,0,10,0,"NW_XARDAS_TOWER_03");
	TA_Dance(10,0,12,0,"NW_FARM1_OUT_01");
	TA_Stand_Eating(12,0,15,0,"NW_CITY_ENTRANCE_02");
	TA_Dance(15,0,20,0,"NW_CITY_ENTRANCE_01");
	TA_Stand_Drinking(20,0,8,0,"NW_CITY_MAINSTREET_01_B");
};

func void B_Nikita_Func(var C_Npc nikita_in)
{
    nikita_in.guild = GIL_NIK;
    nikita_in.voice = 20;
    Npc_SetTalentSkill(nikita_in,NPC_TALENT_MAGE,7);
    Npc_SetTalentSkill(nikita_in,NPC_TALENT_PICKLOCK,1);
    Npc_SetTalentSkill(nikita_in,NPC_TALENT_SNEAK,1);
    Npc_SetTalentSkill(nikita_in,NPC_TALENT_SMITH,1);
    Npc_SetTalentSkill(nikita_in,NPC_TALENT_RUNES,1);
    Npc_SetTalentSkill(nikita_in,NPC_TALENT_ALCHEMY,1);
    B_RaiseFightTalent(nikita_in,NPC_TALENT_1H,70);
    B_RaiseFightTalent(nikita_in,NPC_TALENT_2H,70);
    B_RaiseFightTalent(nikita_in,NPC_TALENT_BOW,70);
    B_RaiseFightTalent(nikita_in,NPC_TALENT_CROSSBOW,70);
    CreateInvItems(nikita_in,itmw_nikita_piercer,1);
    AI_EquipBestMeleeWeapon(nikita_in);
    Mdl_SetModelFatness(nikita_in,2);
    Mdl_ApplyOverlayMds(nikita_in,"Humans_Mage.mds");
    B_SetNpcVisual(nikita_in,MALE,"Hum_Head_Thief",FACE_N_NIKITA,BodyTex_N,ITAR_Bau_M);
    nikita_in.fight_tactic = FAI_HUMAN_MASTER;
    nikita_in.npcType = npctype_main;
};

prototype Nikita_Default(C_NPC)
{
    attribute[ATR_STRENGTH] = 200;
    aivar[REAL_STRENGTH] = 200;
    attribute[ATR_DEXTERITY] = 150;
    aivar[REAL_DEXTERITY] = 150;
    attribute[ATR_MANA_MAX] = 300;
    aivar[REAL_MANA_MAX] = 300;
    attribute[ATR_MANA] = 300;
    attribute[ATR_HITPOINTS_MAX] = 5000;
    attribute[ATR_HITPOINTS] = 5000;
    protection[PROT_EDGE] = 200;
    protection[PROT_BLUNT] = 200;
    protection[PROT_POINT] = 200;
    protection[PROT_FIRE] = 100;
    protection[PROT_MAGIC] = 100;
    damagetype = DAM_BLUNT;
    senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
    senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
    aivar[AIV_MM_FollowTime] = NPC_TIME_FOLLOW;
    aivar[AIV_FightDistCancel] = FIGHT_DIST_CANCEL;
    bodyStateInterruptableOverride = FALSE;
};


instance Summoned_Nikita(Nikita_Default)
{
    name[0] = "Вызванный Никита";
    level = 0;
	B_SetAttitude(self,ATT_FRIENDLY);
	start_aistate = ZS_MM_Rtn_Summoned;
    B_Nikita_Func(self);
	aivar[AIV_DropDeadAndKill] = TRUE;
};

instance Nikita_For_Npc(Nikita_Default)
{
    name[0] = "Никита";
    level = 100;
    B_Nikita_Func(self);
	aivar[AIV_DropDeadAndKill] = TRUE;
};