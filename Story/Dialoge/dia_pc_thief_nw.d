
instance DIA_DiegoNW_EXIT(C_Info)
{
	npc = PC_Thief_NW;
	nr = 999;
	condition = DIA_DiegoNW_EXIT_Condition;
	information = DIA_DiegoNW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_DiegoNW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_DiegoNW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DiegoNW_Perm(C_Info)
{
	npc = PC_Thief_NW;
	nr = 998;
	condition = DIA_DiegoNW_Perm_Condition;
	information = DIA_DiegoNW_Perm_Info;
	permanent = TRUE;
	description = "��� ��������?";
};


func int DIA_DiegoNW_Perm_Condition()
{
	if(Diego_IsOnBoard == FALSE)
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_Perm_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_Perm_15_00");	//��� ����?
	AI_Output(self,other,"DIA_DiegoNW_Perm_11_01");	//�������. ������ ����� �� ������ ���, ��� ������� �� ��� ����� ��������� ���������?
	AI_Output(other,self,"DIA_DiegoNW_Perm_15_02");	//������� �� ����. � ���� ���� ����� ������ �����.
	AI_Output(self,other,"DIA_DiegoNW_Perm_11_03");	//�� �� ����� ��� ��������� ��� �����. �� �� ���� ������ �� ���������� � �������� ���������.
};


instance DIA_DiegoNW_NeedHelp(C_Info)
{
	npc = PC_Thief_NW;
	nr = 1;
	condition = DIA_DiegoNW_NeedHelp_Condition;
	information = DIA_DiegoNW_NeedHelp_Info;
	important = TRUE;
};


func int DIA_DiegoNW_NeedHelp_Condition()
{
	if(Diego_IsOnBoard == FALSE)
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_NeedHelp_Info()
{
	if(Diego_IsDead == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_01");	//��! �� ��������� ���, ����� ������ ��������!
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_02");	//(�������) � �� �����, ��� ��� ������ �����, �����?
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_03");	//� ����� �������� ����� ���������� ��� ��������. �� ��� ������, � ��� ��� ���.
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_04");	//�����, ����� ������ - ��� ��, ��� ������ �� ��� �����.
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_05");	//�� ������ ��� ������.
	}
	else
	{
		AI_Output(self,other,"DIA_DiegoNW_NeedHelp_11_00");	//������, ��� �� �����. �� ������ ������ ���.
	};
	Info_ClearChoices(DIA_DiegoNW_NeedHelp);
	if(DiegoOW.aivar[AIV_TalkedToPlayer] == FALSE)
	{
	};
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"��� ��� �� ���� �� ������?",DIA_DiegoNW_NeedHelp_Clothes);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"��� �� ������� �����?",DIA_DiegoNW_NeedHelp_Plan);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"����� �����?",DIA_DiegoNW_NeedHelp_Problem);
};

func void DIA_DiegoNW_NeedHelp_Plan()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Plan_15_00");	//��� �� ������� �����?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Plan_11_01");	//�� ���� ������ ������. ��� ������ ������.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Plan_11_02");	//�� �����, ��� ��� ����� ����� ���������� �����.
};

func void DIA_DiegoNW_NeedHelp_WhoAreYou()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_WhoAreYou_15_00");	//��� ��?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_01");	//����, ��� ���, ��������, ��-�� ������. � ������ ������, ��������� �� ������� �� ���� � �����.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_02");	//��� ������ � ����� ��� ������� � �������� �� �������. ������-��, �������, �� �������� ����? � �����.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_03");	//� ������ ������� � ���� ���� �����, ��� ���������� ��� ���������.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_04");	//�� �� �� ��� ��� ��� ������ ��� ������.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_WhoAreYou_15_05");	//��... � ��� ������ ��������� ���?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_06");	//���� ������! �� ������������� ������ �� �������.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_07");	//��������, � ���� ������������� ��� ������� ��������� ��� ���� ������. �������� ������ ����: �� ���� ��������� �������� ��������, � � �� ��� ������ ���� �����.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_08");	//� ������ ��� ����� ���� ������.
};

