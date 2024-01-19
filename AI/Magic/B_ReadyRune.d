func int B_ReadyRune(var C_NPC slf, var C_NPC oth, var int rune)
{
    if (!Npc_GetInvItem(slf, rune))
    {
        CreateInvItem(slf, rune);
    };
    
    var int SpellId;    SpellId = item.spell;
    var int SpellMana;  SpellMana = item.COUNT[1];

    B_ReadySpell(slf, SpellId, 0);
    return TRUE;   
};
