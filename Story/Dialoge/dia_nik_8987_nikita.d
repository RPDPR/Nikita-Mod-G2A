
instance DIA_Nikita_EXIT(C_Info)
{
	npc = NIK_8987_NIKITA;
	nr = 999;
	condition = DIA_Nikita_EXIT_Condition;
	information = DIA_Nikita_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Nikita_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Nikita_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NIKITA_YOUDEAD(C_Info)
{
	npc = nik_8987_nikita;
	nr = 1;
	condition = dia_nikita_youdead_condition;
	information = dia_nikita_youdead_info;
	permanent = TRUE;
	description = "Все в порядке?";
};


func int dia_nikita_youdead_condition()
{
	return TRUE;
};

func void dia_nikita_youdead_info()
{
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other,"DIA_NIKITA_08_01");	//Наличными или картой? ... Я Никита. ... Тебе не стоило появляться здесь... (Вопль Никиты)
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	AI_StopProcessInfos(self);
	PrintScreen("Никита хочет вас проткнуть!",-1,-1,"FONT_OLD_20_WHITE.TGA",5);
	B_Attack(self,other,AR_NONE,0);
};

instance DIA_Nikita_PreTeach(C_Info)
{
	npc = NIK_8987_NIKITA;
	nr = 99;
	condition = DIA_Nikita_PreTeach_Condition;
	information = DIA_Nikita_PreTeach_Info;
	description = "Ты можешь обучить меня созданию рун?";
};


func int DIA_Nikita_PreTeach_Condition()
{
	if((hero.guild == GIL_KDF) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 1))
	{
		return TRUE;
	};
	return true;
};

func void DIA_Nikita_PreTeach_Info()
{
	AI_Output(other,self,"DIA_Nikita_PreTeach_01_01");	//Ты можешь обучить меня созданию рун?
	AI_Output(self,other,"DIA_Nikita_PreTeach_01_02");	//Конечно я могу обучить тебя созданию имбовых рун, Ам-Ням!
	AI_Output(self,other,"DIA_Nikita_PreTeach_01_03");	//Тебе со мной повезло - будешь метать, протыкать и делать вид, что ты не Никита.
	Nikita_TeachRunes = TRUE;
	Log_CreateTopic(TOPIC_NikitaTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_NikitaTeacher,LogText_NikitaTeach);
};


instance DIA_Nikita_Runen(C_Info)
{
	npc = NIK_8987_NIKITA;
	nr = 99;
	condition = DIA_Nikita_Runen_Condition;
	information = DIA_Nikita_Runen_Info;
	permanent = TRUE;
	description = "Обучи меня (созданию рун)";
};


func int DIA_Nikita_Runen_Condition()
{
	if(Nikita_TeachRunes == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Nikita_Runen_Info()
{
	Info_ClearChoices(DIA_Nikita_Runen);
	Info_AddChoice(DIA_Nikita_Runen,Dialog_Back,DIA_Nikita_Runen_BACK);
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 7)
	{
		Info_AddChoice(DIA_Nikita_Runen,"7-й круг магии",DIA_Nikita_Runen_7);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 6)
	{
		Info_AddChoice(DIA_Nikita_Runen,"6-й круг магии",DIA_Nikita_Runen_6);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5)
	{
		Info_AddChoice(DIA_Nikita_Runen,"5-й круг магии",DIA_Nikita_Runen_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4)
	{
		Info_AddChoice(DIA_Nikita_Runen,"4-й круг магии",DIA_Nikita_Runen_4);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3)
	{
		Info_AddChoice(DIA_Nikita_Runen,"3-й круг магии",DIA_Nikita_Runen_3);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2)
	{
		Info_AddChoice(DIA_Nikita_Runen,"2-й круг магии",DIA_Nikita_Runen_2);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1)
	{
		Info_AddChoice(DIA_Nikita_Runen,"1-й круг магии",DIA_Nikita_Runen_1);
	};
};

func void DIA_Nikita_Runen_BACK()
{
	Info_ClearChoices(DIA_Nikita_Runen);
};

func void DIA_Nikita_Runen_1()
{
	Info_ClearChoices(DIA_Nikita_Runen);
	Info_AddChoice(DIA_Nikita_Runen,Dialog_Back,DIA_Nikita_Runen_BACK);
	if(PLAYER_TALENT_RUNES[SPL_SummonGoblinSkeleton] == FALSE)
	{
		Info_AddChoice(DIA_Nikita_Runen,B_BuildLearnString(NAME_SPL_SummonGoblinSkeleton,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonGoblinSkeleton)),DIA_Nikita_Runen_Circle_1_SPL_SummonGoblinSkeleton);
	};
	if(PLAYER_TALENT_RUNES[SPL_LightHeal] == FALSE)
	{
		Info_AddChoice(DIA_Nikita_Runen,B_BuildLearnString(NAME_SPL_LightHeal,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_LightHeal)),DIA_Nikita_Runen_Circle_1_SPL_LightHeal);
	};
	if(PLAYER_TALENT_RUNES[SPL_Zap] == FALSE)
	{
		Info_AddChoice(DIA_Nikita_Runen,B_BuildLearnString(NAME_SPL_Zap,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Zap)),DIA_Nikita_Runen_Circle_1_SPL_Zap);
	};
	if(PLAYER_TALENT_RUNES[SPL_Firebolt] == FALSE)
	{
		Info_AddChoice(DIA_Nikita_Runen,B_BuildLearnString(NAME_SPL_Firebolt,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Firebolt)),DIA_Nikita_Runen_Circle_1_SPL_Firebolt);
	};
	if(PLAYER_TALENT_RUNES[SPL_Light] == FALSE)
	{
		Info_AddChoice(DIA_Nikita_Runen,B_BuildLearnString(NAME_SPL_LIGHT,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Light)),DIA_Nikita_Runen_Circle_1_SPL_LIGHT);
	};
};

