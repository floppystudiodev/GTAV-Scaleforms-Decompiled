class com.rockstargames.gtav.levelDesign.heists.selectors.MPHeistBoardPreiviews extends com.rockstargames.ui.components.GUIMenuItem
{
   var imageRotation;
   var rotationArray;
   var tapeArray;
   var mcArray;
   var completedStr = "";
   var todoStr = "";
   function MPHeistBoardPreiviews()
   {
      super();
      this.imageRotation = new Array(-1,-0.5,0,0.5,1);
      var _loc3_ = this.randRange(0,4);
      var _loc4_ = this.randRange(0,4,_loc3_);
      this.rotationArray = new Array(_loc3_,_loc4_);
      this.tapeArray = new Array();
      this.tapeArray[0] = this.randRange(1,9);
      this.tapeArray[1] = this.randRange(1,9,this.tapeArray[0]);
      this.mcArray = new Array("gearMC","outfitMC");
   }
   function randRange(min, max, exclude)
   {
      if(exclude == undefined)
      {
         exclude = max + 1;
      }
      var _loc1_ = Math.floor(Math.random() * (max - min + 1)) + min;
      while(_loc1_ == exclude)
      {
         _loc1_ = Math.floor(Math.random() * (max - min + 1)) + min;
      }
      return _loc1_;
   }
   function set data(_d)
   {
      this._data = _d.slice(2);
      if(this._data[0] != undefined)
      {
         var _loc10_ = 180;
         var _loc9_ = 0;
         var _loc4_ = this._data[0];
         var _loc8_ = this.mcArray[_loc4_];
         var _loc2_ = this[_loc8_];
         var _loc5_ = this._data[1];
         var _loc3_ = this._data[2];
         var _loc7_ = _loc3_;
         if(_loc3_ == undefined || _loc3_ == "" || _loc3_ == null)
         {
            _loc3_ = undefined;
            _loc7_ = undefined;
         }
         if(_loc2_ == undefined)
         {
            _loc2_ = this.attachMovie("preview_Image",_loc8_,this.getNextHighestDepth());
         }
         if(_loc4_ == 0)
         {
            _loc2_._x = 180;
            _loc2_._y = -30;
         }
         else if(_loc4_ == 1)
         {
            _loc2_._x = 180;
            _loc2_._y = 110;
            if(_loc7_.substr(0,17).toUpperCase() == "MPHEIST_OUTFIT_F_")
            {
               _loc3_ = "MPHEIST_OUTFIT_FEMALE";
            }
            else if(_loc7_.substr(0,17).toUpperCase() == "MPHEIST_OUTFIT_M_")
            {
               _loc3_ = "MPHEIST_OUTFIT_MALE";
            }
         }
         _loc2_._rotation = this.rotationArray[_loc4_];
         if(_loc5_ == undefined || _loc5_ == "" || _loc5_ == null)
         {
            _loc2_.titleMC.titleTF.text = "";
            _loc2_._visible = false;
         }
         else
         {
            _loc2_.titleMC.gotoAndStop(this.tapeArray[_loc4_ + 1]);
            _loc2_.titleMC.titleTF.text = "";
            var _loc6_ = _loc2_.titleMC.titleTF.getNewTextFormat();
            _loc6_.size = 20;
            _loc2_.titleMC.titleTF.setTextFormat(_loc6_);
            _loc2_.titleMC.titleTF._height = 26.35;
            _loc2_.titleMC.titleTF.htmlText = _loc5_;
            _loc2_.titleMC.titleTF.autoSize = "center";
            if(_loc2_.titleMC.titleTF._height > 30)
            {
               _loc6_.size = 15;
               _loc2_.titleMC.titleTF.setTextFormat(_loc6_);
            }
            _loc2_.titleMC.titleTF._y = 16 - _loc2_.titleMC.titleTF._height / 2;
            _loc2_._visible = true;
         }
         _loc2_.updateImage(_loc3_,_loc7_);
      }
   }
   function set highlighted(_h)
   {
      if(_h == undefined)
      {
         _h = false;
      }
      this._highlighted = _h;
   }
}
