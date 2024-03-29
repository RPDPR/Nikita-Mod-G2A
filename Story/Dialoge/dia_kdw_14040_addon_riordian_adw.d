
instance DIA_Addon_Riordian_ADW_EXIT(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 999;
	condition = DIA_Addon_Riordian_ADW_EXIT_Condition;
	information = DIA_Addon_Riordian_ADW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Riordian_ADW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Riordian_ADW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Riordian_HelloADW(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_HelloADW_Condition;
	information = DIA_Addon_Riordian_HelloADW_Info;
	description = "�� ������ ������� ����� �����?";
};


func int DIA_Addon_Riordian_HelloADW_Condition()
{
	return TRUE;
};

func void DIA_Addon_Riordian_HelloADW_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_HelloADW_15_00");	//�� ������ ������� ����� �����?
	AI_Output(self,other,"DIA_Addon_Riordian_HelloADW_10_01");	//���, ����� ���. � ������� ���, ����� ������� ������ ��� ����� ���� �����.
	AI_Output(self,other,"DIA_Addon_Riordian_HelloADW_10_02");	//����������� ������ ��������� ��� ������ � ������, �� �� �����, ��� �������� ���� ������, ���������� �� ���� ������.
	AI_Output(self,other,"DIA_Addon_Riordian_HelloADW_10_03");	//�����, ������ ����, ���� ������ �������.
};


instance DIA_Addon_Riordian_WhatToFind(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_WhatToFind_Condition;
	information = DIA_Addon_Riordian_WhatToFind_Info;
	description = "��� �� ����� ��� ����������?";
};


func int DIA_Addon_Riordian_WhatToFind_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Riordian_HelloADW))
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_WhatToFind_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_WhatToFind_15_00");	//��� �� ����� ��� ����������?
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_01");	//�� ������� ����������� �������� ������, �� ������� ��������� ������� ��������.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_02");	//��������� �� ������, � ��� ������������ �������.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_03");	//�� ����� ����� � �� ���� �� �����. ��� ������� ���������� ����� � ���������.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_04");	//������� �� ������ ��������, ���� �� ���������� �����... ��� �� ������� ������ �������� ��������.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_05");	//�� ������ ������������� ��������� ������.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_06");	//� ����� �� ������, �� ��-�����, ������ ��� ���� ��� ��������.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_07");	//�������, ��, ������, �� �����-�� ��������� ���� �����������.
};


instance DIA_Addon_Riordian_Gegend(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_Gegend_Condition;
	information = DIA_Addon_Riordian_Gegend_Info;
	permanent = TRUE;
	description = "�������� ��� �� ���� ��������� ��������.";
};


func int DIA_Addon_Riordian_Gegend_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Riordian_WhatToFind) && (Saturas_RiesenPlan == FALSE))
	{
		return TRUE;
	};
};


var int DIA_Addon_Riordian_Gegend_Info_OneTime;

func void DIA_Addon_Riordian_Gegend_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_15_00");	//�������� ��� �� ���� ��������� ��������.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_10_01");	//��� �� ������ ������?
	Info_ClearChoices(DIA_Addon_Riordian_Gegend);
	Info_AddChoice(DIA_Addon_Riordian_Gegend,Dialog_Back,DIA_Addon_Riordian_Gegend_Back);
	if((DIA_Addon_Riordian_Gegend_Info_OneTime == FALSE) && (Npc_HasItems(other,ItWr_Map_AddonWorld) == FALSE))
	{
		Info_AddChoice(DIA_Addon_Riordian_Gegend,"���������� �� ����� ���� ���������?",DIA_Addon_Riordian_Gegend_map);
		DIA_Addon_Riordian_Gegend_Info_OneTime = TRUE;
	};
	Info_AddChoice(DIA_Addon_Riordian_Gegend,"��� �� �������� �������?",DIA_Addon_Riordian_Gegend_Piraten);
	Info_AddChoice(DIA_Addon_Riordian_Gegend,"�������, ��� ������������ �������?",DIA_Addon_Riordian_Gegend_bandits);
	Info_AddChoice(DIA_Addon_Riordian_Gegend,"�� ��� �������� �� ������?",DIA_Addon_Riordian_Gegend_west);
	Info_AddChoice(DIA_Addon_Riordian_Gegend,"��� � ����� �� �������?",DIA_Addon_Riordian_Gegend_ost);
	Info_AddChoice(DIA_Addon_Riordian_Gegend,"��� ����������� �� ���?",DIA_Addon_Riordian_Gegend_sued);
	Info_AddChoice(DIA_Addon_Riordian_Gegend,"��� ��������� �� ������?",DIA_Addon_Riordian_Gegend_nord);
};

