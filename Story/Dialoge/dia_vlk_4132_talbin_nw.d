
instance DIA_Talbin_NW_EXIT(C_Info)
{
	npc = VLK_4132_Talbin_NW;
	nr = 999;
	condition = DIA_Talbin_EXIT_Condition;
	information = DIA_Talbin_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Talbin_NW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Talbin_NW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Talbin_NW(C_Info)
{
	npc = VLK_4132_Talbin_NW;
	nr = 15;
	condition = DIA_Talbin_NW_Condition;
	information = DIA_Talbin_NW_Info;
	description = "���� ������ ��� �� ����� �� � ��������, ������?";
};


func int DIA_Talbin_NW_Condition()
{
	return TRUE;
};

func void DIA_Talbin_NW_Info()
{
	AI_Output(other,self,"DIA_Talbin_NW_15_00");	//���� ������ ��� �� ����� �� � ��������, ������?
	AI_Output(self,other,"DIA_Talbin_NW_07_01");	//�������, ��� ���� ����.
	AI_Output(self,other,"DIA_Talbin_NW_07_02");	//���. � ����� ���� ������ � �������. � �����, �� ���������� ����.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Talbin_NW_07_03");	//��� �������, ��� ������ ������.
		CreateInvItems(self,ItMi_RuneBlank,1);
		B_GiveInvItems(self,other,ItMi_RuneBlank,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Talbin_NW_07_04");	//��� �������, ��� ����� ����.
		CreateInvItems(self,ItMi_Nugget,1);
		B_GiveInvItems(self,other,ItMi_Nugget,1);
	};
	AI_Output(self,other,"DIA_Talbin_NW_07_05");	//�� ������� ���� �����.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Farm");
	TOPIC_END_Talbin_Runs = TRUE;
	B_GivePlayerXP(XP_SavedTalbin);
};


instance DIA_Talbin_NW_PERM(C_Info)
{
	npc = VLK_4132_Talbin_NW;
	nr = 15;
	condition = DIA_Talbin_NW_PERM_Condition;
	information = DIA_Talbin_NW_PERM_Info;
	permanent = TRUE;
	description = "��� � �������?";
};


func int DIA_Talbin_NW_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Talbin_NW))
	{
		return TRUE;
	};
};

func void DIA_Talbin_NW_PERM_Info()
{
	AI_Output(other,self,"DIA_Talbin_NW_PERM_15_00");	//��� � �������?
	AI_Output(self,other,"DIA_Talbin_NW_PERM_07_01");	//��, ������� ����. � ������ ���. �� ���� ����� ��� � �������.
	AI_StopProcessInfos(self);
};

