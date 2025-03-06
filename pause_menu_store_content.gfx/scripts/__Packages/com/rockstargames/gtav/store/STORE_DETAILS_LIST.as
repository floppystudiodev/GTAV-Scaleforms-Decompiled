class com.rockstargames.gtav.store.STORE_DETAILS_LIST extends com.rockstargames.gtav.store.EcommerceStoreBaseClass
{
   var data;
   var COLUMN;
   var menuBgCol;
   var blackCol;
   var whiteCol;
   var textTF;
   var statusMC;
   var PriceItemMC;
   var PriceItemMCbgMC;
   var blankImage;
   var bg;
   var scrollIndicator;
   var scrollIndicatorbgMC;
   var bgCol;
   var textCol;
   var scrollPos = 0;
   var currentSelection = 0;
   function STORE_DETAILS_LIST()
   {
      super();
      this.data = new Array();
   }
   function SETUP_COLUMN(mc, _menuBgCol, _blackCol, _whiteCol)
   {
      this.COLUMN = mc;
      this.menuBgCol = _menuBgCol;
      this.blackCol = _blackCol;
      this.whiteCol = _whiteCol;
      this.textTF = this.COLUMN.textMC.textTF;
      this.statusMC = this.COLUMN.statusMC;
      this.PriceItemMC = this.COLUMN.PriceItemMC;
      this.PriceItemMCbgMC = this.COLUMN.PriceItemMC.bgMC;
      this.blankImage = this.COLUMN.blankImage;
      this.bg = this.COLUMN.bgMC;
      this.scrollIndicator = this.COLUMN.scrollIndicatorMC;
      this.scrollIndicator._visible = false;
      this.scrollIndicatorbgMC = this.scrollIndicator.bgMC;
      if(this.scrollIndicatorbgMC != undefined)
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.scrollIndicatorbgMC,this.menuBgCol[0],this.menuBgCol[1],this.menuBgCol[2],this.menuBgCol[3]);
      }
      if(this.COLUMN.textMC != undefined)
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.COLUMN.textMC,this.whiteCol[0],this.whiteCol[1],this.whiteCol[2],100);
      }
      this.PriceItemMC = this.COLUMN.PriceItemMC;
      if(this.PriceItemMCbgMC != undefined)
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.PriceItemMCbgMC,this.menuBgCol[0],this.menuBgCol[1],this.menuBgCol[2],this.menuBgCol[3]);
      }
      if(this.bg != undefined)
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.bg,this.menuBgCol[0],this.menuBgCol[1],this.menuBgCol[2],this.menuBgCol[3]);
      }
   }
   function SET_DATA(_slot, _data)
   {
      this.data[_slot] = _data;
   }
   function SET_DATA_EMPTY(_slot)
   {
      if(_slot == undefined)
      {
         this.data = [];
      }
      else
      {
         this.data[_slot] = [];
      }
      this.textTF.text = "";
      this.REDRAW();
   }
   function highlightItem(_slot)
   {
   }
   function SET_DESCRIPTION(priceTitle, itemPrice, numPlayers, statusText, statusColour, priceVis, playersVis, statusVis)
   {
      this.data[2] = priceTitle;
      this.data[3] = itemPrice;
      this.data[4] = numPlayers;
      this.data[5] = statusText;
      this.data[6] = statusColour;
      this.data[7] = priceVis;
      this.data[8] = playersVis;
      this.data[9] = statusVis;
      this.REDRAW();
   }
   function REDRAW()
   {
      var _loc3_ = false;
      this.textTF.html = true;
      if(this.data[0] != undefined)
      {
         this.textTF.htmlText = "<font size=\'16\'>" + this.parseLinebreaks(this.data[0].toString()) + "</font><BR><BR>";
         _loc3_ = false;
      }
      else
      {
         _loc3_ = true;
      }
      if(this.data[1] != undefined)
      {
         this.textTF.htmlText += this.parseLinebreaks(this.data[1].toString());
         _loc3_ = false;
      }
      else
      {
         _loc3_ = true;
      }
      if(_loc3_ == true)
      {
         this.textTF.htmlText = "";
      }
      this.updateScrollIndicator();
      var _loc8_ = this.data[2];
      var _loc2_ = this.data[3];
      var _loc4_ = this.data[4];
      var _loc5_ = this.data[5];
      var _loc9_ = this.data[6];
      var _loc7_ = this.data[7];
      var _loc10_ = this.data[8];
      var _loc6_ = this.data[9];
      if(_loc8_ == undefined || _loc8_ == "")
      {
         this.PriceItemMC.labelMC.titleTF.htmlText = "";
      }
      else
      {
         this.PriceItemMC.labelMC.titleTF.html = true;
         this.PriceItemMC.labelMC.titleTF.autoSize = true;
         this.PriceItemMC.labelMC.titleTF.htmlText = _loc8_;
      }
      if(_loc2_ == undefined || _loc2_ == "")
      {
         this.PriceItemMC.labelMC.priceTF.htmlText = "";
         _loc7_ = false;
      }
      else
      {
         _loc2_ = _loc2_.split("MSP").join("<img src=\'points_icon\' height=\'16\' width=\'16\'>");
         if(_loc2_.charCodeAt(0) == 8381)
         {
            _loc2_ = _loc2_.substring(1) + "RUB";
         }
         if(_loc2_.charCodeAt(0) == 8377)
         {
            _loc2_ = _loc2_.substring(1) + "INR";
         }
         if(_loc2_.charCodeAt(0) == 75 && _loc2_.charCodeAt(1) == 269)
         {
            _loc2_ = _loc2_.substring(2) + "CZK";
         }
         this.PriceItemMC.labelMC.priceTF.html = true;
         this.PriceItemMC.labelMC.priceTF.autoSize = true;
         this.PriceItemMC.labelMC.priceTF.htmlText = _loc2_;
         _loc7_ = true;
      }
      if(_loc4_ == undefined || _loc4_ == 0 || _loc4_ == "0" || _loc4_ == "")
      {
         this.PriceItemMC.playersMC.playersTF.text = "";
         this.PriceItemMC.playersMC._visible = false;
      }
      else
      {
         this.PriceItemMC.playersMC.playersTF.autoSize = true;
         this.PriceItemMC.playersMC.playersTF.text = _loc4_;
         this.PriceItemMC.playersMC._x = 278 - this.PriceItemMC.playersMC._width + 1;
         this.PriceItemMC.playersMC._visible = true;
      }
      this.COLOUR_STATUS_BAR();
      if(_loc5_ == undefined || _loc5_ == "")
      {
         this.statusMC.labelMC._visible = false;
         this.statusMC.bgMC._visible = false;
         _loc6_ = false;
      }
      else
      {
         this.statusMC.labelMC.statusTF.autoSize = true;
         this.statusMC.labelMC.statusTF.text = _loc5_;
         this.statusMC.bgMC._width = this.statusMC.labelMC._width + 4;
         this.statusMC._x = 276 - this.statusMC.labelMC._width;
         this.statusMC.labelMC._visible = true;
         this.statusMC.bgMC._visible = true;
         _loc6_ = true;
      }
      this.currentSelection = 0;
      if(_loc3_ == true)
      {
         this.blankImage._visible = true;
         this.bg._visible = false;
      }
      else
      {
         this.blankImage._visible = false;
         this.bg._visible = true;
      }
      this.PriceItemMC.labelMC._visible = _loc7_;
      this.statusMC._visible = _loc6_;
   }
   function COLOUR_STATUS_BAR()
   {
      var _loc2_ = this.statusMC.bgMC;
      if(_loc2_ != undefined)
      {
         com.rockstargames.ui.utils.Colour.Colourise(_loc2_,this.bgCol[0],this.bgCol[1],this.bgCol[2],100);
      }
      var _loc3_ = this.statusMC.labelMC;
      if(_loc3_ != undefined)
      {
         com.rockstargames.ui.utils.Colour.Colourise(_loc3_,this.textCol[0],this.textCol[1],this.textCol[2],100);
      }
   }
   function UPDATE_STATUS_COLOURS(_bgCol, _textCol)
   {
      this.bgCol = _bgCol;
      this.textCol = _textCol;
      this.COLOUR_STATUS_BAR();
   }
   function SET_INPUT_EVENT(direction)
   {
      switch(direction)
      {
         case com.rockstargames.ui.game.GamePadConstants.DPADUP:
            this.textTF.scroll--;
            break;
         case com.rockstargames.ui.game.GamePadConstants.DPADDOWN:
            this.textTF.scroll = this.textTF.scroll + 1;
      }
      this.updateScrollIndicator();
   }
   function GET_CURRENT_SELECTION()
   {
      return 0;
   }
   function updateScrollIndicator()
   {
      if(this.textTF.maxscroll > 1)
      {
         if(this.textTF.scroll > 1)
         {
            this.scrollIndicator.scrollArrowUp._alpha = 100;
         }
         else
         {
            this.scrollIndicator.scrollArrowUp._alpha = 50;
         }
         if(this.textTF.scroll < this.textTF.maxscroll)
         {
            this.scrollIndicator.scrollArrowDown._alpha = 100;
         }
         else
         {
            this.scrollIndicator.scrollArrowDown._alpha = 50;
         }
         this.scrollIndicator._visible = true;
      }
      else
      {
         this.scrollIndicator._visible = false;
      }
   }
   function highlight(_h)
   {
      if(_h)
      {
         this.textTF.scroll = 0;
         this.updateScrollIndicator();
      }
   }
   function SET_FOCUS(isFocused)
   {
      var _loc2_ = undefined;
      if(isFocused)
      {
         _loc2_ = 1;
         if(this.PriceItemMCbgMC != undefined)
         {
            com.rockstargames.ui.utils.Colour.Colourise(this.PriceItemMCbgMC,this.blackCol[0],this.blackCol[1],this.blackCol[2],this.blackCol[3]);
         }
      }
      else
      {
         _loc2_ = 0.3;
         if(this.PriceItemMCbgMC != undefined)
         {
            com.rockstargames.ui.utils.Colour.Colourise(this.PriceItemMCbgMC,this.menuBgCol[0],this.menuBgCol[1],this.menuBgCol[2],this.menuBgCol[3]);
         }
      }
      var _loc3_ = new flash.geom.Transform(this.COLUMN);
      var _loc4_ = new flash.geom.ColorTransform(_loc2_,_loc2_,_loc2_,1,1,1,1,0);
      _loc3_.colorTransform = _loc4_;
      this.highlight(isFocused);
   }
   function CURRENT_COLUMN(_column)
   {
      this.currentColumn = _column;
   }
   function parseLinebreaks(str)
   {
      return str.split("\\n").join("<br>");
   }
}