func void DIA_Addon_Riordian_Gegend_Back()
{
	Info_ClearChoices(DIA_Addon_Riordian_Gegend);
};

func void DIA_Addon_Riordian_Gegend_map()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_map_15_00");	//���������� �� ����� ���� ���������?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_map_10_01");	//��, ������ ��� ��������� �����. �������� � ����.
};

func void DIA_Addon_Riordian_Gegend_bandits()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_bandits_15_00");	//�������, ��� ������������ �������?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_bandits_10_01");	//�� �������� � ���������� ����� ��������� �� �������.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_bandits_10_02");	//����� ��������� �� ��������, ���� �������� �������� ������.
};

func void DIA_Addon_Riordian_Gegend_Piraten()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_Piraten_15_00");	//��� �� �������� �������?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_Piraten_10_01");	//�� ������. ��������� ������ ��������� � ����� ����� �������� ������.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_Piraten_10_02");	//�����, ��� ���������.
};

func void DIA_Addon_Riordian_Gegend_nord()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_nord_15_00");	//��� ��������� �� ������?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_nord_10_01");	//���� ������ ������� ������, ��� ����������� ������� ������, ���������� �������.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_nord_10_02");	//�������� ��� ���������� ����� � ��������������� �� ������ �����.
};

func void DIA_Addon_Riordian_Gegend_sued()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_sued_15_00");	//��� ����������� �� ���?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_sued_10_01");	//��������� �� ��� ����� ����������������.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_sued_10_02");	//�� ������� ��� ��������-����������, �������� � ����� ����������� ����.
};

func void DIA_Addon_Riordian_Gegend_ost()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_ost_15_00");	//��� � ����� �� �������?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_ost_10_01");	//�������� ������. ��� ��������� ����� ������.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_ost_10_02");	//��� ����� ��������� �� ������ ��������, �� � ����������� ������� ��������.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_ost_10_03");	//���� ����������.
};


var int DIA_Addon_Riordian_Gegend_west_OneTime;

func void DIA_Addon_Riordian_Gegend_west()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_west_15_00");	//�� ��� �������� �� ������?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_west_10_01");	//��� ���. �� �� �����, ��� ��� ��������� ����� ����.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_west_10_02");	//������, �� ���� ������ �������� ���� ������ ������.
	if((DIA_Addon_Riordian_Gegend_west_OneTime == FALSE) && Npc_HasItems(VLK_4304_Addon_William,ITWr_Addon_William_01))
	{
		AI_Output(self,other,"DIA_Addon_Riordian_Gegend_west_10_03");	//�� �������, �������� ������, �� ����� ���� ������.
		AI_Output(self,other,"DIA_Addon_Riordian_Gegend_west_10_04");	//���� ����� �� ���� ���������.
		B_LogEntry(TOPIC_Addon_MissingPeople,LogText_Addon_WilliamLeiche);
		DIA_Addon_Riordian_Gegend_west_OneTime = TRUE;
	};
};


instance DIA_Addon_Riordian_HousesOfRulers(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_HousesOfRulers_Condition;
	information = DIA_Addon_Riordian_HousesOfRulers_Info;
	description = "���� ������ �������.";
};