func void DIA_Nikita_Runen_2()
{
	Info_ClearChoices(DIA_Nikita_Runen);
	Info_AddChoice(DIA_Nikita_Runen,Dialog_Back,DIA_Nikita_Runen_BACK);
	if(PLAYER_TALENT_RUNES[SPL_InstantFireball] == FALSE)
	{
		Info_AddChoice(DIA_Nikita_Runen,B_BuildLearnString(NAME_SPL_InstantFireball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_InstantFireball)),DIA_Nikita_Runen_Circle_2_SPL_InstantFireball);
	};
	if(PLAYER_TALENT_RUNES[SPL_Icebolt] == FALSE)
	{
		Info_AddChoice(DIA_Nikita_Runen,B_BuildLearnString(NAME_SPL_Icebolt,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Icebolt)),DIA_Nikita_Runen_Circle_2_SPL_Icebolt);
	};
	if(PLAYER_TALENT_RUNES[SPL_SummonWolf] == FALSE)
	{
		Info_AddChoice(DIA_Nikita_Runen,B_BuildLearnString(NAME_SPL_SummonWolf,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonWolf)),DIA_Nikita_Runen_Circle_2_SPL_SummonWolf);
	};
	if(PLAYER_TALENT_RUNES[SPL_WindFist] == FALSE)
	{
		Info_AddChoice(DIA_Nikita_Runen,B_BuildLearnString(NAME_SPL_WINDFIST,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_WindFist)),DIA_Nikita_Runen_Circle_2_SPL_WINDFIST);
	};
	if(PLAYER_TALENT_RUNES[SPL_Sleep] == FALSE)
	{
		Info_AddChoice(DIA_Nikita_Runen,B_BuildLearnString(NAME_SPL_Sleep,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Sleep)),DIA_Nikita_Runen_Circle_2_SPL_Sleep);
	};
	if(PLAYER_TALENT_RUNES[SPL_Whirlwind] == FALSE)
	{
		Info_AddChoice(DIA_Nikita_Runen,B_BuildLearnString(NAME_SPL_Whirlwind,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Whirlwind)),DIA_Nikita_Runen_Circle_2_SPL_Whirlwind);
	};
	if(PLAYER_TALENT_RUNES[SPL_IceLance] == FALSE)
	{
		Info_AddChoice(DIA_Nikita_Runen,B_BuildLearnString(NAME_SPL_IceLance,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_IceLance)),DIA_Nikita_Runen_Circle_2_SPL_ICELANCE);
	};
};

