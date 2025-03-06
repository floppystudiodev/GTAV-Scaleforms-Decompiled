class com.rockstargames.gtav.levelDesign.MissionCompleteItem extends com.rockstargames.ui.components.GUIMenuItem
{
   var innerMC;
   var _data;
   var id;
   var _alpha;
   var bgMC;
   var _highlighted;
   function MissionCompleteItem()
   {
      super();
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.innerMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
   }
   function set data(_d)
   {
      this._data = _d;
      this.innerMC.completeMC._visible = true;
      switch(this._data[0])
      {
         case -1:
            this.innerMC.completeMC.gotoAndStop(3);
            this.innerMC.completeMC._visible = false;
            this.innerMC.itemTextRight._x = 169;
            break;
         case 0:
            this.innerMC.completeMC.gotoAndStop(1);
            this.innerMC.itemTextRight._x = 146;
            break;
         case 1:
            this.innerMC.completeMC.gotoAndStop(2);
            this.innerMC.itemTextRight._x = 146;
      }
      this.id = _d[1];
      var _loc2_ = "";
      var _loc9_ = this._data[this._data.length - 1];
      this.innerMC._alpha = 100;
      switch(this.id)
      {
         case 0:
            this._alpha = 50;
            break;
         case 1:
         case 2:
            _loc2_ = this._data[this._data.length - 2];
            break;
         case 3:
            _loc2_ = com.rockstargames.ui.utils.MathStar.toFixedRound(this._data[this._data.length - 2],2) + "%";
            break;
         case 4:
            var _loc4_ = this._data[this._data.length - 3];
            var _loc6_ = String(_loc4_);
            if(_loc4_ < 10)
            {
               _loc6_ = "0" + _loc4_;
            }
            var _loc5_ = this._data[this._data.length - 2];
            var _loc7_ = String(_loc5_);
            if(_loc5_ < 10)
            {
               _loc7_ = "0" + _loc5_;
            }
            _loc2_ = _loc6_ + ":" + _loc7_;
            break;
         case 5:
            _loc2_ = this._data[this._data.length - 3] + "/" + this._data[this._data.length - 2];
            break;
         case 6:
            _loc2_ = "$" + this._data[this._data.length - 2];
            break;
         case 7:
            this.innerMC.completeMC._visible = false;
            break;
         case 8:
            _loc2_ = this._data[this._data.length - 2];
            this.innerMC.itemTextRight._x = 138;
            this.innerMC.completeMC._visible = false;
            break;
         case 9:
         case 10:
            _loc2_ = this._data[this._data.length - 2];
            this.innerMC.itemTextRight._x = 138;
      }
      var _loc3_ = _loc9_.split("<br/>");
      com.rockstargames.ui.utils.UIText.setSizedText(this.innerMC.itemTextLeft,_loc3_[0],true,false);
      var _loc8_ = _loc3_.length > 1;
      com.rockstargames.ui.utils.UIText.setDescText(this.innerMC.descTF,!_loc8_ ? "" : _loc3_[1],true);
      this.bgMC._height = !_loc8_ ? 25 : this.innerMC.descTF._y + this.innerMC.descTF.textHeight + 5;
      com.rockstargames.ui.utils.UIText.setSizedText(this.innerMC.itemTextRight,_loc2_,false,false,0,13);
      if(this.id == 10)
      {
         this.innerMC.completeMC._x = this.innerMC.itemTextRight._x - 20;
      }
   }
   function set highlighted(_h)
   {
      this._highlighted = _h;
      if(this._highlighted)
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.innerMC,0,0,0);
         com.rockstargames.ui.utils.Colour.Colourise(this.bgMC,220,220,220);
         this.bgMC._alpha = 100;
      }
      else
      {
         if(this.id == 0)
         {
            com.rockstargames.ui.utils.Colour.Colourise(this.innerMC,100,100,100);
         }
         else
         {
            com.rockstargames.ui.utils.Colour.Colourise(this.innerMC,220,220,220);
         }
         this.bgMC._alpha = 0;
      }
   }
}