func int DIA_Addon_Riordian_HousesOfRulers_Condition()
{
	if(MIS_Saturas_LookingForHousesOfRulers == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_HousesOfRulers_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_HousesOfRulers_15_00");	//���� ������ �������. � ������ ����������� ���� ������� ���������.
	AI_Output(self,other,"DIA_Addon_Riordian_HousesOfRulers_10_01");	//�� ��, ����� ����� �������� �� �� ��������������� � ������� ������, ��� ������������ ��������� ���������� �������.
	AI_Output(self,other,"DIA_Addon_Riordian_HousesOfRulers_10_02");	//�� ���� ������ � ���� ���� ���� ������ ����������.
	MIS_Riordian_HousesOfRulers = LOG_Running;
};


instance DIA_Addon_Riordian_WhereAreHouses(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_WhereAreHouses_Condition;
	information = DIA_Addon_Riordian_WhereAreHouses_Info;
	description = "��� ��������� ���� �������?";
};


func int DIA_Addon_Riordian_WhereAreHouses_Condition()
{
	if((MIS_Riordian_HousesOfRulers == LOG_Running) && (Saturas_SCBroughtAllToken == FALSE))
	{
		return TRUE;
	};
};


var int B_WhreAreHousesOfRulersOneTime;

func void B_WhreAreHousesOfRulers()
{
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_00");	//������ ������ - ��� �������� ����������. ��� ��������� ������ �� ������.
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_01");	//������ ������ ���������� �� �������. �� ������������ �� ���� ��������, ���������� �������.
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_02");	//������ ������ � ������� ������� ����������� �������� ���� �� �����. �� ������� �� �� ���-������.
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_03");	//� ������-��������� ��������� ������ ���� ���-�� �� ���-�������.
	if(B_WhreAreHousesOfRulersOneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_04");	//���� ��� ������ ��� �����������, �� ������� �� �� ������ ������ ���������.
		B_WhreAreHousesOfRulersOneTime = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_05");	//��� ������ ��������� �� �����������. � ����������� ��������� ����� � ������ �� ��� ���� ������ ��������.
	if(B_WhreAreHousesOfRulersOneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_06");	//�������, ���� ��� �������.
	};
	Log_CreateTopic(TOPIC_Addon_HousesOfRulers,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_HousesOfRulers,LOG_Running);
	B_LogEntry(TOPIC_Addon_HousesOfRulers,"����� ������ - ��� �������� ����������. ��� ��������� ���-�� �� ������.");
	Log_AddEntry(TOPIC_Addon_HousesOfRulers,"����� ������ - ��� ���������� ������� �������� �� �������.");
	Log_AddEntry(TOPIC_Addon_HousesOfRulers,"����� ������ � ������� ������� ��������� �������� ���� �� �����. � ����� ����� �� �� ���-������.");
	Log_AddEntry(TOPIC_Addon_HousesOfRulers,"������-��������� ��������� ��������� �� ���-�������.");
};

func void DIA_Addon_Riordian_WhereAreHouses_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_WhereAreHouses_15_00");	//��� ��������� ���� �������?
	B_WhreAreHousesOfRulers();
};


instance DIA_Addon_Riordian_FoundHouse(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_FoundHouse_Condition;
	information = DIA_Addon_Riordian_FoundHouse_Info;
	permanent = TRUE;
	description = "������ �������...";
};


func int DIA_Addon_Riordian_FoundHouse_Condition()
{
	if((MIS_Riordian_HousesOfRulers == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_Riordian_WhereAreHouses) && (RiordianHousesFoundCount < 5))
	{
		return TRUE;
	};
};



var int foundhouseinfo[6];
const int Library = 1;
const int heiler = 2;
const int Warrior = 3;
const int Priest = 4;
const int Totenw = 5;
var int RiordianHouseNeuigkeit;
var int RiordianHousesFoundCount;

func void DIA_Addon_Riordian_FoundHouse_Info()
{
	var int RiordianHouseXPs;
	RiordianHouseNeuigkeit = 0;
	AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_00");	//������ �������...
	AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_01");	//��?
	if((SC_COMESINTO_CANYONLIBRARY_FUNC_OneTime == TRUE) && (FOUNDHOUSEINFO[1] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_02");	//����������� ������, ������, ���������������� ����.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_03");	//�� ���������, ��� ��� �������� ��������� ������ �� ������� �����?
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_04");	//���, � ��� �� �����, �� ��� �����...
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_05");	//�����, � ����� ������, ���� ����� �� ��� ����������.
		FOUNDHOUSEINFO[1] = TRUE;
		RiordianHouseNeuigkeit = RiordianHouseNeuigkeit + 1;
		Log_CreateTopic(TOPIC_Addon_CanyonOrcs,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_CanyonOrcs,LOG_Running);
		B_LogEntry(TOPIC_Addon_CanyonOrcs,"��� ���� ������� ����� �������, ���� � ����� ������ �� �����.");
	};
	if((Npc_IsDead(Stoneguardian_Heiler) || Npc_HasItems(other,ItMi_Addon_Stone_04) || (Saturas_SCFound_ItMi_Addon_Stone_04 == TRUE)) && (FOUNDHOUSEINFO[2] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_06");	//������ ��������� ��������� � ������ ������. ��� �������� �������� ������.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_07");	//������, �� ��� ��� �����?
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_08");	//��, �� ����������, ������� ��� ��� ���������...
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_09");	//��� ������ ������ ���������� ������� ��������, ���������� ��������...
		FOUNDHOUSEINFO[2] = TRUE;
		RiordianHouseNeuigkeit = RiordianHouseNeuigkeit + 1;
	};
	if((RavenIsInTempel == TRUE) && (FOUNDHOUSEINFO[3] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_10");	//�� ������ ������ ��������� �����.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_11");	//(�������) �� ������ ������� �����.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_12");	//��� ����� ������������ �������� �� ���� ������.
		FOUNDHOUSEINFO[3] = TRUE;
		RiordianHouseNeuigkeit = RiordianHouseNeuigkeit + 1;
	};
	if((Npc_IsDead(Minecrawler_Priest) || Npc_HasItems(other,ItMi_Addon_Stone_03) || (Saturas_SCFound_ItMi_Addon_Stone_03 == TRUE)) && (FOUNDHOUSEINFO[4] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_13");	//�� ������ ������ ���� ��������� ���������...
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_14");	//�� ���� ��� �������� ����������� ����� ����� �����, �����?
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_15");	//��, �� ����.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_16");	//�������� ���� ����� ��������...
		FOUNDHOUSEINFO[4] = TRUE;
		RiordianHouseNeuigkeit = RiordianHouseNeuigkeit + 1;
	};
	if((Npc_IsDead(MayaZombie04_Totenw) || Npc_HasItems(other,ItMi_Addon_Stone_02) || (Saturas_SCFound_ItMi_Addon_Stone_02 == TRUE)) && (FOUNDHOUSEINFO[5] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_17");	//��� ������� ������� �������� ���� ���.
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_18");	//� ������ ������� �� �������� ����� ���������� ����� � ����� �����.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_19");	//����� ��������� ������! ������ ������� ���� ������� ����� �� ������������.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_20");	//�� ������ ����� � ����� ������� ��������� �� ���� ������. �������, �� ��������� �� �� ���������.
		FOUNDHOUSEINFO[5] = TRUE;
		RiordianHouseNeuigkeit = RiordianHouseNeuigkeit + 1;
	};
	if(RiordianHouseNeuigkeit > 0)
	{
		RiordianHouseXPs = XP_Addon_Riordian_FoundHouse * RiordianHouseNeuigkeit;
		B_GivePlayerXP(RiordianHouseXPs);
		RiordianHousesFoundCount = RiordianHousesFoundCount + RiordianHouseNeuigkeit;
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_21");	//������� ���, ��� ��� ���������?
		B_WhreAreHousesOfRulers();
	};
};


instance DIA_Addon_Riordian_OrksWeg(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_OrksWeg_Condition;
	information = DIA_Addon_Riordian_OrksWeg_Info;
	description = "����� ���� �������� ������� � ���� ���������.";
};


func int DIA_Addon_Riordian_OrksWeg_Condition()
{
	if(Npc_IsDead(OrcShaman_Sit_CanyonLibraryKey) && (FOUNDHOUSEINFO[1] == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_OrksWeg_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_OrksWeg_15_00");	//����� ���� �������� ������� � ���� ���������.
	AI_Output(self,other,"DIA_Addon_Riordian_OrksWeg_10_01");	//������ �� ��� ��������?
	if(OrcShaman_Sit_CanyonLibraryKey.aivar[AIV_KilledByPlayer] == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Riordian_OrksWeg_15_02");	//� ���� �� ���������.
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Riordian_OrksWeg_15_03");	//�� ������������ �����.
	};
	AI_Output(self,other,"DIA_Addon_Riordian_OrksWeg_10_04");	//����� ���������, �� ����.
	AI_Output(self,other,"DIA_Addon_Riordian_OrksWeg_10_05");	//��� ������ �� ����� ������ ������.
	TOPIC_END_CanyonOrcs = TRUE;
	B_GivePlayerXP(XP_Addon_Riordian_OrksWeg);
};


instance DIA_Addon_Riordian_FoundAllHouses(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_FoundAllHouses_Condition;
	information = DIA_Addon_Riordian_FoundAllHouses_Info;
	description = "� ����� ��� ������.";
};


func int DIA_Addon_Riordian_FoundAllHouses_Condition()
{
	if((RiordianHousesFoundCount >= 5) && (MIS_Riordian_HousesOfRulers == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_FoundAllHouses_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_FoundAllHouses_15_00");	//� ����� ��� ������.
	AI_Output(self,other,"DIA_Addon_Riordian_FoundAllHouses_10_01");	//��� ��� ���������� ���, ��� � ������?
	AI_Output(other,self,"DIA_Addon_Riordian_FoundAllHouses_15_02");	//��... �����-�����.
	AI_Output(self,other,"DIA_Addon_Riordian_FoundAllHouses_10_03");	//�������! ������, ��� ������ ���� �� ���������.
	AI_Output(self,other,"DIA_Addon_Riordian_FoundAllHouses_10_04");	//��������� ����.
	MIS_Riordian_HousesOfRulers = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_FoundAllHouses);
};


instance DIA_Addon_Riordian_ADW_PreTeach(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_ADW_PreTeach_Condition;
	information = DIA_Addon_Riordian_ADW_PreTeach_Info;
	description = "�� ������ ���� ����-������ �������?";
};


func int DIA_Addon_Riordian_ADW_PreTeach_Condition()
{
	return TRUE;
};

func void DIA_Addon_Riordian_ADW_PreTeach_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_ADW_PreTeach_15_00");	//�� ������ ���� ����-������ �������?
	AI_Output(self,other,"DIA_Addon_Riordian_ADW_PreTeach_10_01");	//��, � ���� ������� ���� ��������� �������.
	if(Npc_HasItems(other,ItAm_Addon_WispDetector) && (DIA_Addon_Riordian_Teach_NoPerm == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Riordian_ADW_PreTeach_10_02");	//� ��� � ���� �������� ����, ��� ������� ���� ������ ������ ��������� ��������.
		Log_CreateTopic(TOPIC_Addon_KDWTeacher,LOG_NOTE);
		Log_AddEntry(TOPIC_Addon_KDWTeacher,LogText_Addon_RiordianTeach);
	};
	Log_CreateTopic(TOPIC_Addon_KDWTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_Addon_KDWTeacher,LogText_Addon_RiordianTeachAlchemy);
	Riordian_ADW_ADDON_TeachWisp = TRUE;
	Riordian_ADW_ADDON_TeachAlchemy = TRUE;
};


instance DIA_Addon_Riordian_ADW_Teach(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 90;
	condition = DIA_Addon_Riordian_ADW_Teach_Condition;
	information = DIA_Addon_Riordian_ADW_Teach_Info;
	permanent = TRUE;
	description = "������ ���, ��� ����������� ����� ����������� �������.";
};


var int DIA_Addon_Riordian_ADW_Teach_NoPerm;

func int DIA_Addon_Riordian_ADW_Teach_Condition()
{
	if((DIA_Addon_Riordian_ADW_Teach_NoPerm == FALSE) && (DIA_Addon_Riordian_Teach_NoPerm == FALSE) && (Riordian_ADW_ADDON_TeachWisp == TRUE) && Npc_HasItems(other,ItAm_Addon_WispDetector))
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_ADW_Teach_Info()
{
	B_DIA_Addon_Riordian_Teach_15_00();
	if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NF] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] == FALSE))
	{
		Info_ClearChoices(DIA_Addon_Riordian_ADW_Teach);
		Info_AddChoice(DIA_Addon_Riordian_ADW_Teach,Dialog_Back,DIA_Addon_Riordian_ADW_Teach_BACK);
		B_DIA_Addon_Riordian_Teach_10_01();
		if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] == FALSE)
		{
			Info_AddChoice(DIA_Addon_Riordian_ADW_Teach,B_BuildLearnString(NAME_ADDON_WISPSKILL_FF,B_GetLearnCostTalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_FF)),DIA_Addon_Riordian_ADW_Teach_WISPSKILL_FF);
		};
		if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] == FALSE)
		{
			Info_AddChoice(DIA_Addon_Riordian_ADW_Teach,B_BuildLearnString(NAME_ADDON_WISPSKILL_NONE,B_GetLearnCostTalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_NONE)),DIA_Addon_Riordian_ADW_Teach_WISPSKILL_NONE);
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] == FALSE) && (WISPSKILL_LEVEL >= 2))
		{
			Info_AddChoice(DIA_Addon_Riordian_ADW_Teach,B_BuildLearnString(NAME_ADDON_WISPSKILL_RUNE,B_GetLearnCostTalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_RUNE)),DIA_Addon_Riordian_ADW_Teach_WISPSKILL_RUNE);
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] == FALSE) && (WISPSKILL_LEVEL >= 2))
		{
			Info_AddChoice(DIA_Addon_Riordian_ADW_Teach,B_BuildLearnString(NAME_ADDON_WISPSKILL_MAGIC,B_GetLearnCostTalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_MAGIC)),DIA_Addon_Riordian_ADW_Teach_WISPSKILL_MAGIC);
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] == FALSE) && (WISPSKILL_LEVEL >= 3))
		{
			Info_AddChoice(DIA_Addon_Riordian_ADW_Teach,B_BuildLearnString(NAME_ADDON_WISPSKILL_FOOD,B_GetLearnCostTalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_FOOD)),DIA_Addon_Riordian_ADW_Teach_WISPSKILL_FOOD);
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] == FALSE) && (WISPSKILL_LEVEL >= 3))
		{
			Info_AddChoice(DIA_Addon_Riordian_ADW_Teach,B_BuildLearnString(NAME_ADDON_WISPSKILL_POTIONS,B_GetLearnCostTalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_POTIONS)),DIA_Addon_Riordian_ADW_Teach_WISPSKILL_POTIONS);
		};
	}
	else
	{
		B_DIA_Addon_Riordian_Teach_10_08();
		DIA_Addon_Riordian_ADW_Teach_NoPerm = TRUE;
	};
};

