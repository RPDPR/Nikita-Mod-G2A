
func void B_FinishingMove(var C_Npc slf,var C_Npc oth)
{
	if(!Npc_IsInFightMode(slf,FMODE_MELEE))
	{
		if(slf.guild == GIL_NIK)
		{
			Npc_SetToFightMode(slf,ItMw_Nikita_Piercer);
		}
		else
		{
			Npc_SetToFightMode(slf,ItMw_1h_MISC_Sword);
		};
	};
	AI_FinishingMove(slf,oth);
};

