
instance DIA_Sagitta_EXIT(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 999;
	condition = DIA_Sagitta_EXIT_Condition;
	information = DIA_Sagitta_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sagitta_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Sagitta_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Sagitta_HALLO(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 4;
	condition = DIA_Sagitta_HALLO_Condition;
	information = DIA_Sagitta_HALLO_Info;
	description = "�� ����� ������ ����?";
};


func int DIA_Sagitta_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Sagitta_HALLO_Info()
{
	AI_Output(other,self,"DIA_Sagitta_HALLO_15_00");	//�� ����� ������ ����?
	AI_Output(self,other,"DIA_Sagitta_HALLO_17_01");	//������, ��� ���� ����� �� ����, � �����. � ������.
	Info_ClearChoices(DIA_Sagitta_HALLO);
	Info_AddChoice(DIA_Sagitta_HALLO,Dialog_Back,DIA_Sagitta_HALLO_ende);
	Info_AddChoice(DIA_Sagitta_HALLO,"�� ������ �������� ����?",DIA_Sagitta_HALLO_Heil);
	Info_AddChoice(DIA_Sagitta_HALLO,"��� �� ������� �����?",DIA_Sagitta_HALLO_was);
	Info_AddChoice(DIA_Sagitta_HALLO,"��� ��?",DIA_Sagitta_HALLO_wer);
};

func void DIA_Sagitta_HALLO_wer()
{
	AI_Output(other,self,"DIA_Sagitta_HALLO_wer_15_00");	//��� ��?
	AI_Output(self,other,"DIA_Sagitta_HALLO_wer_17_01");	//�� ���, ������� �� ������ ��� ���?
	AI_Output(self,other,"DIA_Sagitta_HALLO_wer_17_02");	//���� �������� �������-�������������. � ��� ��������.
	AI_Output(self,other,"DIA_Sagitta_HALLO_wer_17_03");	//�� ����� �� �����, ��� ��� ���������� ���������� ������ ������ ������� � �� �������� �����.
};

func void DIA_Sagitta_HALLO_was()
{
	AI_Output(other,self,"DIA_Sagitta_HALLO_was_15_00");	//��� �� ������� �����?
	AI_Output(self,other,"DIA_Sagitta_HALLO_was_17_01");	//� ���� �����, ������� ���� �����, � ��������� �������.
	AI_Output(self,other,"DIA_Sagitta_HALLO_was_17_02");	//��� - ��� ����. �� ���� ��� ��, ��� ��� �����.
};

func void DIA_Sagitta_HALLO_Heil()
{
	AI_Output(other,self,"DIA_Sagitta_HALLO_Heil_15_00");	//�� ������ �������� ����?
	AI_Output(self,other,"DIA_Sagitta_HALLO_Heil_17_01");	//�� �� ���� ������, ��? ��� ��� �����, ���� � ����� ����� ���-�� �� � �������.
	Log_CreateTopic(Topic_SoldierTrader,LOG_NOTE);
	B_LogEntry(Topic_SoldierTrader,"� �������, ������� �� ������ ������, ����� ������ ��������� ������.");
};

func void DIA_Sagitta_HALLO_ende()
{
	Info_ClearChoices(DIA_Sagitta_HALLO);
};


instance DIA_Sagitta_TeachAlchemyRequest(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 6;
	condition = DIA_Sagitta_TeachAlchemyRequest_Condition;
	information = DIA_Sagitta_TeachAlchemyRequest_Info;
	permanent = TRUE;
	description = "�� ������ ������� ���� �������� �����?";
};


func int DIA_Sagitta_TeachAlchemyRequest_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sagitta_HALLO) && (MIS_Sagitta_Herb == FALSE))
	{
		return TRUE;
	};
};


var int DIA_Sagitta_TeachAlchemyRequest_OneTime;

