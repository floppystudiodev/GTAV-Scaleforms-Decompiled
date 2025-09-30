class com.rockstargames.gtav.Multiplayer.MIDSIZED_MESSAGE extends com.rockstargames.ui.core.BaseScreenLayout
{
   var BOUNDING_BOX;
   var BigMessageMaster;
   var CONTENT;
   var TIMELINE;
   var _width;
   function MIDSIZED_MESSAGE()
   {
      super();
      _global.gfxExtensions = true;
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
   }
   function SHOW_MIDSIZED_MESSAGE(title, description)
   {
      this.CONTENT.removeMovieClip();
      this.BOUNDING_BOX.removeMovieClip();
      this.INITIALISE(this.TIMELINE);
      if(title != undefined)
      {
         this.CONTENT.MASTER_SCREEN.TITLE.textAutoSize = this.CONTENT.MASTER_SCREEN.TITLE_OUTLINE.textAutoSize = "shrink";
         this.CONTENT.MASTER_SCREEN.TITLE.htmlText = this.CONTENT.MASTER_SCREEN.TITLE_OUTLINE.htmlText = title;
         this.CONTENT.MASTER_SCREEN.TITLE_OUTLINE.textColor = 0;
         this.CONTENT.MASTER_SCREEN.TITLE_OUTLINE.outline = 14;
      }
      if(description != undefined)
      {
         this.CONTENT.MASTER_SCREEN.DESCRIPTION.htmlText = description;
         this.CONTENT.MASTER_SCREEN.DESCRIPTION_BLACK.htmlText = description;
      }
      this.CONTENT._visible = true;
   }
   function SHOW_BRIDGES_KNIVES_PROGRESS(title, totalToDo, message, info, completed)
   {
      var _loc2_ = String(completed) + " / " + String(totalToDo) + " " + info;
      this.SHOW_SHARD_MIDSIZED_MESSAGE(title,_loc2_);
   }
   function SHOW_COND_SHARD_MESSAGE(bigText, msgText, colID, useDarkerShard)
   {
      this.SHOW_SHARD_MIDSIZED_MESSAGE(bigText,msgText,colID,useDarkerShard,true);
   }
   function SHOW_SHARD_MIDSIZED_MESSAGE(bigText, msgText, colID, useDarkerShard, useCondensedShard)
   {
      if(this.BigMessageMaster != undefined)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.BigMessageMaster);
         this.BigMessageMaster.removeMovieClip();
      }
      var _loc8_ = 100;
      var _loc12_;
      switch(true)
      {
         case useCondensedShard && useDarkerShard:
            _loc12_ = "SHARD_MESSAGE_DARK_FONT2COND";
            break;
         case !useCondensedShard && useDarkerShard:
            _loc12_ = "SHARD_MESSAGE_DARK";
            break;
         case useCondensedShard && !useDarkerShard:
            _loc12_ = "SHARD_MESSAGE_FONT2COND";
            break;
         default:
            _loc12_ = "SHARD_MESSAGE";
      }
      this.BigMessageMaster = this.TIMELINE.attachMovie(_loc12_,!useCondensedShard ? "SHARD_MESSAGE" : "SHARD_MESSAGE",_loc8_,{_x:640});
      this.SHARD_SET_TEXT(bigText,msgText,useCondensedShard);
      var _loc10_ = 30;
      var _loc7_ = !useCondensedShard ? 0 : 4;
      this.BigMessageMaster.bgMC._y = this.BigMessageMaster.textHolderMC._y + this.BigMessageMaster.textHolderMC._height / 2 + _loc7_;
      this.BigMessageMaster.bgMC._height = this.BigMessageMaster.textHolderMC._height + _loc10_ * 2;
      if(colID == undefined)
      {
         colID = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK;
      }
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.BigMessageMaster.bgMC,colID);
      this.CONTENT._visible = false;
      var _loc3_ = false;
      var _loc2_ = 0;
      while(_loc2_ < bigText.length)
      {
         if(bigText.charCodeAt(_loc2_) > 11263)
         {
            _loc3_ = true;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(!_loc3_)
      {
         _loc2_ = 0;
         while(_loc2_ < msgText.length)
         {
            if(msgText.charCodeAt(_loc2_) > 11263)
            {
               _loc3_ = true;
               break;
            }
            _loc2_ = _loc2_ + 1;
         }
      }
      if(_loc3_)
      {
         this.BigMessageMaster.textHolderMC.titleMC.BIG_TEXT._y -= 3;
         this.BigMessageMaster.textHolderMC.MESSAGE_TEXT._y += 3;
      }
   }
   function SHARD_SET_TEXT(bigText, msgText, useCondensedShard)
   {
      var _loc2_ = this.BigMessageMaster.textHolderMC.titleMC.BIG_TEXT;
      var _loc3_ = this.BigMessageMaster.textHolderMC.MESSAGE_TEXT;
      var _loc4_;
      if(bigText == "")
      {
         _loc2_._visible = false;
      }
      else
      {
         if(useCondensedShard)
         {
            _loc4_ = _loc2_._width;
            _loc2_.autoSize = "center";
            _loc2_.htmlText = "<font color=\'#FFFFFF\'>" + bigText.toUpperCase() + "</font>";
         }
         else
         {
            _loc2_.textAutoSize = "shrink";
            _loc2_.htmlText = "<font color=\'#FFFFFF\'>" + bigText + "</font>";
         }
         _loc2_._visible = true;
      }
      if(msgText == "" || msgText == undefined)
      {
         _loc3_._visible = false;
         _loc3_._y = 0;
      }
      else
      {
         _loc3_.htmlText = this.parseForGamerTagTitleFonts(_loc3_,msgText,!useCondensedShard ? 15 : 18);
         _loc3_.multiline = true;
         _loc3_.wordWrap = true;
         _loc3_.autoSize = true;
         if(_loc2_._visible == true)
         {
            if(useCondensedShard)
            {
               if(_loc2_._width > _loc4_)
               {
                  _loc2_._xscale = _loc2_._yscale = 100 * _loc4_ / _loc2_._width;
                  _loc2_._x = -0.5 * _loc2_._width;
               }
               _loc3_._y = _loc2_._height - 4;
            }
            else
            {
               _loc3_._y = _loc2_.textHeight;
            }
         }
         _loc3_._visible = true;
         _loc3_._alpha = 0;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc3_,0.35,{_alpha:100});
      }
   }
   function SHARD_ANIM_OUT(colID, animTime)
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.BigMessageMaster);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.BigMessageMaster.textHolderMC.MESSAGE_TEXT);
      this.BigMessageMaster._y = 0;
      this.BigMessageMaster._alpha = 100;
      if(animTime == undefined)
      {
         animTime = 0.33;
      }
      if(colID == undefined)
      {
         colID = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK;
      }
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.BigMessageMaster.bgMC,colID);
      var _loc3_ = - this.BigMessageMaster.textHolderMC._y;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.BigMessageMaster,animTime,{ease:com.rockstargames.ui.tweenStar.Ease.CUBIC_INOUT,_y:_loc3_,_alpha:0});
   }
   function parseForGamerTagTitleFonts(tf, str, stdPtSize)
   {
      var _loc4_ = str.indexOf("<C>");
      var _loc3_;
      var _loc5_;
      var _loc8_;
      var _loc6_;
      var _loc7_;
      if(_loc4_ != -1)
      {
         _loc3_ = str.indexOf("</C>");
         if(_loc3_ != -1)
         {
            _loc5_ = str.substring(_loc4_ + 3,_loc3_);
            _loc8_ = this.getFontSizeFit(_loc5_,stdPtSize + 3,tf._width);
            _loc6_ = "<FONT FACE=\'$Font2_cond\' SIZE=\'" + _loc8_ + "\'>";
            _loc7_ = "<FONT FACE=\'$Font2\' SIZE=\'" + stdPtSize + "\'>";
            str = str.split("<C>").join(_loc6_).split("</C>").join(_loc7_);
         }
      }
      return str;
   }
   function getFontSizeFit(gamerName, fontSize, widthToFit)
   {
      var _loc2_ = new TextFormat("$Font2_cond");
      do
      {
         _loc2_.size = fontSize;
         var tfExtent = _loc2_.getTextExtent(gamerName,this._width);
      }
      while(tfExtent.textFieldWidth > widthToFit && (fontSize = fontSize - 1));
      
      return fontSize;
   }
}