func void DIA_DiegoNW_NeedHelp_Clothes()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Clothes_15_00");	//��� ��� �� ���� �� ������?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_01");	//� ����� �� � �������� �� �������. ������ �� ������ ���������� ���� � �����.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_02");	//����� �� ����� ������ ��������, ������ � ������.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Clothes_15_03");	//��� ����� �����.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_04");	//� ���� ��� �����. �� ���� ���� � ���� ���� ������ �����, � ��� ����� ������� �������.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_05");	//� � ���� ������� ����� ���������� ����� ������.
};

func void DIA_DiegoNW_NeedHelp_Problem()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_15_00");	//����� �����?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_01");	//����� ������ ������������ � ��� ���, ��� � ������� ���. ��� ���-�� ����� ����� ������ �� ����.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_15_02");	//� ��� ��������?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_03");	//� ������ ������� � ������� �������.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_04");	//�� � �� ��������� ����� ������, � � ���� ��� �����, ����� ��������� ������. ��� ����� ����� ��!
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_15_05");	//�� ����, �� ������, ����� � ������� ���� ������?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_06");	//����. � ���� ���� ������. � �� ������ ���� ����� ���� ������! ��, � ���������, ��� �� ��� ���.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_07");	//�� ������ ������� ��� ������ ���, ��� ��� ���������.
	Info_ClearChoices(DIA_DiegoNW_NeedHelp);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"� ���� ��� ������� �� ���.",DIA_DiegoNW_NeedHelp_Problem_NoTime);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"� ��� ��� � ����� �����?",DIA_DiegoNW_NeedHelp_Problem_Reward);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"�����, � ������ ����.",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou);
};

func void DIA_DiegoNW_NeedHelp_Problem_NoTime()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_NoTime_15_00");	//� ���� ��� ������� �� ���.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_01");	//��, � ����� �� ������! ��� ���� �, �� �������, ������ ���� �������, ����� ���� ������� � �������.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_NoTime_15_02");	//�� ���������������.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_03");	//��?! � �� ��������� �� �������, ��� ����� �� ����, ���� �� � �� �������� ���� �����, ��� ����� ����� ���� � �������.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_04");	//������ ������ ������� �� ���� �� �������, � �� �� ����� ������ ������� ���-������ � �����.
	MIS_HelpDiegoNW = LOG_FAILED;
	Info_ClearChoices(DIA_DiegoNW_NeedHelp);
};

func void DIA_DiegoNW_NeedHelp_Problem_Reward()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_Reward_15_00");	//��� ��� � ����� �����?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_Reward_11_01");	//� �����-������ ��������� ����, ��� �� ��� ���� ������? �� �� ������, ����� ����� ������������?
};

func void DIA_DiegoNW_NeedHelp_Problem_WillHelpYou()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_15_00");	//�����, � ������ ����.
	AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_11_01");	//���������. ������ �����������. ����� ������ ��� ��� �� �����, � ������� � ������ �������� ��������� ����.
	AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_11_02");	//��� ���� �������� �����, � ������� ����� � ������ ������, � ����� ��� �������.
	AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_11_03");	//� ������ ��� ����� ����� ��� ������.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_11_03");	//���� �������, �� ������ ����� � ������ �������� � ������� ��� ������.
	MIS_HelpDiegoNW = LOG_Running;
	Log_CreateTopic(TOPIC_HelpDiegoNW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HelpDiegoNW,LOG_Running);
	B_LogEntry(TOPIC_HelpDiegoNW,"������ ����� ��������� � ������ ��������. ��� ����� ���, ����� ������� � ������� ����� ������, � �� �������� ���� ����� ��� ������.");
	Info_ClearChoices(DIA_DiegoNW_NeedHelp);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"��� �� ����������� ������ � ���� �������?",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"������ � ���� ��� ������?",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"��� �������� ��� ������?",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold);
};

func void DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_15_00");	//��� �� ����������� ������ � ���� �������?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_11_01");	//� ���� ������ ����� � ����� �� ��������� � ������� ��������. � ����� ����� ����.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_11_02");	//� �����, � ���� ����� ������ ����� �������!
};

func void DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_15_00");	//������ � ���� ��� ������?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_11_01");	//� ���, ������������ ��� ��, ��� ���������� ������ ��� ���� � ������ ��������?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_11_02");	//������� ��������� ������ ���� ���� ����� �������. ������ �� ������, ���� ��� �����-������ ������� ��������� ������.
	AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_HowGold_11_03");	//��� ���� ��� ������������� �� ����, ��� �� ������ ����� �� ������� ��������...
};