func void DIA_Sagitta_TeachAlchemyRequest_Info()
{
	AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_15_00");	//�� ������ ������� ���� �������� �����?
	if(DIA_Sagitta_TeachAlchemyRequest_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_01");	//��� ���������. ���� ������� � ����� ������.
		AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_02");	//��� �� ������ ���� ���� ��������? ����� ���� ������� ����� ��������, ��� ���� ��������� ��������.
		AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_03");	//� ������ ������� ��� ����� ������ ������, ������� ��������� �� ������ ������������� ���� � ��������.
		AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_04");	//���� �� �� ������ ��� ���� ���������� - ����� ������ ��������, �������� � ���� ��� - � ����� ����.
		DIA_Sagitta_TeachAlchemyRequest_OneTime = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_05");	//� ��� ������� ����: ��, ����� ����, ��� �� ��������� ��� ���� ������ ����������, ��� � �������.
	};
	Info_ClearChoices(DIA_Sagitta_TeachAlchemyRequest);
	Info_AddChoice(DIA_Sagitta_TeachAlchemyRequest,"������, �� ��� ��� �� ���������.",DIA_Sagitta_TeachAlchemyRequest_nein);
	Info_AddChoice(DIA_Sagitta_TeachAlchemyRequest,"��� ����� ����� ���� ����������?",DIA_Sagitta_TeachAlchemyRequest_wo);
	Info_AddChoice(DIA_Sagitta_TeachAlchemyRequest,"��� ��� �� ����������?",DIA_Sagitta_TeachAlchemyRequest_was);
};

func void DIA_Sagitta_TeachAlchemyRequest_was()
{
	AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_was_15_00");	//��� ��� �� ����������?
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_was_17_01");	//��� ����� ������ �������� - �����, ���������� ��������� ����. �� ������� ��� �� �������� ����������� �������.
};

func void DIA_Sagitta_TeachAlchemyRequest_wo()
{
	AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_wo_15_00");	//��� ����� ����� ���� ����������?
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_wo_17_01");	//�����, ����������� ���, ������������ ������ � ������, ��� ���� ��� ����������� ��������, ����������� ��� �� �����.
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_wo_17_02");	//������ ��� ����������� �� ������������ ������� ������.
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_wo_17_03");	//��� ������ ��� ��� ������ ������� ��� �����, ���������?
	Info_AddChoice(DIA_Sagitta_TeachAlchemyRequest,"���������, �����, ��� ������� ����� �� ���-������.",DIA_Sagitta_TeachAlchemyRequest_wo_ja);
};

func void DIA_Sagitta_TeachAlchemyRequest_wo_ja()
{
	AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_wo_ja_15_00");	//���������, �����, ��� ������� ����� �� ���-������.
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_wo_ja_17_01");	//����� ���� � ����� �������.
	Info_ClearChoices(DIA_Sagitta_TeachAlchemyRequest);
	MIS_Sagitta_Herb = LOG_Running;
	Log_CreateTopic(TOPIC_SagittaHerb,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SagittaHerb,LOG_Running);
	B_LogEntry(TOPIC_SagittaHerb,"������� ����� ����� �������� ��������. ��� ��������� ����, ��� ������ ������ �� ������������ ������� ������.");
};

func void DIA_Sagitta_TeachAlchemyRequest_nein()
{
	AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_nein_15_00");	//������, �� ��� ��� �� ���������.
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_nein_17_01");	//����� ������ ������� ��� ����� �� ������ ������.
	Info_ClearChoices(DIA_Sagitta_TeachAlchemyRequest);
};


instance DIA_Sagitta_Sagitta_Herb(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 3;
	condition = DIA_Sagitta_Sagitta_Herb_Condition;
	information = DIA_Sagitta_Sagitta_Herb_Info;
	description = "� ����� ��������� ����.";
};


