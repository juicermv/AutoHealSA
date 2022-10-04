#pragma once
#define GTASA

// Plugin SDK imports
#include <plugin.h>
#include <CPlayerInfo.h>
#include <CPlayerPed.h>
#include <CPlayerData.h>
#include <CTheScripts.h>
#include <CTimer.h>
#include <CFont.h>
#include <CHud.h>
#include <common.h>

#include <algorithm>
#include <string>

class AutoHealSA
{
private:
	CTimer* gameTimer;
	CHud* gameHUD;

	float PrevHealth;
	float Rate = 2.5;
	float Time;
	float Counter;
	float LastTime;
	bool Heal;
	bool Under50;
public:
	AutoHealSA();

} AutoHealInstance;