func void DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_15_00");	//��� �������� ��� ������?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_01");	//����� �� �������� �������. ��� ����������� ������. ��� � ������� ��������.
	if(Diego_angekommen == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_WhereGold_11_01");	//�������� ��� ������������. � � ��� �����, ��� �� ��������� ���� ����� �����.
		AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_WhereGold_11_02");	//������ ������� ��� ������.
	};
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_02");	//�� �������, ����� ��� ��� ��� ����� �������, ����� �� ������ ���� ���������.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_15_03");	//��� � ������� ���?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_04");	//�� ����� ������. ������� �����!
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"� ��������� ����� ���� ������.",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_End_TryIt);
	B_LogEntry(TOPIC_HelpDiegoNW,"������ ����� ��������� ���-�� �� ������ �������� �������, ���, ��� ������ �������������� � ������� �� �������� ������, ��� ����������� ������.");
};

func void DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_End_TryIt()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_TryIt_15_00");	//� ��������� ����� ���� ������.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_TryIt_11_01");	//(����������) ������ ���. ����� ����� ���������� ��� ����.
	Info_ClearChoices(DIA_DiegoNW_NeedHelp);
};


instance DIA_DiegoNW_HelpYou(C_Info)
{
	npc = PC_Thief_NW;
	nr = 30;
	condition = DIA_DiegoNW_HelpYou_Condition;
	information = DIA_DiegoNW_HelpYou_Info;
	permanent = FALSE;
	description = "�����, � ��� �� ������ ����.";
};