func int DIA_Sagitta_Sagitta_Herb_Condition()
{
	if(Npc_HasItems(other,ItPl_Sagitta_Herb_MIS) && (MIS_Sagitta_Herb == LOG_Running) && Npc_KnowsInfo(other,DIA_Sagitta_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_Sagitta_Herb_Info()
{
	AI_Output(other,self,"DIA_Sagitta_Sagitta_Herb_15_00");	//� ����� ��������� ����.
	AI_Output(self,other,"DIA_Sagitta_Sagitta_Herb_17_01");	//�������. ������ �� ������ ���������� ���� ��� ����, ��� ������ ������ � ������������� �����.
	B_GiveInvItems(other,self,ItPl_Sagitta_Herb_MIS,1);
	Sagitta_TeachAlchemy = TRUE;
	MIS_Sagitta_Herb = LOG_SUCCESS;
	B_GivePlayerXP(XP_Sagitta_Sonnenaloe);
};


instance DIA_Sagitta_Teach(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 2;
	condition = DIA_Sagitta_Teach_Condition;
	information = DIA_Sagitta_Teach_Info;
	permanent = TRUE;
	description = "����� ����� ������ �� ������� ���� ������?";
};


var int DIA_Sagitta_Teach_permanent;

func int DIA_Sagitta_Teach_Condition()
{
	if((DIA_Sagitta_Teach_permanent == FALSE) && (Sagitta_TeachAlchemy == TRUE) && Npc_KnowsInfo(other,DIA_Sagitta_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_Teach_Info()
{
	var int talente;
	talente = 0;
	AI_Output(other,self,"DIA_Sagitta_Teach_15_00");	//����� ����� ������ �� ������� ���� ������?
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE))
	{
		Info_ClearChoices(DIA_Sagitta_Teach);
		Info_AddChoice(DIA_Sagitta_Teach,Dialog_Back,DIA_Sagitta_Teach_BACK);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice(DIA_Sagitta_Teach,B_BuildLearnString("�������� ��������",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_01)),DIA_Sagitta_Teach_Health_01);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE))
	{
		Info_AddChoice(DIA_Sagitta_Teach,B_BuildLearnString("�������� ��������",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_02)),DIA_Sagitta_Teach_Health_02);
		talente = talente + 1;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice(DIA_Sagitta_Teach,B_BuildLearnString("�������� ����",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_01)),DIA_Sagitta_Teach_Mana_01);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE))
	{
		Info_AddChoice(DIA_Sagitta_Teach,B_BuildLearnString("�������� ����",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_02)),DIA_Sagitta_Teach_Mana_02);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE))
	{
		Info_AddChoice(DIA_Sagitta_Teach,B_BuildLearnString("������� ����",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_03)),DIA_Sagitta_Teach_Mana_03);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE))
	{
		Info_AddChoice(DIA_Sagitta_Teach,B_BuildLearnString("������� ����",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Mana)),DIA_Sagitta_Teach_Perm_Mana);
		talente = talente + 1;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE)
	{
		Info_AddChoice(DIA_Sagitta_Teach,B_BuildLearnString("������� ��������",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_DEX)),DIA_Sagitta_Teach_Perm_DEX);
		talente = talente + 1;
	};
	if(talente > 0)
	{
		if(Alchemy_Explain != TRUE)
		{
			AI_Output(self,other,"DIA_Sagitta_Teach_17_01");	//������ ��� ���������� � �������� ���� �������, � ������� ��������, ��� ���������� ����� ��� ������������� �����.
			AI_Output(self,other,"DIA_Sagitta_Teach_17_02");	//��� ����� ��������� �� ������������ �����. ���� ����� ����������� ������ ��������, � ������� ����� ��������� �������������� �����.
			AI_Output(self,other,"DIA_Sagitta_Teach_17_03");	//���� ����� ������� ����������� ����������� � ��� - ����� ������.
			AI_Output(self,other,"DIA_Sagitta_Teach_17_04");	//�� � �������������� ����������� �� ������ ������ ������ � ����, ���� ��������.
			Alchemy_Explain = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Sagitta_Teach_17_05");	//��� ����� ����� ���� ����������?
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_Teach_17_06");	//�� ��� ������ ���, ���� � ����� ������� ����.
		DIA_Sagitta_Teach_permanent = TRUE;
	};
};

func void DIA_Sagitta_Teach_BACK()
{
	Info_ClearChoices(DIA_Sagitta_Teach);
};

func void DIA_Sagitta_Teach_Health_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_01);
	Info_ClearChoices(DIA_Sagitta_Teach);
};

func void DIA_Sagitta_Teach_Health_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_02);
	Info_ClearChoices(DIA_Sagitta_Teach);
};

func void DIA_Sagitta_Teach_Mana_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_01);
	Info_ClearChoices(DIA_Sagitta_Teach);
};

func void DIA_Sagitta_Teach_Mana_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_02);
	Info_ClearChoices(DIA_Sagitta_Teach);
};

