
instance DIA_Richter_EXIT(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 999;
	condition = DIA_Richter_EXIT_Condition;
	information = DIA_Richter_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Richter_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Richter_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Richter_Hello(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 4;
	condition = DIA_Richter_Hello_Condition;
	information = DIA_Richter_Hello_Info;
	permanent = FALSE;
	description = "��� �� ������� �����?";
};


func int DIA_Richter_Hello_Condition()
{
	if(MIS_Lee_JudgeRichter == 0)
	{
		return TRUE;
	};
};

func void DIA_Richter_Hello_Info()
{
	AI_Output(other,self,"DIA_Richter_Hello_15_00");	//��� �� ������� �����?
	AI_Output(self,other,"DIA_Richter_Hello_10_01");	//��� ���� �� ���� �����? ��� �� ������ �����?
	AI_Output(other,self,"DIA_Richter_Hello_15_02");	//�, �-�...
	AI_Output(self,other,"DIA_Richter_Hello_10_03");	//�����, �� ������ ����� �� �����������?
	Info_ClearChoices(DIA_Richter_Hello);
	Info_AddChoice(DIA_Richter_Hello,"� ������ �� �����.",DIA_Richter_Hello_DontThinkSo);
	Info_AddChoice(DIA_Richter_Hello,"����� � ���.",DIA_Richter_Hello_MayBe);
};

func void DIA_Richter_Hello_DontThinkSo()
{
	AI_Output(other,self,"DIA_Richter_Hello_DontThinkSo_15_00");	//� ������ �� �����.
	AI_Output(self,other,"DIA_Richter_Hello_DontThinkSo_10_01");	//�������. ����� ����������, ��� ���-�� ����� ���� ������.
	AI_Output(self,other,"DIA_Richter_Hello_DontThinkSo_10_02");	//�����, ��� ��, ������� ��������, ������ ���� �� �����.
};

func void DIA_Richter_Hello_MayBe()
{
	AI_Output(other,self,"DIA_Richter_Hello_MayBe_15_00");	//����� � ���.
	AI_Output(self,other,"DIA_Richter_Hello_MayBe_10_01");	//�� ������ ��������?! �� ���� ������, � ��� �� ��������������?
	AI_Output(self,other,"DIA_Richter_Hello_MayBe_10_02");	//�� ������� ����, �� ��� �� ���������� �� ��� ����� �����������.
	AI_Output(self,other,"DIA_Richter_Hello_MayBe_10_03");	//� ������ �������� � ���� ����!
	AI_StopProcessInfos(self);
};


instance DIA_Richter_Perm(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 800;
	condition = DIA_Richter_Perm_Condition;
	information = DIA_Richter_Perm_Info;
	permanent = TRUE;
	description = "��� ����?";
};


func int DIA_Richter_Perm_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Richter_Hello) || (MIS_Lee_JudgeRichter == LOG_Running)) && (SCIstRichtersLakai == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Richter_Perm_Info()
{
	AI_Output(other,self,"DIA_Richter_Perm_15_00");	//��� ����?
	if((MIS_Lee_JudgeRichter == LOG_Running) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		AI_Output(self,other,"DIA_Richter_Perm_10_01");	//���� ����� �������� ������, ������� �������, ���� � �� ������ ������.
		AI_Output(other,self,"DIA_Richter_Perm_15_02");	//����������. � ����� �� ��� ����, ����� ��������� ����. � ��� ������.
		AI_Output(self,other,"DIA_Richter_Perm_10_03");	//��. ��� �� ������ �������� �� ����. ���. ���, �������, ������ ����.
		AI_Output(self,other,"DIA_Richter_Perm_10_04");	//��, � ���� ���� ��������� ��������. �� � �� ����, ���� �� � �������� ����. ������� �� ������ ��������, ��� �� ���� ����� ����������.
		SCIstRichtersLakai = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Richter_Perm_10_05");	//����� � ��� �� ������, ��� �� ���� ����� � ����� ������� ���?
		AI_Output(other,self,"DIA_Richter_Perm_15_06");	//���, �� ������� ����, �� ��� ��������.
		AI_Output(self,other,"DIA_Richter_Perm_10_07");	//�� ������, � �������, �� ����, �������, ��� �����.
	};
};


instance DIA_Richter_RichtersLakai(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 2;
	condition = DIA_Richter_RichtersLakai_Condition;
	information = DIA_Richter_RichtersLakai_Info;
	description = "������� ����.";
};


func int DIA_Richter_RichtersLakai_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Richter_Hello) || (MIS_Lee_JudgeRichter != 0)) && (SCIstRichtersLakai == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Richter_RichtersLakai_Info()
{
	AI_Output(other,self,"DIA_Richter_RichtersLakai_15_00");	//������� ����.
	AI_Output(self,other,"DIA_Richter_RichtersLakai_10_01");	//�-�-�. ������. ������. ������� ��� ��������� ����� ����� ����. ��� ������ ��� ���-�� � �������� ���������.
	AI_Output(self,other,"DIA_Richter_RichtersLakai_10_02");	//���� ���� ������� ���, � ������� ������ ����, ����� ������� ���� � �������������.
	Info_ClearChoices(DIA_Richter_RichtersLakai);
	Info_AddChoice(DIA_Richter_RichtersLakai,"� ������ ������� � �����? �� � ���� ����� �������.",DIA_Richter_RichtersLakai_nein);
	Info_AddChoice(DIA_Richter_RichtersLakai,"������.",DIA_Richter_RichtersLakai_ja);
	B_LogEntry(TOPIC_RichterLakai,"����� �� �������� ���. � ������ �������� ���� �������� ���. � ������ ������� ��������� ����� �� ������� ��������� ����� ���� � �������� ����� ���.");
	MIS_Richter_BringHolyHammer = LOG_Running;
};

func void DIA_Richter_RichtersLakai_nein()
{
	AI_Output(other,self,"DIA_Richter_RichtersLakai_nein_15_00");	//� ������ ������� � �����? �� � ���� ����� �������.
	AI_Output(self,other,"DIA_Richter_RichtersLakai_nein_10_01");	//����� ���������� � �����. ������ ������� ��� ����� �������.
	AI_StopProcessInfos(self);
};

func void DIA_Richter_RichtersLakai_ja()
{
	AI_Output(other,self,"DIA_Richter_RichtersLakai_ja_15_00");	//������.
	AI_Output(self,other,"DIA_Richter_RichtersLakai_ja_10_01");	//�������. �� ����� - ���� ���� �������, � ������� �� ������ � ����.
	AI_StopProcessInfos(self);
};


instance DIA_Richter_KillMorgahard(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 2;
	condition = DIA_Richter_KillMorgahard_Condition;
	information = DIA_Richter_KillMorgahard_Info;
	description = "��� ��������� ����� �����.";
};


func int DIA_Richter_KillMorgahard_Condition()
{
	if(Npc_HasItems(other,Holy_Hammer_MIS) && (MIS_Richter_BringHolyHammer == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Richter_KillMorgahard_Info()
{
	AI_Output(other,self,"DIA_Richter_KillMorgahard_15_00");	//��� ��������� ����� �����.
	B_GiveInvItems(other,self,Holy_Hammer_MIS,1);
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_01");	//� �������. ������, � ���� ������������� ��������� ���������. ��� ���� ��������������.
	CreateInvItems(self,ItMi_Gold,300);
	B_GiveInvItems(self,other,ItMi_Gold,300);
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_02");	//�������. ��� ��� ��� ������ ������, � ���� ���� ��� ���� ��� ���� �������.
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_03");	//��������� ���� �����, �� ������� ������ ������� ��������� �����������.
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_04");	//��� ������ ���� ����������� � ����. ������ �����, �� ����������� � ����� ����� ��������.
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_05");	//�� ������� ����� ���������. � ����, ����� �� ���� ���.
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_06");	//����������, ���� ��� �� ������� ����-������ ���.
	Wld_InsertNpc(BDT_1030_Morgahard,"REICH");
	Wld_InsertNpc(BDT_1031_Fluechtling,"REICH");
	Wld_InsertNpc(BDT_1032_Fluechtling,"REICH");
	Wld_InsertNpc(BDT_1033_Fluechtling,"REICH");
	Wld_InsertNpc(BDT_1034_Fluechtling,"REICH");
	Wld_InsertNpc(BDT_1035_Fluechtling,"REICH");
	B_InitNpcGlobals();
	B_GivePlayerXP(XP_BringHolyHammer);
	MIS_Richter_BringHolyHammer = LOG_SUCCESS;
	B_LogEntry(TOPIC_RichterLakai,"��������� ����������� ������� �� �����. � ������ ����� �� � ����������, � ����� ���������� �� ������� - ����������. ���, ����������������, ���������� � �����, ���-�� �� ����������� � ����� ����� ��������.");
	MIS_Richter_KillMorgahard = LOG_Running;
	AI_StopProcessInfos(self);
};


instance DIA_Richter_KilledMorgahard(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 2;
	condition = DIA_Richter_KilledMorgahard_Condition;
	information = DIA_Richter_KilledMorgahard_Info;
	description = "��������� �����.";
};


func int DIA_Richter_KilledMorgahard_Condition()
{
	if(Npc_IsDead(Morgahard) && (MIS_Richter_KillMorgahard == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Richter_KilledMorgahard_Info()
{
	AI_Output(other,self,"DIA_Richter_KilledMorgahard_15_00");	//��������� �����.
	AI_Output(self,other,"DIA_Richter_KilledMorgahard_10_01");	//��! �� �������� ������. ��� ���� �������.
	CreateInvItems(self,ItMi_Gold,400);
	B_GiveInvItems(self,other,ItMi_Gold,400);
	B_GivePlayerXP(XP_KillMorgahard);
	B_LogEntry(TOPIC_RichterLakai,"�����, ������, �������� ������� � ������ ����������. �, �����, ��� �� ����� ��� ����. ��� �������� ���� - ���������� ������� ��.");
	MIS_Richter_KillMorgahard = LOG_SUCCESS;
};


instance DIA_Richter_KilledMorgahardPERM(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 2;
	condition = DIA_Richter_KilledMorgahardPERM_Condition;
	information = DIA_Richter_KilledMorgahardPERM_Info;
	permanent = TRUE;
	description = "���� � ��� ���-������ ������� ��� ����?";
};


func int DIA_Richter_KilledMorgahardPERM_Condition()
{
	if((MIS_Richter_KillMorgahard == LOG_SUCCESS) && (MIS_RichtersPermissionForShip == 0))
	{
		return TRUE;
	};
};

func void DIA_Richter_KilledMorgahardPERM_Info()
{
	AI_Output(other,self,"DIA_Richter_KilledMorgahardPERM_15_00");	//���� � ��� ���-������ ������� ��� ����?
	AI_Output(self,other,"DIA_Richter_KilledMorgahardPERM_10_01");	//���� ���. ��������, �����.
};


instance DIA_Richter_PermissionForShip(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 2;
	condition = DIA_Richter_PermissionForShip_Condition;
	information = DIA_Richter_PermissionForShip_Info;
	description = "��� ��� ���������� ������������� ���������� ������������� �������� ���������.";
};


func int DIA_Richter_PermissionForShip_Condition()
{
	if(MIS_RichtersPermissionForShip == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Richter_PermissionForShip_Info()
{
	AI_Output(other,self,"DIA_Richter_PermissionForShip_15_00");	//��� ��� ���������� ������������� ���������� ������������� �������� ���������.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_01");	//(�������) ��, ������ ����, �������� ���������. ��� �� ������, ����� � ������?
	AI_Output(other,self,"DIA_Richter_PermissionForShip_15_02");	//�� ��� ������. ���� �� ���� ��� ��� ������, ���� � ���� ���� ���������.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_03");	//(�����) ����� �� ����� ���� �������������! ��� ����� ��! � ������� ���� ������, ���������� ����� ������!
	AI_Output(other,self,"DIA_Richter_PermissionForShip_15_04");	//��������� ���� ����������� �� ������ �������. � ���� ���� ��������, �������������� ���.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_05");	//(�����) ��-�.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_06");	//�� ��������� �� ����. ���� ������ �� ������ ���� � ��� ������ ���.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_07");	//��� ���� ������. � ������ ����������. � ��������� � ����� �����.
	CreateInvItems(self,ITWr_ForgedShipLetter_MIS,1);
	B_GiveInvItems(self,other,ITWr_ForgedShipLetter_MIS,1);
	B_LogEntry(Topic_Ship,"������ � ������������� ���������� ������ ��������� ��� ������� ��������� ��������. ���������, ��� ������ �� ��� ��.");
	MIS_RichtersPermissionForShip = LOG_SUCCESS;
	B_GivePlayerXP(XP_RichtersPermissionForShip);
};


instance DIA_Richter_perm2(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 2;
	condition = DIA_Richter_perm2_Condition;
	information = DIA_Richter_perm2_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Richter_perm2_Condition()
{
	if((MIS_RichtersPermissionForShip == LOG_SUCCESS) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Richter_perm2_Info()
{
	AI_Output(self,other,"DIA_Richter_perm2_10_00");	//�������� � ���� ����.
	AI_StopProcessInfos(self);
};


instance DIA_Richter_PICKPOCKET(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 900;
	condition = DIA_Richter_PICKPOCKET_Condition;
	information = DIA_Richter_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(������� ���� ���� ����� �����)";
};


func int DIA_Richter_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ItKe_Richter) >= 1) && (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Richter_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Richter_PICKPOCKET);
	Info_AddChoice(DIA_Richter_PICKPOCKET,Dialog_Back,DIA_Richter_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Richter_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Richter_PICKPOCKET_DoIt);
};

func void DIA_Richter_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		B_GiveInvItems(self,other,ItKe_Richter,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Richter_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Richter_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Richter_PICKPOCKET);
};