func int DIA_DiegoNW_HelpYou_Condition()
{
	if((Diego_IsOnBoard == FALSE) && (MIS_HelpDiegoNW == LOG_FAILED) && (Diego_IsOnBoard != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_HelpYou_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_HelpYou_15_00");	//�����, � ��� �� ������ ����.
	AI_Output(self,other,"DIA_DiegoNW_HelpYou_11_01");	//� ���� ���.
	AI_Output(other,self,"DIA_DiegoNW_HelpYou_15_02");	//����� �������� ����� � ����.
	AI_Output(self,other,"DIA_DiegoNW_HelpYou_11_03");	//������. � ������� ������ � ������ ��������, � �� ������ ������� ��� ������ ��� ����.
	AI_Output(self,other,"DIA_DiegoNW_HelpYou_11_06");	//� � ���� ����� ����� � ��� ���������� ��� ���������� ��������.
	DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold();
	DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_End_TryIt();
	MIS_HelpDiegoNW = LOG_Running;
	Log_CreateTopic(TOPIC_HelpDiegoNW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HelpDiegoNW,LOG_Running);
	B_LogEntry(TOPIC_HelpDiegoNW,"������ ����� ��������� � ������ ��������. ��� ����� ���, ����� ������� � ������� ����� ������, � �� �������� ���� ����� ��� ������.");
};


instance DIA_DiegoNW_HaveYourGold(C_Info)
{
	npc = PC_Thief_NW;
	nr = 31;
	condition = DIA_DiegoNW_HaveYourGold_Condition;
	information = DIA_DiegoNW_HaveYourGold_Info;
	permanent = TRUE;
	description = "� ����� ���� ������!";
};


func int DIA_DiegoNW_HaveYourGold_Condition()
{
	if(((OpenedDiegosBag == TRUE) || (Npc_HasItems(other,ItSe_DiegosTreasure_Mis) >= 1)) && (MIS_HelpDiegoNW == LOG_Running) && (Diego_IsOnBoard != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void b_diegonw_diegosrevenge()
{
	AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_05");	//����� ������. ����� ��������� ������ ������ �� ������.
};


var int DiegosRevenge;

func void DIA_DiegoNW_HaveYourGold_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_HaveYourGold_15_00");	//� ����� ���� ������!
	AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_01");	//�������. ������.
	if(Npc_HasItems(other,ItSe_DiegosTreasure_Mis) >= 1)
	{
		B_GiveInvItems(other,self,ItSe_DiegosTreasure_Mis,1);
		b_diegonw_diegosrevenge();
		DiegosRevenge = TRUE;
	}
	else 
	if(Npc_HasItems(other,ItMi_Gold) < DiegosTreasure)
	{
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_02");	//�� ����� �� ���! �� ���, �� ��������� ���? ��� ����� ��� �����.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_03");	//���� ��� ���� ���������, ������ ��������� ���������� � ��� ����.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_04");	//��� ���, ����������, ������� ��� �����. ��� ����� �����!
	}
	else
	{
		B_GiveInvItems(other,self,ItMi_Gold,DiegosTreasure);
		b_diegonw_diegosrevenge();
		DiegosRevenge = TRUE;
	};
	if((Npc_IsDead(Gerbrandt) == FALSE) && (DiegosRevenge == TRUE))
	{
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_06");	//��������, � ��� ��� �� ����������� �� �������.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_07");	//� ����, ����� �� ����� ��� ������ ����������. ��� ���� �� ��������� � ������� ��������.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_08");	//������� ��� ������ �� ����. � ����� ���������� ����� ����� ����������.
		CreateInvItems(self,ItWr_DiegosLetter_MIS,1);
		B_GiveInvItems(self,other,ItWr_DiegosLetter_MIS,1);
		B_StartOtherRoutine(Gerbrandt,"WaitForDiego");
		MIS_HelpDiegoNW = LOG_SUCCESS;
		MIS_DiegosResidence = LOG_Running;
		B_GivePlayerXP(XP_HelpDiegoNW);
		Log_CreateTopic(TOPIC_DiegosResidence,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DiegosResidence,LOG_Running);
		B_LogEntry(TOPIC_DiegosResidence,"����� ��� ��� ������ ��� �������� ����������.");
		AI_StopProcessInfos(self);
	};
};


instance DIA_DiegoNW_DeliveredLetter(C_Info)
{
	npc = PC_Thief_NW;
	nr = 30;
	condition = DIA_DiegoNW_DeliveredLetter_Condition;
	information = DIA_DiegoNW_DeliveredLetter_Info;
	permanent = FALSE;
	description = "� �������� ���� ������.";
};


func int DIA_DiegoNW_DeliveredLetter_Condition()
{
	if((Diego_IsOnBoard == FALSE) && (MIS_DiegosResidence == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_DeliveredLetter_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_DeliveredLetter_15_00");	//� �������� ���� ������.
	AI_Output(self,other,"DIA_DiegoNW_DeliveredLetter_11_01");	//����� ������. ��� ��������� ��������� ���?
	AI_Output(other,self,"DIA_DiegoNW_DeliveredLetter_15_02");	//�� ��� � ���� � ����������� ����� ����-��.
	AI_Output(self,other,"DIA_DiegoNW_DeliveredLetter_11_03");	//(��������������) � ��� � �����.
	AI_Output(self,other,"DIA_DiegoNW_DeliveredLetter_11_04");	//�����, ������, ��� � ������ ������� ��� �������� �������� ����������� ����� ������ ����. ���� � ��������� �����, ���� � ���������� ������ �������.
	B_GivePlayerXP(XP_DiegoHasANewHome);
	Wld_AssignRoomToGuild("reich01",GIL_PUBLIC);
	Info_ClearChoices(DIA_DiegoNW_DeliveredLetter);
	Info_AddChoice(DIA_DiegoNW_DeliveredLetter,"��� ���� ������� ���������� ���?",DIA_DiegoNW_DeliveredLetter_YourTrick);
	Info_AddChoice(DIA_DiegoNW_DeliveredLetter,"������, ��� ������ ���� ���?",DIA_DiegoNW_DeliveredLetter_YourHouse);
};

func void DIA_DiegoNW_DeliveredLetter_Gerbrandt()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_15_00");	//��� ������ ����������?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_01");	//�� ����������� ����������� ������ ������� �����.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_02");	//�� ��� �����, ������� � �������, ����� � ������� ��������� �� ������ �����.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_03");	//������� �� ����, ���� �� ������ ������, �� �� ������ �� ��������� ��������� � �������� ����� - � ���������� �� ����.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_04");	//���� �� ����� ���, �������� �������� � �������� ��������.
};

func void DIA_DiegoNW_DeliveredLetter_YourHouse()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourHouse_15_00");	//������, ��� ������ ���� ���?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_01");	//��, �� ������� �� �������! �� ���� �������!
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_02");	//� ������� ��� ������ � ����������� �������� � ������ ������ � ���, ��� � ���� ����� � �������� ������� � ����������.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_03");	//� �����, �� �������, � ���� ���� ������������ ������ � �������� ��� ������� �����.
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourHouse_15_04");	//��, �� ������ �� ��������.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_05");	//�����.
};

