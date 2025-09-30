class com.rockstargames.gtav.FrontendGen9.CALIBRATION extends com.rockstargames.ui.core.BaseScreenLayout
{
   var CONTENT;
   var displayConfig;
   var headerText;
   var pauseBgColor = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG;
   var whiteColor = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE;
   var blackColor = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK;
   var greyColor = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREY;
   function CALIBRATION()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.displayConfig = new com.rockstargames.ui.utils.DisplayConfig();
      com.rockstargames.ui.game.GameInterface.call("SET_DISPLAY_CONFIG",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.displayConfig);
      this.SET_BUTTONS();
      this.initColor();
      this.headerText = this.CONTENT.headerText;
      com.rockstargames.gtav.FrontendGen9.CALIBRATION.setLocalisedText(this.headerText,"HDRCALIB_TITLE");
      if(this.displayConfig.isAsian)
      {
         this.resizeAsianText(this.headerText);
      }
   }
   function initColor()
   {
      var _loc3_ = new com.rockstargames.ui.utils.HudColour();
      var _loc4_ = new com.rockstargames.ui.utils.HudColour();
      var _loc2_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(this.pauseBgColor,_loc3_);
      com.rockstargames.ui.utils.Colour.setHudColour(this.whiteColor,_loc4_);
      com.rockstargames.ui.utils.Colour.setHudColour(this.greyColor,_loc2_);
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.listItem0.listItemBG,_loc3_.r,_loc3_.g,_loc3_.b,80);
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.listItem0.sliderFg,_loc4_.r,_loc4_.g,_loc4_.b,100);
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.listItem0.sliderBg,_loc2_.r,_loc2_.g,_loc2_.b,80);
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.listItem1.listItemBG,_loc3_.r,_loc3_.g,_loc3_.b,80);
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.listItem1.sliderFg,_loc4_.r,_loc4_.g,_loc4_.b,100);
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.listItem1.sliderBg,_loc2_.r,_loc2_.g,_loc2_.b,80);
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.listItem2.listItemBG,_loc3_.r,_loc3_.g,_loc3_.b,80);
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.listItem2.sliderFg,_loc4_.r,_loc4_.g,_loc4_.b,100);
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.listItem2.sliderBg,_loc2_.r,_loc2_.g,_loc2_.b,80);
   }
   function SET_HDR_VALUES(rowId, textLabel, minValue, maxValue, currentValue)
   {
      var _loc2_;
      var _loc5_;
      var _loc6_;
      switch(rowId)
      {
         case 0:
            _loc2_ = this.CONTENT.listItem0;
            break;
         case 1:
            _loc2_ = this.CONTENT.listItem1;
            break;
         case 2:
            _loc2_ = this.CONTENT.listItem2;
      }
      if(currentValue > maxValue)
      {
         currentValue = maxValue;
      }
      else if(currentValue < minValue)
      {
         currentValue = minValue;
      }
      _loc5_ = _loc2_.label;
      com.rockstargames.gtav.FrontendGen9.CALIBRATION.setLocalisedText(_loc5_,textLabel);
      _loc2_.value.text = currentValue;
      _loc6_ = (currentValue - minValue) / (maxValue - minValue) * 100;
      this.setSliderFill(_loc2_,_loc6_);
   }
   function SET_FOOTER_TEXT(textLabel)
   {
      var _loc2_;
      _loc2_ = this.CONTENT.footerText;
      com.rockstargames.gtav.FrontendGen9.CALIBRATION.setLocalisedText(_loc2_,textLabel);
   }
   function SET_SELECTED(rowId)
   {
      var _loc4_ = this.CONTENT.listItem0;
      var _loc3_ = this.CONTENT.listItem1;
      var _loc2_ = this.CONTENT.listItem2;
      switch(rowId)
      {
         case 0:
            this.setHighlight(_loc4_,true);
            this.setHighlight(_loc3_,false);
            this.setHighlight(_loc2_,false);
            return;
         case 1:
            this.setHighlight(_loc4_,false);
            this.setHighlight(_loc3_,true);
            this.setHighlight(_loc2_,false);
            return;
         case 2:
            this.setHighlight(_loc4_,false);
            this.setHighlight(_loc3_,false);
            this.setHighlight(_loc2_,true);
            return;
         default:
            this.setHighlight(_loc4_,false);
            this.setHighlight(_loc3_,false);
            this.setHighlight(_loc2_,false);
            return;
      }
   }
   function setSliderFill(mc, fillPercent)
   {
      mc.sliderFg._xscale = fillPercent;
   }
   function setHighlight(mc, isHighlighted)
   {
      var _loc2_ = new com.rockstargames.ui.utils.HudColour();
      var _loc3_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(this.blackColor,_loc2_);
      com.rockstargames.ui.utils.Colour.setHudColour(this.whiteColor,_loc3_);
      if(isHighlighted)
      {
         com.rockstargames.ui.utils.Colour.setHudColour(this.blackColor,_loc2_);
         com.rockstargames.ui.utils.Colour.setHudColour(this.whiteColor,_loc3_);
      }
      else
      {
         com.rockstargames.ui.utils.Colour.setHudColour(this.whiteColor,_loc2_);
         com.rockstargames.ui.utils.Colour.setHudColour(this.pauseBgColor,_loc3_);
      }
      com.rockstargames.ui.utils.Colour.Colourise(mc.listItemBG,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
      com.rockstargames.ui.utils.Colour.Colourise(mc.label,_loc2_.r,_loc2_.g,_loc2_.b,_loc2_.a);
      com.rockstargames.ui.utils.Colour.Colourise(mc.value,_loc2_.r,_loc2_.g,_loc2_.b,_loc2_.a);
      com.rockstargames.ui.utils.Colour.Colourise(mc.sliderFg,_loc2_.r,_loc2_.g,_loc2_.b,_loc2_.a);
   }
   static function setLocalisedText(tf, label)
   {
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,label,tf,tf.html);
      return tf.text;
   }
   function SET_BUTTONS()
   {
      var _loc2_ = this.CONTENT.attachMovie("mouseButton","mouseButtonL",this.CONTENT.getNextHighestDepth(),{_x:445,_y:455,_width:34,_height:47});
      var _loc3_ = this.CONTENT.attachMovie("mouseButton","mouseButtonR",this.CONTENT.getNextHighestDepth(),{_x:798,_y:455,_width:34,_height:47});
      com.rockstargames.ui.mouse.MouseBtn(_loc2_).setupGenericMouseInterface(0,0,this.onMouseEvent,[this.CONTENT.lArrowMC]);
      com.rockstargames.ui.mouse.MouseBtn(_loc3_).setupGenericMouseInterface(1,0,this.onMouseEvent,[this.CONTENT.rArrowMC]);
   }
   function SET_ARROW_ALPHA(arrowID, a)
   {
      var _loc4_ = [this.CONTENT.lArrowMC,this.CONTENT.rArrowMC];
      var _loc2_ = _loc4_[arrowID];
      var _loc3_;
      if(_loc2_ != undefined)
      {
         _loc3_ = Math.max(0,Math.min(a,100));
         _loc2_._alpha = _loc3_;
      }
   }
   function onMouseEvent(evtType, targetMC, args)
   {
      var _loc1_ = args[0];
      var _loc0_;
      switch(evtType)
      {
         case com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_RELEASE:
            _loc1_._yscale = _loc0_ = 75;
            _loc1_._xscale = _loc0_;
            com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc1_,0.05,{_xscale:100,_yscale:100});
            break;
         case com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_ROLL_OUT:
            _loc1_._yscale = _loc0_ = 100;
            _loc1_._xscale = _loc0_;
            break;
         case com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_ROLL_OVER:
            _loc1_._yscale = _loc0_ = 110;
            _loc1_._xscale = _loc0_;
         default:
            return;
      }
   }
   function resizeAsianText(tf)
   {
      var _loc1_ = tf.getTextFormat();
      _loc1_.size *= 0.8;
      _loc1_.leading = 8;
      tf.setTextFormat(_loc1_);
   }
}