func void DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X()
{
	B_DIA_Addon_Riordian_Teach_WISPSKILL_X_10_00();
};

func void DIA_Addon_Riordian_ADW_Teach_BACK()
{
	Info_ClearChoices(DIA_Addon_Riordian_ADW_Teach);
};

func void DIA_Addon_Riordian_ADW_Teach_WISPSKILL_FF()
{
	if(B_TeachPlayerTalentWispDetector(self,other,WISPSKILL_FF))
	{
		if(WISPSKILL_LEVEL < 2)
		{
			WISPSKILL_LEVEL = 2;
		};
		DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X();
	};
	Info_ClearChoices(DIA_Addon_Riordian_ADW_Teach);
};

func void DIA_Addon_Riordian_ADW_Teach_WISPSKILL_NONE()
{
	if(B_TeachPlayerTalentWispDetector(self,other,WISPSKILL_NONE))
	{
		if(WISPSKILL_LEVEL < 2)
		{
			WISPSKILL_LEVEL = 2;
		};
		DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X();
	};
	Info_ClearChoices(DIA_Addon_Riordian_ADW_Teach);
};

func void DIA_Addon_Riordian_ADW_Teach_WISPSKILL_RUNE()
{
	if(B_TeachPlayerTalentWispDetector(self,other,WISPSKILL_RUNE))
	{
		if(WISPSKILL_LEVEL < 3)
		{
			WISPSKILL_LEVEL = 3;
		};
		DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X();
	};
	Info_ClearChoices(DIA_Addon_Riordian_ADW_Teach);
};

