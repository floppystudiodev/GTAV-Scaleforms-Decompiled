class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuConfigurationItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
   var __get__columnID;
   var __get__data;
   var __get__highlighted;
   var _data;
   var _highlighted;
   var _uniqueID;
   var _xmouse;
   var attachMovie;
   var bAlpha;
   var bMC;
   var bgMC;
   var checkSelectable;
   var configListRef;
   var gotoAndStop;
   var highlightMC;
   var index;
   var initialIndex;
   var isLastItem;
   var itemTextLeft;
   var itemTextMid;
   var itemTextRight;
   var labelMC;
   var mOut;
   var mOver;
   var type;
   var warningMC;
   var defaultLabelColourEnum = 0;
   var keyFocus = 1;
   function PauseMenuConfigurationItem()
   {
      super();
      this.itemTextMid = this.labelMC.value1;
      this.itemTextRight = this.labelMC.value2;
      this.warningMC = this.labelMC.warningMC;
      this.defaultLabelColourEnum = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE;
      if(this.itemTextMid.bg)
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.itemTextMid.bg,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
      }
      if(this.itemTextRight.bg)
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.itemTextRight.bg,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
      }
      this.itemTextMid.bg._visible = false;
      this.itemTextRight.bg._visible = false;
      this.bgMC._visible = false;
      _global.gfxExtensions = true;
   }
   function mInit()
   {
      if(this.bMC)
      {
         this.bMC.removeMovieClip();
      }
      this.bMC = this.attachMovie("configListHighlight","bMC",9999);
      this.bMC._alpha = this.bAlpha;
      this.bMC.onRelease = gfx.utils.Delegate.create(this,this.mPress);
      this.bMC.onRollOver = gfx.utils.Delegate.create(this,this.mOver);
      this.bMC.onRollOut = gfx.utils.Delegate.create(this,this.mOut);
   }
   function setText(text, bindingItem, slot)
   {
      this.fadeStop(bindingItem);
      bindingItem.icons.removeMovieClip();
      bindingItem.iconsBG.removeMovieClip();
      var _loc4_;
      var _loc5_;
      if(text != undefined && text != "")
      {
         _loc4_ = bindingItem.createEmptyMovieClip("iconsBG",bindingItem.getNextHighestDepth());
         _loc5_ = bindingItem.createEmptyMovieClip("icons",bindingItem.getNextHighestDepth());
         com.rockstargames.ui.game.GameInterface.call("SET_FORMATTED_TEXT_WITH_ICONS_EXPLICIT",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,text,_loc5_,bindingItem.valueTF,0,13,3,true,false,slot);
         com.rockstargames.ui.game.GameInterface.call("SET_FORMATTED_TEXT_WITH_ICONS_EXPLICIT",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"~HUD_COLOUR_BLACK~" + text,_loc4_,bindingItem.valueBorderTF,0,15,3,true,false,slot);
      }
      else
      {
         com.rockstargames.ui.utils.UIText.setSizedText(bindingItem.valueTF,"");
         com.rockstargames.ui.utils.UIText.setSizedText(bindingItem.valueBorderTF,"");
      }
   }
   function set data(_d)
   {
      super.data = _d;
      if(this._data[0] != undefined)
      {
         this.itemTextLeft.autoSize = "none";
         this.itemTextLeft._width = 390;
         com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextLeft,this._data[0],true);
      }
      if(this.type == 0)
      {
         this.gotoAndStop("mapping");
         this.setText(this.data[1],this.itemTextMid,0);
         this.setText(this.data[2],this.itemTextRight,1);
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
         com.rockstargames.ui.utils.Debug.log("_data[0] " + this._data[0] + " // " + _d + " /// " + this.isLastItem);
         if(this.isLastItem)
         {
            this.highlightMC._height = this.bgMC._height = 25;
         }
         else
         {
            this.bgMC._height = 27;
            this.highlightMC._height = this.bgMC._height - 2;
         }
      }
      else if(this.type == 1)
      {
         this.fadeDn(this.itemTextMid);
      }
      else if(this.type == 2)
      {
         this.fadeDn(this.itemTextRight);
      }
      else if(this.type == 3)
      {
         this.gotoAndStop("defaults");
         this.itemTextMid._visible = false;
         this.itemTextRight._visible = false;
      }
      else if(this.type == 4)
      {
         this.gotoAndStop("header");
         this.itemTextMid._visible = false;
         this.itemTextRight._visible = false;
      }
      this.warningMC._visible = this.initialIndex == 1;
      this.highlighted = this._highlighted;
   }
   function fadeUp(mc)
   {
      mc.valueTF._visible = false;
      mc.valueBorderTF._visible = false;
      mc.icons._visible = false;
      mc.iconsBG._visible = false;
      mc.highlight._alpha = 0;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(mc.highlight,0.35,{_alpha:100,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_IN,onCompleteScope:this,onComplete:this.fadeDn,onCompleteArgs:[mc]});
   }
   function fadeDn(mc)
   {
      mc.valueTF._visible = false;
      mc.valueBorderTF._visible = false;
      mc.icons._visible = false;
      mc.iconsBG._visible = false;
      mc.highlight._alpha = 100;
      mc.bg._visible = true;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(mc.highlight,0.35,{_alpha:0,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT,onCompleteScope:this,onComplete:this.fadeUp,onCompleteArgs:[mc]});
   }
   function fadeStop(mc)
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(mc.highlight);
      mc.highlight._alpha = 100;
      mc.valueTF._visible = true;
      mc.valueBorderTF._visible = true;
      mc.icons._visible = true;
      mc.iconsBG._visible = true;
      mc.bg._visible = false;
   }
   function set highlighted(_h)
   {
      if(this.bgMC)
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
      }
      var _loc3_ = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG;
      var _loc2_ = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG;
      if(this.keyFocus == 1 && _h)
      {
         _loc3_ = !this.checkSelectable() ? com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREY : com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE;
         _loc2_ = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG;
      }
      if(this.keyFocus == 2 && _h)
      {
         _loc3_ = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG;
         _loc2_ = !this.checkSelectable() ? com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREY : com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE;
      }
      if(this.itemTextMid.highlight)
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.itemTextMid.highlight,_loc3_);
      }
      if(this.itemTextRight.highlight)
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.itemTextRight.highlight,_loc2_);
      }
      if(this.checkSelectable())
      {
         this.itemTextLeft._alpha = 100;
         if(this.itemTextMid.icons)
         {
            com.rockstargames.ui.utils.Colour.ApplyHudColour(this.itemTextMid.icons,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PURE_WHITE);
         }
         if(this.itemTextRight.icons)
         {
            com.rockstargames.ui.utils.Colour.ApplyHudColour(this.itemTextRight.icons,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PURE_WHITE);
         }
      }
      else
      {
         this.itemTextLeft._alpha = 40;
         if(this.itemTextMid.icons)
         {
            com.rockstargames.ui.utils.Colour.ApplyHudColour(this.itemTextMid.icons,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREY);
         }
         if(this.itemTextRight.icons)
         {
            com.rockstargames.ui.utils.Colour.ApplyHudColour(this.itemTextRight.icons,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREY);
         }
      }
      this._highlighted = _h;
   }
   function mPress()
   {
      var _loc3_ = this.keyFocus;
      var _loc2_ = this._xmouse;
      this.keyFocus = _loc2_ >= this.itemTextRight._x ? 2 : 1;
      if(this.highlighted && this.keyFocus == _loc3_)
      {
         if(this.checkSelectable())
         {
            this.clickColumn();
         }
      }
      else
      {
         this.configListRef.SET_KEY_CONFIG_COLUMN(this.keyFocus);
         _level0.TIMELINE.M_PRESS_EVENT(this.index,this.columnID,false);
      }
   }
   function focusColumn(colIndex)
   {
      this.keyFocus = colIndex;
   }
   function clickColumn()
   {
      _level0.TIMELINE.M_PRESS_EVENT(this.index,this.columnID,true);
   }
   function get uniqueID()
   {
      if(this.keyFocus == 2)
      {
         return this._uniqueID + 1000;
      }
      return this._uniqueID;
   }
}
