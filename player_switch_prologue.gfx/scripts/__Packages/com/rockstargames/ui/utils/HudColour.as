class com.rockstargames.ui.utils.HudColour extends com.rockstargames.ui.utils.HudColourLite
{
   var a;
   var b;
   var g;
   var r;
   static var HUD_COLOUR_PURE_WHITE = 0;
   static var HUD_COLOUR_WHITE = 1;
   static var HUD_COLOUR_BLACK = 2;
   static var HUD_COLOUR_GREY = 3;
   static var HUD_COLOUR_GREYLIGHT = 4;
   static var HUD_COLOUR_GREYDARK = 5;
   static var HUD_COLOUR_RED = 6;
   static var HUD_COLOUR_REDLIGHT = 7;
   static var HUD_COLOUR_REDDARK = 8;
   static var HUD_COLOUR_BLUE = 9;
   static var HUD_COLOUR_BLUELIGHT = 10;
   static var HUD_COLOUR_BLUEDARK = 11;
   static var HUD_COLOUR_YELLOW = 12;
   static var HUD_COLOUR_YELLOWLIGHT = 13;
   static var HUD_COLOUR_YELLOWDARK = 14;
   static var HUD_COLOUR_ORANGE = 15;
   static var HUD_COLOUR_ORANGELIGHT = 16;
   static var HUD_COLOUR_ORANGEDARK = 17;
   static var HUD_COLOUR_GREEN = 18;
   static var HUD_COLOUR_GREENLIGHT = 19;
   static var HUD_COLOUR_GREENDARK = 20;
   static var HUD_COLOUR_PURPLE = 21;
   static var HUD_COLOUR_PURPLELIGHT = 22;
   static var HUD_COLOUR_PURPLEDARK = 23;
   static var HUD_COLOUR_PINK = 24;
   static var HUD_COLOUR_RADAR_HEALTH = 25;
   static var HUD_COLOUR_RADAR_ARMOUR = 26;
   static var HUD_COLOUR_RADAR_DAMAGE = 27;
   static var HUD_COLOUR_NET_PLAYER1 = 28;
   static var HUD_COLOUR_NET_PLAYER2 = 29;
   static var HUD_COLOUR_NET_PLAYER3 = 30;
   static var HUD_COLOUR_NET_PLAYER4 = 31;
   static var HUD_COLOUR_NET_PLAYER5 = 32;
   static var HUD_COLOUR_NET_PLAYER6 = 33;
   static var HUD_COLOUR_NET_PLAYER7 = 34;
   static var HUD_COLOUR_NET_PLAYER8 = 35;
   static var HUD_COLOUR_NET_PLAYER9 = 36;
   static var HUD_COLOUR_NET_PLAYER10 = 37;
   static var HUD_COLOUR_NET_PLAYER11 = 38;
   static var HUD_COLOUR_NET_PLAYER12 = 39;
   static var HUD_COLOUR_NET_PLAYER13 = 40;
   static var HUD_COLOUR_NET_PLAYER14 = 41;
   static var HUD_COLOUR_NET_PLAYER15 = 42;
   static var HUD_COLOUR_NET_PLAYER16 = 43;
   static var HUD_COLOUR_NET_PLAYER17 = 44;
   static var HUD_COLOUR_NET_PLAYER18 = 45;
   static var HUD_COLOUR_NET_PLAYER19 = 46;
   static var HUD_COLOUR_NET_PLAYER20 = 47;
   static var HUD_COLOUR_NET_PLAYER21 = 48;
   static var HUD_COLOUR_NET_PLAYER22 = 49;
   static var HUD_COLOUR_NET_PLAYER23 = 50;
   static var HUD_COLOUR_NET_PLAYER24 = 51;
   static var HUD_COLOUR_NET_PLAYER25 = 52;
   static var HUD_COLOUR_NET_PLAYER26 = 53;
   static var HUD_COLOUR_NET_PLAYER27 = 54;
   static var HUD_COLOUR_NET_PLAYER28 = 55;
   static var HUD_COLOUR_NET_PLAYER29 = 56;
   static var HUD_COLOUR_NET_PLAYER30 = 57;
   static var HUD_COLOUR_NET_PLAYER31 = 58;
   static var HUD_COLOUR_NET_PLAYER32 = 59;
   static var HUD_COLOUR_SIMPLEBLIP_DEFAULT = 60;
   static var HUD_COLOUR_MENU_BLUE = 61;
   static var HUD_COLOUR_MENU_GREY_LIGHT = 62;
   static var HUD_COLOUR_MENU_BLUE_EXTRA_DARK = 63;
   static var HUD_COLOUR_MENU_YELLOW = 64;
   static var HUD_COLOUR_MENU_YELLOW_DARK = 65;
   static var HUD_COLOUR_MENU_GREEN = 66;
   static var HUD_COLOUR_MENU_GREY = 67;
   static var HUD_COLOUR_MENU_GREY_DARK = 68;
   static var HUD_COLOUR_MENU_HIGHLIGHT = 69;
   static var HUD_COLOUR_MENU_STANDARD = 70;
   static var HUD_COLOUR_MENU_DIMMED = 71;
   static var HUD_COLOUR_MENU_EXTRA_DIMMED = 72;
   static var HUD_COLOUR_BRIEF_TITLE = 73;
   static var HUD_COLOUR_MID_GREY_MP = 74;
   static var HUD_COLOUR_NET_PLAYER1_DARK = 75;
   static var HUD_COLOUR_NET_PLAYER2_DARK = 76;
   static var HUD_COLOUR_NET_PLAYER3_DARK = 77;
   static var HUD_COLOUR_NET_PLAYER4_DARK = 78;
   static var HUD_COLOUR_NET_PLAYER5_DARK = 79;
   static var HUD_COLOUR_NET_PLAYER6_DARK = 80;
   static var HUD_COLOUR_NET_PLAYER7_DARK = 81;
   static var HUD_COLOUR_NET_PLAYER8_DARK = 82;
   static var HUD_COLOUR_NET_PLAYER9_DARK = 83;
   static var HUD_COLOUR_NET_PLAYER10_DARK = 84;
   static var HUD_COLOUR_NET_PLAYER11_DARK = 85;
   static var HUD_COLOUR_NET_PLAYER12_DARK = 86;
   static var HUD_COLOUR_NET_PLAYER13_DARK = 87;
   static var HUD_COLOUR_NET_PLAYER14_DARK = 88;
   static var HUD_COLOUR_NET_PLAYER15_DARK = 89;
   static var HUD_COLOUR_NET_PLAYER16_DARK = 90;
   static var HUD_COLOUR_NET_PLAYER17_DARK = 91;
   static var HUD_COLOUR_NET_PLAYER18_DARK = 92;
   static var HUD_COLOUR_NET_PLAYER19_DARK = 93;
   static var HUD_COLOUR_NET_PLAYER20_DARK = 94;
   static var HUD_COLOUR_NET_PLAYER21_DARK = 95;
   static var HUD_COLOUR_NET_PLAYER22_DARK = 96;
   static var HUD_COLOUR_NET_PLAYER23_DARK = 97;
   static var HUD_COLOUR_NET_PLAYER24_DARK = 98;
   static var HUD_COLOUR_NET_PLAYER25_DARK = 99;
   static var HUD_COLOUR_NET_PLAYER26_DARK = 100;
   static var HUD_COLOUR_NET_PLAYER27_DARK = 101;
   static var HUD_COLOUR_NET_PLAYER28_DARK = 102;
   static var HUD_COLOUR_NET_PLAYER29_DARK = 103;
   static var HUD_COLOUR_NET_PLAYER30_DARK = 104;
   static var HUD_COLOUR_NET_PLAYER31_DARK = 105;
   static var HUD_COLOUR_NET_PLAYER32_DARK = 106;
   static var HUD_COLOUR_BRONZE = 107;
   static var HUD_COLOUR_SILVER = 108;
   static var HUD_COLOUR_GOLD = 109;
   static var HUD_COLOUR_PLATINUM = 110;
   static var HUD_COLOUR_GANG1 = 111;
   static var HUD_COLOUR_GANG2 = 112;
   static var HUD_COLOUR_GANG3 = 113;
   static var HUD_COLOUR_GANG4 = 114;
   static var HUD_COLOUR_SAME_CREW = 115;
   static var HUD_COLOUR_FREEMODE = 116;
   static var HUD_COLOUR_PAUSE_BG = 117;
   static var HUD_COLOUR_FRIENDLY = 118;
   static var HUD_COLOUR_ENEMY = 119;
   static var HUD_COLOUR_LOCATION = 120;
   static var HUD_COLOUR_PICKUP = 121;
   static var HUD_COLOUR_PAUSE_SINGLEPLAYER = 122;
   static var HUD_COLOUR_FREEMODE_DARK = 123;
   static var HUD_COLOUR_INACTIVE_MISSION = 124;
   static var HUD_COLOUR_DAMAGE = 125;
   static var HUD_COLOUR_PINKLIGHT = 126;
   static var HUD_COLOUR_PM_MITEM_HIGHLIGHT = 127;
   static var HUD_COLOUR_SCRIPT_VARIABLE = 128;
   static var HUD_COLOUR_YOGA = 129;
   static var HUD_COLOUR_TENNIS = 130;
   static var HUD_COLOUR_GOLF = 131;
   static var HUD_COLOUR_SHOOTING_RANGE = 132;
   static var HUD_COLOUR_FLIGHT_SCHOOL = 133;
   static var HUD_COLOUR_NORTH_BLUE = 134;
   static var HUD_COLOUR_SOCIAL_CLUB = 135;
   static var HUD_COLOUR_PLATFORM_BLUE = 136;
   static var HUD_COLOUR_PLATFORM_GREEN = 137;
   static var HUD_COLOUR_PLATFORM_GREY = 138;
   static var HUD_COLOUR_FACEBOOK_BLUE = 139;
   static var HUD_COLOUR_INGAME_BG = 140;
   static var HUD_COLOUR_DARTS = 141;
   static var HUD_COLOUR_WAYPOINT = 142;
   static var HUD_COLOUR_MICHAEL = 143;
   static var HUD_COLOUR_FRANKLIN = 144;
   static var HUD_COLOUR_TREVOR = 145;
   static var HUD_COLOUR_GOLF_P1 = 146;
   static var HUD_COLOUR_GOLF_P2 = 147;
   static var HUD_COLOUR_GOLF_P3 = 148;
   static var HUD_COLOUR_GOLF_P4 = 149;
   static var HUD_COLOUR_WAYPOINTLIGHT = 150;
   static var HUD_COLOUR_WAYPOINTDARK = 151;
   static var HUD_COLOUR_PANEL_LIGHT = 152;
   static var HUD_COLOUR_MICHAEL_DARK = 153;
   static var HUD_COLOUR_FRANKLIN_DARK = 154;
   static var HUD_COLOUR_TREVOR_DARK = 155;
   static var HUD_COLOUR_OBJECTIVE_ROUTE = 156;
   static var HUD_COLOUR_PAUSEMAP_TINT = 157;
   static var HUD_COLOUR_PAUSE_DESELECT = 158;
   static var HUD_COLOUR_PM_WEAPONS_PURCHASABLE = 159;
   static var HUD_COLOUR_PM_WEAPONS_LOCKED = 160;
   static var HUD_COLOUR_END_SCREEN_BG = 161;
   static var HUD_COLOUR_CHOP = 162;
   static var HUD_COLOUR_PAUSEMAP_TINT_HALF = 163;
   static var HUD_COLOUR_NORTH_BLUE_OFFICIAL = 164;
   static var HUD_COLOUR_SCRIPT_VARIABLE_2 = 165;
   static var HUD_COLOUR_CONTROLLER_MICHAEL = 166;
   static var HUD_COLOUR_CONTROLLER_FRANKLIN = 167;
   static var HUD_COLOUR_CONTROLLER_TREVOR = 168;
   static var HUD_COLOUR_CONTROLLER_CHOP = 169;
   static var HUD_COLOUR_VIDEO_EDITOR_VIDEO = 170;
   static var HUD_COLOUR_VIDEO_EDITOR_AUDIO = 171;
   static var HUD_COLOUR_VIDEO_EDITOR_TEXT = 171;
   function HudColour()
   {
      super();
      this.r = 255;
      this.g = 255;
      this.b = 255;
      this.a = 100;
   }
   static function getGlobeColID(rankNum)
   {
      if(rankNum <= 99)
      {
         return com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE;
      }
      if(rankNum >= 100 && rankNum <= 499)
      {
         return com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BRONZE;
      }
      if(rankNum >= 500 && rankNum <= 749)
      {
         return com.rockstargames.ui.utils.HudColour.HUD_COLOUR_SILVER;
      }
      if(rankNum >= 750)
      {
         return com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GOLD;
      }
   }
}
