class com.rockstargames.gtav.levelDesign.heists.selectors.MPHeistBoardHeistName extends com.rockstargames.ui.components.GUIMenuItem
{
   var heistNameTF;
   var heistTitleTF;
   var heistNameUnderlineMC;
   var heistDescription;
   var infoTF;
   var teamTF;
   var heistLeaderTF;
   var heistPlayerTF;
   var highlightMC;
   var highlightWidth = 0;
   var emailTopLeft = "";
   var emailTopRight = "";
   var emailBot = "";
   var teamTFShowing = false;
   function MPHeistBoardHeistName()
   {
      super();
   }
   function set data(_d)
   {
      this._data = _d.slice(2);
      var _loc6_ = this._data[0];
      var _loc9_ = this._data[1];
      var _loc4_ = this._data[2];
      var _loc8_ = this._data[3];
      var _loc18_ = this._data[4];
      var _loc16_ = this._data[5];
      var _loc17_ = this._data[6];
      if(_loc6_ != undefined && _loc6_ != "" && _loc6_ != null)
      {
         com.rockstargames.ui.utils.FitToTextfield.scaleText(this.heistNameTF,_loc6_,400,"center",true);
         this.heistNameTF._x = 6;
         this.highlightWidth = this.heistNameTF.textWidth;
         this.adjustHighlightUnderline();
         this._visible = true;
      }
      else
      {
         this._visible = false;
      }
      if(_loc8_ != undefined && _loc8_ != "" && _loc8_ != null)
      {
         this.heistTitleTF.htmlText = _loc8_.toUpperCase();
         com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.heistTitleTF,com.rockstargames.gtav.levelDesign.heists.HeistColours.BLUE);
      }
      this.heistNameUnderlineMC._width = 720 - this.heistNameUnderlineMC._x;
      if(_loc18_ == true)
      {
         if(this.heistDescription != undefined)
         {
            this.heistDescription.removeMovieClip();
         }
         this.heistDescription = this.attachMovie("heistDescription","heistDescription",this.getNextHighestDepth(),{_x:557,_y:0,_rotation:-2});
         this.heistDescription.heistDescEmailHeaderTF._visible = false;
         this.heistDescription.heistDescEmailInfoTF._visible = false;
         this.heistDescription.heistDescTF._visible = false;
         this.heistDescription.eyefindLogo._visible = false;
         if(this.emailTopLeft == "")
         {
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.heistDescription.heistDescEmailHeaderTF,"HEIST_MP_EMAILHEADER",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,true);
            this.emailTopLeft = this.heistDescription.heistDescEmailHeaderTF.htmlText;
         }
         this.heistDescription.heistDescEmailHeaderTF._xscale = 100;
         this.heistDescription.heistDescEmailHeaderTF._yscale = 100;
         this.heistDescription.heistDescEmailHeaderTF.autoSize = "left";
         this.heistDescription.heistDescEmailHeaderTF.wordWrap = true;
         this.heistDescription.heistDescEmailHeaderTF.multiline = true;
         this.heistDescription.heistDescEmailHeaderTF.html = true;
         this.heistDescription.heistDescEmailHeaderTF.htmlText = this.emailTopLeft;
         this.heistDescription.heistDescEmailHeaderTF._width = this.heistDescription.heistDescEmailHeaderTF.textWidth + 8;
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.heistDescription.heistDescEmailInfoTF,"HEIST_MP_LESTERADD",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,true);
         this.emailTopRight = this.stripPtag(this.heistDescription.heistDescEmailInfoTF.htmlText);
         var _loc10_ = " ";
         if(_loc4_ != undefined && _loc4_ != "")
         {
            _loc10_ = _loc4_ + "@eyefind.info";
         }
         var _loc15_ = this.emailTopRight + "<br>" + _loc10_ + "<br>" + _loc6_;
         this.heistDescription.heistDescEmailInfoTF._xscale = 100;
         this.heistDescription.heistDescEmailInfoTF._yscale = 100;
         this.heistDescription.heistDescEmailInfoTF.autoSize = "left";
         this.heistDescription.heistDescEmailInfoTF.wordWrap = true;
         this.heistDescription.heistDescEmailInfoTF.multiline = true;
         this.heistDescription.heistDescEmailInfoTF.html = true;
         this.heistDescription.heistDescEmailInfoTF.htmlText = _loc15_;
         this.heistDescription.heistDescEmailInfoTF._width = this.heistDescription.heistDescEmailInfoTF.textWidth + 8;
         var _loc12_ = this.heistDescription.heistDescEmailHeaderTF._width + this.heistDescription.heistDescEmailInfoTF._width;
         if(_loc12_ > 160)
         {
            var _loc7_ = 160 / _loc12_ * 100;
            this.heistDescription.heistDescEmailHeaderTF._xscale = _loc7_;
            this.heistDescription.heistDescEmailHeaderTF._yscale = _loc7_;
            this.heistDescription.heistDescEmailInfoTF._xscale = _loc7_;
            this.heistDescription.heistDescEmailInfoTF._yscale = _loc7_;
         }
         this.heistDescription.heistDescEmailInfoTF._x = 172 - this.heistDescription.heistDescEmailInfoTF._width;
         var _loc14_ = 30 + Math.max(this.heistDescription.heistDescEmailHeaderTF._height,this.heistDescription.heistDescEmailInfoTF._height);
         this.heistDescription.heistDescTF._y = _loc14_;
         var _loc5_ = 222 - _loc14_;
         if(_loc9_ != "" && _loc9_ != undefined && _loc9_ != null)
         {
            var _loc11_ = "";
            var _loc13_ = " ";
            if(_loc4_ != undefined && _loc4_ != "" && _loc4_ != null)
            {
               com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.heistDescription.heistDescTF,"HEIST_MP_HI",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,true);
               _loc13_ = this.stripPtag(this.heistDescription.heistDescTF.htmlText);
            }
            if(this.emailBot == "")
            {
               com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.heistDescription.heistDescTF,"HEIST_MP_SIG",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,true);
               this.emailBot = this.heistDescription.heistDescTF.htmlText;
            }
            _loc11_ = _loc13_ + " " + _loc4_ + "<br><br>" + _loc9_ + "<br><br>" + this.emailBot;
            var _loc2_ = this.heistDescription.heistDescTF;
            _loc2_.htmlText = _loc11_;
            _loc2_.autoSize = "left";
            _loc2_.wordWrap = true;
            _loc2_.multiline = true;
            _loc2_.html = true;
            var _loc3_ = _loc2_.getNewTextFormat();
            _loc3_.size = 8;
            _loc2_.setTextFormat(_loc3_);
            while(_loc2_.textHeight > _loc5_)
            {
               _loc3_.size = _loc3_.size - 1;
               _loc2_.setTextFormat(_loc3_);
            }
            if(_loc4_ != undefined && _loc4_ != "")
            {
               this.setPlayerName(_loc4_);
            }
            this.heistDescription.eyefindLogo._visible = true;
            this.heistDescription.heistDescTF._visible = true;
            this.heistDescription.heistDescEmailHeaderTF._visible = true;
            this.heistDescription.heistDescEmailInfoTF._visible = true;
            this.heistDescription._visible = true;
         }
         else
         {
            this.heistDescription._visible = false;
         }
         this.heistNameTF._x = 375 - this.heistNameTF._width / 2;
         this.infoTF.text = _loc16_;
         this.infoTF.autoSize = "left";
         this.infoTF._x = 6;
         com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.infoTF,com.rockstargames.gtav.levelDesign.heists.HeistColours.BLUE);
         this.teamTF.text = _loc17_;
         this.teamTF.autoSize = "left";
         this.teamTF._x = 600;
         com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.teamTF,com.rockstargames.gtav.levelDesign.heists.HeistColours.BLUE);
         this.teamTF._visible = this.teamTFShowing;
         com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.heistLeaderTF,com.rockstargames.gtav.levelDesign.heists.HeistColours.BLUE);
         com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.heistPlayerTF,com.rockstargames.gtav.levelDesign.heists.HeistColours.BLUE);
      }
   }
   function setPlayerName(_playerName)
   {
      if(_playerName != "" && _playerName != undefined)
      {
         var _loc2_ = _playerName + "@eyefind.info";
         com.rockstargames.ui.utils.FitToTextfield.scaleText(this.heistDescription.heistDescPlayerTF,_loc2_,164,"left",true);
      }
   }
   function stripPtag(str)
   {
      return str.split("<P ALIGN=\"LEFT\">").join("").split("</P>").join("");
   }
   function set labels(_l)
   {
   }
   function set highlighted(_h)
   {
      if(_h && this.highlightMC.underlineMC._visible == false)
      {
         this.adjustHighlightUnderline();
         this.highlightMC.underlineMC._visible == true;
      }
      this.highlightMC.underlineMC._visible = _h;
      if(!_h)
      {
         this.highlightMC.arrowLeft._visible = false;
         this.highlightMC.arrowRight._visible = false;
         this.highlightMC.underlineMC._visible == false;
         com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.heistNameTF,com.rockstargames.gtav.levelDesign.heists.HeistColours.BLUE);
      }
      else
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.heistNameTF,com.rockstargames.gtav.levelDesign.heists.HeistColours.BLUE);
      }
      this._highlighted = _h;
   }
   function adjustHighlightUnderline()
   {
      this.highlightMC._x = this.heistNameTF._x + this.highlightWidth / 2;
      this.highlightMC.underlineMC._width = this.highlightWidth;
      this.highlightMC.arrowLeft._x = - this.highlightWidth / 2;
      this.highlightMC.arrowRight._x = this.highlightWidth / 2;
   }
   function subHighlight(_subItemIndex, leftArrowVis, rightArrowVis)
   {
      if(_subItemIndex == undefined)
      {
         return undefined;
      }
      if(leftArrowVis == undefined)
      {
         leftArrowVis = 0;
      }
      if(rightArrowVis == undefined)
      {
         rightArrowVis = 0;
      }
      this.highlightMC.arrowLeft._visible = Boolean(leftArrowVis);
      this.highlightMC.arrowRight._visible = Boolean(rightArrowVis);
   }
   function stepVal(dir)
   {
   }
   function showTeamTF()
   {
      this.teamTFShowing = true;
      this.teamTF._visible = true;
   }
}
