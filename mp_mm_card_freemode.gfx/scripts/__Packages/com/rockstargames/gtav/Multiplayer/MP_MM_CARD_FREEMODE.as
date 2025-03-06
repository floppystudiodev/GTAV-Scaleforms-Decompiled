class com.rockstargames.gtav.Multiplayer.MP_MM_CARD_FREEMODE extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
   var CONTENT;
   var dataList = new Array();
   var itemList = new Array();
   function MP_MM_CARD_FREEMODE()
   {
      super();
      _global.gfxExtensions = true;
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.CONTENT._x += 25;
      this.dataList = [];
      this.itemList = [];
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.titleBG,117);
      this.SET_TITLE("");
   }
   function debug()
   {
   }
   function COLLAPSE(collapse)
   {
   }
   function SET_ICON(index, iconEnum, rank)
   {
      var _loc3_ = this.itemList[index];
      var _loc2_ = com.rockstargames.gtav.Multiplayer.items.MPMMFreemodeItem(_loc3_);
      if(iconEnum != undefined)
      {
         if(_loc2_)
         {
            _loc2_.setIcon(iconEnum,_loc2_.icon2MC);
            _loc2_.rankNumTF.text = rank == undefined ? "" : String(rank);
         }
      }
   }
   function DISPLAY_MIC()
   {
      var _loc8_ = arguments;
      var _loc4_ = 0;
      while(_loc4_ < 16)
      {
         var _loc6_ = _loc8_[0] * 16 + _loc4_;
         var _loc7_ = this.itemList[_loc6_];
         var _loc3_ = com.rockstargames.gtav.Multiplayer.items.MPMMFreemodeItem(_loc7_);
         var _loc5_ = _loc8_[_loc6_ + 1];
         if(_loc5_ != undefined)
         {
            if(_loc3_)
            {
               _loc3_.setIcon(_loc5_,_loc3_.icon2MC);
               _loc3_.rankNumTF.text = "";
            }
         }
         _loc4_ = _loc4_ + 1;
      }
   }
   function SET_TITLE(str, str2, icon)
   {
      var _loc2_ = this.CONTENT.titleTF;
      var _loc3_ = this.CONTENT.diffTF;
      var _loc5_ = this.CONTENT.iconMC;
      if(str == undefined || str == "")
      {
         _loc2_.htmlText = "";
         _loc2_._visible = this.CONTENT.titleBG._visible = false;
         _loc5_.gotoAndStop(0);
         this.CONTENT._y = -25;
      }
      else
      {
         var _loc4_ = 0;
         var _loc8_ = 4;
         if(str2 == undefined || str2 == "")
         {
            _loc3_.htmlText = "";
         }
         else
         {
            _loc3_.htmlText = str2;
            _loc3_.textAutoSize = "shrink";
            _loc3_.autoSize = false;
            _loc4_ = _loc3_.textWidth + _loc8_;
         }
         _loc2_.htmlText = str;
         _loc2_.textAutoSize = "shrink";
         _loc2_.autoSize = false;
         _loc2_._visible = this.CONTENT.titleBG._visible = true;
         if(icon != undefined && icon != "")
         {
            _loc5_.gotoAndStop(icon);
            _loc2_._x = 26;
            _loc2_._width = 254 - _loc4_;
         }
         else
         {
            _loc2_._x = 5;
            _loc2_._width = 280 - _loc4_;
         }
         this.CONTENT._y = 0;
      }
   }
   function SET_DATA_SLOT(_viewIndex)
   {
      this.dataList[_viewIndex] = arguments;
   }
   function UPDATE_SLOT(_viewIndex)
   {
      var _loc3_ = this.itemList[_viewIndex];
      if(_loc3_ != undefined)
      {
         com.rockstargames.gtav.Multiplayer.items.MPMMFreemodeItem(_loc3_).data = arguments;
      }
   }
   function SET_HIGHLIGHT(index)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.itemList.length)
      {
         var _loc3_ = this.itemList[_loc2_];
         com.rockstargames.gtav.Multiplayer.items.MPMMFreemodeItem(_loc3_).highlighted = index != _loc2_ ? false : true;
         _loc2_ = _loc2_ + 1;
      }
   }
   function DISPLAY_VIEW()
   {
      this.itemList = [];
      var _loc7_ = 25;
      var _loc3_ = 0;
      while(_loc3_ < this.dataList.length)
      {
         var _loc5_ = this.dataList[_loc3_];
         var _loc6_ = 0;
         var _loc4_ = this.CONTENT.getNextHighestDepth();
         var _loc2_ = this.CONTENT.attachMovie("playerListItem","playerListItem" + _loc4_ + "MC",_loc4_);
         _loc2_._y = _loc7_ + _loc3_ * (25 + _loc6_);
         _loc2_._x = -25;
         com.rockstargames.gtav.Multiplayer.items.MPMMFreemodeItem(_loc2_).data = _loc5_;
         this.itemList.push(_loc2_);
         _loc3_ = _loc3_ + 1;
      }
      this.dataList = [];
   }
   function SET_DATA_SLOT_EMPTY(viewIndex, itemIndex)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.itemList.length)
      {
         var _loc3_ = this.itemList[_loc2_];
         com.rockstargames.gtav.Multiplayer.items.MPMMFreemodeItem(_loc3_).ON_DESTROY();
         _loc3_.removeMovieClip();
         _loc2_ = _loc2_ + 1;
      }
      this.itemList = [];
   }
   function TXD_HAS_LOADED(textureDict, success, uniqueID)
   {
      if(success == true)
      {
         var il = com.rockstargames.ui.media.ImageLoaderMC(eval(this.CONTENT + "." + uniqueID));
         il.displayTxdResponse(textureDict);
      }
   }
   function TXD_ALREADY_LOADED(textureDict, uniqueID)
   {
      var il = com.rockstargames.ui.media.ImageLoaderMC(eval(this.CONTENT + "." + uniqueID));
      il.displayTxdResponse(textureDict);
   }
   function ADD_TXD_REF_RESPONSE(textureDict, uniqueID, success)
   {
      if(success == true)
      {
         var il = com.rockstargames.ui.media.ImageLoaderMC(eval(this.CONTENT + "." + uniqueID));
         il.displayTxdResponse(textureDict);
      }
   }
}
