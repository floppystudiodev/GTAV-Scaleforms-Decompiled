class com.rockstargames.gtav.store.ECOMMERCE_STORE extends com.rockstargames.gtav.store.EcommerceStoreBaseClass
{
   var TIMELINE;
   var CONTENT;
   var BOUNDING_BOX;
   var HEADER;
   var detailsMC;
   var charMC;
   var crewMC;
   var bgCol;
   var textCol;
   var headerCol;
   var menuBgCol;
   var blackCol;
   var whiteCol;
   var currentMenu;
   var ERRORMESSAGE;
   var column0;
   var column1;
   var column2;
   var crewImgLoaderMC;
   var charImgLoaderMC;
   var currentSelection;
   var STORE_TYPE = 7;
   var maxCol = 2;
   var columnYpos = 121;
   var _highlighted = false;
   var gfxFileName = "PAUSE_MENU_STORE_CONTENT";
   var detailsXPositions = [876,826,784];
   var showChar = false;
   var showCrew = false;
   var imgSize = 37;
   function ECOMMERCE_STORE()
   {
      super();
      _global.gfxExtensions = true;
   }
   function INITIALISE(mc)
   {
      this.TIMELINE = mc;
      this.CONTENT = this.TIMELINE.attachMovie("CONTENT","CONTENT",this.TIMELINE.getNextHighestDepth(),{_visible:false});
      this.BOUNDING_BOX = this.TIMELINE.attachMovie("BOUNDING_BOX","BOUNDING_BOX",this.TIMELINE.getNextHighestDepth());
      this.BOUNDING_BOX._visible = false;
      var _loc6_ = 105;
      var _loc5_ = 10;
      this.HEADER = this.CONTENT.attachMovie("header","HEADER",this.CONTENT.getNextHighestDepth(),{_x:31,_y:_loc5_});
      this.columnYpos = _loc6_ + _loc5_;
      this.HEADER.platformLogo._visible = false;
      this.HEADER.shopLogosMC._visible = false;
      var _loc2_ = 0;
      while(_loc2_ < 4)
      {
         this.HEADER["headerItem" + _loc2_]._visible = false;
         _loc2_ = _loc2_ + 1;
      }
      this.detailsMC = this.HEADER.alldetailsMC.detailsMC;
      this.charMC = this.HEADER.alldetailsMC.charMC;
      this.crewMC = this.HEADER.alldetailsMC.crewMC;
      var _loc4_ = new com.rockstargames.ui.utils.HudColour();
      var _loc3_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc4_);
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG,_loc3_);
      if(this.detailsMC != undefined)
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.detailsMC,_loc4_.r,_loc4_.g,_loc4_.b,_loc4_.a);
      }
      com.rockstargames.ui.utils.Colour.Colourise(this.crewMC.bgMC,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
      com.rockstargames.ui.utils.Colour.Colourise(this.charMC.bgMC,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
      this.bgCol = [11,55,123];
      this.textCol = [255,255,255];
      this.headerCol = this.bgCol;
      this.menuBgCol = [0,0,0,50];
      this.blackCol = [0,0,0,100];
      this.whiteCol = [255,255,255,100];
      this.adjustHeaderPositions();
      this.SET_CHAR_IMG("","",false);
      this.SET_CREW_IMG("","",false);
   }
   function getHudColours()
   {
      var _loc5_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLUEDARK,_loc5_);
      this.textCol[0] = _loc5_.r;
      this.textCol[1] = _loc5_.g;
      this.textCol[2] = _loc5_.b;
      var _loc2_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG,_loc2_);
      this.menuBgCol[0] = _loc2_.r;
      this.menuBgCol[1] = _loc2_.g;
      this.menuBgCol[2] = _loc2_.b;
      this.menuBgCol[3] = _loc2_.a;
      var _loc3_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK,_loc3_);
      this.blackCol[0] = _loc3_.r;
      this.blackCol[1] = _loc3_.g;
      this.blackCol[2] = _loc3_.b;
      var _loc4_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc4_);
      this.whiteCol[0] = _loc4_.r;
      this.whiteCol[1] = _loc4_.g;
      this.whiteCol[2] = _loc4_.b;
   }
   function BUILD_MENU(menuIndex)
   {
   }
   function MENU_STATE(menuIndex)
   {
      this.getHudColours();
      this.currentMenu = menuIndex;
      var _loc2_ = 0;
      while(_loc2_ < 3)
      {
         if(this.CONTENT["column" + _loc2_] != undefined)
         {
            this.CONTENT["column" + _loc2_].removeMovieClip();
         }
         _loc2_ = _loc2_ + 1;
      }
      if(this.ERRORMESSAGE != undefined)
      {
         this.ERRORMESSAGE.removeMovieClip();
      }
      if(this.HEADER._visible == false)
      {
         this.HEADER._visible = true;
      }
      this.column0 = this.CONTENT.attachMovie("verticalMenuList","column0",this.CONTENT.getNextHighestDepth() + 100,{_x:31,_y:this.columnYpos,_visible:false});
      this.column1 = this.CONTENT.attachMovie("contentImageList","column1",this.CONTENT.getNextHighestDepth() + 200,{_x:321,_y:this.columnYpos,_visible:false});
      this.column2 = this.CONTENT.attachMovie("DetailsList","column2",this.CONTENT.getNextHighestDepth() + 300,{_x:611,_y:this.columnYpos,_visible:false});
      this.column2.UPDATE_STATUS_COLOURS(this.bgCol,this.textCol);
      _loc2_ = 0;
      while(_loc2_ < 3)
      {
         this.HEADER["headerItem" + _loc2_]._visible = true;
         _loc2_ = _loc2_ + 1;
      }
      this.HEADER.headerItem3._visible = false;
      this.maxCol = 1;
      this.column0 = this.CONTENT.column0;
      this.column0.SETUP_COLUMN(this.column0,this.menuBgCol,this.blackCol,this.whiteCol);
      if(this.column1 != undefined)
      {
         this.column1 = this.CONTENT.column1;
         this.column1.SETUP_COLUMN(this.column1,this.menuBgCol,this.blackCol,this.whiteCol);
         this.column1.SET_FOCUS(false);
      }
      if(this.column2 != undefined)
      {
         this.column2 = this.CONTENT.column2;
         this.column2.SETUP_COLUMN(this.column2,this.menuBgCol,this.blackCol,this.whiteCol);
         this.column2.SET_FOCUS(false);
      }
      this.SET_HEADER_COLOUR();
      com.rockstargames.ui.game.GameInterface.call("LOAD_PAUSE_MENU_STORE_CONTENT",this.STORE_TYPE,this.currentMenu);
   }
   function REMOVE_COLUMN(_column)
   {
      this.SET_DATA_SLOT_EMPTY(_column);
   }
   function SET_DATA_SLOT_EMPTY(_column, _slot)
   {
      this.CONTENT["column" + _column].SET_DATA_EMPTY(_slot);
   }
   function SET_DATA_SLOT()
   {
      var _loc3_ = new Array();
      _loc3_ = arguments;
      var _loc5_ = arguments[0];
      var _loc4_ = arguments[1];
      _loc3_ = arguments.slice(2);
      this.CONTENT["column" + _loc5_].SET_DATA(_loc4_,_loc3_);
   }
   function DISPLAY_DATA_SLOT(_column)
   {
      if(this.CONTENT._visible == false)
      {
         this.CONTENT._visible = true;
      }
      this.CONTENT["column" + _column].REDRAW();
   }
   function UPDATE_DATA_SLOT(_column, _slotIndex)
   {
      this.SET_DATA_SLOT(arguments);
   }
   function HIDE_COLUMN2(vis)
   {
      this.CONTENT.column2._visible = vis;
   }
   function SET_HEADER_COLOUR()
   {
      var _loc3_ = arguments;
      if(_loc3_[0] != undefined)
      {
         this.headerCol = [_loc3_[0],_loc3_[1],_loc3_[2]];
      }
      this.colouriseHeader();
   }
   function SET_STATUS_COLOURS()
   {
      var _loc3_ = arguments;
      if(_loc3_[0] != undefined)
      {
         this.bgCol = [_loc3_[0],_loc3_[1],_loc3_[2]];
      }
      if(_loc3_[3] != undefined)
      {
         this.textCol = [_loc3_[3],_loc3_[4],_loc3_[5]];
      }
      if(this.currentMenu == 1)
      {
         this.CONTENT.column2.UPDATE_STATUS_COLOURS(this.bgCol,this.textCol);
      }
   }
   function SET_CONTENTIMAGE_SIZE(_visItems)
   {
      if(this.currentMenu == 1 && _visItems != undefined)
      {
         this.CONTENT.column1.UPDATE_CONTENTIMAGE_SIZE(_visItems);
      }
   }
   function SET_HEADER_TITLE(str)
   {
      this.HEADER.headingMC.headingTF.text = str;
   }
   function SET_COLUMN_TITLE(columnIndex, str)
   {
      this.SET_MENU_HEADER_TEXT(columnIndex,str);
   }
   function SET_MENU_HEADER_TEXT(columnIndex, str)
   {
      this.HEADER["headerItem" + columnIndex].labelMC.labelTF.text = str;
      this.HEADER["headerItem" + columnIndex]._visible = true;
   }
   function SET_HEADING_DETAILS(str1, str2, str3, isSingleplayer, crewname)
   {
      var _loc2_ = this.detailsMC;
      _loc2_.details1TF.autoSize = _loc2_.details1condTF.autoSize = "left";
      _loc2_.details1TF.wordWrap = _loc2_.details1condTF.wordWrap = false;
      _loc2_.details1TF.multiline = _loc2_.details1condTF.multiline = false;
      if(isSingleplayer)
      {
         _loc2_.details1condTF.text = "";
         _loc2_.details1TF.text = str1.toUpperCase();
      }
      else
      {
         _loc2_.details1condTF.text = "";
         _loc2_.details1TF.text = str1;
      }
      _loc2_.details1TF._x = - _loc2_.details1TF._width;
      _loc2_.details1condTF._x = - _loc2_.details1condTF._width;
      if(str2 != undefined)
      {
         var _loc7_ = str2.split(":").length > 1;
         if(!_loc7_)
         {
            _loc2_.details2TF.text = str2;
            _loc2_.details2TF.autoSize = "left";
            _loc2_.details2TF.wordWrap = false;
            _loc2_.details2TF.multiline = false;
            _loc2_.details2TF._x = - _loc2_.details2TF._width;
            _loc2_.timeTF.text = "";
         }
         else
         {
            var _loc3_ = str2.split(" ");
            var _loc5_ = _loc3_[_loc3_.length - 1];
            _loc3_.pop();
            var _loc6_ = _loc3_.join(" ");
            _loc2_.timeTF.text = _loc5_;
            _loc2_.timeTF.autoSize = "left";
            _loc2_.timeTF.wordWrap = false;
            _loc2_.timeTF.multiline = false;
            _loc2_.timeTF._x = - _loc2_.timeTF._width + 1;
            _loc2_.details2TF.text = _loc6_;
            _loc2_.details2TF.autoSize = "left";
            _loc2_.details2TF.wordWrap = false;
            _loc2_.details2TF.multiline = false;
            _loc2_.details2TF._x = _loc2_.timeTF._x - _loc2_.details2TF._width - 1;
         }
      }
      if(str3 != undefined)
      {
         _loc2_.details3TF.text = str3;
         _loc2_.details3TF.autoSize = "left";
         _loc2_.details3TF.wordWrap = false;
         _loc2_.details3TF.multiline = false;
         _loc2_.details3TF._x = - _loc2_.details3TF._width;
      }
   }
   function SET_CREW_IMG(txd, crewTexturePath, show)
   {
      this.showCrew = show;
      if(this.showCrew)
      {
         if(txd != "")
         {
            if(this.crewImgLoaderMC == undefined)
            {
               this.crewImgLoaderMC = com.rockstargames.ui.media.ImageLoaderMC(this.crewMC.attachMovie("txdLoader","crewsImageMC",this.crewMC.getNextHighestDepth(),{_x:- this.imgSize}));
            }
            if(this.crewImgLoaderMC.isLoaded == true)
            {
               this.crewImgLoaderMC.removeTxdRef();
            }
            this.crewImgLoaderMC.init(this.gfxFileName,txd,crewTexturePath,this.imgSize,this.imgSize);
            var _loc3_ = 3;
            var _loc2_ = String(this.crewImgLoaderMC).split(".");
            var _loc4_ = _loc2_.slice(_loc2_.length - _loc3_).join(".");
            this.crewImgLoaderMC.addTxdRef(_loc4_,this.loadedCrewImg,this);
            this.crewImgLoaderMC._alpha = 0;
         }
         this.crewMC._visible = true;
      }
      else
      {
         this.crewMC._visible = false;
      }
      this.adjustHeaderPositions();
   }
   function loadedCrewImg()
   {
      var _loc2_ = 0.2;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.crewImgLoaderMC,_loc2_,{_alpha:100});
   }
   function SET_CHAR_IMG(txd, charTexturePath, show)
   {
      this.showChar = show;
      if(this.showChar)
      {
         if(txd != "")
         {
            if(this.charImgLoaderMC == undefined)
            {
               this.charImgLoaderMC = com.rockstargames.ui.media.ImageLoaderMC(this.charMC.attachMovie("txdLoader","charImageMC",this.charMC.getNextHighestDepth(),{_x:- this.imgSize}));
            }
            if(this.charImgLoaderMC.isLoaded == true)
            {
               this.charImgLoaderMC.removeTxdRef();
            }
            this.charImgLoaderMC.init(this.gfxFileName,txd,charTexturePath,this.imgSize,this.imgSize);
            var _loc3_ = 3;
            var _loc2_ = String(this.charImgLoaderMC).split(".");
            var _loc4_ = _loc2_.slice(_loc2_.length - _loc3_).join(".");
            this.charImgLoaderMC.addTxdRef(_loc4_,this.loadedCharImg,this);
            this.charImgLoaderMC._alpha = 0;
         }
         this.charMC._visible = true;
      }
      else
      {
         this.charMC._visible = false;
      }
      this.adjustHeaderPositions();
   }
   function loadedCharImg()
   {
      var _loc2_ = 0.2;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.charImgLoaderMC,_loc2_,{_alpha:100});
   }
   function adjustHeaderPositions()
   {
      var _loc2_ = 4;
      if(this.showChar == false && this.showCrew == false)
      {
         this.detailsMC._x = this.detailsXPositions[0];
      }
      else if(this.showChar == false && this.showCrew == true)
      {
         this.crewMC._x = this.detailsXPositions[0];
         this.detailsMC._x = this.detailsXPositions[1] - _loc2_;
      }
      else if(this.showChar == true && this.showCrew == false)
      {
         this.charMC._x = this.detailsXPositions[0];
         this.detailsMC._x = this.detailsXPositions[1] - _loc2_;
      }
      else if(this.showChar == true && this.showCrew == true)
      {
         this.charMC._x = this.detailsXPositions[0];
         this.crewMC._x = this.detailsXPositions[1];
         this.detailsMC._x = this.detailsXPositions[2] - _loc2_;
      }
   }
   function SHOW_PLAYSTATION_LOGO(vis)
   {
      this.HEADER.platformLogo._visible = vis;
   }
   function SET_SHOP_LOGO(_logo)
   {
      if(_logo > 0)
      {
         var _loc2_ = "logo" + _logo.toString();
         this.HEADER.shopLogosMC.gotoAndStop(_loc2_);
         this.SHOW_SHOP_LOGO(true);
      }
      else
      {
         this.SHOW_SHOP_LOGO(false);
      }
   }
   function SHOW_SHOP_LOGO(vis)
   {
      this.HEADER.shopLogosMC._visible = vis;
   }
   function SET_DESCRIPTION(column, priceTitle, itemPrice, numPlayers, statusText, statusColour, priceVis, playersVis, statusVis)
   {
      if(this.currentMenu == 1)
      {
         this.column2.SET_DESCRIPTION(priceTitle,itemPrice,numPlayers,statusText,statusColour,priceVis,playersVis,statusVis);
      }
   }
   function HIGHLIGHT_ITEM(_column, _itemIndex)
   {
      this.HIGHLIGHT_COLUMN(_column);
      this.CONTENT["column" + _column].highlightItem(_itemIndex);
   }
   function HIGHLIGHT_COLUMN(_column)
   {
      if(_column != undefined)
      {
         var _loc3_ = undefined;
         var _loc2_ = 0;
         while(_loc2_ < 2)
         {
            _loc3_ = "column" + _loc2_;
            if(_loc2_ == _column)
            {
               if(this.CONTENT[_loc3_] != undefined)
               {
                  this.CONTENT[_loc3_].SET_FOCUS(true);
               }
            }
            else if(this.CONTENT[_loc3_] != undefined && _loc2_ != 0)
            {
               this.CONTENT[_loc3_].SET_FOCUS(false);
            }
            _loc2_ = _loc2_ + 1;
         }
         if(this.currentMenu == 1 && _column == 1)
         {
            if(this.CONTENT.column2 != undefined)
            {
               this.CONTENT.column2.SET_FOCUS(true);
            }
         }
         else if(this.currentMenu == 1 && _column == 0)
         {
            if(this.CONTENT.column2 != undefined)
            {
               this.CONTENT.column2.SET_FOCUS(false);
            }
         }
         if(this.CONTENT[_loc3_] != undefined)
         {
            this.CONTENT[_loc3_].CURRENT_COLUMN(_column);
         }
         this.currentColumn = _column;
         this.colouriseHeader();
      }
   }
   function GET_CURRENT_SELECTION(_column)
   {
      var _loc3_ = undefined;
      if(_column == undefined)
      {
         _loc3_ = this.GET_CURRENT_COLUMN();
      }
      else
      {
         _loc3_ = _column;
      }
      var _loc2_ = "column" + _loc3_;
      this.currentSelection = this.CONTENT[_loc2_].GET_CURRENT_SELECTION();
      if(this.currentSelection == -1 && this.CONTENT[_loc2_].data.length > 0)
      {
         this.currentSelection = 0;
      }
      return this.currentSelection;
   }
   function GET_CURRENT_START_INDEX(_column)
   {
      var _loc3_ = undefined;
      if(_column == undefined)
      {
         _loc3_ = 1;
      }
      else
      {
         _loc3_ = _column;
      }
      var _loc4_ = "column" + _loc3_;
      var _loc2_ = this.CONTENT[_loc4_].arrayStartPoint;
      if(_loc2_ == undefined || _loc2_ == NaN)
      {
         _loc2_ = -1;
      }
      return _loc2_;
   }
   function GET_CURRENT_END_INDEX(_column)
   {
      var _loc3_ = undefined;
      if(_column == undefined)
      {
         _loc3_ = 1;
      }
      else
      {
         _loc3_ = _column;
      }
      var _loc4_ = "column" + _loc3_;
      var _loc2_ = this.CONTENT[_loc4_].endIndex;
      if(_loc2_ == undefined || _loc2_ == NaN)
      {
         _loc2_ = -1;
      }
      return _loc2_;
   }
   function GET_CURRENT_COLUMN()
   {
      return this.currentColumn;
   }
   function DISPLAY_ERROR_MESSAGE(titleStr, msgStr)
   {
      this.HEADER._visible = false;
      this.column0._visible = false;
      if(this.column1 != undefined)
      {
         this.column1._visible = false;
      }
      if(this.column2 != undefined)
      {
         this.column2._visible = false;
      }
      this.ERRORMESSAGE = this.CONTENT.attachMovie("errorMessage","errorMessage",this.CONTENT.getNextHighestDepth());
      this.ERRORMESSAGE.errorHeaderTF.text = titleStr;
      this.ERRORMESSAGE.errorMessageTF.text = msgStr;
   }
   function colouriseHeader()
   {
      var _loc6_ = this.headerCol[0];
      var _loc7_ = this.headerCol[1];
      var _loc5_ = this.headerCol[2];
      com.rockstargames.ui.utils.Colour.Colourise(this.HEADER.headingMC,this.whiteCol[0],this.whiteCol[1],this.whiteCol[2],100);
      if(this.HEADER.headerItem3.tabMC != undefined)
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.HEADER.headerItem3.tabMC,_loc6_,_loc7_,_loc5_,100);
      }
      if(this.HEADER.headerItem3.bgMC != undefined)
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.HEADER.headerItem3.bgMC,this.whiteCol[0],this.whiteCol[1],this.whiteCol[2],100);
      }
      if(this.HEADER.headerItem3.labelMC != undefined)
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.HEADER.headerItem3.labelMC,0,0,0,100);
      }
      var _loc4_ = 0;
      while(_loc4_ < 3)
      {
         var _loc2_ = this.HEADER["headerItem" + _loc4_];
         if(_loc2_.tabMC != undefined)
         {
            com.rockstargames.ui.utils.Colour.Colourise(_loc2_.tabMC,_loc6_,_loc7_,_loc5_,100);
         }
         if(_loc4_ == this.currentColumn)
         {
            _loc2_.tabMC._visible = true;
            if(_loc2_.bgMC != undefined)
            {
               com.rockstargames.ui.utils.Colour.Colourise(_loc2_.bgMC,this.whiteCol[0],this.whiteCol[1],this.whiteCol[2],100);
            }
            if(_loc2_.labelMC != undefined)
            {
               com.rockstargames.ui.utils.Colour.Colourise(_loc2_.labelMC,0,0,0,100);
            }
         }
         else if(this.currentMenu == 1 && this.currentColumn == 1 && _loc4_ == 2)
         {
            _loc2_.tabMC._visible = true;
            if(_loc2_.bgMC != undefined)
            {
               com.rockstargames.ui.utils.Colour.Colourise(_loc2_.bgMC,this.whiteCol[0],this.whiteCol[1],this.whiteCol[2],100);
            }
            if(_loc2_.labelMC != undefined)
            {
               com.rockstargames.ui.utils.Colour.Colourise(_loc2_.labelMC,0,0,0,100);
            }
         }
         else
         {
            _loc2_.tabMC._visible = false;
            var _loc3_ = new com.rockstargames.ui.utils.HudColour();
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG,_loc3_);
            if(_loc2_.bgMC != undefined)
            {
               com.rockstargames.ui.utils.Colour.Colourise(_loc2_.bgMC,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
            }
            if(_loc2_.labelMC != undefined)
            {
               com.rockstargames.ui.utils.Colour.Colourise(_loc2_.labelMC,this.whiteCol[0],this.whiteCol[1],this.whiteCol[2],50);
            }
         }
         _loc4_ = _loc4_ + 1;
      }
   }
   function SHUTDOWN_MOVIE()
   {
      if(this.column0 != undefined)
      {
         this.column0._visible = false;
      }
      if(this.column1 != undefined)
      {
         this.column1._visible = false;
      }
      if(this.column2 != undefined)
      {
         this.column2._visible = false;
      }
      this.CONTENT.column1.clearTXDs();
      if(this.column0 != undefined)
      {
         this.SET_DATA_SLOT_EMPTY(0);
      }
      if(this.column1 != undefined)
      {
         this.SET_DATA_SLOT_EMPTY(1);
      }
      if(this.column2 != undefined)
      {
         this.SET_DATA_SLOT_EMPTY(2);
      }
      this.HEADER.removeMovieClip();
   }
   function SET_INPUT_EVENT(direction)
   {
      switch(direction)
      {
         case com.rockstargames.ui.game.GamePadConstants.DPADUP:
            this.CONTENT["column" + this.currentColumn].SET_INPUT_EVENT(direction);
            break;
         case com.rockstargames.ui.game.GamePadConstants.DPADRIGHT:
            if(this.currentColumn < this.maxCol)
            {
               this.CONTENT["column" + this.currentColumn].SET_FOCUS(false);
               this.currentColumn = this.currentColumn + 1;
               this.CONTENT["column" + this.currentColumn].SET_FOCUS(true);
               this.HIGHLIGHT_COLUMN(this.currentColumn);
               com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"SELECT","HUD_FRONTEND_DEFAULT_SOUNDSET");
            }
            break;
         case com.rockstargames.ui.game.GamePadConstants.DPADDOWN:
            this.CONTENT["column" + this.currentColumn].SET_INPUT_EVENT(direction);
            break;
         case com.rockstargames.ui.game.GamePadConstants.DPADLEFT:
            if(this.currentColumn > 0)
            {
               this.CONTENT["column" + this.currentColumn].SET_FOCUS(false);
               this.currentColumn = this.currentColumn - 1;
               this.CONTENT["column" + this.currentColumn].SET_FOCUS(true);
               this.HIGHLIGHT_COLUMN(this.currentColumn);
               com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"BACK","HUD_FRONTEND_DEFAULT_SOUNDSET");
            }
      }
   }
   function SET_INPUT_EVENT_CIRCLE()
   {
      if(this.currentColumn > 0)
      {
         this.currentColumn = this.currentColumn - 1;
         this.HIGHLIGHT_COLUMN(this.currentColumn);
         com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"BACK","HUD_FRONTEND_DEFAULT_SOUNDSET");
      }
   }
   function SET_INPUT_EVENT_CROSS()
   {
      if(this.column1 != undefined)
      {
         this.column1.REDRAW();
      }
      if(this.column2 != undefined)
      {
         this.column2.REDRAW();
      }
      com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"SELECT","HUD_FRONTEND_DEFAULT_SOUNDSET");
   }
   function SET_ANALOG_STICK_INPUT(isLeftStick, inputX, inputY)
   {
      if(this.currentMenu == 1)
      {
         if(isLeftStick == false)
         {
            if(Math.abs(inputY) > 40)
            {
               var _loc2_ = com.rockstargames.ui.game.GamePadConstants.DPADUP;
               if(inputY > 0)
               {
                  _loc2_ = com.rockstargames.ui.game.GamePadConstants.DPADDOWN;
               }
               this.CONTENT.column2.SET_INPUT_EVENT(_loc2_);
            }
         }
      }
   }
   function ADD_TXD_REF_RESPONSE(textureDict, uniqueID, success)
   {
      com.rockstargames.ui.utils.Debug.log("uniqueID --------------->> " + uniqueID);
      if(this.currentMenu == 1)
      {
         this.CONTENT.column1.ADD_TXD_REF_RESPONSE(textureDict,uniqueID,success);
      }
   }
   function traceOut(str)
   {
      trace(str);
   }
}