func void DIA_Addon_Riordian_ADW_Teach_WISPSKILL_MAGIC()
{
	if(B_TeachPlayerTalentWispDetector(self,other,WISPSKILL_MAGIC))
	{
		if(WISPSKILL_LEVEL < 3)
		{
			WISPSKILL_LEVEL = 3;
		};
		DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X();
	};
	Info_ClearChoices(DIA_Addon_Riordian_ADW_Teach);
};

func void DIA_Addon_Riordian_ADW_Teach_WISPSKILL_FOOD()
{
	if(B_TeachPlayerTalentWispDetector(self,other,WISPSKILL_FOOD))
	{
		DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X();
	};
	Info_ClearChoices(DIA_Addon_Riordian_ADW_Teach);
};

func void DIA_Addon_Riordian_ADW_Teach_WISPSKILL_POTIONS()
{
	if(B_TeachPlayerTalentWispDetector(self,other,WISPSKILL_POTIONS))
	{
		DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X();
	};
	Info_ClearChoices(DIA_Addon_Riordian_ADW_Teach);
};


instance DIA_Riordian_ADW_TeachAlchemy(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 2;
	condition = DIA_Riordian_ADW_TeachAlchemy_Condition;
	information = DIA_Riordian_ADW_TeachAlchemy_Info;
	permanent = TRUE;
	description = "����� ���� ��������� �����.";
};