func void DIA_DiegoNW_DeliveredLetter_YourTrick()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourTrick_15_00");	//��� ���� ������� ���������� ���?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_01");	//�� �������, ��������� ��������� ���� ��������� �� ������� �������?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_02");	//�������, �� ������� �� ����� ����, ����� �������� �� ������� ���. � ���� ��� ����� ��� ��������.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_03");	//�� ���� ������� ����� ����� ���� ����. ���������, � ����� ������, ����� ���������� �� ����. ��������, �� ��������, ��� � ���� ������� �����.
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourTrick_15_04");	//�� ������� �� ������� ��� �� ����.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_05");	//� �� ������� � �� ���������.
	Info_ClearChoices(DIA_DiegoNW_DeliveredLetter);
	Info_AddChoice(DIA_DiegoNW_DeliveredLetter,Dialog_Back,DIA_DiegoNW_DeliveredLetter_YourTrick_BACK);
	Info_AddChoice(DIA_DiegoNW_DeliveredLetter,"��� ������ ���� ����?",DIA_DiegoNW_DeliveredLetter_YourTrick_REWARD);
	Info_AddChoice(DIA_DiegoNW_DeliveredLetter,"��� ������ ����������?",DIA_DiegoNW_DeliveredLetter_Gerbrandt);
};

func void DIA_DiegoNW_DeliveredLetter_YourTrick_REWARD()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_15_00");	//��� ������ ���� ����?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_11_01");	//������, �� ������ �� ����� �� ����, ���� � ���� ����.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_11_02");	//�� �� ����, � ���� ������ �� �� ����� ��� ����� ������. ��� ���� ����.
	CreateInvItems(self,ItMi_Gold,500);
	B_GiveInvItems(self,other,ItMi_Gold,500);
};

func void DIA_DiegoNW_DeliveredLetter_YourTrick_BACK()
{
	Info_ClearChoices(DIA_DiegoNW_DeliveredLetter);
};


var int Diego_Teach;

instance DIA_DiegoNW_CanYouTeach(C_Info)
{
	npc = PC_Thief_NW;
	nr = 995;
	condition = DIA_DiegoNW_CanYouTeach_Condition;
	information = DIA_DiegoNW_CanYouTeach_Info;
	permanent = TRUE;
	description = "�� ������ ������� ���� ����-������?";
};


func int DIA_DiegoNW_CanYouTeach_Condition()
{
	if((Diego_IsOnBoard == FALSE) && (Diego_Teach == FALSE))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_CanYouTeach_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_CanYouTeach_15_00");	//�� ������ ������� ���� ����-������?
	if(Npc_KnowsInfo(other,DIA_DiegoNW_DeliveredLetter))
	{
		AI_Output(self,other,"DIA_DiegoNW_CanYouTeach_11_01");	//��, �������. ��� ��� �����, ����� ������ �����.
		Diego_Teach = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_DiegoNW_CanYouTeach_11_02");	//������� ��� ����� ������ ���� ��������.
	};
};


var int DiegoNW_Merke_DEX;

instance DIA_DiegoNW_Teach(C_Info)
{
	npc = PC_Thief_NW;
	nr = 995;
	condition = DIA_DiegoNW_Teach_Condition;
	information = DIA_DiegoNW_Teach_Info;
	permanent = TRUE;
	description = "����� ����.";
};


func int DIA_DiegoNW_Teach_Condition()
{
	if((Diego_IsOnBoard == FALSE) && (Diego_Teach == TRUE))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_Teach_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_Teach_15_00");	//����� ����.
	AI_Output(self,other,"DIA_DiegoNW_Teach_11_01");	//� ���� ������� ����, ��� ����� ����� ������.
	DiegoNW_Merke_DEX = other.attribute[ATR_DEXTERITY];
	Info_ClearChoices(DIA_DiegoNW_Teach);
	Info_AddChoice(DIA_DiegoNW_Teach,Dialog_Back,DIA_DiegoNW_Teach_BACK);
	Info_AddChoice(DIA_DiegoNW_Teach,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_DiegoNW_TeachDEX_1);
	Info_AddChoice(DIA_DiegoNW_Teach,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_DiegoNW_TeachDEX_5);
};

