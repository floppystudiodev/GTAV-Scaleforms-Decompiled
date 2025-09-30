class com.rockstargames.gtav.levelDesign.heists.selectors.HeistEndScreenPieChart extends com.rockstargames.ui.components.GUIMenuItem
{
   var cashTF;
   var percent1;
   var percent2;
   var percent3;
   var percent4;
   var pie1;
   var pie2;
   var pie3;
   var pie4;
   var playerCutTF;
   var redRGB = 12734544;
   var blueRGB = 2582162;
   function HeistEndScreenPieChart()
   {
      super();
   }
   function set data(_d)
   {
      this._data = _d.slice(2);
      if(this._data[0] != undefined)
      {
         this.cashTF.textColor = this.blueRGB;
         this.cashTF.htmlText = "$" + this._data[0];
         this.cashTF.autoSize = "center";
         this.cashTF.wordWrap = false;
         this.clampText(this.cashTF,150);
      }
      if(this._data[1] != undefined)
      {
         this.playerCutTF.textColor = this.redRGB;
         this.playerCutTF.htmlText = "$" + this._data[1];
         this.playerCutTF.autoSize = "center";
         this.playerCutTF.wordWrap = false;
         this.clampText(this.playerCutTF,150);
      }
      if(this._data[2] != undefined)
      {
         this.percent1 = this._data[2];
      }
      else
      {
         this.percent1 = 0;
      }
      if(this._data[3] != undefined)
      {
         this.percent2 = this._data[3];
      }
      else
      {
         this.percent2 = 0;
      }
      if(this._data[4] != undefined)
      {
         this.percent3 = this._data[4];
      }
      else
      {
         this.percent3 = 0;
      }
      if(this._data[5] != undefined)
      {
         this.percent4 = this._data[5];
      }
      else
      {
         this.percent4 = 0;
      }
      this.drawArc(this.pie1,0,this.percent1,1,43,113,163,20);
      this.drawArc(this.pie2,this.percent1,this.percent2,2,43,113,163,45);
      this.drawArc(this.pie3,this.percent1 + this.percent2,this.percent3,3,43,113,163,70);
      this.drawArc(this.pie4,this.percent1 + this.percent2 + this.percent3,this.percent4,4,43,113,163,100);
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
   function drawArc(pieMC, rotation, percent, pieNumber, _r, _g, _b, _a)
   {
      if(percent != undefined && percent != 0)
      {
         pieMC.pieSlices._rotation = rotation * 3.6;
         pieMC.pieSlices.gotoAndStop(percent);
         pieMC.pieNumberMC._rotation = pieMC.pieSlices._rotation + percent / 2 * 3.6;
         pieMC.pieNumberMC.pieNumber._rotation = - (pieMC.pieSlices._rotation + percent / 2 * 3.6);
         pieMC.pieLineMC._rotation = rotation * 3.6;
         pieMC.pieNumberMC.pieNumber.numberTF.textColor = 16777215;
         pieMC.pieNumberMC.pieNumber.numberTF.htmlText = pieNumber;
         pieMC.pieNumberMC.pieNumber._alpha = 60;
         com.rockstargames.ui.utils.Colour.Colourise(pieMC.pieSlices,_r,_g,_b,_a);
         pieMC.pieLineMC.pieNumber._alpha = 60;
      }
      else
      {
         pieMC.pieSlices._alpha = 0;
         pieMC.pieNumberMC.pieNumber._alpha = 0;
         pieMC.pieLineMC._alpha = 0;
      }
   }
   function set labels(_l)
   {
   }
   function set highlighted(_h)
   {
      this._highlighted = _h;
   }
}