var int DIA_Riordian_ADW_TeachAlchemy_permanent;

func int DIA_Riordian_ADW_TeachAlchemy_Condition()
{
	if((DIA_Riordian_ADW_TeachAlchemy_permanent == FALSE) && (Riordian_ADW_ADDON_TeachAlchemy == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Riordian_ADW_TeachAlchemy_Info()
{
	var int talente;
	talente = 0;
	AI_Output(other,self,"DIA_Addon_Riordian_ADW_TeachAlchemy_15_00");	//����� ���� ��������� �����.
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE))
	{
		Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
		Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,Dialog_Back,DIA_Riordian_ADW_TeachAlchemy_BACK);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString("�������� ��������",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_01)),DIA_Riordian_ADW_TeachAlchemy_Health_01);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE))
	{
		Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString("�������� ��������",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_02)),DIA_Riordian_ADW_TeachAlchemy_Health_02);
		talente = talente + 1;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString("�������� ����",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_01)),DIA_Riordian_ADW_TeachAlchemy_Mana_01);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE))
	{
		Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString("�������� ����",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_02)),DIA_Riordian_ADW_TeachAlchemy_Mana_02);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE))
	{
		Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString("������� ����",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_03)),DIA_Riordian_ADW_TeachAlchemy_Mana_03);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE))
	{
		Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString("������� ����",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Mana)),DIA_Riordian_ADW_TeachAlchemy_Perm_Mana);
		talente = talente + 1;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE)
	{
		Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString("������� ��������",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_DEX)),DIA_Riordian_ADW_TeachAlchemy_Perm_DEX);
		talente = talente + 1;
	};
	if(talente > 0)
	{
		if(Alchemy_Explain != TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_01");	//���������� ����� ��������������� �� ������������ �����. �� ���������� ����� ���� � ����� �� ������ �������.
			AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_02");	//���� ����������� ������ �����, ����������� �, �������, ������ ������� �����.
			AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_03");	//�������� �� ������ ��������� � ����. ��� ��������� ���� �������� ������ ������.
			Alchemy_Explain = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_04");	//����� ������ �� ������ �������?
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_05");	//� ��� ������ ���� �����, ��� ���� ���.
		DIA_Riordian_ADW_TeachAlchemy_permanent = TRUE;
	};
};

