
func int B_SelectSpellNikita(var C_NPC slf, var C_NPC oth)
{	
	if (slf.guild != GIL_NIK)       { return false; };
	if (Npc_IsDrawingWeapon(slf))   { return TRUE; };
    
	if(Npc_GetDistToNpc(slf,oth) <= FIGHT_DIST_MELEE)
	{
		return FALSE;
	};
		
	if(Npc_HasItems(slf,ItRu_PierceArrow) == 0)
	{
		CreateInvItems(slf,ItRu_PierceArrow,1);
	};
	if(Npc_HasItems(slf,ItRu_SumNik) == 0)
	{
		CreateInvItems(slf,ItRu_SumNik,1);
	};
	if(Npc_HasItems(slf,ItRu_FullHeal) == 0)
	{
		CreateInvItems(slf,ItRu_FullHeal,1);
	};
	
	var int rand;
    
	if (slf.aivar[AIV_SelectSpell] != rand)
	{
		rand = Hlp_Random(100) + 1;
		slf.aivar[AIV_SelectSpell] = rand;
	};
    
	if (rand > 95)
	{
		return B_ReadyRune(slf, oth, ItRu_SumNik);
	};
    
	if (rand > 80)
	{   
		var c_npc npc;
		npc = Hlp_GetNpc(Nikita_for_Npc);
        
		if (!Hlp_IsValidNpc(npc))
		{
			return B_ReadyRune(slf, oth, ItRu_SumNik);  
		};
	};
    
	return B_ReadyRune(slf, oth, ItRu_PierceArrow);   
};