
const int SPL_Cost_PierceArrow    		= 50;	// ��������� ����������  
const int SPL_Damage_PierceArrow    	= 700;	// ����������� �� ����������
  
// ���������� ���������� � ��������������

instance Spell_PierceArrow ( C_SPELL_PROTO )
{
    Time_Per_Mana           	= 0;
    Damage_Per_Level        	= SPL_Damage_PierceArrow;
};
  
// ������� �������������� ����

func int Spell_Logic_PierceArrow ( var int manaInvested )
{
    // ���� �������� ���������� ������ � ���� ��������� ���-�� ����
    if ( Npc_GetActiveSpellIsScroll ( Self ) && ( Self.Attribute [ATR_MANA] >= SPL_Cost_Scroll ) )
    {
        // ����� ����������
        return SPL_SENDCAST;
    }
	
    // �����, ���� ���� � ���� ��������� ���-�� ����	
    else if ( Self.Attribute [ATR_MANA] >= SPL_Cost_PierceArrow )
    {   
        // ����� ����������
        return SPL_SENDCAST;
    }
	
	// ���� ����
    else 
    {
        // ������ ����������
        return SPL_SENDSTOP;
    };
	
	return SPL_SENDSTOP;
};

// ����� ����������

func void Spell_Cast_PierceArrow()
{
    self.aivar[AIV_SelectSpell] += 1;
    // �� ���� �������� ���� ������� !!!
};