func void DIA_Sagitta_Teach_Mana_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_03);
	Info_ClearChoices(DIA_Sagitta_Teach);
};

func void DIA_Sagitta_Teach_Perm_Mana()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Mana);
	Info_ClearChoices(DIA_Sagitta_Teach);
};

func void DIA_Sagitta_Teach_Perm_DEX()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_DEX);
	Info_ClearChoices(DIA_Sagitta_Teach);
};


instance DIA_Sagitta_HEAL(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 99;
	condition = DIA_Sagitta_HEAL_Condition;
	information = DIA_Sagitta_HEAL_Info;
	permanent = TRUE;
	description = "������ ����.";
};


func int DIA_Sagitta_HEAL_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sagitta_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_HEAL_Info()
{
	AI_Output(other,self,"DIA_Sagitta_HEAL_15_00");	//������ ����.
	if(hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
	{
		AI_Output(self,other,"DIA_Sagitta_HEAL_17_01");	//����� ���������, ��� ��� � ����. ���. ��� ���� � ������ ������� ��� ���� ����.
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		PrintScreen(PRINT_FullyHealed,-1,-1,FONT_Screen,2);
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_HEAL_17_02");	//� ��������� ������ ���� ������� �������.
	};
};


instance DIA_Sagitta_TRADE(C_Info)
{
	npc = BAU_980_Sagitta;
	condition = DIA_Sagitta_TRADE_Condition;
	information = DIA_Sagitta_TRADE_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "����� ������ �� �����������?";
};


func int DIA_Sagitta_TRADE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sagitta_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_TRADE_Info()
{
	AI_Output(other,self,"DIA_Sagitta_TRADE_15_00");	//����� ������ �� ������ ���������� ���?
	B_GiveTradeInv(self);
	AI_Output(self,other,"DIA_Sagitta_TRADE_17_01");	//�������.
};


instance DIA_Sagitta_KAP3_EXIT(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 999;
	condition = DIA_Sagitta_KAP3_EXIT_Condition;
	information = DIA_Sagitta_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sagitta_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Sagitta_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Sagitta_OBSESSION(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 30;
	condition = DIA_Sagitta_OBSESSION_Condition;
	information = DIA_Sagitta_OBSESSION_Info;
	description = "� ������ ���������� �������.";
};


func int DIA_Sagitta_OBSESSION_Condition()
{
	if((SC_IsObsessed == TRUE) && (SC_ObsessionTimes < 1) && Npc_KnowsInfo(other,DIA_Sagitta_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_OBSESSION_Info()
{
	AI_Output(other,self,"DIA_Sagitta_OBSESSION_15_00");	//� ������ �����-�� ������� ���������� �������. ��� ����� ������.
	AI_Output(self,other,"DIA_Sagitta_OBSESSION_17_01");	//� ����, ��� ���� �� ����������, ����� ��������������. �� ����� ��� ����������� ������� ������� ������.
	AI_Output(self,other,"DIA_Sagitta_OBSESSION_17_02");	//��� � ��������, ������� ���� ���������. ���� �������� ������ ����� ������������.
};


instance DIA_Sagitta_Thekla(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 3;
	condition = DIA_Sagitta_Thekla_Condition;
	information = DIA_Sagitta_Thekla_Info;
	description = "����� ������� ���� � ���� �� �������.";
};


func int DIA_Sagitta_Thekla_Condition()
{
	if((MIS_Thekla_Paket == LOG_Running) && Npc_KnowsInfo(other,DIA_Sagitta_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_Thekla_Info()
{
	AI_Output(other,self,"DIA_Sagitta_Thekla_15_00");	//����� ������� ���� � ���� �� �������.
	AI_Output(self,other,"DIA_Sagitta_Thekla_17_01");	//��, ��. ������-�� � ������� �� ��� ��������� ���� �����.
	AI_Output(self,other,"DIA_Sagitta_Thekla_17_02");	//���, ����� �����. � ������������ � ���!
	B_GivePlayerXP(XP_AmbientKap3);
	B_GiveInvItems(self,other,ItMi_TheklasPaket,1);
};


instance DIA_Sagitta_KAP4_EXIT(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 999;
	condition = DIA_Sagitta_KAP4_EXIT_Condition;
	information = DIA_Sagitta_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sagitta_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Sagitta_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Sagitta_HEALRANDOLPH(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 30;
	condition = DIA_Sagitta_HEALRANDOLPH_Condition;
	information = DIA_Sagitta_HEALRANDOLPH_Info;
	permanent = TRUE;
	description = "� ��������� ���������� �������.";
};


var int DIA_Sagitta_HEALRANDOLPH_GotOne;
var int DIA_Sagitta_HEALRANDOLPH_KnowsPrice;

func int DIA_Sagitta_HEALRANDOLPH_Condition()
{
	if((MIS_HealRandolph == LOG_Running) && (Npc_HasItems(other,ItPo_HealRandolph_MIS) == 0) && Npc_KnowsInfo(other,DIA_Sagitta_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_HEALRANDOLPH_Info()
{
	AI_Output(other,self,"DIA_Sagitta_HEALRANDOLPH_15_00");	//� ��������� ���������� �������.
	if(DIA_Sagitta_HEALRANDOLPH_KnowsPrice == FALSE)
	{
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_01");	//� ����� ���� ������ �����������?!
		DIA_Sagitta_HEALRANDOLPH_KnowsPrice = TRUE;
	};
	if(DIA_Sagitta_HEALRANDOLPH_GotOne == TRUE)
	{
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_02");	//� ��� ������ ��� ���������. �� ���������� �� �� � ���.
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_03");	//� ��� ���� ��������� ��� ����. ��� �������� ��� ��  ���� �� ���� ����.
	};
	AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_04");	//�� ��� ��������� ���� � 300 �������.
	if(DIA_Sagitta_HEALRANDOLPH_KnowsPrice == FALSE)
	{
		AI_Output(other,self,"DIA_Sagitta_HEALRANDOLPH_15_05");	//���?
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_06");	//������������, ��� �� ������ �������� ����� ��������� - ��� ������, �����.
	};
	Info_ClearChoices(DIA_Sagitta_HEALRANDOLPH);
	Info_AddChoice(DIA_Sagitta_HEALRANDOLPH,"���. ������� ������ �� ����� ������?!",DIA_Sagitta_HEALRANDOLPH_no);
	Info_AddChoice(DIA_Sagitta_HEALRANDOLPH,"��� ���� ������.",DIA_Sagitta_HEALRANDOLPH_geld);
};

func void DIA_Sagitta_HEALRANDOLPH_geld()
{
	AI_Output(other,self,"DIA_Sagitta_HEALRANDOLPH_geld_15_00");	//��� ���� ������.
	if(B_GiveInvItems(other,self,ItMi_Gold,300))
	{
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_geld_17_01");	//����� ������. �� ������ ������ ����������� �� ���� �������������� ���� �������.
		CreateInvItems(self,ItPo_HealRandolph_MIS,1);
		B_GiveInvItems(self,other,ItPo_HealRandolph_MIS,1);
		DIA_Sagitta_HEALRANDOLPH_GotOne = TRUE;
		B_LogEntry(TOPIC_HealRandolph,"������� ���� ��� ��������� ��� ���������.");
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_geld_17_02");	//���� � ���� �� ����� ���� �����, � ���� ������������� �� ���� �� ����.
	};
	Info_ClearChoices(DIA_Sagitta_HEALRANDOLPH);
};

func void DIA_Sagitta_HEALRANDOLPH_no()
{
	AI_Output(other,self,"DIA_Sagitta_HEALRANDOLPH_no_15_00");	//���. ������� ������ �� ����� ������?!
	AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_no_17_01");	//(�������) �� �� ��� ���� �����? ��� �� ���� ������!
	Info_ClearChoices(DIA_Sagitta_HEALRANDOLPH);
};


instance DIA_Sagitta_KAP5_EXIT(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 999;
	condition = DIA_Sagitta_KAP5_EXIT_Condition;
	information = DIA_Sagitta_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sagitta_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Sagitta_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Sagitta_KAP6_EXIT(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 999;
	condition = DIA_Sagitta_KAP6_EXIT_Condition;
	information = DIA_Sagitta_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sagitta_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Sagitta_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Sagitta_PICKPOCKET(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 900;
	condition = DIA_Sagitta_PICKPOCKET_Condition;
	information = DIA_Sagitta_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_120_Female;
};


func int DIA_Sagitta_PICKPOCKET_Condition()
{
	return C_Beklauen(103,360);
};

func void DIA_Sagitta_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Sagitta_PICKPOCKET);
	Info_AddChoice(DIA_Sagitta_PICKPOCKET,Dialog_Back,DIA_Sagitta_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Sagitta_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Sagitta_PICKPOCKET_DoIt);
};

func void DIA_Sagitta_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Sagitta_PICKPOCKET);
};

func void DIA_Sagitta_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Sagitta_PICKPOCKET);
};

// FreeSergey - modding scripts
// ������������� �������� "�� ������"

instance BAU_980_Sagitta_MakePotionsCommon (C_INFO)
{
	npc			= BAU_980_Sagitta;
	condition		= BAU_980_Sagitta_MakePotionsCommon_Condition;
	information		= BAU_980_Sagitta_MakePotionsCommon_Info;
	important		= FALSE;
	permanent		= TRUE;
	description		= "� ���� ���� ���-��� ��� ������������� ��������.";
};

func int BAU_980_Sagitta_MakePotionsCommon_Condition()
{
//	!! ���������������� ��� �������� !!
//	if (MIS_Sagitta_Herb == LOG_SUCCESS)
//	{
		return TRUE;
//	};
};

func void BAU_980_Sagitta_MakePotionsCommon_MakeChoices()
{
	Info_ClearChoices(BAU_980_Sagitta_MakePotionsCommon);
	Info_AddChoice(BAU_980_Sagitta_MakePotionsCommon, DIALOG_BACK, BAU_980_Sagitta_MakePotionsCommon_Back);

	if	(
			(NPC_HasItems(other, ItPo_Health_01) >= 1) && (NPC_HasItems(other, ItPl_Temp_Herb) >= 1) && (NPC_HasItems(other, ItMi_Gold) >= 500)
		)
	{
		Info_AddChoice(BAU_980_Sagitta_MakePotionsCommon, "������ �����, 500 ������", BAU_980_Sagitta_MakePotionsCommon_ItPo_Health_Addon_04);
	};

	if	(
			(NPC_HasItems(other, ItPl_Mana_Herb_03) >= 2) && (NPC_HasItems(other, ItPl_Temp_Herb) >= 1) && (NPC_HasItems(other, ItMi_Gold) >= 300)
		)
	{
		Info_AddChoice(BAU_980_Sagitta_MakePotionsCommon, "������� ����, 300 ������", BAU_980_Sagitta_MakePotionsCommon_ItPo_Mana_03);
	};

	if	((NPC_HasItems(other, ItPo_Mana_01) >= 3) && (NPC_HasItems(other, ItPl_Temp_Herb) >= 1) && (NPC_HasItems(other, ItMi_Gold) >= 500))
	{
		Info_AddChoice(BAU_980_Sagitta_MakePotionsCommon, "������ ����, 500 ������", BAU_980_Sagitta_MakePotionsCommon_ItPo_Mana_Addon_04);
	};

	if	((NPC_HasItems(other, ItPl_Perm_Herb) >= 1) && (NPC_HasItems(other, ItPl_Mana_Herb_03) >= 1) && (NPC_HasItems(other, ItMi_Gold) >= 1000))
	{
		Info_AddChoice(BAU_980_Sagitta_MakePotionsCommon, "������� ����, 1000 ������", BAU_980_Sagitta_MakePotionsCommon_ItPo_Perm_Mana);
	};

	if	((NPC_HasItems(other, ItPl_Dex_Herb_01) >= 1) && (NPC_HasItems(other, ItPl_Perm_Herb) >= 1) && (NPC_HasItems(other, ItMi_Gold) >= 1000))
	{
		Info_AddChoice(BAU_980_Sagitta_MakePotionsCommon, "������� ��������, 1000 ������", BAU_980_Sagitta_MakePotionsCommon_ItPo_Perm_DEX);
	};
};

func void BAU_980_Sagitta_MakePotionsCommon_Info()
{
	AI_Output(other, self, "BAU_980_Sagitta_MakePotionsCommon_Info_15_01"); // � ���� ���� ���-��� ��� ������������� ��������.
	AI_Output(self, other, "BAU_980_Sagitta_MakePotionsCommon_Info_10_02"); // ���, ����� ���������. � ���� ���������� ����:

	BAU_980_Sagitta_MakePotionsCommon_MakeChoices();
};

func void BAU_980_Sagitta_MakePotionsCommon_ItPo_Health_Addon_04()
{
	AI_Output(other, self, "BAU_980_Sagitta_MakePotionsCommon_ItPo_Health_Addon_04_15_01"); // ������ �����

    	B_GiveInvItems(other, self, 	ItPo_Health_01,		3);
    	B_GiveInvItems(other, self, 	ItPl_Temp_Herb,  	1);
    	B_GiveInvItems(other, self, 	ItMi_Gold,  		500);

	CreateInvItems(self, 		ItPo_Health_Addon_04, 	1);
    	B_GiveInvItems(self, other, 	ItPo_Health_Addon_04, 	1);

	BAU_980_Sagitta_MakePotionsCommon_MakeChoices();
};

func void BAU_980_Sagitta_MakePotionsCommon_ItPo_Mana_03()
{
	AI_Output(other, self, "BAU_980_Sagitta_MakePotionsCommon_ItPo_Mana_03_15_01"); // ������� ����

    	B_GiveInvItems(other, self, 	ItPl_Mana_Herb_03,	2);
    	B_GiveInvItems(other, self, 	ItPl_Temp_Herb,  	1);
    	B_GiveInvItems(other, self, 	ItMi_Gold,  		300);

	CreateInvItems(self, 		ItPo_Mana_03, 	1);
    	B_GiveInvItems(self, other, 	ItPo_Mana_03, 	1);

	BAU_980_Sagitta_MakePotionsCommon_MakeChoices();
};

func void BAU_980_Sagitta_MakePotionsCommon_ItPo_Mana_Addon_04()
{
	AI_Output(other, self, "BAU_980_Sagitta_MakePotionsCommon_ItPo_Mana_Addon_04_15_01"); // ������ ����

    	B_GiveInvItems(other, self, 	ItPo_Mana_01,		3);
    	B_GiveInvItems(other, self, 	ItPl_Temp_Herb,  	1);
    	B_GiveInvItems(other, self, 	ItMi_Gold,  		500);

	CreateInvItems(self, 		ItPo_Mana_Addon_04, 	1);
    	B_GiveInvItems(self, other, 	ItPo_Mana_Addon_04, 	1);

	BAU_980_Sagitta_MakePotionsCommon_MakeChoices();
};

func void BAU_980_Sagitta_MakePotionsCommon_ItPo_Perm_Mana()
{
	AI_Output(other, self, "BAU_980_Sagitta_MakePotionsCommon_ItPo_Perm_Mana_15_01"); // ������� ����

    	B_GiveInvItems(other, self, 	ItPl_Perm_Herb,		1);
    	B_GiveInvItems(other, self, 	ItPl_Mana_Herb_03,  	1);
    	B_GiveInvItems(other, self, 	ItMi_Gold,  		1000);

	CreateInvItems(self, 		ItPo_Perm_Mana, 	1);
    	B_GiveInvItems(self, other, 	ItPo_Perm_Mana, 	1);

	BAU_980_Sagitta_MakePotionsCommon_MakeChoices();
};

func void BAU_980_Sagitta_MakePotionsCommon_ItPo_Perm_DEX()
{
	AI_Output(other, self, "BAU_980_Sagitta_MakePotionsCommon_ItPo_Perm_DEX_15_01"); // ������� ��������

    	B_GiveInvItems(other, self, 	ItPl_Dex_Herb_01,	1);
    	B_GiveInvItems(other, self, 	ItPl_Perm_Herb,  	1);
    	B_GiveInvItems(other, self, 	ItMi_Gold,  		1000);

	CreateInvItems(self, 		ItPo_Perm_DEX, 	1);
    	B_GiveInvItems(self, other, 	ItPo_Perm_DEX, 	1);

	BAU_980_Sagitta_MakePotionsCommon_MakeChoices();
};

func void BAU_980_Sagitta_MakePotionsCommon_Back()
{
	Info_ClearChoices(BAU_980_Sagitta_MakePotionsCommon);
};
