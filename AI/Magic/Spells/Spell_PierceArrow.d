
const int SPL_Cost_PierceArrow    		= 50;	// Стоимость заклинания  
const int SPL_Damage_PierceArrow    	= 700;	// Повреждение от заклинания
  
// Объявление заклинания с инициализацией

instance Spell_PierceArrow ( C_SPELL_PROTO )
{
    Time_Per_Mana           	= 0;
    Damage_Per_Level        	= SPL_Damage_PierceArrow;
};
  
// Функция инвестирования маны

func int Spell_Logic_PierceArrow ( var int manaInvested )
{
    // Если активное заклинание свиток и есть требуемое кол-во маны
    if ( Npc_GetActiveSpellIsScroll ( Self ) && ( Self.Attribute [ATR_MANA] >= SPL_Cost_Scroll ) )
    {
        // Старт заклинания
        return SPL_SENDCAST;
    }
	
    // Иначе, если руна и есть требуемое кол-во маны	
    else if ( Self.Attribute [ATR_MANA] >= SPL_Cost_PierceArrow )
    {   
        // Старт заклинания
        return SPL_SENDCAST;
    }
	
	// Мало маны
    else 
    {
        // Отмена заклинания
        return SPL_SENDSTOP;
    };
	
	return SPL_SENDSTOP;
};

// Вызов заклинания

func void Spell_Cast_PierceArrow()
{
    self.aivar[AIV_SelectSpell] += 1;
    // не надо отнимать ману негерою !!!
};