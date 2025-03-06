class com.rockstargames.gtav.levelDesign.heists.selectors.MPPlanningBoard extends com.rockstargames.ui.components.GUIMenuItem
{
   var choiceStr;
   var imageRotation;
   var showPlanningImage;
   var thisSlot;
   var txd;
   var available;
   var fadeInCross;
   var planningItemTitle;
   var itemDivider;
   var singleImage;
   var planningImage;
   var unavailableMC;
   var dataLeftMC;
   var prevPlanningData_left;
   var item0;
   var dataRightMC;
   var planningSlotRightData;
   var highlight;
   static var UNAVAILABLE_ALPHA = 25;
   static var UNAVAILABLE_FADE_DURATION = 0.8;
   var imageLinkage = "planningImage";
   var dataLeftLinkage = "planningData_left";
   var titleLinkage = "planningItemTitle";
   var numItems = 0;
   var completed = 99;
   var redRGB = 12734544;
   var redRGBArray = [194,80,80];
   var blueRGB = 2582162;
   var blueRGBArray = [39,102,146];
   var greenRGB = 3966268;
   var greenRGBArray = [60,113,60];
   var isCompleted = false;
   var planningYMax = 150;
   var todoStr = "";
   var hasHighlight = false;
   var numPlanningSlots = 0;
   var crossFrame = 1;
   function MPPlanningBoard()
   {
      super();
      _global.gfxExtensions = true;
      this.choiceStr = new Array("A","B","C");
      this.imageRotation = new Array(-1.75,2.15,-1.75,1.5,2.2,-1.75);
      this.crossFrame = 1 + Math.ceil(Math.random() * 4);
      this.showPlanningImage = true;
   }
   function set data(_d)
   {
      this._data = _d.slice(2);
      this.thisSlot = this._data[0];
      this.txd = this._data[1];
      this.available = this._data[10];
      if(this.available == undefined)
      {
         this.available = true;
      }
      this.hasHighlight = this._data[11];
      if(this.hasHighlight == undefined)
      {
         this.hasHighlight = false;
      }
      this.fadeInCross = this._data[12];
      if(this.fadeInCross == undefined)
      {
         this.fadeInCross = false;
      }
      if(this._data[2] != undefined)
      {
         if(this.planningItemTitle == undefined)
         {
            this.planningItemTitle = this.attachMovie(this.titleLinkage,"planningItemTitle",this.getNextHighestDepth(),{_x:0,_y:0});
            this.planningItemTitle.underlineMC._visible = false;
            this.planningItemTitle.numberTF.text = this.thisSlot + 1 + ".";
            com.rockstargames.ui.utils.Colour.Colourise(this.itemDivider,this.blueRGBArray[0],this.blueRGBArray[1],this.blueRGBArray[2],100);
         }
         if(this._data[2] != undefined)
         {
            com.rockstargames.ui.utils.FitToTextfield.scaleText(this.planningItemTitle.titleTF,this._data[2],536,"left",true);
         }
         else
         {
            this.planningItemTitle.titleTF.text = "";
         }
         this.planningItemTitle.titleTF.textColor = this.blueRGB;
         this.planningItemTitle.numberTF.textColor = this.blueRGB;
         var _loc11_ = this.planningItemTitle.titleTF._x + this.planningItemTitle.titleTF.textWidth;
         this.planningItemTitle.underlineMC._x = _loc11_ / 2 + 4;
         this.planningItemTitle.underlineMC._width = _loc11_;
         this.completed = this._data[9];
         if(this.completed == -1 || this.completed == undefined)
         {
            this.completed = 99;
         }
         var _loc10_ = 46;
         this.numItems = 3;
         this.singleImage = false;
         if(this._data[5] == undefined || this._data[5] == "" || this._data[5] == null)
         {
            this.numItems = 2;
            if(this._data[7] == undefined || this._data[7] == "" || this._data[7] == null)
            {
               _loc10_ = 500;
               this.singleImage = true;
               this.numItems = 1;
            }
         }
         var _loc5_ = 3;
         var _loc3_ = 0;
         while(_loc3_ < this.numItems)
         {
            var _loc6_ = "item" + _loc3_;
            var _loc2_ = this[_loc6_];
            if(this._data[_loc5_] == undefined || this._data[_loc5_] == "" || this._data[_loc5_] == null)
            {
               if(_loc2_ != undefined)
               {
                  _loc2_.removeImage();
                  this.planningImage = null;
               }
            }
            if(_loc2_ == undefined)
            {
               _loc2_ = this.attachMovie(this.imageLinkage,_loc6_,this.getNextHighestDepth(),{_x:_loc10_ + _loc3_ * 170,_y:0,_rotation:this.imageRotation[this.thisSlot]});
               this.planningImage = _loc2_;
               this.planningImage._visible = this.showPlanningImage;
            }
            _loc2_.highlight._visible = false;
            _loc2_.highlight._rotation = this.thisSlot * 90 - _loc3_ * 45;
            var _loc4_ = (this.thisSlot + 1) * (_loc3_ + 1);
            if(_loc4_ > 8)
            {
               _loc4_ -= 8;
            }
            _loc2_.photoFrame.tapeMC.gotoAndStop(_loc4_);
            _loc2_.completedTickMC.gotoAndStop(_loc4_);
            if(this.todoStr == "")
            {
               com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.completedTickMC.todoTF,"HEIST_MP_TODO",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,true);
               this.todoStr = _loc2_.completedTickMC.todoTF.htmlText;
            }
            _loc2_.completedTickMC.todoTF.htmlText = this.todoStr;
            _loc2_.completedTickMC.todoTF.textAutoSize = "shrink";
            if(this.singleImage == true)
            {
               if(this.completed != undefined && this.completed != 99)
               {
                  this.isCompleted = true;
               }
               else
               {
                  this.isCompleted = false;
               }
            }
            else if(_loc3_ == this.completed)
            {
               this.isCompleted = true;
            }
            else
            {
               this.isCompleted = false;
            }
            if(this.isCompleted == true)
            {
               _loc2_.crossMC.gotoAndStop(this.crossFrame);
               if(this.fadeInCross)
               {
                  _loc2_.crossMC._alpha = 0;
                  com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2_.crossMC,com.rockstargames.gtav.levelDesign.heists.selectors.MPPlanningBoard.UNAVAILABLE_FADE_DURATION,{_alpha:95});
               }
               _loc2_.completedTickMC._visible = false;
               _loc2_.completedTickMC.tick._visible = true;
               _loc2_.completedTickMC.todoTF._visible = false;
            }
            else
            {
               _loc2_.crossMC.gotoAndStop(1);
               _loc2_.completedTickMC._visible = true;
               _loc2_.completedTickMC.tick._visible = false;
               _loc2_.completedTickMC.todoTF._visible = true;
            }
            if(this.singleImage == true)
            {
               _loc2_.postItNote._visible = false;
               _loc2_._xscale = 125;
               _loc2_._yscale = 125;
            }
            else
            {
               _loc2_.postItNote.gotoAndStop(_loc4_);
               _loc2_.postItNote.textTF.htmlText = this.choiceStr[_loc3_];
            }
            _loc2_.updateImage(this.txd,this._data[_loc5_]);
            _loc5_ += 2;
            _loc3_ = _loc3_ + 1;
         }
         this._visible = true;
         this.planningYMax = _loc2_._height;
      }
      else
      {
         this._visible = false;
         this.planningYMax = 150;
      }
      if(this.available == true && this.unavailableMC != undefined)
      {
         this.unavailableMC.removeMovieClip();
         this.unavailableMC = undefined;
      }
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.planningItemTitle);
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.planningItemTitle,com.rockstargames.gtav.levelDesign.heists.selectors.MPPlanningBoard.UNAVAILABLE_FADE_DURATION,{_alpha:(!this.available ? com.rockstargames.gtav.levelDesign.heists.selectors.MPPlanningBoard.UNAVAILABLE_ALPHA : 100)});
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(_loc2_);
      com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2_,com.rockstargames.gtav.levelDesign.heists.selectors.MPPlanningBoard.UNAVAILABLE_FADE_DURATION,{_alpha:(!this.available ? com.rockstargames.gtav.levelDesign.heists.selectors.MPPlanningBoard.UNAVAILABLE_ALPHA : 100)});
      _loc2_.completedTickMC._alpha = !this.available ? 0 : 100;
   }
   function reposition(_numPlanningSlots, _hiddenSlotOffset, numVisible)
   {
      if(_hiddenSlotOffset == undefined)
      {
         _hiddenSlotOffset = 0;
      }
      if(numVisible == undefined)
      {
         numVisible = _numPlanningSlots;
      }
      if(this.thisSlot != undefined)
      {
         this.numPlanningSlots = _numPlanningSlots;
         var _loc9_ = 40;
         var _loc7_ = 150;
         _loc7_ = 660 / this.numPlanningSlots;
         this.planningYMax = _loc7_;
         this._y = Math.round(_loc9_ + (this.thisSlot - _hiddenSlotOffset) * _loc7_);
         var _loc8_ = 100;
         if(this.numPlanningSlots > 3)
         {
            _loc8_ = 100 - 6 * (this.numPlanningSlots - 3);
         }
         this.planningItemTitle._xscale = _loc8_;
         this.planningItemTitle._yscale = _loc8_;
         var _loc4_ = 0;
         while(_loc4_ < this.numItems)
         {
            var _loc2_ = this["item" + _loc4_];
            if(_loc2_ != undefined)
            {
               if(_loc2_ == this.planningImage)
               {
                  _loc2_._y = 22;
               }
               else
               {
                  _loc2_._y = this.planningItemTitle._height;
               }
               var _loc5_ = [100,100,100,100,92,80,80];
               var _loc3_ = _loc5_[numVisible];
               if(numVisible >= 6)
               {
                  _loc3_ = 100;
               }
               _loc2_._xscale = _loc3_;
               _loc2_._yscale = _loc3_;
               this.planningYMax = Math.max(_loc7_,_loc2_._height);
            }
            _loc4_ = _loc4_ + 1;
         }
         this.updatePlanningSlotLeft(["reposition"]);
         this.updatePlanningSlotRight(["reposition"]);
         this.setHighlightHeight();
         if(numVisible == 1)
         {
            this._y = 250;
         }
         else if(numVisible == 2)
         {
            this._y = this.thisSlot != 0 ? 380 : 190;
            this.itemDivider._y = this.thisSlot != 0 ? 380 : 190;
         }
      }
   }
   function hideAllText()
   {
      this.dataLeftMC._visible = false;
      this.planningItemTitle._visible = false;
   }
   function showAllText()
   {
      this.dataLeftMC._visible = true;
      this.planningItemTitle._visible = true;
   }
   function updatePlanningSlotLeft(stringArray)
   {
      var _loc15_ = [100,100,100];
      if(this.dataLeftMC != undefined)
      {
         var _loc3_ = 0;
         while(_loc3_ < 3)
         {
            var _loc10_ = this.dataLeftMC["dataLeft" + _loc3_];
            if(_loc10_)
            {
               _loc15_[_loc3_] = _loc10_._alpha;
               com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(_loc10_);
            }
            _loc3_ = _loc3_ + 1;
         }
         this.dataLeftMC.removeMovieClip();
      }
      if(stringArray.length == 0)
      {
         return undefined;
      }
      if(stringArray[0] == "reposition")
      {
         stringArray = this.prevPlanningData_left;
      }
      else
      {
         this.prevPlanningData_left = stringArray;
      }
      var _loc7_ = 6;
      if(this.numPlanningSlots > 3)
      {
         _loc7_ = 0;
      }
      var _loc2_ = undefined;
      var _loc5_ = undefined;
      var dataLeftMC = this.createEmptyMovieClip("dataLeftMC",this.getNextHighestDepth());
      dataLeftMC._x = 4;
      dataLeftMC._y = this.planningItemTitle._height;
      dataLeftMC._visible = false;
      var _loc4_ = -4;
      var _loc9_ = stringArray.length;
      _loc3_ = 0;
      while(_loc3_ < _loc9_)
      {
         var _loc13_ = "dataLeft" + _loc3_;
         var _loc8_ = dataLeftMC.attachMovie(this.dataLeftLinkage,_loc13_,dataLeftMC.getNextHighestDepth(),{_x:4,_y:_loc4_});
         _loc8_._alpha = _loc15_[_loc3_];
         _loc2_ = _loc8_.textTF;
         _loc2_._width = this.getAvailableWidth(this.item0);
         _loc2_.autoSize = "left";
         _loc2_.htmlText = stringArray[_loc3_];
         com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(_loc2_,com.rockstargames.gtav.levelDesign.heists.HeistColours.BLUE);
         var _loc11_ = !this.available ? com.rockstargames.gtav.levelDesign.heists.selectors.MPPlanningBoard.UNAVAILABLE_ALPHA : 100;
         if(_loc8_._alpha != _loc11_)
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(_loc8_);
            com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc8_,com.rockstargames.gtav.levelDesign.heists.selectors.MPPlanningBoard.UNAVAILABLE_FADE_DURATION,{_alpha:_loc11_});
         }
         _loc4_ += _loc2_.textHeight + _loc7_;
         _loc3_ = _loc3_ + 1;
      }
      var _loc14_ = _loc4_;
      var _loc20_ = Math.floor(this.item0._height);
      var _loc12_ = 1;
      while(_loc14_ > _loc20_)
      {
         _loc4_ = -4;
         var _loc6_ = undefined;
         _loc3_ = 0;
         while(_loc3_ < _loc9_)
         {
            _loc6_ = dataLeftMC["dataLeft" + _loc3_];
            _loc6_._y = _loc4_;
            _loc2_ = _loc6_.textTF;
            _loc5_ = _loc2_.getNewTextFormat();
            _loc5_.size -= _loc12_;
            _loc2_.setTextFormat(_loc5_);
            _loc4_ += _loc2_.textHeight + _loc7_;
            if(dataLeftMC.divider != undefined)
            {
               if(_loc9_ > 2 && _loc3_ == 1)
               {
                  dataLeftMC.divider._y = _loc4_;
                  _loc4_ += dataLeftMC.divider._height + _loc7_;
               }
            }
            _loc3_ = _loc3_ + 1;
         }
         _loc14_ = _loc6_._y + _loc6_._height + _loc7_;
         if(_loc7_ > 2)
         {
            _loc7_ = _loc7_ - 1;
         }
         if(_loc5_.size < 5)
         {
            break;
         }
         _loc12_ = _loc12_ + 1;
      }
      dataLeftMC._visible = true;
      this.setHighlightHeight();
   }
   function getAvailableWidth(image)
   {
      return image._x - image._width / 2 - 12;
   }
   function updatePlanningSlotRight(stringArray)
   {
      var _loc23_ = String(stringArray.shift());
      var _loc22_ = _loc23_ == "reposition";
      this.dataRightMC.removeMovieClip();
      if(_loc22_)
      {
         stringArray = this.planningSlotRightData;
      }
      else
      {
         this.planningSlotRightData = stringArray.concat();
      }
      var _loc10_ = new Array([166,221,190],[214,181,99],[150,153,161],[180,130,97]);
      var _loc15_ = stringArray.slice(0,_loc10_.length);
      var _loc12_ = this.numPlanningSlots <= 3 ? 6 : 0;
      var _loc20_ = this.item0._x + this.item0._width / 2;
      var _loc6_ = this.createEmptyMovieClip("dataRightMC",this.getNextHighestDepth());
      _loc6_._x = _loc20_;
      _loc6_._y = this.planningItemTitle._height;
      _loc6_._visible = false;
      var _loc9_ = 2;
      var _loc5_ = 0;
      while(_loc5_ < stringArray.length)
      {
         var _loc11_ = stringArray[_loc5_];
         if(_loc11_)
         {
            var _loc8_ = _loc6_.attachMovie("planningData_right_player","dataRight" + _loc5_,_loc6_.getNextHighestDepth(),{_x:22,_y:_loc9_});
            var _loc2_ = _loc8_.textTF;
            _loc2_._width = 750 - _loc20_;
            _loc2_.autoSize = "left";
            _loc2_.html = true;
            _loc2_.htmlText = _loc11_;
            if(_loc2_._width > 146)
            {
               _loc8_._width = 146;
            }
            com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(_loc2_,com.rockstargames.gtav.levelDesign.heists.HeistColours.BLUE);
            _loc9_ += _loc2_.textHeight + 2;
            var _loc3_ = 0;
            while(_loc3_ < _loc15_.length)
            {
               if(_loc11_ == _loc15_[_loc3_])
               {
                  var _loc13_ = _loc6_.attachMovie("medalMC","medal" + _loc5_,_loc6_.getNextHighestDepth(),{_x:8,_y:_loc8_._y + _loc8_._height / 2});
                  com.rockstargames.ui.utils.Colour.Colourise(_loc13_,_loc10_[_loc3_][0],_loc10_[_loc3_][1],_loc10_[_loc3_][2],100);
                  break;
               }
               _loc3_ = _loc3_ + 1;
            }
         }
         _loc5_ = _loc5_ + 1;
      }
      var _loc19_ = _loc9_;
      var _loc21_ = Math.floor(this.item0._height);
      var _loc18_ = 1;
      while(_loc19_ > _loc21_)
      {
         _loc9_ = -4;
         var _loc4_ = undefined;
         _loc5_ = 0;
         while(_loc5_ < stringArray.length)
         {
            _loc4_ = _loc6_["dataRight" + _loc5_];
            _loc4_._y = _loc9_;
            _loc2_ = _loc4_.textTF;
            var _loc7_ = _loc2_.getNewTextFormat();
            _loc7_.size -= _loc18_;
            _loc2_.setTextFormat(_loc7_);
            _loc13_ = _loc6_["medal" + _loc5_];
            _loc13_._y = _loc4_._y + _loc4_._height / 2;
            _loc9_ += _loc2_.textHeight + _loc12_;
            _loc5_ = _loc5_ + 1;
         }
         _loc19_ = _loc4_._y + _loc4_._height + _loc12_;
         if(_loc12_ > 0)
         {
            _loc12_ = _loc12_ - 1;
         }
         if(_loc7_.size < 5)
         {
            break;
         }
         _loc18_ = _loc18_ + 1;
      }
      _loc6_._visible = true;
      this.setHighlightHeight();
   }
   function showImages(bool)
   {
      this.showPlanningImage = bool;
      this.planningImage._visible = bool;
      var _loc2_ = this.dataRightMC;
      if(_loc2_ != undefined)
      {
         _loc2_._visible = bool;
      }
   }
   function setHighlightHeight()
   {
      if(this.numPlanningSlots == this.thisSlot + 1 || this.numPlanningSlots < 1)
      {
         this.itemDivider._visible = false;
      }
      else
      {
         this.itemDivider._visible = true;
      }
      this.itemDivider._y = this.planningYMax + 2;
   }
   function subHighlight(_subItemIndex, leftArrowVis, rightArrowVis)
   {
      var _loc3_ = 0;
      while(_loc3_ < this.numItems)
      {
         var _loc4_ = "item" + _loc3_;
         var _loc2_ = this[_loc4_];
         if(_loc3_ != _subItemIndex || _subItemIndex == undefined)
         {
            if(this.singleImage == true)
            {
               if(this.completed != undefined && this.completed != 99)
               {
                  this.isCompleted = true;
               }
               else
               {
                  this.isCompleted = false;
               }
            }
            else if(_loc3_ == this.completed)
            {
               this.isCompleted = true;
            }
            else
            {
               this.isCompleted = false;
            }
            if(this.isCompleted == true)
            {
               _loc2_.crossMC.gotoAndStop(this.crossFrame);
               if(!this.fadeInCross)
               {
               }
               _loc2_.completedTickMC._visible = false;
               _loc2_.completedTickMC.tick._visible = true;
               _loc2_.completedTickMC.todoTF._visible = false;
            }
            else
            {
               _loc2_.crossMC.gotoAndStop(1);
               _loc2_.completedTickMC._visible = true;
               _loc2_.completedTickMC.tick._visible = false;
               _loc2_.completedTickMC.todoTF._visible = true;
            }
            _loc2_.highlight._visible = this.hasHighlight;
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function set highlighted(_h)
   {
      if(_h == undefined)
      {
         _h = false;
      }
      if(this.unavailableMC != undefined)
      {
         var _loc2_ = this.item0;
         this.unavailableMC._y = _loc2_._y + _loc2_._height / 2;
         this.unavailableMC._height = _loc2_._height * 0.9;
         this.unavailableMC.swapDepths(this.getNextHighestDepth() + 100);
      }
      if(_h == false)
      {
         if(this.planningItemTitle.titleTF != undefined)
         {
            com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.planningItemTitle.titleTF,com.rockstargames.gtav.levelDesign.heists.HeistColours.BLUE);
         }
         if(this.planningItemTitle.numberTF != undefined)
         {
            com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.planningItemTitle.numberTF,com.rockstargames.gtav.levelDesign.heists.HeistColours.BLUE);
         }
         this.planningItemTitle.underlineMC._visible = false;
         this.subHighlight();
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.highlight,com.rockstargames.gtav.levelDesign.heists.HeistColours.BLUE);
         this.highlight._visible = false;
      }
      else
      {
         this.planningItemTitle.underlineMC._visible = false;
         if(this.available == false)
         {
            com.rockstargames.ui.utils.Colour.ApplyHudColour(this.highlight,com.rockstargames.gtav.levelDesign.heists.HeistColours.RED);
            if(this.planningItemTitle.titleTF != undefined)
            {
               com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.planningItemTitle.titleTF,com.rockstargames.gtav.levelDesign.heists.HeistColours.RED);
            }
            if(this.planningItemTitle.numberTF != undefined)
            {
               com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.planningItemTitle.numberTF,com.rockstargames.gtav.levelDesign.heists.HeistColours.RED);
            }
         }
         else
         {
            com.rockstargames.ui.utils.Colour.ApplyHudColour(this.highlight,com.rockstargames.gtav.levelDesign.heists.HeistColours.GREEN);
            if(this.planningItemTitle.titleTF != undefined)
            {
               com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.planningItemTitle.titleTF,com.rockstargames.gtav.levelDesign.heists.HeistColours.GREEN);
            }
            if(this.planningItemTitle.numberTF != undefined)
            {
               com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.planningItemTitle.numberTF,com.rockstargames.gtav.levelDesign.heists.HeistColours.GREEN);
            }
         }
         this.highlight._visible = true;
      }
      this._highlighted = _h;
   }
}
