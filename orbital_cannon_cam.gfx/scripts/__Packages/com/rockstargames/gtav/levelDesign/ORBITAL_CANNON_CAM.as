class com.rockstargames.gtav.levelDesign.ORBITAL_CANNON_CAM extends com.rockstargames.ui.core.BaseScreenLayout
{
   var hud;
   var CONTENT;
   var targets;
   var state;
   var camX;
   var camY;
   var camScale;
   static var displayConfig;
   static var STATE_NULL = 0;
   static var STATE_MENU = 1;
   static var STATE_SURVEILLANCE = 2;
   static var STATE_MANUAL = 3;
   static var STATE_AUTO = 4;
   static var STAGE_WIDTH = 1280;
   static var STAGE_HEIGHT = 720;
   static var NORMAL_COLOR_TRANSFORM = new flash.geom.ColorTransform();
   static var RED_COLOR_TRANSFORM = new flash.geom.ColorTransform(0,0,0,1,231,0,0,0);
   function ORBITAL_CANNON_CAM()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.hud = this.CONTENT.hud;
      this.hud._visible = false;
      this.menu = new com.rockstargames.gtav.levelDesign.orbitalCannonCam.Menu(this.CONTENT.mainMenu);
      this.menu._visible = false;
      this.targets = [];
      this.state = com.rockstargames.gtav.levelDesign.ORBITAL_CANNON_CAM.STATE_NULL;
      this.camX = 0;
      this.camY = 0;
      this.camScale = 1;
      com.rockstargames.gtav.levelDesign.ORBITAL_CANNON_CAM.displayConfig = new com.rockstargames.ui.utils.DisplayConfig();
      com.rockstargames.ui.game.GameInterface.call("SET_DISPLAY_CONFIG",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,com.rockstargames.gtav.levelDesign.ORBITAL_CANNON_CAM.displayConfig);
      this.hud.countdown.label.textAutoSize = "shrink";
      this.setLocalisedText(this.hud.countdown.label,"CANNON_CAM_FIRING");
      var _loc3_ = this.hud.countdown.label.getTextFormat();
      _loc3_.letterSpacing = 5;
      this.hud.countdown.label.setTextFormat(_loc3_);
      this.CONTENT.mainMenu._x = Math.max(99,com.rockstargames.gtav.levelDesign.ORBITAL_CANNON_CAM.STAGE_WIDTH * com.rockstargames.gtav.levelDesign.ORBITAL_CANNON_CAM.displayConfig.safeLeft + 10);
   }
   function SET_STATE(state)
   {
      switch(state)
      {
         case com.rockstargames.gtav.levelDesign.ORBITAL_CANNON_CAM.STATE_MENU:
            this.showMenu();
            break;
         case com.rockstargames.gtav.levelDesign.ORBITAL_CANNON_CAM.STATE_SURVEILLANCE:
            this.showSurveillance();
            break;
         case com.rockstargames.gtav.levelDesign.ORBITAL_CANNON_CAM.STATE_MANUAL:
            this.showManual();
            break;
         case com.rockstargames.gtav.levelDesign.ORBITAL_CANNON_CAM.STATE_AUTO:
            this.showAuto();
      }
      this.state = state;
   }
   function SET_MENU_TITLE(title)
   {
      this.menu.setTitle(title);
   }
   function SET_MENU_HELP_TEXT(message)
   {
      this.menu.setHelpText(message);
   }
   function ADD_MENU_ITEM(id, leftText, rightText, isActive, strikethroughText)
   {
      this.menu.addItem(id,leftText,rightText,strikethroughText,isActive);
   }
   function REMOVE_MENU_ITEM(id)
   {
      this.menu.removeItem(id);
   }
   function SET_MENU_ITEM_STATE(id, isActive)
   {
      this.menu.setItemState(id,isActive);
   }
   function SET_INPUT_EVENT(inputID)
   {
      this.menu.moveHighlight(inputID);
   }
   function GET_CURRENT_SELECTION()
   {
      return this.menu.getHighlightID();
   }
   function SET_COUNTDOWN(value)
   {
      this.hud.countdown.digit.text = value.toString();
      this.hud.countdown._visible = value > 0;
   }
   function SET_CHARGING_LEVEL(chargingLevel)
   {
      chargingLevel = this.clamp(chargingLevel,0,1);
      this.hud.chargingMeter.bar._xscale = 100 * chargingLevel;
      if(chargingLevel == 1)
      {
         this.hud.chargingMeter.transform.colorTransform = com.rockstargames.gtav.levelDesign.ORBITAL_CANNON_CAM.RED_COLOR_TRANSFORM;
         this.hud.message.gotoAndStop("active");
         this.hud.message.label.textAutoSize = "shrink";
         this.setLocalisedText(this.hud.message.label,"CANNON_CAM_ACTIVE");
         var _loc3_ = this.hud.message.label.getTextFormat();
         _loc3_.letterSpacing = 5;
         this.hud.message.label.setTextFormat(_loc3_);
         if(this.state == com.rockstargames.gtav.levelDesign.ORBITAL_CANNON_CAM.STATE_MANUAL)
         {
            this.hud.reticle.gotoAndStop("manualActive");
         }
         else if(this.state == com.rockstargames.gtav.levelDesign.ORBITAL_CANNON_CAM.STATE_AUTO)
         {
            this.hud.reticle.gotoAndStop("autoActive");
         }
      }
      else
      {
         this.hud.chargingMeter.transform.colorTransform = com.rockstargames.gtav.levelDesign.ORBITAL_CANNON_CAM.NORMAL_COLOR_TRANSFORM;
         this.hud.message.gotoAndStop("inactive");
         this.hud.message.label.textAutoSize = "shrink";
         this.setLocalisedText(this.hud.message.label,"CANNON_CAM_CHARGING");
         _loc3_ = this.hud.message.label.getTextFormat();
         _loc3_.letterSpacing = 5;
         this.hud.message.label.setTextFormat(_loc3_);
         if(this.state == com.rockstargames.gtav.levelDesign.ORBITAL_CANNON_CAM.STATE_MANUAL)
         {
            this.hud.reticle.gotoAndStop("manualInactive");
         }
         else if(this.state == com.rockstargames.gtav.levelDesign.ORBITAL_CANNON_CAM.STATE_AUTO)
         {
            this.hud.reticle.gotoAndStop("autoInactive");
         }
      }
   }
   function SET_COOLDOWN_LEVEL(coolDownLevel)
   {
      coolDownLevel = this.clamp(coolDownLevel,0,1);
      this.hud.cooldownMeter.bar._xscale = 100 * coolDownLevel;
   }
   function HIDE_COOLDOWN_METER()
   {
      this.hud.cooldownMeter._visible = false;
   }
   function SHOW_COOLDOWN_METER()
   {
      this.hud.cooldownMeter._visible = true;
      this.hud.chargingMeter.transform.colorTransform = com.rockstargames.gtav.levelDesign.ORBITAL_CANNON_CAM.NORMAL_COLOR_TRANSFORM;
      this.hud.message.gotoAndStop("inactive");
      this.hud.message._visible = true;
      this.setLocalisedText(this.hud.message.label,"CANNON_CAM_INACTIVE");
      if(this.state == com.rockstargames.gtav.levelDesign.ORBITAL_CANNON_CAM.STATE_MANUAL)
      {
         this.hud.reticle.gotoAndStop("manualInactive");
      }
      else if(this.state == com.rockstargames.gtav.levelDesign.ORBITAL_CANNON_CAM.STATE_AUTO)
      {
         this.hud.reticle.gotoAndStop("autoInactive");
      }
   }
   function SET_ZOOM_LEVEL(zoomLevel)
   {
      var _loc4_ = 200;
      var _loc5_ = this.hud.zoomMeter.pointer._y;
      var _loc2_ = this.hud.zoomMeter.track._height * (1 - this.clamp(zoomLevel,0,1));
      var _loc6_ = _loc2_ - _loc5_;
      var _loc3_ = Math.abs(_loc6_) / _loc4_;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.hud.zoomMeter.pointer,_loc3_,{_y:_loc2_,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_INOUT});
   }
   function showMenu()
   {
      this.hud._visible = false;
      this.menu._visible = true;
   }
   function showSurveillance()
   {
      this.menu._visible = false;
      this.hud.reticle.gotoAndStop("surveillance");
      this.hud.message._visible = true;
      this.hud.countdown._visible = false;
      this.hud.chargingMeter._visible = false;
      this.hud.cooldownMeter._visible = false;
      this.hud.message._visible = false;
      this.hud._visible = true;
   }
   function showManual()
   {
      this.menu._visible = false;
      this.hud.countdown._visible = false;
      this.hud.chargingMeter._visible = true;
      this.hud.cooldownMeter._visible = false;
      this.hud.message._visible = true;
      this.hud.reticle.gotoAndStop("manualInactive");
      this.hud._visible = true;
   }
   function showAuto()
   {
      this.menu._visible = false;
      this.hud.countdown._visible = false;
      this.hud.chargingMeter._visible = true;
      this.hud.cooldownMeter._visible = false;
      this.hud.message._visible = true;
      this.hud.reticle.gotoAndStop("autoInactive");
      this.hud._visible = true;
   }
   function clamp(value, min, max)
   {
      if(value < min)
      {
         return min;
      }
      if(value > max)
      {
         return max;
      }
      if(value == undefined)
      {
         return min;
      }
      if(isNaN(value))
      {
         return min;
      }
      return value;
   }
   function setLocalisedText(tf, label)
   {
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,label,tf,tf.html);
      return tf.text;
   }
}
