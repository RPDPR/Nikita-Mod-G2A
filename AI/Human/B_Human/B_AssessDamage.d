
func Int B_BlastTimer(var C_NPC slf, var C_NPC oth)
{
	if(!Npc_RefuseTalk(slf))
	{
		Npc_SetRefuseTalk(slf, 5);
		
		slf.aivar[AIV_BlastCount] = 0;
	}
	else
	{
		if(slf.aivar[AIV_BlastCount] == 10)
		{	
			slf.aivar[AIV_BlastCount] = 0;
			
			AI_SetNpcsToState(slf,ZS_Blast,800);
			
			PrintScreen("�����!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
			
			return true;
		};
	};
	
	slf.aivar[AIV_BlastCount] += 1;
	
	return false;
};

func void B_AssessDamage()
{
	if(self.guild == GIL_NIK)
	{
		B_BlastTimer(self, other);
	};
	
	var C_Npc Quarho;
	var C_Npc Rhadem;
	var C_Npc rav;
	
	Quarho = Hlp_GetNpc(NONE_ADDON_111_Quarhodron);
	Rhadem = Hlp_GetNpc(NONE_ADDON_112_Rhademes);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Quarho)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Rhadem)))
	{
		B_GhostSpecialDamage(other,self);
		return;
	};
	B_BeliarsWeaponSpecialDamage(other,self);
	if(self.aivar[AIV_ArenaFight] == AF_AFTER)
	{
		self.aivar[AIV_ArenaFight] = AF_AFTER_PLUS_DAMAGE;
	};
	if(self.aivar[AIV_EnemyOverride] == TRUE)
	{
		rav = Hlp_GetNpc(BDT_1090_Addon_Raven);
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(rav))
		{
			self.aivar[AIV_EnemyOverride] = FALSE;
		};
	};
	if(Npc_IsInState(self,ZS_Attack))
	{
		if(Npc_IsPlayer(other) && (self.npcType == NPCTYPE_FRIEND))
		{
			return;
		};
		if(Npc_IsPlayer(other) && (self.aivar[AIV_PARTYMEMBER] == TRUE))
		{
			return;
		};
		if((Hlp_GetInstanceID(other) != self.aivar[AIV_LASTTARGET]) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Summoned_Nikita)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Nikita_For_Npc)))
		{
			if((self.aivar[AIV_HitByOtherNpc] == Hlp_GetInstanceID(other)) || (Hlp_GetInstanceID(other) != Hlp_GetInstanceID(hero)))
			{
				Npc_SetTarget(self,other);
			}
			else
			{
				self.aivar[AIV_HitByOtherNpc] = Hlp_GetInstanceID(other);
			};
		};
		return;
	};
	if(B_AssessEnemy())
	{
		return;
	};
	if(!Npc_IsPlayer(other) && (other.aivar[AIV_ATTACKREASON] == AR_NONE))
	{
		B_Attack(self,other,AR_NONE,0);
		return;
	};
	if(Npc_IsInFightMode(other,FMODE_MELEE) || Npc_IsInFightMode(other,FMODE_FIST) || Npc_IsInFightMode(other,FMODE_NONE))
	{
		if((Npc_GetAttitude(self,other) == ATT_FRIENDLY) || ((self.npcType == NPCTYPE_FRIEND) && Npc_IsPlayer(other)))
		{
			if(!Npc_IsInState(self,ZS_ReactToDamage))
			{
				Npc_ClearAIQueue(self);
				B_ClearPerceptions(self);
				AI_StartState(self,ZS_ReactToDamage,0,"");
				return;
			};
		};
	};
	B_Attack(self,other,AR_ReactToDamage,0);
};

