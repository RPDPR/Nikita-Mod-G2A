
instance STRF_1109_Straefling(Npc_Default)
{
	name[0] = NAME_Straefling;
	guild = GIL_STRF;
	id = 1109;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_2H_Axe_L_01);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart05,BodyTex_N,ITAR_Prisoner);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,15);
	daily_routine = Rtn_Start_1109;
};


func void Rtn_Start_1109()
{
	TA_Repair_Hut(8,0,23,0,"OC_OPEN_ROOM_REPAIR_02");
	TA_Repair_Hut(23,0,8,0,"OC_OPEN_ROOM_REPAIR_02");
};

