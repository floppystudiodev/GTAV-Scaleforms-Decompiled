class com.rockstargames.gtav.levelDesign.heists.selectors.MPHeistBoardpieChart extends com.rockstargames.ui.components.GUIMenuItem
{
   var cashTF;
   var percentArray;
   var pie5;
   var theTakeTF;
   var totalCashTF;
   function MPHeistBoardpieChart()
   {
      super();
      this.percentArray = new Array();
   }
   function set data(_d)
   {
      this._data = _d.slice(2);
      if(this._data[0] != undefined)
      {
         this.cashTF.text = "";
         this.cashTF._xscale = 100;
         this.cashTF._x = -50;
         com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.cashTF,com.rockstargames.gtav.levelDesign.heists.HeistColours.BLUE);
         this.cashTF.htmlText = this.formatAmount(this._data[0]);
         this.cashTF.autoSize = "center";
         this.cashTF.wordWrap = false;
         this.clampText(this.cashTF,130);
      }
      else
      {
         this._data[11] = undefined;
         this.cashTF.text = "";
      }
      var _loc5_ = 0;
      var _loc2_ = 0;
      var _loc3_;
      var _loc4_;
      while(_loc2_ <= 4)
      {
         _loc3_ = this._data[_loc2_ + 1] == undefined ? 0 : this._data[_loc2_ + 1];
         _loc4_ = this["pie" + (_loc2_ + 1)];
         this.drawArc(_loc4_,_loc5_,_loc3_,_loc2_ + 1);
         _loc5_ += _loc3_;
         _loc2_ = _loc2_ + 1;
      }
      if(_loc3_ > 0)
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.pie5.pieSlices,com.rockstargames.gtav.levelDesign.heists.HeistColours.LIGHT_BLUE);
         this.pie5.pieSlices._alpha = 80;
         this.pie5.pieSlices._visible = true;
      }
      else
      {
         this.pie5.pieSlices._visible = false;
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
   function clampText(obj, maxVal)
   {
      if(obj._width > maxVal)
      {
         obj._xscale = maxVal / obj._width * 100;
      }
      else
      {
         obj._xscale = 100;
      }
      obj._x = - obj._width / 2;
   }
   function drawArc(pieMC, rotation, percent, pieNumber)
   {
      if(percent != undefined && percent != 0)
      {
         pieMC.pieSlices._rotation = rotation * 3.6;
         pieMC.pieSlices.gotoAndStop(percent);
         pieMC.pieNumberMC._rotation = pieMC.pieSlices._rotation + percent / 2 * 3.6;
         pieMC.pieNumberMC.pieNumber._rotation = - (pieMC.pieSlices._rotation + percent / 2 * 3.6);
         pieMC.pieLineMC._rotation = (rotation + percent) * 3.6;
         com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(pieMC.pieNumberMC.pieNumber.numberTF,com.rockstargames.gtav.levelDesign.heists.HeistColours.BLUE);
         if(pieNumber <= 4)
         {
            pieMC.pieNumberMC.pieNumber.numberTF.htmlText = pieNumber;
            pieMC.pieNumberMC.pieNumber._alpha = 100;
         }
         if(pieNumber > 8)
         {
            pieMC.pieNumberMC.pieNumber._visible = false;
         }
         pieMC.pieNumberMC.pieNumber._alpha = 100;
         pieMC.pieLineMC._alpha = 100;
      }
      else
      {
         pieMC.pieSlices._visible = false;
         pieMC.pieNumberMC.pieNumber._alpha = 0;
         pieMC.pieLineMC._alpha = 0;
      }
   }
   function set labels(_l)
   {
      this.totalCashTF.htmlText = _l[4];
      this.totalCashTF.textAutoSize = "shrink";
      this.totalCashTF.wordWrap = false;
      com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.totalCashTF,com.rockstargames.gtav.levelDesign.heists.HeistColours.BLUE);
      this.theTakeTF.htmlText = _l[2];
      this.totalCashTF.textAutoSize = "shrink";
      this.totalCashTF.wordWrap = false;
      com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.theTakeTF,com.rockstargames.gtav.levelDesign.heists.HeistColours.BLUE);
   }
   function subHighlight(_subItemIndex)
   {
      var _loc2_ = 1;
      var _loc3_;
      while(_loc2_ <= 4)
      {
         _loc3_ = this["pie" + _loc2_];
         _loc3_.pieSlices._visible = false;
         _loc2_ = _loc2_ + 1;
      }
      if(_subItemIndex != undefined)
      {
         _loc3_ = this["pie" + (_subItemIndex + 1)];
         _loc3_.pieSlices._visible = true;
         if(_subItemIndex < 5)
         {
            com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc3_.pieSlices,com.rockstargames.gtav.levelDesign.heists.HeistColours.GREEN);
            _loc3_.pieSlices._alpha = 80;
         }
      }
   }
   function set highlighted(_h)
   {
      this._highlighted = _h;
   }
}
