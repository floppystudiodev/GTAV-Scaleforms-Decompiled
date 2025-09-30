class com.rockstargames.gtav.minimap.MINIMAP extends MovieClip
{
   var ABILITY;
   var ABILITY_BAR_GLOW_MC;
   var ABILITY_BAR_GLOW_POINT_MC;
   var ABILITY_BAR_MC;
   var AIR;
   var AIR_BAR_MC;
   var ARMOUR;
   var BOUNDING_BOX;
   var CONTENT;
   var DEPTHGUAGE;
   var GANGLAYER;
   var HEALTH;
   var HEALTH_ARMOUR_ABILITY;
   var HEALTH_ARMOUR_BAR_MC;
   var MINIMAP_MASK;
   var SATNAV;
   var SONAR;
   var STALLWARNING;
   var TIMELINE;
   var centerScreenX;
   var centerScreenY;
   var colourAbility;
   var colourAir;
   var colourArmour;
   var colourHealth;
   var colourRed;
   var depthLevelForMap;
   var flashAbilityCycleCount;
   var flashAbilityGlowCycleCount;
   var flashMaxCyclesAbility;
   var flashMaxCyclesAbilityGlow;
   var gangColours;
   var healthContainer;
   var isAbilityFlashing;
   var queuedAbilityVisibility;
   var screenHeight;
   var screenWidth;
   var wantedOverlayActive;
   var worldMapHeight;
   var worldMapWidth;
   var MINIMAP_FILENAME = "MINIMAP";
   var BLIP_DEATH_DURATION = 1;
   var currentHealthValue = 0;
   var currentArmourValue = 0;
   var currentAbilityValue = 0;
   var currentAirValue = 0;
   var previousHealthValue = 0;
   var previousArmourValue = 0;
   var previousAbilityValue = 0;
   var previousAirValue = 0;
   var restarted = false;
   var isMultiplayer = false;
   var mapType = 0;
   var multiplayerScaleModifier = 1;
   var currentHour = 0;
   var currentMinute = 0;
   var FLASH_RATE = 50;
   var flashHealthActive = false;
   var healthLow = false;
   var gangCycleDelay = 1.5;
   var allowAbilityBarInMP = false;
   function MINIMAP(mc)
   {
      super();
      _global.gfxExtensions = true;
      this.TIMELINE = mc;
      this.screenWidth = 142;
      this.screenHeight = 142;
      this.centerScreenX = this.screenWidth / 2;
      this.centerScreenY = this.screenHeight / 2;
      this.depthLevelForMap = 10;
      this.worldMapWidth = 9216;
      this.worldMapHeight = 15360.002;
      this.INITIALISE();
   }
   function REGISTER_HEALTH_ARMOUR(_healthContainer)
   {
      this.healthContainer = _healthContainer;
   }
   function INITIALISE()
   {
      this.CONTENT = this.TIMELINE.attachMovie("CONTENT","CONTENT",this.TIMELINE.getNextHighestDepth());
      this.CONTENT.setMask(this.TIMELINE.mapMask);
      this.BOUNDING_BOX = this.TIMELINE.attachMovie("BOUNDING_BOX","BOUNDING_BOX",this.TIMELINE.getNextHighestDepth());
      this.BOUNDING_BOX._visible = false;
      this.wantedOverlayActive = false;
      this.colourHealth = new com.rockstargames.ui.utils.HudColour();
      this.colourArmour = new com.rockstargames.ui.utils.HudColour();
      this.colourAbility = new com.rockstargames.ui.utils.HudColour();
      this.colourAir = new com.rockstargames.ui.utils.HudColour();
      this.colourRed = new com.rockstargames.ui.utils.HudColour();
      this.gangColours = new Array();
      this.gangColours.push([29,100,153]);
      this.gangColours.push([214,116,15]);
      this.gangColours.push([135,125,142]);
      this.READY();
   }
   function READY()
   {
   }
   function SETUP_HEALTH_ARMOUR(healthType)
   {
      this.mapType = healthType;
      this.restarted = true;
      var _loc3_;
      if(this.healthContainer != undefined)
      {
         if(healthType == 1)
         {
            if(this.HEALTH_ARMOUR_ABILITY != undefined)
            {
               this.HEALTH_ARMOUR_ABILITY.removeMovieClip();
            }
            this.HEALTH_ARMOUR_ABILITY = this.healthContainer.attachMovie("HEALTH_ARMOUR_ABILITY_SMALL","HEALTH_ARMOUR_ABILITY_SMALL",1,{_visible:false});
            if(this.STALLWARNING != undefined)
            {
               this.STALLWARNING._visible = true;
            }
         }
         if(healthType == 2 || healthType == 3)
         {
            if(this.HEALTH_ARMOUR_ABILITY != undefined)
            {
               this.HEALTH_ARMOUR_ABILITY.removeMovieClip();
            }
            this.HEALTH_ARMOUR_ABILITY = this.healthContainer.attachMovie("HEALTH_ARMOUR_ABILITY_BIG","HEALTH_ARMOUR_ABILITY_BIG",1,{_visible:false});
            if(this.STALLWARNING != undefined)
            {
               this.STALLWARNING._visible = false;
            }
         }
         if(healthType == 3)
         {
            if(this.HEALTH_ARMOUR_ABILITY != undefined)
            {
               this.HEALTH_ARMOUR_ABILITY.removeMovieClip();
            }
            this.HEALTH_ARMOUR_ABILITY = this.healthContainer.attachMovie("GOLF","GOLF",1,{_visible:false});
         }
         if(healthType != 3)
         {
            if(this.wantedOverlayActive == false)
            {
               this.STOP_FLASHING_WANTED_OVERLAY();
            }
            else
            {
               this.FLASH_WANTED_OVERLAY();
            }
            this.SET_HEALTH_DAMAGE_VISIBLE(false);
            _loc3_ = new com.rockstargames.ui.utils.HudColour();
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_DAMAGE,_loc3_);
            if(this.HEALTH_ARMOUR_ABILITY.healthHitMC != undefined)
            {
               com.rockstargames.ui.utils.Colour.Colourise(this.HEALTH_ARMOUR_ABILITY.healthHitMC,_loc3_.r,_loc3_.g,_loc3_.b,100);
            }
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREEN,this.colourHealth);
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLUE,this.colourArmour);
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_YELLOW,this.colourAbility);
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLUELIGHT,this.colourAir);
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_RED,this.colourRed);
            this.HEALTH_ARMOUR_BAR_MC = this.HEALTH_ARMOUR_ABILITY.healthArmourMC;
            this.HEALTH = this.HEALTH_ARMOUR_BAR_MC.healthBar;
            this.ARMOUR = this.HEALTH_ARMOUR_BAR_MC.armourBar;
            this.ABILITY_BAR_MC = this.HEALTH_ARMOUR_ABILITY.abilityMC;
            this.ABILITY = this.ABILITY_BAR_MC.abilityBar;
            this.ABILITY_BAR_GLOW_MC = this.ABILITY_BAR_MC.barGlowMC;
            this.ABILITY_BAR_GLOW_POINT_MC = this.ABILITY_BAR_MC.abilityBarGlowPointMC;
            this.AIR_BAR_MC = this.HEALTH_ARMOUR_ABILITY.airMC;
            this.AIR = this.AIR_BAR_MC.airBar;
            com.rockstargames.ui.utils.Colour.Colourise(this.AIR,this.colourAir.r,this.colourAir.g,this.colourAir.b,100);
            com.rockstargames.ui.utils.Colour.Colourise(this.AIR_BAR_MC.airTrough,this.colourAir.r,this.colourAir.g,this.colourAir.b,100);
            this.AIR_BAR_MC.airBarRed._visible = false;
            com.rockstargames.ui.utils.Colour.Colourise(this.AIR_BAR_MC.airBarRed,this.colourRed.r,this.colourRed.g,this.colourRed.b,100);
            this.AIR_BAR_MC.airBarRed.stop();
            this.AIR_BAR_MC._visible = false;
            this.HEALTH._visible = false;
            this.HEALTH_ARMOUR_BAR_MC.healthTrough._visible = false;
            this.HEALTH_ARMOUR_BAR_MC.healthBarRed._visible = false;
            this.HEALTH_ARMOUR_BAR_MC.healthBarRed.stop();
            if(this.HEALTH_ARMOUR_BAR_MC.healthBarRed != undefined)
            {
               com.rockstargames.ui.utils.Colour.Colourise(this.HEALTH_ARMOUR_BAR_MC.healthBarRed,this.colourRed.r,this.colourRed.g,this.colourRed.b,100);
            }
            if(this.healthLow == true)
            {
               com.rockstargames.ui.utils.Colour.Colourise(this.HEALTH,this.colourRed.r,this.colourRed.g,this.colourRed.b,100);
               com.rockstargames.ui.utils.Colour.Colourise(this.HEALTH_ARMOUR_BAR_MC.healthTrough,this.colourRed.r,this.colourRed.g,this.colourRed.b,100);
            }
            else
            {
               com.rockstargames.ui.utils.Colour.Colourise(this.HEALTH,this.colourHealth.r,this.colourHealth.g,this.colourHealth.b,100);
               com.rockstargames.ui.utils.Colour.Colourise(this.HEALTH_ARMOUR_BAR_MC.healthTrough,this.colourHealth.r,this.colourHealth.g,this.colourHealth.b,100);
            }
            this.ARMOUR._visible = false;
            this.HEALTH_ARMOUR_BAR_MC.armourTrough._visible = false;
            com.rockstargames.ui.utils.Colour.Colourise(this.ARMOUR,this.colourArmour.r,this.colourArmour.g,this.colourArmour.b,100);
            com.rockstargames.ui.utils.Colour.Colourise(this.HEALTH_ARMOUR_BAR_MC.armourTrough,this.colourArmour.r,this.colourArmour.g,this.colourArmour.b,100);
            this.ABILITY._visible = false;
            com.rockstargames.ui.utils.Colour.Colourise(this.ABILITY,this.colourAbility.r,this.colourAbility.g,this.colourAbility.b,100);
            com.rockstargames.ui.utils.Colour.Colourise(this.ABILITY_BAR_MC.abilityTrough,this.colourAbility.r,this.colourAbility.g,this.colourAbility.b,100);
            this.ABILITY_BAR_GLOW_MC._visible = false;
            com.rockstargames.ui.utils.Colour.Colourise(this.ABILITY_BAR_GLOW_MC,this.colourAbility.r,this.colourAbility.g,this.colourAbility.b,100);
            this.ABILITY_BAR_GLOW_POINT_MC._visible = false;
            com.rockstargames.ui.utils.Colour.Colourise(this.ABILITY_BAR_GLOW_POINT_MC,this.colourAbility.r,this.colourAbility.g,this.colourAbility.b,100);
            this.ABILITY._width = this.currentAbilityValue * 0.43;
            this.AIR._width = this.currentAirValue * 0.43;
            this.currentHealthValue = this.previousHealthValue;
            this.currentArmourValue = this.previousArmourValue;
            this.currentAbilityValue = this.previousAbilityValue;
            this.currentAirValue = this.previousAirValue;
            this.rescaleAllBars();
            this.HEALTH_ARMOUR_ABILITY._visible = true;
            if(this.flashHealthActive == true)
            {
               this.flashHealthBarRed();
            }
            if(this.SATNAV != undefined)
            {
               this.SATNAV.removeMovieClip();
            }
            this.SATNAV = this.healthContainer.attachMovie("satnav","satnav",2,{_x:10,_y:103,_visible:false});
         }
      }
   }
   function rescaleAllBars()
   {
      if(this.isMultiplayer == true && !this.allowAbilityBarInMP)
      {
         this.ABILITY_BAR_MC._visible = false;
         if(this.AIR_BAR_MC._visible == false)
         {
            this.multiplayerScaleModifier = 2.049;
            this.HEALTH_ARMOUR_ABILITY.bar_bg.gotoAndStop(2);
         }
         else
         {
            this.multiplayerScaleModifier = 1;
            this.HEALTH_ARMOUR_ABILITY.bar_bg.gotoAndStop(1);
         }
      }
      else
      {
         this.multiplayerScaleModifier = 1;
         this.HEALTH_ARMOUR_ABILITY.bar_bg.gotoAndStop(1);
         if(this.AIR_BAR_MC._visible == false)
         {
            this.ABILITY_BAR_MC._visible = true;
         }
      }
      this.ARMOUR._xscale = this.currentArmourValue * this.multiplayerScaleModifier;
      this.HEALTH_ARMOUR_BAR_MC.armourTrough._xscale = 100 * this.multiplayerScaleModifier;
   }
   function SET_PLAYER_HEALTH(newHealthValue, wasAdded, capacity, showDamage)
   {
      var _loc3_;
      if(capacity != undefined && capacity <= 100)
      {
         _loc3_ = newHealthValue * (100 / capacity);
         newHealthValue = _loc3_;
      }
      if(newHealthValue > 0 && newHealthValue < 101)
      {
         this.HEALTH._xscale = newHealthValue;
         if(this.HEALTH._width < 1)
         {
            this.HEALTH._width = 1;
         }
         this.HEALTH_ARMOUR_BAR_MC.healthBarRed._xscale = this.currentHealthValue;
         this.HEALTH._visible = true;
         this.HEALTH_ARMOUR_BAR_MC.healthTrough._visible = true;
         this.HEALTH_ARMOUR_BAR_MC.armourTrough._visible = true;
      }
      else if(newHealthValue == 0)
      {
         this.HEALTH._visible = false;
      }
      if(this.isMultiplayer == false || this.allowAbilityBarInMP)
      {
         this.ABILITY._visible = true;
      }
      if(newHealthValue < this.currentHealthValue && newHealthValue != 0)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.HEALTH_ARMOUR_BAR_MC.healthBarRed);
         this.HEALTH_ARMOUR_BAR_MC.healthBarRed._alpha = 85;
         this.HEALTH_ARMOUR_BAR_MC.healthBarRed._visible = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.HEALTH_ARMOUR_BAR_MC.healthBarRed,0.5,{_alpha:0,onCompleteScope:this,onComplete:com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf,onCompleteArgs:[this.HEALTH_ARMOUR_BAR_MC.healthBarRed]});
         if(this.healthContainer._visible == true)
         {
            this.SET_HEALTH_DAMAGE_VISIBLE(showDamage);
         }
      }
      else if(newHealthValue > this.currentHealthValue)
      {
         if(this.HEALTH_ARMOUR_BAR_MC.healthBarRed._visible == true)
         {
            this.HEALTH_ARMOUR_BAR_MC.healthBarRed._visible = false;
            this.HEALTH_ARMOUR_BAR_MC.healthBarRed._alpha = 85;
         }
         this.SET_HEALTH_DAMAGE_VISIBLE(false);
      }
      if(newHealthValue <= 25)
      {
         if(this.healthLow == false)
         {
            this.healthLow = true;
         }
         if(this.flashHealthActive == false)
         {
            if(this.HEALTH_ARMOUR_BAR_MC.healthTrough != undefined)
            {
               com.rockstargames.ui.utils.Colour.Colourise(this.HEALTH_ARMOUR_BAR_MC.healthTrough,this.colourRed.r,this.colourRed.g,this.colourRed.b,100);
            }
            if(this.HEALTH != undefined)
            {
               com.rockstargames.ui.utils.Colour.Colourise(this.HEALTH,this.colourRed.r,this.colourRed.g,this.colourRed.b,100);
            }
         }
      }
      else if(newHealthValue > 25)
      {
         if(this.healthLow == true)
         {
            this.healthLow = false;
         }
         if(this.flashHealthActive == false)
         {
            if(this.HEALTH != undefined)
            {
               com.rockstargames.ui.utils.Colour.Colourise(this.HEALTH,this.colourHealth.r,this.colourHealth.g,this.colourHealth.b,100);
            }
            if(this.HEALTH_ARMOUR_BAR_MC.healthTrough != undefined)
            {
               com.rockstargames.ui.utils.Colour.Colourise(this.HEALTH_ARMOUR_BAR_MC.healthTrough,this.colourHealth.r,this.colourHealth.g,this.colourHealth.b,100);
            }
         }
      }
      this.currentHealthValue = newHealthValue;
      this.previousHealthValue = this.currentHealthValue;
   }
   function FLASH_HEALTH_BAR(vis)
   {
      if(vis == true)
      {
         if(this.flashHealthActive == false)
         {
            this.flashHealthActive = true;
            this.flashHealthBarRed();
         }
      }
      if(vis == false)
      {
         this.flashHealthActive = false;
         this.removeRedHealthBar();
      }
   }
   function flashHealthBarRed()
   {
      if(this.flashHealthActive == true)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.HEALTH);
         if(this.HEALTH != undefined)
         {
            com.rockstargames.ui.utils.Colour.Colourise(this.HEALTH,this.colourRed.r,this.colourRed.g,this.colourRed.b,100);
         }
         if(this.HEALTH_ARMOUR_BAR_MC.healthTrough != undefined)
         {
            com.rockstargames.ui.utils.Colour.Colourise(this.HEALTH_ARMOUR_BAR_MC.healthTrough,this.colourRed.r,this.colourRed.g,this.colourRed.b,100);
         }
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.HEALTH,0.5,{_alpha:0,delay:0.25,onCompleteScope:this,onComplete:this.flashHealthBarRed});
      }
      else
      {
         this.removeRedHealthBar();
      }
   }
   function removeRedHealthBar()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.HEALTH);
      this.HEALTH._alpha = 100;
      if(this.currentHealthValue != 0)
      {
         if(this.HEALTH != undefined)
         {
            com.rockstargames.ui.utils.Colour.Colourise(this.HEALTH,this.colourHealth.r,this.colourHealth.g,this.colourHealth.b,100);
         }
         if(this.HEALTH_ARMOUR_BAR_MC.healthTrough != undefined)
         {
            com.rockstargames.ui.utils.Colour.Colourise(this.HEALTH_ARMOUR_BAR_MC.healthTrough,this.colourHealth.r,this.colourHealth.g,this.colourHealth.b,100);
         }
      }
   }
   function SET_PLAYER_ARMOUR(newArmourValue, wasAdded, capacity)
   {
      var _loc4_;
      if(capacity != undefined && capacity <= 100)
      {
         _loc4_ = newArmourValue * (100 / capacity);
         newArmourValue = _loc4_;
      }
      else
      {
         capacity = 100;
      }
      if(newArmourValue > 0 && newArmourValue < 101)
      {
         this.ARMOUR._xscale = newArmourValue * this.multiplayerScaleModifier;
         if(this.ARMOUR._width < 1)
         {
            this.ARMOUR._width = 1;
         }
      }
      if(newArmourValue == 0)
      {
         this.ARMOUR._visible = false;
      }
      else
      {
         this.ARMOUR._visible = true;
         this.HEALTH_ARMOUR_BAR_MC.armourTrough._visible = true;
      }
      this.currentArmourValue = newArmourValue;
      this.previousArmourValue = this.currentArmourValue;
   }
   function SET_AIR_BAR(newAirValue)
   {
      if(newAirValue >= 0 && newAirValue <= 100)
      {
         this.AIR._width = newAirValue * 0.43;
         this.AIR_BAR_MC.airBarRed._width = this.AIR._width;
         this.AIR_BAR_MC._visible = true;
         this.ABILITY_BAR_MC._visible = false;
         if(newAirValue == 0)
         {
            if(this.AIR_BAR_MC._visible != false)
            {
               if(this.AIR_BAR_MC != undefined)
               {
                  com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.AIR_BAR_MC);
                  com.rockstargames.ui.tweenStar.TweenStarLite.to(this.AIR_BAR_MC,0.5,{_alpha:0,delay:20,onCompleteScope:this,onComplete:this.HIDE_AIR_BAR});
               }
            }
         }
         else if(newAirValue < 33)
         {
            this.AIR_BAR_MC.airBarRed._visible = true;
            this.AIR_BAR_MC.airBarRed.play();
         }
         else
         {
            this.AIR_BAR_MC.airBarRed._visible = false;
            this.AIR_BAR_MC.airBarRed.stop();
         }
         this.SET_PLAYER_ARMOUR(this.currentArmourValue);
      }
      else
      {
         this.HIDE_AIR_BAR();
      }
      this.currentAirValue = newAirValue;
      this.previousAirValue = this.currentAirValue;
      this.rescaleAllBars();
   }
   function HIDE_AIR_BAR()
   {
      if(this.AIR_BAR_MC != undefined)
      {
         this.AIR_BAR_MC._visible = false;
         this.AIR_BAR_MC.airBarRed._visible = false;
         this.AIR_BAR_MC.airBarRed.stop();
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.AIR_BAR_MC);
         this.AIR_BAR_MC._alpha = 100;
      }
      this.rescaleAllBars();
   }
   function SET_ABILITY_BAR(newAbilityValue, wasAdded, capacity)
   {
      var _loc4_;
      if(this.isMultiplayer == false || this.allowAbilityBarInMP)
      {
         if(capacity != undefined && capacity <= 100)
         {
            _loc4_ = newAbilityValue * (100 / capacity);
            newAbilityValue = _loc4_;
            if(newAbilityValue > 100)
            {
               newAbilityValue = 100;
            }
         }
         if(this.AIR_BAR_MC._visible == true)
         {
            this.HIDE_AIR_BAR();
         }
         if(newAbilityValue > 0)
         {
            this.ABILITY._width = newAbilityValue * 0.43;
            this.ABILITY._visible = true;
         }
         else if(newAbilityValue == 0)
         {
            this.ABILITY._width = newAbilityValue * 0.43;
            this.ABILITY._visible = false;
         }
         this.ABILITY_BAR_GLOW_POINT_MC._x = this.ABILITY._x + this.ABILITY._width;
         if(newAbilityValue < this.currentAbilityValue)
         {
            this.SET_ABILITY_BAR_GLOW_POINT(true);
            if(this.ABILITY_BAR_GLOW_MC._visible == true)
            {
               this.STOP_FLASHING_ABILITYGLOW();
            }
         }
         else
         {
            this.SET_ABILITY_BAR_GLOW_POINT(false);
         }
         if(newAbilityValue > this.currentAbilityValue && newAbilityValue > 0)
         {
            this.ABILITY_BAR_GLOW_MC.abilityBarGlowMC._width = this.ABILITY._width;
            this.ABILITY_BAR_GLOW_MC.abilityBarGlowRightMC._x = this.ABILITY_BAR_GLOW_MC.abilityBarGlowMC._x + this.ABILITY_BAR_GLOW_MC.abilityBarGlowMC._width;
            this.SET_ABILITY_BAR_GLOW(true);
            if(newAbilityValue == 100)
            {
               this.SET_ABILITY_BAR_GLOW_POINT(false);
            }
         }
         else if(newAbilityValue <= this.currentAbilityValue)
         {
            this.SET_ABILITY_BAR_GLOW(false);
         }
         this.currentAbilityValue = newAbilityValue;
         this.previousAbilityValue = this.currentAbilityValue;
      }
      else
      {
         this.ABILITY._visible = false;
      }
   }
   function SET_ABILITY_BAR_GLOW(isVisible)
   {
      this.flashMaxCyclesAbilityGlow = 6;
      if(isVisible == true)
      {
         if(this.ABILITY_BAR_GLOW_MC._visible == true)
         {
            this.flashAbilityGlowCycleCount = 0;
         }
         else
         {
            this.flashAbilityGlowCycleCount = 0;
            this.flashAbilityGlowOn(0.5);
            this.ABILITY_BAR_GLOW_MC._visible = true;
         }
      }
      else
      {
         this.flashAbilityGlowCycleCount = 6;
         this.flashAbilityGlowOff(0.5);
      }
   }
   function SET_ABILITY_BAR_GLOW_POINT(isVisible, isMax)
   {
      if(this.ABILITY_BAR_GLOW_POINT_MC != undefined)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.ABILITY_BAR_GLOW_POINT_MC);
      }
      var _loc2_ = 0.25;
      if(isVisible == true)
      {
         if(this.restarted == false)
         {
            this.ABILITY_BAR_GLOW_POINT_MC._visible = true;
            this.ABILITY_BAR_GLOW_POINT_MC.play();
            this.STOP_FLASHING_ABILITYGLOW();
            if(this.ABILITY_BAR_GLOW_POINT_MC != undefined)
            {
               com.rockstargames.ui.tweenStar.TweenStarLite.to(this.ABILITY_BAR_GLOW_POINT_MC,0.25,{_alpha:0,delay:_loc2_,onCompleteScope:this,onComplete:this.SET_ABILITY_BAR_GLOW_POINT,onCompleteArgs:[false]});
            }
         }
         else
         {
            this.restarted = false;
         }
      }
      else
      {
         this.ABILITY_BAR_GLOW_POINT_MC._visible = false;
         this.ABILITY_BAR_GLOW_POINT_MC._alpha = 100;
         this.ABILITY_BAR_GLOW_POINT_MC.stop();
      }
   }
   function SET_ABILITY_BAR_VISIBLE(isVisible)
   {
      if(this.ABILITY_BAR_MC != undefined)
      {
         if(this.isAbilityFlashing)
         {
            this.queuedAbilityVisibility = isVisible;
         }
         else if(isVisible == true)
         {
            this.ABILITY_BAR_MC._visible = true;
            if(this.ABILITY_BAR_MC._alpha == 0)
            {
               if(typeof this.ABILITY_BAR_MC == "movieclip")
               {
                  com.rockstargames.ui.tweenStar.TweenStarLite.to(this.ABILITY_BAR_MC,0.5,{_alpha:100,onCompleteScope:this,onComplete:com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf,onCompleteArgs:[this.ABILITY_BAR_MC]});
               }
            }
         }
         else if(typeof this.ABILITY_BAR_MC == "movieclip")
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this.ABILITY_BAR_MC,0.5,{_alpha:0,onCompleteScope:this,onComplete:com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf,onCompleteArgs:[this.ABILITY_BAR_MC]});
         }
         return true;
      }
      return false;
   }
   function MULTIPLAYER_IS_ACTIVE(isMP, allowAbilityBar)
   {
      this.allowAbilityBarInMP = allowAbilityBar;
      if(isMP != undefined)
      {
         this.isMultiplayer = isMP;
      }
      this.rescaleAllBars();
   }
   function SET_ABILITY_BAR_VISIBILITY_IN_MULTIPLAYER(isVisible)
   {
      this.MULTIPLAYER_IS_ACTIVE(true,isVisible);
   }
   function SET_HEALTH_DAMAGE_VISIBLE(vis, fadeTime)
   {
      if(this.healthContainer != undefined)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.HEALTH_ARMOUR_ABILITY.healthHitMC);
         if(vis == true)
         {
            if(fadeTime == undefined)
            {
               fadeTime = 1.5;
            }
            this.HEALTH_ARMOUR_ABILITY.healthHitMC._alpha = 75;
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this.HEALTH_ARMOUR_ABILITY.healthHitMC,fadeTime,{_alpha:0,delay:0.2,onCompleteScope:this,onComplete:com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf,onCompleteArgs:[this.HEALTH_ARMOUR_ABILITY.healthHitMC]});
         }
         this.HEALTH_ARMOUR_ABILITY.healthHitMC._visible = vis;
      }
   }
   function FLASH_MINIMAP(eFlashColour)
   {
      if(this.healthContainer != undefined)
      {
         if(eFlashColour == undefined)
         {
            eFlashColour = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE;
         }
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.HEALTH_ARMOUR_ABILITY.minimapFlashMC,eFlashColour);
         this.HEALTH_ARMOUR_ABILITY.minimapFlashMC._alpha = 100;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.HEALTH_ARMOUR_ABILITY.minimapFlashMC,0.3,{_alpha:0,onCompleteScope:this,onComplete:com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf,onCompleteArgs:[this.HEALTH_ARMOUR_ABILITY.minimapFlashMC]});
      }
   }
   function SET_MASK(maskMC)
   {
      this.MINIMAP_MASK = maskMC;
   }
   function MOVE_MAPMASKSQUARE(isVisible)
   {
   }
   function SET_COLOUR(mc, r, g, b, a)
   {
      if(typeof mc == "movieclip")
      {
         com.rockstargames.ui.utils.Colour.Colourise(mc,r,g,b,a);
      }
   }
   function SET_RADIUS_BLIP_COLOUR(mc, r, g, b, a)
   {
      if(typeof mc == "movieclip")
      {
         if(a == 0)
         {
            mc._visible = false;
         }
         else
         {
            mc._visible = true;
            com.rockstargames.ui.utils.Colour.Colourise(mc,r,g,b);
            mc.blipCenter._alpha = a;
         }
      }
   }
   function SHOW_CROSSHAIR(vis)
   {
      var _loc1_ = Boolean(vis);
      if(_level0.asRootContainer.asCrosshair != undefined)
      {
         _level0.asRootContainer.asCrosshair._visible = _loc1_;
      }
   }
   function TOGGLE_BLIP_LABEL(mc, str)
   {
      var _loc2_ = false;
      if(mc.textLabel != undefined)
      {
         this.REMOVE_BLIP_LABEL(mc);
         _loc2_ = false;
      }
      else
      {
         this.SET_BLIP_LABEL(mc,str);
         _loc2_ = true;
      }
      return _loc2_;
   }
   function SET_BLIP_DEATH(mc, isDead)
   {
      var _loc2_;
      if(mc.blip_mp_death != undefined)
      {
         _loc2_ = mc.deathBlip;
      }
      else
      {
         _loc2_ = mc.attachMovie("blip_mp_death","blip_mp_death",mc.getNextHighestDepth());
      }
      if(isDead)
      {
         _loc2_._alpha = 0;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2_,this.BLIP_DEATH_DURATION,{_alpha:100,onCompleteScope:this,onComplete:com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf,onCompleteArgs:[_loc2_]});
      }
      else
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2_,this.BLIP_DEATH_DURATION,{_alpha:0,onCompleteScope:this,onComplete:com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf,onCompleteArgs:[_loc2_]});
      }
   }
   function SET_BLIP_LABEL(mc, str, labelScale)
   {
      var _loc1_ = new MovieClip();
      var _loc2_;
      _loc1_ = mc.attachMovie("blipLabel","textLabel",mc.getNextHighestDepth(),{_x:0,_y:0});
      if(labelScale == undefined)
      {
         _loc1_._xscale = 100 / mc._xscale * 100;
         _loc1_._yscale = 100 / mc._yscale * 100;
      }
      else
      {
         _loc1_._xscale = labelScale;
         _loc1_._yscale = labelScale;
      }
      var _loc4_ = - mc._rotation;
      _loc1_._rotation = _loc4_;
      _loc2_ = _loc1_.blipLabel;
      _loc2_.htmlText = str;
      _loc2_.autoSize = "right";
      _loc2_.multiline = false;
      _loc2_.wordWrap = false;
      _loc1_.bg._width = _loc2_.textWidth + 20;
   }
   function REMOVE_BLIP_LABEL(mc)
   {
      mc.textLabel.removeMovieClip();
   }
   function START_BLIP_FLASHING(mc, blinkSpeed)
   {
      this.flashOff(mc,blinkSpeed);
   }
   function STOP_BLIP_FLASHING(mc)
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(mc);
      mc._visible = true;
   }
   function REMOVE_BLIP(mc)
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(mc);
      var _loc2_;
      if(mc.blip_mp_death != undefined)
      {
         _loc2_ = mc.deathBlip;
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(_loc2_);
      }
      mc.removeMovieClip();
   }
   function BLINK_ABILITY_BAR(millisecondsToFlash)
   {
      if(millisecondsToFlash > 0)
      {
         this.queuedAbilityVisibility = this.ABILITY_BAR_MC._visible;
         this.blinkOff(0.5,millisecondsToFlash / 1000);
         this.isAbilityFlashing = true;
      }
      else
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.ABILITY_BAR_MC);
         this.ABILITY_BAR_MC._visible = this.queuedAbilityVisibility;
         this.isAbilityFlashing = false;
      }
   }
   function blinkOn(blinkRate, blinkRemaining)
   {
      if(blinkRemaining)
      {
         this.ABILITY_BAR_MC._visible = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.ABILITY_BAR_MC,blinkRate,{onComplete:this.blinkOff,onCompleteScope:this,onCompleteArgs:[blinkRate,blinkRemaining]});
      }
      else
      {
         this.ABILITY_BAR_MC._visible = this.queuedAbilityVisibility;
      }
   }
   function blinkOff(blinkRate, blinkRemaining)
   {
      this.ABILITY_BAR_MC._visible = false;
      if(blinkRemaining)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.ABILITY_BAR_MC,blinkRate,{onComplete:this.blinkOn,onCompleteScope:this,onCompleteArgs:[blinkRate,blinkRemaining - 1]});
      }
   }
   function FLASH_ABILITY_BAR(params)
   {
      var _loc3_ = params[0];
      var _loc2_ = params[1];
      this.flashAbilityCycleCount = 0;
      _loc2_ = Math.floor(_loc2_ * 2);
      this.flashMaxCyclesAbility = _loc2_;
      this.START_FLASHING_ABILITY(_loc3_ / 1000);
   }
   function flashAbilityOn(blinkSpeed)
   {
      this.flashAbilityCycleCount = this.flashAbilityCycleCount + 1;
      var _loc2_;
      if(this.flashAbilityCycleCount < this.flashMaxCyclesAbility)
      {
         this.ABILITY._visible = true;
         _loc2_ = this.ABILITY._alpha;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.ABILITY,0,{_alpha:_loc2_,delay:blinkSpeed,onCompleteScope:this,onComplete:this.flashAbilityOff,onCompleteArgs:[blinkSpeed]});
      }
      else
      {
         this.STOP_FLASHING_ABILITY();
      }
   }
   function flashAbilityOff(blinkSpeed)
   {
      this.flashAbilityCycleCount = this.flashAbilityCycleCount + 1;
      var _loc2_;
      if(this.flashAbilityCycleCount < this.flashMaxCyclesAbility)
      {
         this.ABILITY._visible = false;
         _loc2_ = this.ABILITY._alpha;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.ABILITY,0,{_alpha:_loc2_,delay:blinkSpeed,onCompleteScope:this,onComplete:this.flashAbilityOn,onCompleteArgs:[blinkSpeed]});
      }
      else
      {
         this.STOP_FLASHING_ABILITY();
      }
   }
   function START_FLASHING_ABILITY(blinkSpeed)
   {
      this.flashAbilityOff(blinkSpeed);
   }
   function STOP_FLASHING_ABILITY()
   {
      if(typeof this.ABILITY == "movieclip")
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.ABILITY);
      }
      this.ABILITY._visible = true;
   }
   function flashAbilityGlowOn(blinkSpeed)
   {
      this.flashAbilityGlowCycleCount = this.flashAbilityGlowCycleCount + 1;
      if(this.flashAbilityGlowCycleCount < this.flashMaxCyclesAbilityGlow)
      {
         this.ABILITY_BAR_GLOW_MC._alpha = 0;
         if(this.ABILITY_BAR_GLOW_MC != undefined)
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this.ABILITY_BAR_GLOW_MC,blinkSpeed,{_alpha:100,delay:blinkSpeed / 2,onCompleteScope:this,onComplete:this.flashAbilityGlowOff,onCompleteArgs:[blinkSpeed]});
         }
      }
      else
      {
         this.STOP_FLASHING_ABILITYGLOW();
      }
   }
   function flashAbilityGlowOff(blinkSpeed)
   {
      this.flashAbilityGlowCycleCount = this.flashAbilityGlowCycleCount + 1;
      if(this.flashAbilityGlowCycleCount < this.flashMaxCyclesAbilityGlow)
      {
         this.ABILITY_BAR_GLOW_MC._alpha = 100;
         if(this.ABILITY_BAR_GLOW_MC != undefined)
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this.ABILITY_BAR_GLOW_MC,blinkSpeed,{_alpha:0,delay:blinkSpeed / 2,onCompleteScope:this,onComplete:this.flashAbilityGlowOn,onCompleteArgs:[blinkSpeed]});
         }
      }
      else if(this.ABILITY_BAR_GLOW_MC != undefined)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.ABILITY_BAR_GLOW_MC,blinkSpeed,{_alpha:0,delay:blinkSpeed / 2,onCompleteScope:this,onComplete:this.STOP_FLASHING_ABILITYGLOW});
      }
   }
   function STOP_FLASHING_ABILITYGLOW()
   {
      if(this.ABILITY_BAR_GLOW_MC != undefined)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.ABILITY_BAR_GLOW_MC);
      }
      this.ABILITY_BAR_GLOW_MC._visible = false;
   }
   function flashOn(mc, blinkSpeed)
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(mc);
      mc._visible = true;
      var _loc3_ = mc._alpha;
      if(mc != undefined)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(mc,blinkSpeed,{_alpha:_loc3_,onCompleteScope:this,onComplete:this.flashOff,onCompleteArgs:[mc,blinkSpeed]});
      }
   }
   function flashOff(mc, blinkSpeed)
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(mc);
      mc._visible = false;
      var _loc3_ = mc._alpha;
      if(mc != undefined)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(mc,blinkSpeed,{_alpha:_loc3_,onCompleteScope:this,onComplete:this.flashOn,onCompleteArgs:[mc,blinkSpeed]});
      }
   }
   function SET_WANTED_LEVEL(circle, wantedLevel, radius)
   {
      circle.clear();
      circle.blipCenter.removeMovieClip();
      circle.outline.removeMovieClip();
      var _loc12_ = "PoliceNetStars" + wantedLevel;
      var _loc13_ = flash.display.BitmapData.loadBitmap(_loc12_);
      var _loc2_ = radius;
      var _loc6_ = 0;
      var _loc5_ = 0;
      var _loc7_ = 0.41421356237309503;
      var _loc3_;
      var _loc4_;
      var _loc9_;
      var _loc8_;
      var _loc11_ = new flash.geom.Matrix();
      circle.beginBitmapFill(_loc13_,_loc11_,true,true);
      circle.moveTo(_loc6_ + _loc2_,_loc5_);
      var _loc1_ = 45;
      while(_loc1_ <= 360)
      {
         _loc3_ = _loc2_ * Math.cos(_loc1_ * 3.141592653589793 / 180);
         _loc4_ = _loc2_ * Math.sin(_loc1_ * 3.141592653589793 / 180);
         _loc9_ = _loc3_ + _loc2_ * _loc7_ * Math.cos((_loc1_ - 90) * 3.141592653589793 / 180);
         _loc8_ = _loc4_ + _loc2_ * _loc7_ * Math.sin((_loc1_ - 90) * 3.141592653589793 / 180);
         circle.curveTo(_loc9_ + _loc6_,_loc8_ + _loc5_,_loc3_ + _loc6_,_loc4_ + _loc5_);
         _loc1_ += 45;
      }
      circle.endFill();
   }
   function GET_ASSET_ARRAY()
   {
      var _loc1_ = new Array();
      var _loc2_ = new com.rockstargames.gtav.constants.Blips();
      _loc1_ = _loc2_.getListOfBlips();
      return _loc1_;
   }
   function GET_SIZE(mc)
   {
      var _loc1_ = new Array();
      _loc1_.push(mc._x);
      _loc1_.push(mc._y);
      return _loc1_;
   }
   function SET_HEALTH_ARMOUR_BAR_VISIBLE(_vis)
   {
      var _loc2_ = false;
      if(this.HEALTH_ARMOUR_BAR_MC != undefined)
      {
         this.HEALTH_ARMOUR_BAR_MC._visible = Boolean(_vis);
         _loc2_ = true;
      }
      if(this.ABILITY_BAR_MC != undefined)
      {
         if(this.isMultiplayer == false || this.allowAbilityBarInMP)
         {
            if(_vis == true)
            {
               this.ABILITY_BAR_MC._visible = Boolean(_vis);
            }
         }
         _loc2_ = true;
      }
      return _loc2_;
   }
   function SET_SATNAV_DIRECTION(iconEnum)
   {
      var _loc2_;
      if(this.SATNAV != undefined)
      {
         if(isNaN(iconEnum))
         {
            this.SATNAV.satNavDirection.gotoAndStop("BLANK");
            this.SATNAV.satNavDirection._alpha = 0;
         }
         else
         {
            _loc2_ = com.rockstargames.gtav.constants.SatNavIconsLUT.lookUp(iconEnum);
            this.SATNAV.satNavDirection.gotoAndStop(_loc2_[1]);
         }
         if(this.SATNAV.satNavDirection._alpha == 0)
         {
            if(this.SATNAV.satNavDirection != undefined)
            {
               com.rockstargames.ui.tweenStar.TweenStarLite.to(this.SATNAV.satNavDirection,0.5,{_alpha:100,onCompleteScope:this,onComplete:com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf,onCompleteArgs:[this.SATNAV.satNavDirection]});
            }
         }
         this.SHOW_SATNAV();
      }
   }
   function SET_SATNAV_DISTANCE(distance, isMetric)
   {
      if(this.SATNAV != undefined)
      {
         if(!isNaN(distance))
         {
         }
         this.SATNAV.distanceTF.text = this.formatDistance(distance,isMetric);
         this.SHOW_SATNAV();
      }
   }
   function HIDE_SATNAV()
   {
      if(this.SATNAV._visible == true)
      {
         this.SATNAV._visible = false;
      }
   }
   function SHOW_SATNAV()
   {
      if(this.HEALTH_ARMOUR_ABILITY._name != "HEALTH_ARMOUR_ABILITY_BIG")
      {
         if(this.SATNAV._visible == false)
         {
            this.SATNAV._visible = true;
         }
      }
   }
   function SET_DEPTH(distanceToSurface, distanceToFloor, isMetric, warning)
   {
      if(this.DEPTHGUAGE == undefined)
      {
         this.SHOW_DEPTH();
      }
      if(this.DEPTHGUAGE != undefined)
      {
         if(isNaN(distanceToSurface) || isNaN(distanceToFloor))
         {
         }
         this.DEPTHGUAGE.distanceToSurfaceTF.text = this.formatDistance(distanceToSurface,isMetric);
         this.DEPTHGUAGE.distanceToFloorTF.text = this.formatDistance(distanceToFloor,isMetric);
         if(warning)
         {
            this.DEPTHGUAGE.depgthRedBG._visible = true;
            this.DEPTHGUAGE.depgthBlackBG._visible = false;
         }
         else
         {
            this.DEPTHGUAGE.depgthRedBG._visible = false;
            this.DEPTHGUAGE.depgthBlackBG._visible = true;
         }
      }
   }
   function HIDE_DEPTH()
   {
      if(this.DEPTHGUAGE != undefined)
      {
         this.DEPTHGUAGE.removeMovieClip();
         this.DEPTHGUAGE = undefined;
      }
   }
   function SHOW_DEPTH()
   {
      if(this.HEALTH_ARMOUR_ABILITY._name != "HEALTH_ARMOUR_ABILITY_BIG")
      {
         if(this.DEPTHGUAGE == undefined)
         {
            this.DEPTHGUAGE = this.healthContainer.attachMovie("depth_bar","depth_bar",3,{_x:10,_y:103});
            this.DEPTHGUAGE.depgthRedBG._visible = false;
         }
      }
   }
   function SHOW_SONAR_SWEEP(isVisible)
   {
      if(isVisible)
      {
         if(this.SONAR == undefined && this.HEALTH_ARMOUR_ABILITY._name != "HEALTH_ARMOUR_ABILITY_BIG")
         {
            this.SONAR = this.healthContainer.attachMovie("sonar","sonar",4,{_x:6,_y:8,_alpha:70});
         }
      }
      else if(this.SONAR != undefined)
      {
         this.SONAR.removeMovieClip();
         this.SONAR = undefined;
      }
   }
   function formatDistance(distance, isMetric)
   {
      var _loc3_;
      var _loc4_;
      var _loc2_;
      var _loc7_;
      var _loc8_;
      var _loc5_;
      var _loc1_;
      var _loc9_;
      if(isMetric == true)
      {
         _loc4_ = distance / 1000;
         if(_loc4_ >= 1)
         {
            _loc4_ = com.rockstargames.gtav.utils.ROUND_DECIMAL_PLACES.roundDecimals(_loc4_,2);
            _loc2_ = _loc4_.toString();
            _loc7_ = _loc2_.lastIndexOf(".");
            if(_loc7_ == -1)
            {
               _loc2_ += ".00";
            }
            else if(_loc2_.length - _loc7_ == 2)
            {
               _loc2_ += "0";
            }
            _loc3_ = _loc2_ + "km";
         }
         else
         {
            _loc8_ = Math.round(distance);
            _loc3_ = _loc8_ + "m";
         }
      }
      else
      {
         _loc5_ = distance * 0.0006213;
         if(_loc5_ > 0.1)
         {
            _loc5_ = com.rockstargames.gtav.utils.ROUND_DECIMAL_PLACES.roundDecimals(_loc5_,2);
            _loc1_ = _loc5_.toString();
            _loc7_ = _loc1_.lastIndexOf(".");
            if(_loc7_ == -1)
            {
               _loc1_ += ".00";
            }
            else if(_loc1_.length - _loc7_ == 2)
            {
               _loc1_ += "0";
            }
            _loc3_ = _loc1_ + "mi";
         }
         else
         {
            _loc9_ = Math.round(distance * 3.2808399);
            _loc3_ = _loc9_ + "ft";
         }
      }
      return _loc3_;
   }
   function HIDE_HEALTH_ARMOUR()
   {
      if(this.HEALTH_ARMOUR_BAR_MC._visible == true)
      {
         this.HEALTH_ARMOUR_BAR_MC._visible = false;
      }
   }
   function SHOW_HEALTH_ARMOUR()
   {
      if(this.HEALTH_ARMOUR_BAR_MC._visible == false)
      {
         this.HEALTH_ARMOUR_BAR_MC._visible = true;
      }
   }
   function SHOW_STALL_WARNING(_vis)
   {
      if(_vis == true)
      {
         if(this.STALLWARNING == undefined)
         {
            this.STALLWARNING = this.healthContainer.attachMovie("stallwarning","stallwarning",3,{_x:10,_y:103});
         }
         com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"STALL_WARNING",this.STALLWARNING.stallTF,false);
         if(this.mapType == 1)
         {
            this.STALLWARNING._visible = true;
         }
      }
      else if(_vis == false)
      {
         if(this.STALLWARNING != undefined)
         {
            this.STALLWARNING.stallTF.text = "";
            this.STALLWARNING.removeMovieClip();
            this.STALLWARNING = undefined;
         }
      }
   }
   function FLASH_WANTED_OVERLAY()
   {
      if(this.HEALTH_ARMOUR_ABILITY != undefined)
      {
         this.HEALTH_ARMOUR_ABILITY.wantedOverlaySP.gotoAndPlay(1);
         this.HEALTH_ARMOUR_ABILITY.wantedOverlaySP._visible = true;
      }
      this.wantedOverlayActive = true;
   }
   function STOP_FLASHING_WANTED_OVERLAY()
   {
      if(this.HEALTH_ARMOUR_ABILITY != undefined)
      {
         this.HEALTH_ARMOUR_ABILITY.wantedOverlaySP._visible = false;
      }
      this.wantedOverlayActive = false;
   }
   function SHOW_YOKE(xFloat, yFloat, vis, alpha)
   {
      var _loc6_;
      var _loc3_;
      var _loc2_;
      if(vis == false || vis == undefined)
      {
         if(this.healthContainer.yoke != undefined)
         {
            this.healthContainer.yoke.removeMovieClip();
         }
      }
      else
      {
         if(this.healthContainer.yoke == undefined)
         {
            if(alpha == undefined || alpha == 0)
            {
               alpha = 50;
            }
            _loc6_ = this.healthContainer.attachMovie("yoke_icon","yoke",4,{_x:86.5,_y:59,_alpha:alpha});
         }
         _loc3_ = 95.5 + 76.5 * xFloat;
         if(_loc3_ < 19)
         {
            _loc3_ = 19;
         }
         if(_loc3_ > 172)
         {
            _loc3_ = 172;
         }
         _loc2_ = 68 + 46 * yFloat;
         if(_loc2_ < 22)
         {
            _loc2_ = 22;
         }
         if(_loc2_ > 114)
         {
            _loc2_ = 114;
         }
         this.healthContainer.yoke._x = _loc3_;
         this.healthContainer.yoke._y = _loc2_;
      }
   }
   function REGISTER_TERRITORY(mc)
   {
      this.GANGLAYER = mc.attachMovie("gang_areas","gang_areas",1,{_x:-864,_y:-1440});
      var _loc2_ = 1;
      while(_loc2_ < 42)
      {
         this.GANGLAYER["gang_area_" + _loc2_]._visible = false;
         _loc2_ = _loc2_ + 1;
      }
   }
   function SET_MP_PROPERTY_OWNER(propertyID, owner, owner2, owner3)
   {
      var _loc5_ = 0;
      var _loc4_ = arguments.slice(1);
      var _loc3_ = this.GANGLAYER["gang_area_" + propertyID];
      if(_loc3_ != undefined)
      {
         if(typeof _loc3_ == "movieclip")
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(_loc3_);
         }
         if(_loc4_[0] == -1 || _loc4_.length == 0)
         {
            _loc3_._visible = false;
         }
         else
         {
            _loc3_._alpha = 0;
            _loc3_._visible = true;
            _loc5_ = _loc4_.length - 1;
            this.CYCLE_GANG_COLOURS(_loc3_,propertyID,_loc5_,_loc4_);
         }
      }
   }
   function CYCLE_GANG_COLOURS(mc, propertyID, currentOwner, ownerArray)
   {
      var _loc3_;
      if(typeof mc == "movieclip")
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(mc);
         _loc3_ = ownerArray[currentOwner];
         if(_loc3_ < 3)
         {
            com.rockstargames.ui.utils.Colour.Colourise(mc,this.gangColours[_loc3_][0],this.gangColours[_loc3_][1],this.gangColours[_loc3_][2],65);
         }
         else
         {
            com.rockstargames.ui.utils.Colour.ApplyHudColour(mc,_loc3_);
            mc._alpha = 65;
         }
      }
      if(ownerArray.length > 1)
      {
         currentOwner = currentOwner + 1;
         if(currentOwner + 1 > ownerArray.length)
         {
            currentOwner = 0;
         }
         if(typeof mc == "movieclip")
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(mc,0,{_alpha:65,delay:this.gangCycleDelay,onCompleteScope:this,onComplete:this.CYCLE_GANG_COLOURS,onCompleteArgs:[mc,propertyID,currentOwner,ownerArray]});
         }
      }
   }
}
