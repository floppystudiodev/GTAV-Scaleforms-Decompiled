class com.rockstargames.gtav.hud.hudComponents.HUD_CHIPS extends com.rockstargames.ui.hud.HUD_COMPONENT
{
   var BOUNDING_BOX;
   var CONTENT;
   var FADE_DURATION;
   var TIMELINE;
   var _HUD;
   var _enumID;
   var bSettingSPCash;
   var defaultX;
   var defaultY;
   var fadeState;
   var isFadingIn;
   var isFadingOut;
   var stayOnForever;
   function HUD_CHIPS()
   {
      super();
      _global.gfxExtensions = true;
      this.fadeState = 0;
      this.isFadingOut = false;
      this.isFadingIn = false;
   }
   function INITIALISE(mc)
   {
      this.TIMELINE = this;
      this.CONTENT = this.TIMELINE.CONTENT;
      this.BOUNDING_BOX = this.TIMELINE.BOUNDING_BOX;
      this.BOUNDING_BOX._visible = false;
      this.CONTENT.cashStrokeTF.outline = 14;
      this.CONTENT.cashStrokeTF.autoSize = "right";
      this.CONTENT.cashTF.autoSize = "right";
   }
   function READY(id)
   {
      super.READY(id);
      this.defaultX = this.TIMELINE._x;
      this.defaultY = this.TIMELINE._y;
      this.CONTENT._alpha = 0;
   }
   function SET_PLAYER_CASH(params)
   {
      this.bSettingSPCash = true;
      this.CONTENT.cashTF.html = false;
      this.CONTENT.cashTF.text = "$" + params[0];
      this.CONTENT.cashStrokeTF.text = "$" + params[0];
      var _loc2_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc2_);
      this.CONTENT.cashTF.textColor = com.rockstargames.ui.utils.Colour.RGBToHex(_loc2_.r,_loc2_.g,_loc2_.b);
      this.SHOW(params[1]);
   }
   function SET_PLAYER_CHIPS(params)
   {
      this.bSettingSPCash = true;
      this.CONTENT.cashTF.html = true;
      this.CONTENT.cashTF.htmlText = "<font face=\'$chips\'>.</font>" + params[0];
      this.CONTENT.cashStrokeTF.htmlText = "<font face=\'$chips\'>.</font>" + params[0];
      var _loc2_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc2_);
      this.CONTENT.cashTF.textColor = com.rockstargames.ui.utils.Colour.RGBToHex(_loc2_.r,_loc2_.g,_loc2_.b);
      this.SHOW(params[1]);
   }
   function SET_PLAYER_CASH_WITH_STRING(params)
   {
      this.bSettingSPCash = true;
      this.CONTENT.cashTF.html = true;
      this.CONTENT.cashTF.htmlText = params[0];
      this.CONTENT.cashStrokeTF.htmlText = params[0];
      this.SHOW(params[1]);
   }
   function SET_PLAYER_MP_CASH(params)
   {
      this.bSettingSPCash = false;
      this.stayOnForever = params[1];
      this.CONTENT.cashTF.html = false;
      this.CONTENT.cashTF.text = this.CONTENT.cashStrokeTF.text = "$" + params[0];
      this.SHOW();
   }
   function SET_PLAYER_MP_CASH_WITH_STRING(params)
   {
      this.bSettingSPCash = false;
      this.stayOnForever = params[1];
      this.CONTENT.cashTF.html = true;
      this.CONTENT.cashStrokeTF.html = true;
      this.CONTENT.cashTF.htmlText = String(params[0]);
      this.CONTENT.cashStrokeTF.htmlText = String(params[0]);
      this.CONTENT.cashStrokeTF.textColor = 0;
      this.SHOW();
   }
   function REMOVE_PLAYER_MP_CASH()
   {
      this.HIDE();
   }
   function SHOW(bSkipFade)
   {
      if(this.bSettingSPCash)
      {
         if(this.fadeState != 1)
         {
            if(bSkipFade)
            {
               com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,this.FADE_DURATION / 1000,{_alpha:100});
            }
            else
            {
               com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,this.FADE_DURATION / 1000,{_alpha:100,onCompleteScope:this,onComplete:this.STAY_ON_SCREEN});
            }
            this.fadeState = 1;
         }
      }
      else if(!this.isFadingIn)
      {
         this.isFadingIn = true;
         if(this.stayOnForever)
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,this.FADE_DURATION / 1000,{_alpha:100});
            com.rockstargames.ui.utils.Debug.log("Showing HUD_CHIPS on screen until HIDE() is called via code/script");
         }
         else
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,this.FADE_DURATION / 1000,{_alpha:100,onCompleteScope:this,onComplete:this.STAY_ON_SCREEN});
         }
      }
   }
   function STAY_ON_SCREEN()
   {
      this.isFadingIn = false;
   }
   function HIDE()
   {
      if(this.bSettingSPCash)
      {
         if(this.fadeState != -1)
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,this.FADE_DURATION / 1000,{_alpha:0,onCompleteScope:this,onComplete:this.REMOVE});
            this.fadeState = -1;
         }
      }
      else if(!this.isFadingOut)
      {
         this.isFadingOut = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,this.FADE_DURATION / 1000,{_alpha:0,onCompleteScope:this,onComplete:this.REMOVE});
      }
   }
   function REMOVE()
   {
      this.CONTENT.cashStrokeTF.text = "";
      this.CONTENT.cashTF.text = "";
      this.CONTENT._alpha = 0;
      this.fadeState = 0;
      this.isFadingOut = false;
      this.isFadingIn = false;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT);
      this._HUD.REMOVE_HUD_ITEM(this._enumID);
   }
   function getTopCompOffset()
   {
      return -3;
   }
   function getBottomCompOffset()
   {
      return -9;
   }
   function SET_PLAYER_CASH_CHANGE(params)
   {
      var _loc3_ = params[1];
      var _loc2_;
      if(_loc3_)
      {
         _loc2_ = "+$";
         com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT,102,152,104,100);
      }
      else
      {
         _loc2_ = "-$";
         com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT,194,80,80,100);
      }
      this.CONTENT.cashTF.text = _loc2_ + params[0];
      this.CONTENT.cashStrokeTF.text = _loc2_ + params[0];
      this.SHOW();
   }
   function SET_PLAYER_CHIP_CHANGE(params)
   {
      var _loc3_ = params[1];
      var _loc2_;
      if(_loc3_)
      {
         _loc2_ = "+";
         com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT,102,152,104,100);
      }
      else
      {
         _loc2_ = "-";
         com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT,194,80,80,100);
      }
      this.CONTENT.cashTF.html = true;
      this.CONTENT.cashTF.htmlText = _loc2_ + "<font face=\'$chips\'>.</font>" + params[0];
      this.CONTENT.cashStrokeTF.html = true;
      this.CONTENT.cashStrokeTF.htmlText = _loc2_ + "<font face=\'$chips\'>.</font>" + params[0];
      this.SHOW();
   }
   function SET_MP_MESSAGE(params)
   {
      this.bSettingSPCash = false;
      this.CONTENT.cashTF.html = true;
      this.CONTENT.cashStrokeTF.html = true;
      this.CONTENT.cashTF.htmlText = String(params[0]);
      this.CONTENT.cashStrokeTF.htmlText = String(params[0]);
      this.CONTENT.cashStrokeTF.textColor = 0;
      this.SHOW();
   }
}
