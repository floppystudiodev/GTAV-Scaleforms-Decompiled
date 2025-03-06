class com.rockstargames.gtav.levelDesign.heists.selectors.MPHeistBoardTodoItem extends com.rockstargames.ui.components.GUIMenuItem
{
   var container;
   var thePlanTF;
   var numItems = 0;
   var topLine = 35;
   var bottomLine = 419;
   var showPostItNoteList = new Array();
   var numLinesOfText = [];
   function MPHeistBoardTodoItem()
   {
      super();
   }
   function set data(_d)
   {
      this._data = _d.slice(2).toString().split(",");
      this.numItems = this._data.length;
      if(this.container != undefined)
      {
         this.container.removeMovieClip();
      }
      this.container = this.createEmptyMovieClip("container",this.getNextHighestDepth(),{_x:0,_y:0});
      this.container._visible = false;
      if(this._data[0] != undefined)
      {
         var _loc31_ = 419;
         var _loc32_ = 16;
         var _loc21_ = this.topLine;
         var _loc7_ = 0;
         var _loc28_ = undefined;
         this.showPostItNoteList = [];
         var _loc5_ = 0;
         while(_loc5_ < this._data.length)
         {
            _loc7_ = _loc5_;
            _loc28_ = "todoItemTF" + _loc5_;
            if(this._data[_loc7_] != undefined)
            {
               var _loc3_ = this.container.attachMovie("todoLineMC",_loc28_,this.container.getNextHighestDepth(),{_x:0,_y:_loc21_});
               _loc3_.bgMC._visible = false;
               _loc3_.postItNote._visible = false;
               var _loc4_ = _loc3_.todoItemTF;
               com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(_loc4_,com.rockstargames.gtav.levelDesign.heists.HeistColours.BLUE);
               _loc4_.autoSize = "left";
               _loc4_.wordWrap = true;
               _loc4_.multiline = true;
               _loc4_.html = true;
               var _loc12_ = _loc4_.getNewTextFormat();
               _loc12_.size = _loc32_;
               _loc4_.setTextFormat(_loc12_);
               var _loc16_ = this.getHUDColourHex(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE).toUpperCase();
               var _loc23_ = _loc16_.toLowerCase();
               var _loc9_ = this.getHUDColourHex(com.rockstargames.gtav.levelDesign.heists.HeistColours.BLUE);
               var _loc2_ = this._data[_loc7_].split(_loc16_).join(_loc9_).split(_loc23_).join(_loc9_);
               if(_loc2_ != undefined && _loc2_ != "")
               {
                  _loc2_ = "<FONT COLOR=\'" + _loc9_ + "\'>" + _loc2_;
                  var _loc15_ = this.getHUDColourHex(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_YELLOW).toUpperCase();
                  var _loc22_ = _loc15_.toLowerCase();
                  var _loc18_ = this.getHUDColourHex(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLUE).toUpperCase();
                  var _loc26_ = _loc18_.toLowerCase();
                  var _loc19_ = this.getHUDColourHex(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREEN).toUpperCase();
                  var _loc25_ = _loc19_.toLowerCase();
                  var _loc14_ = this.getHUDColourHex(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_HB_YELLOW);
                  var _loc17_ = this.getHUDColourHex(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_HB_BLUE);
                  var _loc13_ = this.getHUDColourHex(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_RADAR_HEALTH);
                  _loc2_ = _loc2_.split(_loc15_).join(_loc14_).split(_loc22_).join(_loc14_);
                  _loc2_ = _loc2_.split(_loc18_).join(_loc17_).split(_loc26_).join(_loc17_);
                  _loc2_ = _loc2_.split(_loc19_).join(_loc13_).split(_loc25_).join(_loc13_);
                  var _loc24_ = _loc2_.indexOf("[");
                  var _loc27_ = _loc2_.indexOf("]");
                  var _loc10_ = _loc24_ != -1 ? true : false;
                  var _loc20_ = _loc27_ != -1 ? true : false;
                  var _loc11_ = _loc10_;
                  if(_loc10_ == true || _loc20_ == true)
                  {
                     var _loc6_ = new Array();
                     if(_loc10_)
                     {
                        _loc6_ = _loc2_.split("[");
                        _loc2_ = _loc6_.join("");
                     }
                     if(_loc20_)
                     {
                        _loc6_ = _loc2_.split("]");
                        _loc2_ = _loc6_.join("");
                     }
                  }
                  else
                  {
                     _loc11_ = true;
                  }
                  _loc3_.todoItemTF.htmlText = _loc2_;
                  _loc3_.todoNumberTF.text = _loc7_ + 1;
                  this.numLinesOfText[_loc5_] = _loc3_.todoItemTF.bottomScroll;
                  var _loc8_ = _loc7_;
                  if(_loc8_ > 8)
                  {
                     _loc8_ -= 8;
                  }
                  _loc3_.postItNote.gotoAndStop(_loc8_);
                  _loc3_.bgMC._height = _loc3_._height;
                  _loc21_ += _loc3_._height;
                  _loc3_.postItNote._visible = _loc11_;
                  this.showPostItNoteList[_loc5_] = _loc11_;
               }
               _loc31_ = _loc21_;
            }
            _loc5_ = _loc5_ + 1;
         }
         this.renumberPostIts();
         if(_loc31_ > this.bottomLine)
         {
            this.reduceTodoSize();
         }
      }
      this.container._visible = true;
   }
   function renumberPostIts()
   {
      var _loc6_ = 1;
      var _loc4_ = undefined;
      var _loc2_ = 0;
      while(_loc2_ < 21)
      {
         _loc4_ = "todoItemTF" + _loc2_;
         var _loc3_ = this.container[_loc4_];
         if(this.container[_loc4_] != undefined)
         {
            var _loc5_ = this.showPostItNoteList[_loc2_];
            if(_loc5_)
            {
               _loc3_.todoNumberTF.text = _loc6_;
               _loc6_ = _loc6_ + 1;
            }
            else
            {
               _loc3_.todoNumberTF.text = "-";
            }
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function getHUDColourHex(colourId)
   {
      var _loc1_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(colourId,_loc1_);
      return "#" + ("0" + _loc1_.r.toString(16)).substr(-2) + ("0" + _loc1_.g.toString(16)).substr(-2) + ("0" + _loc1_.b.toString(16)).substr(-2);
   }
   function reduceTodoSize()
   {
      var _loc6_ = this.bottomLine;
      while(_loc6_ >= this.bottomLine)
      {
         var _loc4_ = this.topLine;
         var _loc7_ = 0;
         var _loc5_ = undefined;
         var _loc3_ = 0;
         while(_loc3_ < 21)
         {
            _loc7_ = _loc3_;
            _loc5_ = "todoItemTF" + _loc3_;
            var _loc2_ = this.container[_loc5_];
            if(this.container[_loc5_] != undefined)
            {
               _loc2_._y = _loc4_;
               _loc2_.todoItemTF._width *= 1.05;
               _loc2_._xscale -= 5;
               _loc2_._yscale -= 5;
               _loc2_.bgMC._height = _loc2_.todoItemTF._height;
               _loc4_ += _loc2_._height;
               _loc6_ = _loc4_;
            }
            _loc3_ = _loc3_ + 1;
         }
         if(_loc6_ < this.bottomLine)
         {
            break;
         }
      }
   }
   function set labels(_l)
   {
      this.thePlanTF.htmlText = _l[3];
      this.thePlanTF.textAutoSize = "shrink";
      this.thePlanTF.wordWrap = true;
      com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.thePlanTF,com.rockstargames.gtav.levelDesign.heists.HeistColours.BLUE);
   }
   function subHighlight(_subItemIndex)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.numItems)
      {
         var _loc3_ = "todoItemTF" + _loc2_;
         if(this.container[_loc3_] != undefined)
         {
            if(_subItemIndex != _loc2_ || _subItemIndex == -1 || _subItemIndex == undefined)
            {
               this.container[_loc3_].bgMC._visible = false;
            }
            else
            {
               this.container[_loc3_].bgMC._visible = true;
            }
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function set highlighted(_h)
   {
      this._highlighted = _h;
      this.subHighlight();
   }
   function getItemLineCount(itemIndex)
   {
      return this.numLinesOfText[itemIndex];
   }
}
