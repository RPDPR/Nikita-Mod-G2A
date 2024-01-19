
func void B_StopBlast()
{
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_ClearAIQueue(self);
	AI_Standup(self);
	if(self.guild < GIL_SEPERATOR_HUM)
	{
		B_AssessDamage();
		AI_ContinueRoutine(self);
	}
	else
	{
		Npc_SetTempAttitude(self,ATT_HOSTILE);
		AI_ContinueRoutine(self);
	};
};

func void ZS_Blast()
{	
	Npc_PercEnable(self,PERC_ASSESSSTOPMAGIC,B_StopBlast);
	
	if(!Npc_HasBodyFlag(self,BS_FLAG_INTERRUPTABLE))
	{
		AI_Standup(self);
	}
	else
	{
		AI_StandupQuick(self);
	};
	if(self.guild < GIL_SEPERATOR_HUM)
	{
		AI_PlayAni(self,"T_STAND_2_LIGHTNING_VICTIM");
	};
	return;
};

func int ZS_Blast_Loop()
{	
	if(Npc_GetDistToPlayer(Nik_8987_Nikita) <= 800)
	{
		Wld_PlayEffect("spellFX_chargeFireball",Nik_8987_Nikita,hero,4,500,DAM_FLY,FALSE);
	};
	
	AI_Wait(self,3);
	
	Wld_PlayEffect("spellFX_Firestorm_SPREAD",Nik_8987_Nikita,Nik_8987_Nikita,0,0,0,false);
	Wld_PlayEffect("spellFX_chargeFireball",Nik_8987_Nikita,self,4,500,DAM_FLY,FALSE);
	
	if(Npc_IsInState(self,ZS_Unconscious))
	{
		AI_StartState(self,ZS_Dead,0,"");
	};
	
	PrintScreen("Никита прострелил поребрик!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	if(Npc_GetStateTime(self) > 2)
	{
		B_StopBlast();
	};
	return TRUE;
};

func void ZS_Blast_End()
{
};