func void DIA_Nikita_Runen_3()
{
	Info_ClearChoices(DIA_Nikita_Runen);
	Info_AddChoice(DIA_Nikita_Runen,Dialog_Back,DIA_Nikita_Runen_BACK);
	if(PLAYER_TALENT_RUNES[SPL_MediumHeal] == FALSE)
	{
		Info_AddChoice(DIA_Nikita_Runen,B_BuildLearnString(NAME_SPL_MediumHeal,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_MediumHeal)),DIA_Nikita_Runen_Circle_3_SPL_MediumHeal);
	};
	if(PLAYER_TALENT_RUNES[SPL_ChargeZap] == FALSE)
	{
		Info_AddChoice(DIA_Nikita_Runen,B_BuildLearnString(NAME_SPL_ChargeZap,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ChargeZap)),DIA_Nikita_Runen_Circle_3_SPL_ThunderBall);
	};
	if(PLAYER_TALENT_RUNES[SPL_Firestorm] == FALSE)
	{
		Info_AddChoice(DIA_Nikita_Runen,B_BuildLearnString(NAME_SPL_Firestorm,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Firestorm)),DIA_Nikita_Runen_Circle_3_SPL_Firestorm);
	};
	if(PLAYER_TALENT_RUNES[SPL_SummonSkeleton] == FALSE)
	{
		Info_AddChoice(DIA_Nikita_Runen,B_BuildLearnString(NAME_SPL_SummonSkeleton,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonSkeleton)),DIA_Nikita_Runen_Circle_3_SPL_SummonSkeleton);
	};
	if(PLAYER_TALENT_RUNES[SPL_Fear] == FALSE)
	{
		Info_AddChoice(DIA_Nikita_Runen,B_BuildLearnString(NAME_SPL_Fear,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Fear)),DIA_Nikita_Runen_Circle_3_SPL_Fear);
	};
	if(PLAYER_TALENT_RUNES[SPL_IceCube] == FALSE)
	{
		Info_AddChoice(DIA_Nikita_Runen,B_BuildLearnString(NAME_SPL_IceCube,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_IceCube)),DIA_Nikita_Runen_Circle_3_SPL_IceCube);
	};
	if(PLAYER_TALENT_RUNES[SPL_Thunderstorm] == FALSE)
	{
		Info_AddChoice(DIA_Nikita_Runen,B_BuildLearnString(NAME_SPL_Thunderstorm,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Thunderstorm)),DIA_Nikita_Runen_Circle_3_SPL_Thunderstorm);
	};
	if(PLAYER_TALENT_RUNES[SPL_Geyser] == FALSE)
	{
		Info_AddChoice(DIA_Nikita_Runen,B_BuildLearnString(NAME_SPL_Geyser,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Geyser)),DIA_Nikita_Runen_Circle_3_SPL_Geyser);
	};
};

func void DIA_Nikita_Runen_4()
{
	Info_ClearChoices(DIA_Nikita_Runen);
	Info_AddChoice(DIA_Nikita_Runen,Dialog_Back,DIA_Nikita_Runen_BACK);
	if(PLAYER_TALENT_RUNES[SPL_SummonGolem] == FALSE)
	{
		Info_AddChoice(DIA_Nikita_Runen,B_BuildLearnString(NAME_SPL_SummonGolem,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonGolem)),DIA_Nikita_Runen_Circle_4_SPL_SummonGolem);
	};
	if(PLAYER_TALENT_RUNES[SPL_DestroyUndead] == FALSE)
	{
		Info_AddChoice(DIA_Nikita_Runen,B_BuildLearnString(NAME_SPL_DestroyUndead,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_DestroyUndead)),DIA_Nikita_Runen_Circle_4_SPL_DestroyUndead);
	};
	if(PLAYER_TALENT_RUNES[SPL_LightningFlash] == FALSE)
	{
		Info_AddChoice(DIA_Nikita_Runen,B_BuildLearnString(NAME_SPL_LightningFlash,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_LightningFlash)),DIA_Nikita_Runen_Circle_4_SPL_LightningFlash);
	};
	if(PLAYER_TALENT_RUNES[SPL_ChargeFireball] == FALSE)
	{
		Info_AddChoice(DIA_Nikita_Runen,B_BuildLearnString(NAME_SPL_ChargeFireball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ChargeFireball)),DIA_Nikita_Runen_Circle_4_SPL_ChargeFireball);
	};
	if(PLAYER_TALENT_RUNES[SPL_WaterFist] == FALSE)
	{
		Info_AddChoice(DIA_Nikita_Runen,B_BuildLearnString(NAME_SPL_WaterFist,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_WaterFist)),DIA_Nikita_Runen_Circle_4_SPL_Waterfist);
	};
};

