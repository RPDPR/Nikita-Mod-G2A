
const int SPL_Cost_SummonNikita = 250;

instance Spell_SummonNikita(C_Spell_Proto)
{
    time_per_mana = 0;
    targetCollectAlgo = TARGET_COLLECT_NONE;
};


func int Spell_Logic_SummonNikita(var int manaInvested)
{
    if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
    {
        return SPL_SENDCAST;
    }
    else if(self.attribute[ATR_MANA] >= SPL_Cost_SummonNikita)
    {
        return SPL_SENDCAST;
    }
    else
    {
        return SPL_SENDSTOP;
    };
};

func void Spell_Cast_SummonNikita()
{
    self.aivar[AIV_SelectSpell] += 1;
    
    if(Npc_IsPlayer(self))
    {
        Wld_SpawnNpcRange(self,Summoned_Nikita,1,500);
        AI_StartState(Summoned_Nikita,ZS_MM_Rtn_Summoned,0,"");
		
        if (Npc_GetActiveSpellIsScroll(self))
        {
            self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
        }
        else
        {
            self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_SummonNikita;
        };
    }
    else
    {
        Wld_SpawnNpcRange(self,Nikita_For_Npc,1,500);
		AI_StartState(Nikita_For_Npc,ZS_MM_Rtn_Summoned,0,"");
    };  
};