func void DIA_DiegoNW_Teach_BACK()
{
	if(DiegoNW_Merke_DEX < other.attribute[ATR_DEXTERITY])
	{
		AI_Output(self,other,"DIA_DiegoNW_Teach_BACK_11_00");	//�� ��� ���� ����� ������. ��� �������!
	};
	Info_ClearChoices(DIA_DiegoNW_Teach);
};

func void DIA_DiegoNW_TeachDEX_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MAX);
	Info_ClearChoices(DIA_DiegoNW_Teach);
	Info_AddChoice(DIA_DiegoNW_Teach,Dialog_Back,DIA_DiegoNW_Teach_BACK);
	Info_AddChoice(DIA_DiegoNW_Teach,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_DiegoNW_TeachDEX_1);
	Info_AddChoice(DIA_DiegoNW_Teach,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_DiegoNW_TeachDEX_5);
};

func void DIA_DiegoNW_TeachDEX_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MAX);
	Info_ClearChoices(DIA_DiegoNW_Teach);
	Info_AddChoice(DIA_DiegoNW_Teach,Dialog_Back,DIA_DiegoNW_Teach_BACK);
	Info_AddChoice(DIA_DiegoNW_Teach,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_DiegoNW_TeachDEX_1);
	Info_AddChoice(DIA_DiegoNW_Teach,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_DiegoNW_TeachDEX_5);
};


instance DIA_DiegoNW_KnowWhereEnemy(C_Info)
{
	npc = PC_Thief_NW;
	nr = 55;
	condition = DIA_DiegoNW_KnowWhereEnemy_Condition;
	information = DIA_DiegoNW_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "� ��������� �������� �������.";
};


func int DIA_DiegoNW_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Diego_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_15_00");	//� ��������� �������� �������.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_01");	//������ �������. � ��� �� �� ����� ����������� � �����. ���� ����� ��������� ������� ������ - �������, ����� ����� ����� ���� �����������, ��� � �������.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_02");	//� ��� �� ������� ���� ����� ��������, ������������ ��������� � ��� �� �������� ���� ��������.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_03");	//�����, � ������, ���� �� �������� ������� ���.
	Log_CreateTopic(Topic_Crew,LOG_MISSION);
	Log_SetTopicStatus(Topic_Crew,LOG_Running);
	B_LogEntry(Topic_Crew,"������� ��, ����� ����� ����� �� ����. ��� �������, ��� ��� ������ �� ������� �������, ��� �����. �� ��� �� ������� ����, ��� ����� ����� ������ � ������� �� ���� ��������� �������. ����� �� ����� ������� ���� ������������ ���������.");
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_15_04");	//� ������� ��� ����. �� ���� ��� ������� ��������� ��������������.
		AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_05");	//�� ��������. � ��� ����� ������ �� ������.
	}
	else
	{
		Info_ClearChoices(DIA_DiegoNW_KnowWhereEnemy);
		Info_AddChoice(DIA_DiegoNW_KnowWhereEnemy,"��������, � ��� ���� �����, ����� ������ �����.",DIA_DiegoNW_KnowWhereEnemy_No);
		Info_AddChoice(DIA_DiegoNW_KnowWhereEnemy,"�� �� ������ ��������������?",DIA_DiegoNW_KnowWhereEnemy_Yes);
	};
};

func void DIA_DiegoNW_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_Yes_15_00");	//������ �� ���� �� ����������� � ���� �� ����? ���������� � ������.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_01");	//���. �� ����, � �������� ��� ����� ������ ������. � ������� � �����.
	self.flags = NPC_FLAG_IMMORTAL;
	Diego_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	B_GivePlayerXP(XP_Crewmember_Success);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"NW_CITY_UPTOWN_PATH_23") == 1)
	{
		AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_02");	//�������, � ���� ����� ����� ������.
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_CITY_UPTOWN_HUT_01_01");
		CreateInvItems(self,ITAR_Diego,1);
		AI_EquipArmor(self,ITAR_Diego);
		AI_Wait(self,1);
		AI_GotoWP(self,self.wp);
	};
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_03");	//��, � �����. ���������� � �������.
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(DIA_DiegoNW_KnowWhereEnemy);
};