func void DIA_Riordian_ADW_TeachAlchemy_BACK()
{
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

func void DIA_Riordian_ADW_TeachAlchemy_Health_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_01);
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

func void DIA_Riordian_ADW_TeachAlchemy_Health_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_02);
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

func void DIA_Riordian_ADW_TeachAlchemy_Mana_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_01);
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

func void DIA_Riordian_ADW_TeachAlchemy_Mana_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_02);
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

func void DIA_Riordian_ADW_TeachAlchemy_Mana_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_03);
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

func void DIA_Riordian_ADW_TeachAlchemy_Perm_Mana()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Mana);
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

func void DIA_Riordian_ADW_TeachAlchemy_Perm_DEX()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_DEX);
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};


// FreeSergey - modding scripts
// ������������� �������� "�� ������"

instance KDW_14040_Addon_Riordian_ADW_MakePotionsCommon (C_INFO)
{
	npc			= KDW_14040_Addon_Riordian_ADW;
	condition		= KDW_14040_Addon_Riordian_ADW_MakePotionsCommon_Condition;
	information		= KDW_14040_Addon_Riordian_ADW_MakePotionsCommon_Info;
	important		= FALSE;
	permanent		= TRUE;
	description		= "� ���� ���� ���-��� ��� ������������� ��������.";
};

func int KDW_14040_Addon_Riordian_ADW_MakePotionsCommon_Condition()
{
	return TRUE;
};