func void DIA_Nikita_Runen_5()
{
	Info_ClearChoices(DIA_Nikita_Runen);
	Info_AddChoice(DIA_Nikita_Runen,Dialog_Back,DIA_Nikita_Runen_BACK);
	if(PLAYER_TALENT_RUNES[SPL_IceWave] == FALSE)
	{
		Info_AddChoice(DIA_Nikita_Runen,B_BuildLearnString(NAME_SPL_IceWave,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_IceWave)),DIA_Nikita_Runen_Circle_5_SPL_IceWave);
	};
	if(PLAYER_TALENT_RUNES[SPL_SummonDemon] == FALSE)
	{
		Info_AddChoice(DIA_Nikita_Runen,B_BuildLearnString(NAME_SPL_SummonDemon,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonDemon)),DIA_Nikita_Runen_Circle_5_SPL_SummonDemon);
	};
	if(PLAYER_TALENT_RUNES[SPL_FullHeal] == FALSE)
	{
		Info_AddChoice(DIA_Nikita_Runen,B_BuildLearnString(NAME_SPL_FullHeal,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_FullHeal)),DIA_Nikita_Runen_Circle_5_SPL_FullHeal);
	};
	if(PLAYER_TALENT_RUNES[SPL_Pyrokinesis] == FALSE)
	{
		Info_AddChoice(DIA_Nikita_Runen,B_BuildLearnString(NAME_SPL_Pyrokinesis,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Pyrokinesis)),DIA_Nikita_Runen_Circle_5_SPL_Pyrokinesis);
	};
};

func void DIA_Nikita_Runen_6()
{
	Info_ClearChoices(DIA_Nikita_Runen);
	Info_AddChoice(DIA_Nikita_Runen,Dialog_Back,DIA_Nikita_Runen_BACK);
	if(PLAYER_TALENT_RUNES[SPL_Firerain] == FALSE)
	{
		Info_AddChoice(DIA_Nikita_Runen,B_BuildLearnString(NAME_SPL_Firerain,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Firerain)),DIA_Nikita_Runen_Circle_6_SPL_Firerain);
	};
	if(PLAYER_TALENT_RUNES[SPL_BreathOfDeath] == FALSE)
	{
		Info_AddChoice(DIA_Nikita_Runen,B_BuildLearnString(NAME_SPL_BreathOfDeath,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_BreathOfDeath)),DIA_Nikita_Runen_Circle_6_SPL_BreathOfDeath);
	};
	if(PLAYER_TALENT_RUNES[SPL_MassDeath] == FALSE)
	{
		Info_AddChoice(DIA_Nikita_Runen,B_BuildLearnString(NAME_SPL_MassDeath,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_MassDeath)),DIA_Nikita_Runen_Circle_6_SPL_MassDeath);
	};
	if(PLAYER_TALENT_RUNES[SPL_ArmyOfDarkness] == FALSE)
	{
		Info_AddChoice(DIA_Nikita_Runen,B_BuildLearnString(NAME_SPL_ArmyOfDarkness,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ArmyOfDarkness)),DIA_Nikita_Runen_Circle_6_SPL_ArmyOfDarkness);
	};
	if(PLAYER_TALENT_RUNES[SPL_Shrink] == FALSE)
	{
		Info_AddChoice(DIA_Nikita_Runen,B_BuildLearnString(NAME_SPL_Shrink,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Shrink)),DIA_Nikita_Runen_Circle_6_SPL_Shrink);
	};
};

func void DIA_Nikita_Runen_7()
{
	Info_ClearChoices(DIA_Nikita_Runen);
	Info_AddChoice(DIA_Nikita_Runen,Dialog_Back,DIA_Nikita_Runen_BACK);
	if(PLAYER_TALENT_RUNES[SPL_PierceArrow] == FALSE)
	{
		Info_AddChoice(DIA_Nikita_Runen,B_BuildLearnString(NAME_SPL_PierceArrow,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_PierceArrow)),DIA_Nikita_Runen_Circle_7_SPL_PierceArrow);
	};
	if(PLAYER_TALENT_RUNES[SPL_SummonNikita] == FALSE)
	{
		Info_AddChoice(DIA_Nikita_Runen,B_BuildLearnString(NAME_SPL_SummonNikita,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonNikita)),DIA_Nikita_Runen_Circle_7_SPL_SummonNikita);
	};
};

func void DIA_Nikita_Runen_Circle_1_SPL_LIGHT()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Light);
};

func void DIA_Nikita_Runen_Circle_1_SPL_Firebolt()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Firebolt);
};

func void DIA_Nikita_Runen_Circle_1_SPL_Zap()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Zap);
};

func void DIA_Nikita_Runen_Circle_1_SPL_LightHeal()
{
	B_TeachPlayerTalentRunes(self,other,SPL_LightHeal);
};

