class com.rockstargames.gtav.levelDesign.heists.selectors.MPHeistBoardCrewMember extends com.rockstargames.ui.components.GUIMenuItem
{
   var _visible;
   var bgMC;
   var codenameTF;
   var cutCashTF;
   var cutPercentTF;
   var headsetMC;
   var highlightMC0;
   var highlightMC1;
   var highlightMC4;
   var highlightMC5;
   var highlightMC6;
   var imgLdr;
   var nameTF;
   var picMC;
   var playerNumber;
   var rankMC;
   var roleIconMC;
   var roleTF;
   var statusIconMC;
   var statusTF;
   var subMC;
   var teamNumberTF;
   var prevTxd = "nothing";
   function MPHeistBoardCrewMember()
   {
      super();
      _global.gfxExtensions = true;
      this.highlighted = false;
   }
   function set data(_d)
   {
      this._data = _d;
      if(this._data[0] != undefined)
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.teamNumberTF,com.rockstargames.gtav.levelDesign.heists.HeistColours.BLUE);
         this.teamNumberTF.text = this._data[0] + 1;
         this.picMC.gotoAndStop(this._data[0] + 1);
         this.playerNumber = this._data[0];
      }
      var _loc7_;
      var _loc2_;
      var _loc8_;
      var _loc10_;
      var _loc5_;
      var _loc11_;
      var _loc9_;
      var _loc3_;
      var _loc6_;
      var _loc4_;
      if(this._data[2] != undefined && this._data[2] != "")
      {
         com.rockstargames.ui.utils.FitToTextfield.scaleText(this.nameTF,this._data[2],120,"left",true);
         this.nameTF.autoSize = "left";
         this.nameTF.html = true;
         this.nameTF.htmlText = this._data[2];
         com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.nameTF,com.rockstargames.gtav.levelDesign.heists.HeistColours.BLUE);
         if(this.nameTF.textWidth > 120)
         {
            _loc7_ = 100 * (120 / this.nameTF.textWidth);
            this.nameTF._xscale = _loc7_ - 15;
         }
         this.headsetMC._x = this.nameTF._x + this.nameTF.textWidth + 6;
         this.headsetMC.gotoAndStop("EMPTY");
         this._visible = true;
         this.updateHighlightWidth(this.highlightMC5,this.nameTF);
         if(this._data[3] != undefined)
         {
            if(this._data[3] < 1000)
            {
               this.rankMC.rankTF.text = this._data[3];
               this.rankMC.rankTF4digits.text = "";
            }
            else
            {
               this.rankMC.rankTF4digits.text = this._data[3];
               this.rankMC.rankTF.text = "";
            }
            this.rankMC._visible = true;
         }
         else
         {
            this.rankMC._visible = false;
         }
         _loc2_ = this._data[4];
         if(typeof _loc2_ != "string")
         {
            _loc2_;
         }
         _loc8_ = _loc2_;
         if(_loc2_ != undefined && _loc2_ != "")
         {
            if(this.prevTxd != _loc2_)
            {
               this.prevTxd = _loc2_;
               if(this.imgLdr != undefined)
               {
                  if(this.imgLdr.isLoaded && this.imgLdr.textureDict != _loc2_)
                  {
                     this.imgLdr.removeTxdRef();
                  }
                  this.imgLdr.removeMovieClip();
               }
               this.imgLdr = com.rockstargames.ui.media.ImageLoaderMC(this.picMC.attachMovie("GenericImageLoader","imgLdr",this.picMC.getNextHighestDepth()));
               _loc10_ = true;
               _loc5_ = 0;
               if(_loc2_.substr(0,5) == "CHAR_")
               {
                  _loc5_ = 1;
               }
               this.imgLdr._alpha = 0;
               _loc11_ = "HEIST_MP";
               this.imgLdr.init(_loc11_,_loc2_,_loc8_,52,52,0,0);
               _loc9_ = 4;
               _loc3_ = String(this.imgLdr).split(".");
               _loc6_ = _loc3_.slice(_loc3_.length - _loc9_).join(".");
               if(_loc5_ == 0)
               {
                  this.imgLdr.addTxdRef(_loc6_,this.showPedHead,this);
               }
               else
               {
                  this.imgLdr.requestTxdRef(_loc6_,_loc10_,this.showPedHead,this);
               }
            }
         }
         else
         {
            if(this.imgLdr != undefined)
            {
               if(this.imgLdr.isLoaded)
               {
                  this.imgLdr.removeTxdRef();
               }
               this.imgLdr.removeMovieClip();
            }
            this.prevTxd = "nothing";
         }
         _loc4_ = "";
         if(this._data[14] != undefined && this._data[14] != 0)
         {
            _loc4_ = " (" + this._data[14] + ")";
         }
         if(this._data[5] != undefined)
         {
            com.rockstargames.ui.utils.FitToTextfield.scaleText(this.roleTF,this._data[5] + _loc4_,100,"left",true);
            if(this._data[16])
            {
               com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.roleTF,com.rockstargames.gtav.levelDesign.heists.HeistColours.RED);
            }
            else
            {
               com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.roleTF,com.rockstargames.gtav.levelDesign.heists.HeistColours.BLUE);
            }
            this.updateHighlightWidth(this.highlightMC0,this.roleTF);
         }
         else
         {
            this.roleTF.htmlText = "";
         }
         if(this._data[6] != undefined)
         {
            if(this._data[6] == 0)
            {
               this.roleIconMC._visible = false;
            }
            else
            {
               this.roleIconMC.gotoAndStop(this._data[6] + 1);
               this.roleIconMC._visible = true;
            }
         }
         else
         {
            this.roleIconMC._visible = false;
         }
         if(this._data[7] != undefined)
         {
            this.statusTF.autoSize = "left";
            this.statusTF.html = true;
            this.statusTF.htmlText = this._data[7];
            if(this.statusTF.textWidth > 110)
            {
               _loc7_ = 100 * (110 / this.statusTF.textWidth);
               this.statusTF._xscale = _loc7_ - 15;
            }
            this.updateHighlightWidth(this.highlightMC4,this.statusTF);
         }
         else
         {
            this.statusTF.htmlText = "";
         }
         if(this._data[8] != undefined)
         {
            this.statusIconMC.gotoAndStop(this._data[8] + 1);
            com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.statusTF,this._data[8] != 6 ? com.rockstargames.gtav.levelDesign.heists.HeistColours.RED : com.rockstargames.gtav.levelDesign.heists.HeistColours.GREEN);
         }
         else
         {
            this.statusIconMC.gotoAndStop(1);
            com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.statusTF,com.rockstargames.gtav.levelDesign.heists.HeistColours.BLUE);
         }
         if(this._data[9] != undefined)
         {
            this.cutCashTF.text = this.formatAmount(this._data[9]);
            com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.cutCashTF,com.rockstargames.gtav.levelDesign.heists.HeistColours.BLUE);
            this.cutCashTF.textAutoSize = "shrink";
         }
         else
         {
            this.cutCashTF.text = "";
         }
         if(this._data[10] != undefined)
         {
            this.cutPercentTF.text = this._data[10] + "%";
            com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.cutPercentTF,com.rockstargames.gtav.levelDesign.heists.HeistColours.BLUE);
            this.cutPercentTF.textAutoSize = "shrink";
            this.updateHighlightWidth(this.highlightMC1,this.cutPercentTF);
         }
         else
         {
            this.cutPercentTF.text = "";
         }
         if(this._data[12] != undefined)
         {
            com.rockstargames.ui.utils.FitToTextfield.scaleText(this.codenameTF,this._data[12],100,"left",true);
            com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.codenameTF,com.rockstargames.gtav.levelDesign.heists.HeistColours.BLUE);
            this.updateHighlightWidth(this.highlightMC6,this.codenameTF);
         }
         else
         {
            this.codenameTF.htmlText = "";
         }
         this.setHeadsetIcon(this._data[15]);
         return this.data;
      }
      this.nameTF.htmlText = "";
      this.nameTF._xscale = 100;
      this._visible = false;
      if(this.imgLdr != undefined)
      {
         if(this.imgLdr.isLoaded == true)
         {
            this.imgLdr.removeTxdRef();
         }
         this.imgLdr.removeMovieClip();
      }
      this.prevTxd = "nothing";
      return undefined;
   }
   function showPedHead()
   {
      this.imgLdr._alpha = 100;
   }
   function setHeadsetIcon(iconEnum)
   {
      switch(iconEnum)
      {
         case 47:
            this.headsetMC.gotoAndStop("ACTIVE_HEADSET");
            return;
         case 48:
            this.headsetMC.gotoAndStop("INACTIVE_HEADSET");
            return;
         case 49:
            this.headsetMC.gotoAndStop("MUTED_HEADSET");
            return;
         default:
            this.headsetMC.gotoAndStop("EMPTY");
            return;
      }
   }
   function formatAmount(value)
   {
      var _loc2_ = "$";
      var _loc3_ = value.toString().length;
      var _loc4_ = ",";
      var _loc1_ = 0;
      while(_loc1_ < _loc3_)
      {
         if((_loc3_ - _loc1_) % 3 == 0 && _loc1_ != 0)
         {
            _loc2_ += _loc4_;
         }
         _loc2_ += value.toString().charAt(_loc1_);
         _loc1_ = _loc1_ + 1;
      }
      return _loc2_;
   }
   function subHighlight(_subItemIndex, leftArrowVis, rightArrowVis)
   {
      var _loc2_ = 0;
      while(_loc2_ < 7)
      {
         if(_subItemIndex != _loc2_ || _subItemIndex == 99 || _subItemIndex == undefined)
         {
            this["highlightMC" + _loc2_]._visible = false;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(_subItemIndex == undefined || _subItemIndex == 99)
      {
         this.highlightMC0._visible = false;
         this.highlightMC1._visible = false;
         this.highlightMC4._visible = false;
         this.highlightMC5._visible = false;
         this.highlightMC6._visible = false;
         return undefined;
      }
      this.subMC = this["highlightMC" + _subItemIndex];
      var _loc4_;
      switch(_subItemIndex)
      {
         case 0:
            _loc4_ = this.roleTF;
            break;
         case 1:
            _loc4_ = this.cutPercentTF;
            break;
         case 4:
            _loc4_ = this.statusTF;
            break;
         case 5:
            _loc4_ = this.nameTF;
            break;
         case 6:
            _loc4_ = this.codenameTF;
      }
      this.updateHighlightWidth(this.subMC,_loc4_);
      this.subMC.arrowLeft._visible = Boolean(leftArrowVis);
      this.subMC.arrowRight._visible = Boolean(rightArrowVis);
      this.subMC._visible = true;
   }
   function set highlighted(_h)
   {
      if(_h == undefined)
      {
         _h = false;
      }
      this.bgMC.gotoAndStop(!_h ? 1 : 2);
      if(_h == false)
      {
         this.subHighlight();
      }
      this._highlighted = _h;
   }
   function updateHighlightWidth(MC, TF)
   {
      var _loc1_ = TF.textWidth;
      if(TF.autosize != "center")
      {
         MC._x = TF._x + _loc1_ / 2;
      }
      else
      {
         MC._x = TF._x + TF._width / 2;
      }
      MC.underlineMC._width = _loc1_;
      MC.arrowLeft._x = - _loc1_ / 2;
      MC.arrowRight._x = _loc1_ / 2;
   }
}
