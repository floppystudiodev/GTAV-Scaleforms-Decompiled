class com.rockstargames.gtav.levelDesign.TaxiDestination extends com.rockstargames.ui.components.GUIMenuItem
{
   var addr1MC;
   var addr1TF;
   var addr2MC;
   var addr2TF;
   var allBlips;
   var attachMovie;
   var b;
   var blipList;
   var blipMC;
   var blipName;
   var g;
   var getNextHighestDepth;
   var missionName;
   var r;
   function TaxiDestination()
   {
      super();
      this.allBlips = new com.rockstargames.gtav.constants.Blips();
      this.blipList = this.allBlips.getListOfBlips();
      this.blipName = this.missionName.txtString;
      this.addr1TF = this.addr1MC.txtString;
      this.addr2TF = this.addr2MC.txtString;
      this.blipName.html = this.addr1TF.html = this.addr2TF.html = true;
   }
   function set data(_d)
   {
      this._data = _d;
      var _loc5_ = this._data[0];
      this.r = this._data[1];
      this.g = this._data[2];
      this.b = this._data[3];
      var _loc3_ = this._data[4];
      var _loc7_ = this._data[5];
      var _loc6_ = this._data[6];
      var _loc4_ = this._data[7] == undefined ? false : this._data[7];
      this.blipName.htmlText = (!_loc4_ ? "<font size = \'12\'>" : "<font size = \'10\'>") + _loc3_.toUpperCase();
      this.addr1TF.htmlText = _loc7_.toUpperCase();
      this.addr2TF.htmlText = _loc6_.toUpperCase();
      this.blipName.textColor = this.addr1TF.textColor = this.addr2TF.textColor = 16724736;
      if(this.blipMC != undefined)
      {
         this.blipMC.removeMovieClip();
      }
      var _loc2_ = 18;
      this.blipMC = this.attachMovie(this.blipList[_loc5_],"currentBlip",this.getNextHighestDepth(),{_x:4 + Math.round(_loc2_ / 2),_y:5.5 + Math.round(_loc2_ / 2),_width:_loc2_,_height:_loc2_});
      com.rockstargames.ui.utils.Colour.Colourise(this.blipMC,this.r,this.g,this.b,75);
   }
   function set highlighted(_h)
   {
      this._highlighted = _h;
   }
}