func void KDW_14040_Addon_Riordian_ADW_MakePotionsCommon_MakeChoices()
{
	Info_ClearChoices(KDW_14040_Addon_Riordian_ADW_MakePotionsCommon);
	Info_AddChoice(KDW_14040_Addon_Riordian_ADW_MakePotionsCommon, DIALOG_BACK, KDW_14040_Addon_Riordian_ADW_MakePotionsCommon_Back);

	if	(
			(NPC_HasItems(other, ItPl_Mana_Herb_03) >= 2) && (NPC_HasItems(other, ItPl_Temp_Herb) >= 1) && (NPC_HasItems(other, ItMi_Gold) >= 300)
		)
	{
		Info_AddChoice(KDW_14040_Addon_Riordian_ADW_MakePotionsCommon, "������� ����, 300 ������", KDW_14040_Addon_Riordian_ADW_MakePotionsCommon_ItPo_Mana_03);
	};

	if	((NPC_HasItems(other, ItPl_Perm_Herb) >= 1) && (NPC_HasItems(other, ItPl_Mana_Herb_03) >= 1) && (NPC_HasItems(other, ItMi_Gold) >= 1000))
	{
		Info_AddChoice(KDW_14040_Addon_Riordian_ADW_MakePotionsCommon, "������� ����, 1000 ������", KDW_14040_Addon_Riordian_ADW_MakePotionsCommon_ItPo_Perm_Mana);
	};

	if	((NPC_HasItems(other, ItPl_Dex_Herb_01) >= 1) && (NPC_HasItems(other, ItPl_Perm_Herb) >= 1) && (NPC_HasItems(other, ItMi_Gold) >= 1000))
	{
		Info_AddChoice(KDW_14040_Addon_Riordian_ADW_MakePotionsCommon, "������� ��������, 1000 ������", KDW_14040_Addon_Riordian_ADW_MakePotionsCommon_ItPo_Perm_DEX);
	};
};

func void KDW_14040_Addon_Riordian_ADW_MakePotionsCommon_Info()
{
	AI_Output(other, self, "KDW_14040_Addon_Riordian_ADW_MakePotionsCommon_Info_15_01"); // � ���� ���� ���-��� ��� ������������� ��������.
	AI_Output(self, other, "KDW_14040_Addon_Riordian_ADW_MakePotionsCommon_Info_10_02"); // ���, ����� ���������. � ���� ���������� ����:
	
	KDW_14040_Addon_Riordian_ADW_MakePotionsCommon_MakeChoices();
};

func void KDW_14040_Addon_Riordian_ADW_MakePotionsCommon_ItPo_Mana_03()
{
	AI_Output(other, self, "KDW_14040_Addon_Riordian_ADW_MakePotionsCommon_ItPo_Mana_03_15_01"); // ������� ����

    	B_GiveInvItems(other, self, 	ItPl_Mana_Herb_03,	2);
    	B_GiveInvItems(other, self, 	ItPl_Temp_Herb,  	1);
    	B_GiveInvItems(other, self, 	ItMi_Gold,  		300);

	CreateInvItems(self, 		ItPo_Mana_03, 	1);
    	B_GiveInvItems(self, other, 	ItPo_Mana_03, 	1);

	KDW_14040_Addon_Riordian_ADW_MakePotionsCommon_MakeChoices();
};

func void KDW_14040_Addon_Riordian_ADW_MakePotionsCommon_ItPo_Perm_Mana()
{
	AI_Output(other, self, "KDW_14040_Addon_Riordian_ADW_MakePotionsCommon_ItPo_Perm_Mana_15_01"); // ������� ����

    	B_GiveInvItems(other, self, 	ItPl_Perm_Herb,		1);
    	B_GiveInvItems(other, self, 	ItPl_Mana_Herb_03,  	1);
    	B_GiveInvItems(other, self, 	ItMi_Gold,  		1000);

	CreateInvItems(self, 		ItPo_Perm_Mana, 	1);
    	B_GiveInvItems(self, other, 	ItPo_Perm_Mana, 	1);

	KDW_14040_Addon_Riordian_ADW_MakePotionsCommon_MakeChoices();
};

func void KDW_14040_Addon_Riordian_ADW_MakePotionsCommon_ItPo_Perm_DEX()
{
	AI_Output(other, self, "KDW_14040_Addon_Riordian_ADW_MakePotionsCommon_ItPo_Perm_DEX_15_01"); // ������� ��������

    	B_GiveInvItems(other, self, 	ItPl_Dex_Herb_01,	1);
    	B_GiveInvItems(other, self, 	ItPl_Perm_Herb,  	1);
    	B_GiveInvItems(other, self, 	ItMi_Gold,  		1000);

	CreateInvItems(self, 		ItPo_Perm_DEX, 	1);
    	B_GiveInvItems(self, other, 	ItPo_Perm_DEX, 	1);

	KDW_14040_Addon_Riordian_ADW_MakePotionsCommon_MakeChoices();
};

func void KDW_14040_Addon_Riordian_ADW_MakePotionsCommon_Back()
{
	Info_ClearChoices(KDW_14040_Addon_Riordian_ADW_MakePotionsCommon);
};