func void DIA_Nikita_Runen_Circle_1_SPL_SummonGoblinSkeleton()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonGoblinSkeleton);
};

func void DIA_Nikita_Runen_Circle_2_SPL_Whirlwind()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Whirlwind);
};

func void DIA_Nikita_Runen_Circle_2_SPL_ICELANCE()
{
	B_TeachPlayerTalentRunes(self,other,SPL_IceLance);
};

func void DIA_Nikita_Runen_Circle_2_SPL_InstantFireball()
{
	B_TeachPlayerTalentRunes(self,other,SPL_InstantFireball);
};

func void DIA_Nikita_Runen_Circle_2_SPL_Icebolt()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Icebolt);
};

func void DIA_Nikita_Runen_Circle_2_SPL_SummonWolf()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonWolf);
};

func void DIA_Nikita_Runen_Circle_2_SPL_WINDFIST()
{
	B_TeachPlayerTalentRunes(self,other,SPL_WindFist);
};

func void DIA_Nikita_Runen_Circle_2_SPL_Sleep()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Sleep);
};

func void DIA_Nikita_Runen_Circle_3_SPL_Thunderstorm()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Thunderstorm);
};

func void DIA_Nikita_Runen_Circle_3_SPL_Geyser()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Geyser);
};

func void DIA_Nikita_Runen_Circle_3_SPL_MediumHeal()
{
	B_TeachPlayerTalentRunes(self,other,SPL_MediumHeal);
};

func void DIA_Nikita_Runen_Circle_3_SPL_SummonSkeleton()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonSkeleton);
};

func void DIA_Nikita_Runen_Circle_3_SPL_Fear()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Fear);
};

func void DIA_Nikita_Runen_Circle_3_SPL_IceCube()
{
	B_TeachPlayerTalentRunes(self,other,SPL_IceCube);
};

func void DIA_Nikita_Runen_Circle_3_SPL_ThunderBall()
{
	B_TeachPlayerTalentRunes(self,other,SPL_ChargeZap);
};

func void DIA_Nikita_Runen_Circle_3_SPL_Firestorm()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Firestorm);
};

func void DIA_Nikita_Runen_Circle_4_SPL_LightningFlash()
{
	B_TeachPlayerTalentRunes(self,other,SPL_LightningFlash);
};

func void DIA_Nikita_Runen_Circle_4_SPL_ChargeFireball()
{
	B_TeachPlayerTalentRunes(self,other,SPL_ChargeFireball);
};

func void DIA_Nikita_Runen_Circle_4_SPL_Waterfist()
{
	B_TeachPlayerTalentRunes(self,other,SPL_WaterFist);
};

func void DIA_Nikita_Runen_Circle_4_SPL_SummonGolem()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonGolem);
};

func void DIA_Nikita_Runen_Circle_4_SPL_DestroyUndead()
{
	B_TeachPlayerTalentRunes(self,other,SPL_DestroyUndead);
};

func void DIA_Nikita_Runen_Circle_5_SPL_Pyrokinesis()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Pyrokinesis);
};

func void DIA_Nikita_Runen_Circle_5_SPL_IceWave()
{
	B_TeachPlayerTalentRunes(self,other,SPL_IceWave);
};

func void DIA_Nikita_Runen_Circle_5_SPL_SummonDemon()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonDemon);
};

func void DIA_Nikita_Runen_Circle_5_SPL_FullHeal()
{
	B_TeachPlayerTalentRunes(self,other,SPL_FullHeal);
};

func void DIA_Nikita_Runen_Circle_6_SPL_Firerain()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Firerain);
};

func void DIA_Nikita_Runen_Circle_6_SPL_BreathOfDeath()
{
	B_TeachPlayerTalentRunes(self,other,SPL_BreathOfDeath);
};

func void DIA_Nikita_Runen_Circle_6_SPL_MassDeath()
{
	B_TeachPlayerTalentRunes(self,other,SPL_MassDeath);
};

func void DIA_Nikita_Runen_Circle_6_SPL_ArmyOfDarkness()
{
	B_TeachPlayerTalentRunes(self,other,SPL_ArmyOfDarkness);
};

func void DIA_Nikita_Runen_Circle_6_SPL_Shrink()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Shrink);
};

func void DIA_Nikita_Runen_Circle_7_SPL_PierceArrow()
{
	B_TeachPlayerTalentRunes(self,other,SPL_PierceArrow);
};

func void DIA_Nikita_Runen_Circle_7_SPL_SummonNikita()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonNikita);
};
