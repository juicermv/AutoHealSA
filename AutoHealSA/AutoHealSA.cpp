#include "AutoHealSA.h"


AutoHealSA::AutoHealSA()
{
	plugin::Events::gameProcessEvent += [this]() {
		float maxHealth = FindPlayerPed(0)->m_fMaxHealth;
		float Health = FindPlayerPed(0)->m_fHealth;

		this->Heal = Under50 ? 
			(
				(FindPlayerPed(0)->m_fHealth >= this->PrevHealth) 
				&& (FindPlayerPed(0)->m_fHealth < maxHealth/2)
			)
		:
			(
				(FindPlayerPed(0)->m_fHealth >= this->PrevHealth)
				&& (FindPlayerPed(0)->m_fHealth < (maxHealth/100)*85)
			);

		if (!Heal) {
			this->Counter = 0;
			this->Time = 0;
			this->PrevHealth = Health;
		}
		else {
			this->Counter += (gameTimer->ms_fTimeStep) * gameTimer->ms_fTimeScale;
		}

		if (Heal && Counter >= 500.0f && (this->LastTime - this->Counter) < -10 / Time) {
			this->Under50 = (Health <= maxHealth / 2);
			
			FindPlayerPed(0)->m_fHealth = Under50 ? 
			std::clamp(
				Health + ((maxHealth/100) * this->Rate), 
				0.0f, maxHealth/2
			) : std::clamp(
				Health + ((maxHealth / 100) * this->Rate),
				0.0f, (maxHealth/100)*85
			);

			this->Time += 0.1f;
			this->LastTime = this->Counter;
		}

		this->Time = std::clamp(this->Time, 1.0f, 2.5f);
	};

#ifdef DEBUG
	plugin::Events::drawHudEvent += [this]() {
		std::string msg =
			"Heal? "
			+ std::to_string(this->Heal)
			+ ", PrevHealth: "
			+ std::to_string(this->PrevHealth)
			+ ", Time: "
			+ std::to_string(this->Time)
			+ ", Counter: "
			+ std::to_string(this->Counter)
			+ ", Delta: "
			+ std::to_string(this->LastTime - this->Counter)
			+ ", Delta under -500? "
			+ std::to_string(this->LastTime - this->Counter < -500);

		CFont::SetOrientation(ALIGN_CENTER);
		CFont::SetColor(CRGBA(200, 200, 200, 255));
		CFont::SetBackground(false, false);
		CFont::SetWrapx(500.0f);
		CFont::SetScale(0.4f * static_cast<float>(RsGlobal.maximumWidth) / 640.0f,
			0.8f * static_cast<float>(RsGlobal.maximumHeight) / 448.0f);
		CFont::SetFontStyle(FONT_SUBTITLES);
		CFont::SetProportional(true);
		CFont::SetDropShadowPosition(1);
		CFont::SetDropColor(CRGBA(0, 0, 0, 255));
		CFont::PrintString(1080/2 + 500, 1920/2 + 8.0f * static_cast<float>(RsGlobal.maximumHeight) / 448.0f, (char *)(msg.c_str()));
	};
#endif
}