func void DIA_DiegoNW_KnowWhereEnemy_No()
{
	AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_No_15_00");	//��������, � ��� ���� �����, ����� ������ �����.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_No_11_01");	//��������. �, ��������, � ���� ������������ � ����. ��� �����?
	Diego_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_DiegoNW_KnowWhereEnemy);
};


instance DIA_DiegoNW_LeaveMyShip(C_Info)
{
	npc = PC_Thief_NW;
	nr = 55;
	condition = DIA_DiegoNW_LeaveMyShip_Condition;
	information = DIA_DiegoNW_LeaveMyShip_Info;
	permanent = TRUE;
	description = "�� ������ ���������� � ������.";
};


func int DIA_DiegoNW_LeaveMyShip_Condition()
{
	if((Diego_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_LeaveMyShip_15_00");	//�� ������ ���������� � ������.
	AI_Output(self,other,"DIA_DiegoNW_LeaveMyShip_11_01");	//��? � ���� ������ �� �����? ��, �����. �� ������ ��������� �� ���, ����� ��������� � �����.
	AI_Output(other,self,"DIA_DiegoNW_LeaveMyShip_15_02");	//�� �������, �� ��� ����������?
	AI_Output(self,other,"DIA_DiegoNW_LeaveMyShip_11_03");	//� ������� �� ������ ��������� ������ ����, ����� �� ����� �� ����� ����� ����, ��� ����� ������� ����. ����� �� ����������� � ������ ���.
	AI_Output(self,other,"DIA_DiegoNW_LeaveMyShip_11_04");	//�� ������� �� ������� ����. �� ����������� ���������� �����. ������ ����.
	Diego_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count = Crewmember_Count - 1;
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_DiegoNW_StillNeedYou(C_Info)
{
	npc = PC_Thief_NW;
	nr = 55;
	condition = DIA_DiegoNW_StillNeedYou_Condition;
	information = DIA_DiegoNW_StillNeedYou_Info;
	permanent = TRUE;
	description = "�����������. � ����, ����� �� ����������� ����.";
};


func int DIA_DiegoNW_StillNeedYou_Condition()
{
	if(((Diego_IsOnBoard == LOG_OBSOLETE) || (Diego_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_StillNeedYou_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_StillNeedYou_15_00");	//�����������. � ����, ����� �� ����������� ����.
	AI_Output(self,other,"DIA_DiegoNW_StillNeedYou_11_01");	//���� ���������� ���� �������������, ����? �������, � ������������ � ���� - �� ������ ���������� � ���, ��� ���� �����.
	self.flags = NPC_FLAG_IMMORTAL;
	Diego_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"NW_CITY_UPTOWN_PATH_23") == 1)
	{
		AI_Output(self,other,"DIA_DiegoNW_StillNeedYou_11_02");	//�������, � ���� ����� ����� ������.
		AI_GotoWP(self,"NW_CITY_UPTOWN_HUT_01_01");
		CreateInvItems(self,ITAR_Diego,1);
		AI_EquipArmor(self,ITAR_Diego);
		AI_GotoWP(self,self.wp);
	};
	AI_Output(self,other,"DIA_DiegoNW_StillNeedYou_11_03");	//�������, �� ����� ����.
	AI_StopProcessInfos(self);
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
};


instance DIA_Thief_NW_PICKPOCKET(C_Info)
{
	npc = PC_Thief_NW;
	nr = 900;
	condition = DIA_Thief_NW_PICKPOCKET_Condition;
	information = DIA_Thief_NW_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_120;
};


func int DIA_Thief_NW_PICKPOCKET_Condition()
{
	return C_Beklauen(120,600);
};

func void DIA_Thief_NW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Thief_NW_PICKPOCKET);
	Info_AddChoice(DIA_Thief_NW_PICKPOCKET,Dialog_Back,DIA_Thief_NW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Thief_NW_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Thief_NW_PICKPOCKET_DoIt);
};

func void DIA_Thief_NW_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Thief_NW_PICKPOCKET);
};

func void DIA_Thief_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Thief_NW_PICKPOCKET);
};

