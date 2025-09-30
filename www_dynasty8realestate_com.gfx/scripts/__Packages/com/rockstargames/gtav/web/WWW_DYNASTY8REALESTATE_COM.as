class com.rockstargames.gtav.web.WWW_DYNASTY8REALESTATE_COM extends com.rockstargames.ui.core.BaseWebsite
{
   var CAN_STORE_PAGE;
   var CONTENT;
   var MapMC;
   var PAGE_NAMES;
   var _name;
   var browser;
   var dataProviderUI;
   var dataTextScope;
   var defaultButtonOffColour;
   var defaultButtonOnColour;
   var displayConfig;
   var filterChange;
   var headerMC;
   var interiorMC;
   var intervalId;
   var locationArray;
   var locationChange;
   var mcScope;
   var pageName;
   var pinHitArea;
   var pinNumber;
   var priceArray;
   var propLocArray;
   var propertyArray;
   var propertyButtonContainer;
   var propertyMC;
   var sizeArray;
   var sortChange;
   var sortedPropertyArray;
   var visiblePropertyIDs;
   var firstRun = true;
   var lastPinClicked = 0;
   var bottomLine = 0;
   var newHeight = 0;
   var comeFromAnotherPage = false;
   var textColBlack = 0;
   var textColWhite = 16777215;
   var textColGrey = 7303023;
   var textColYellow = 16763955;
   var textColLightGreen = 13820632;
   var textColGreen = 1667132;
   var textColDarkGreen = 1067559;
   var resultsString = "";
   var forceTopOfList = false;
   var buyTextString = "";
   var highEnd = 0;
   var medEnd = 0;
   var lowEnd = 0;
   var downtown = 0;
   var northls = 0;
   var southls = 0;
   var eastls = 0;
   var westls = 0;
   var blaine = 0;
   var noLocation = 0;
   var currentIndex = 0;
   var currentTint = 0;
   var useTints = false;
   static var NUM_INTERIOR_OPTIONS = 8;
   static var NUM_INTERIOR_TINTS = 12;
   function WWW_DYNASTY8REALESTATE_COM()
   {
      super();
      _global.gfxExtensions = true;
      this._name = "WWW_DYNASTY8REALESTATE_COM";
      this.IS_SITE_DYNAMIC = 0;
      _level0.TIMELINE.DebugTextContent = true;
      this.PAGE_NAMES = new Array();
      this.PAGE_NAMES[1] = "PAGE1";
      this.PAGE_NAMES[2] = "LOS_D_SANTOS";
      this.PAGE_NAMES[4] = "PURCHASE";
      this.PAGE_NAMES[5] = "GETDIRECTIONS";
      this.PAGE_NAMES[21] = "PROPERTY_D_DETAILS";
      this.PAGE_NAMES[22] = "PURCHASE_D_FAILED";
      this.PAGE_NAMES[23] = "PURCHASE_D_ERROR";
      this.PAGE_NAMES[24] = "PURCHASE_D_CONFIRM";
      this.PAGE_NAMES[25] = "MAINTENANCE";
      this.PAGE_NAMES[26] = "PURCHASE_D_SUCCESS";
      this.PAGE_NAMES[27] = "PROPERTY_D_INTERIORS";
      this.CAN_STORE_PAGE = new Array();
      this.CAN_STORE_PAGE[1] = true;
      this.CAN_STORE_PAGE[2] = true;
      this.CAN_STORE_PAGE[3] = false;
      this.CAN_STORE_PAGE[4] = false;
      this.CAN_STORE_PAGE[5] = true;
      this.CAN_STORE_PAGE[6] = false;
      this.CAN_STORE_PAGE[7] = false;
      this.CAN_STORE_PAGE[8] = false;
      this.CAN_STORE_PAGE[9] = false;
      this.CAN_STORE_PAGE[10] = false;
      this.CAN_STORE_PAGE[11] = false;
      this.CAN_STORE_PAGE[12] = false;
      this.CAN_STORE_PAGE[13] = false;
      this.CAN_STORE_PAGE[14] = false;
      this.CAN_STORE_PAGE[15] = false;
      this.CAN_STORE_PAGE[16] = false;
      this.CAN_STORE_PAGE[17] = false;
      this.CAN_STORE_PAGE[18] = false;
      this.CAN_STORE_PAGE[19] = false;
      this.CAN_STORE_PAGE[20] = false;
      this.CAN_STORE_PAGE[21] = false;
      this.CAN_STORE_PAGE[22] = false;
      this.CAN_STORE_PAGE[23] = false;
      this.CAN_STORE_PAGE[24] = false;
      this.CAN_STORE_PAGE[25] = true;
      this.CAN_STORE_PAGE[26] = true;
      this.CAN_STORE_PAGE[27] = false;
      this.browser = _level0.TIMELINE;
      this.propertyArray = new Array();
      this.sortedPropertyArray = new Array();
      this.sizeArray = new Array();
      this.sizeArray.push({sizeAll:true,sizeHigh:false,sizeMed:false,sizeLow:false,sizeNew:false});
      this.priceArray = new Array();
      this.priceArray.push({priceLowToHigh:false,priceHighToLow:true});
      this.locationArray = new Array();
      this.locationArray.push({locationDowntown:true,locationEastLS:true,locationWestLS:true,locationNorthLS:true,locationSouthLS:true,locationBlaineCounty:true});
      this.propLocArray = new Array(false,"DYN_LOC_NORTHLS","DYN_LOC_DOWNTOWN","DYN_LOC_WESTLS","DYN_LOC_EASTLS","DYN_LOC_SOUTHLS","DYN_LOC_BLAINE");
      this.visiblePropertyIDs = [];
   }
   function READY()
   {
      this.displayConfig = this.browser.getConfig();
   }
   function goToAnchor(AnchorLink)
   {
      var _loc2_ = new Array();
      _loc2_ = AnchorLink.split("_");
      if(_loc2_[0] != "OPTION")
      {
         this.pinNumber = parseInt(_loc2_[1]);
      }
      if(_loc2_[0] == "PURCHASE")
      {
         this.browser.GO_TO_WEBPAGE("PURCHASE");
      }
      else if(_loc2_[0] == "OPTION")
      {
         this.currentIndex = parseInt(_loc2_[1]);
         this.updateOptions(this.currentIndex,this.currentTint);
      }
      else if(_loc2_[0] == "TINT")
      {
         this.currentTint = parseInt(_loc2_[1]);
         this.updateOptions(this.currentIndex,this.currentTint);
      }
      var _loc4_;
      var _loc3_;
      var _loc10_;
      if(_loc2_[0] == "pin")
      {
         this.browser.SET_CURRENT_SELECTION(this.pinNumber);
         if(this.lastPinClicked != this.pinNumber)
         {
            _loc4_ = this.propertyButtonContainer["property_" + this.lastPinClicked];
            if(_loc4_ != undefined)
            {
               _loc4_.propertyListTextMC.propertyTF.textColor = this.textColGrey;
               _loc4_.propertyListTextMC.locationTF.textColor = this.textColGrey;
               _loc4_.propertyListTextMC.priceTF.textColor = this.textColGrey;
               _loc4_.propertyListTextMC.carIcon._alpha = 44;
               _loc4_.highlight._visible = false;
               this.mcScope.MapContainer.map.pinContainer["pin_" + this.lastPinClicked].pin_highlight._alpha = 0;
               if(_loc4_.buyMC != undefined)
               {
                  _loc4_.buyMC.removeMovieClip();
               }
            }
            _loc3_ = this.propertyButtonContainer["property_" + this.pinNumber];
            if(_loc3_ != undefined)
            {
               _loc3_.propertyListTextMC.propertyTF.textColor = this.textColBlack;
               _loc3_.propertyListTextMC.locationTF.textColor = this.textColBlack;
               _loc3_.propertyListTextMC.priceTF.textColor = this.textColBlack;
               _loc3_.propertyListTextMC.carIcon._alpha = 100;
               _loc3_.highlight._visible = true;
               if(_loc3_.buyMC == undefined)
               {
                  _loc10_ = _loc3_.attachMovie("buyMC","buyMC",_loc3_.getNextHighestDepth(),{_x:236,_y:171.5});
                  if(this.buyTextString == "")
                  {
                     com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc3_.buyMC.buyTF,"DYN_BUY",0,true);
                     this.buyTextString = _loc3_.buyMC.buyTF.htmlText;
                  }
                  _loc3_.buyMC.buyTF.htmlText = this.buyTextString;
                  _loc3_.buyMC.buyTF.textAutoSize = "shrink";
               }
            }
            this.mcScope.MapContainer.map.zoomScale = 250;
            this.mcScope.MapContainer.map.zoomInOnPin(this.pinNumber,this.comeFromAnotherPage);
            this.scrollListingsPage(_loc3_._y,this.comeFromAnotherPage);
            this.comeFromAnotherPage = false;
            this.lastPinClicked = this.pinNumber;
         }
         else
         {
            this.browser.GO_TO_WEBPAGE("PROPERTY_D_DETAILS");
         }
      }
      if(_loc2_[0] == "property")
      {
         if(this.lastPinClicked != this.pinNumber)
         {
            _loc4_ = this.propertyButtonContainer["property_" + this.lastPinClicked];
            if(_loc4_ != undefined)
            {
               _loc4_.propertyListTextMC.propertyTF.textColor = this.textColGrey;
               _loc4_.propertyListTextMC.locationTF.textColor = this.textColGrey;
               _loc4_.propertyListTextMC.priceTF.textColor = this.textColGrey;
               _loc4_.propertyListTextMC.carIcon._alpha = 44;
               _loc4_.highlight._visible = false;
               this.mcScope.MapContainer.map.pinContainer["pin_" + this.lastPinClicked].pin_highlight._alpha = 0;
               if(_loc4_.buyMC != undefined)
               {
                  _loc4_.buyMC.removeMovieClip();
               }
            }
            _loc3_ = this.propertyButtonContainer["property_" + this.pinNumber];
            if(_loc3_ != undefined)
            {
               _loc3_.propertyListTextMC.propertyTF.textColor = this.textColBlack;
               _loc3_.propertyListTextMC.locationTF.textColor = this.textColBlack;
               _loc3_.propertyListTextMC.priceTF.textColor = this.textColBlack;
               _loc3_.propertyListTextMC.carIcon._alpha = 100;
               _loc3_.highlight._visible = true;
               if(_loc3_.buyMC == undefined)
               {
                  _loc10_ = _loc3_.attachMovie("buyMC","buyMC",_loc3_.getNextHighestDepth(),{_x:236,_y:171.5});
                  if(this.buyTextString == "")
                  {
                     com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc3_.buyMC.buyTF,"DYN_BUY",0,true);
                     this.buyTextString = _loc3_.buyMC.buyTF.htmlText;
                  }
                  _loc3_.buyMC.buyTF.htmlText = this.buyTextString;
                  _loc3_.buyMC.buyTF.textAutoSize = "shrink";
               }
            }
            this.mcScope.MapContainer.map.zoomScale = 250;
            this.mcScope.MapContainer.map.zoomInOnPin(this.pinNumber,this.comeFromAnotherPage);
            this.scrollListingsPage(_loc3_._y,this.comeFromAnotherPage);
            this.comeFromAnotherPage = false;
            this.lastPinClicked = this.pinNumber;
         }
         else
         {
            this.browser.GO_TO_WEBPAGE("PROPERTY_D_DETAILS");
         }
      }
      if(_loc2_[0] == "zoomIn")
      {
         if(this.mcScope.MapContainer.map.zoomScale < 250)
         {
            this.mcScope.MapContainer.map.zoomScale += 50;
            this.mcScope.MapContainer.map.zoomInOnPin(this.lastPinClicked,false);
         }
      }
      if(_loc2_[0] == "zoomOut")
      {
         if(this.mcScope.MapContainer.map.zoomScale > 50)
         {
            this.mcScope.MapContainer.map.zoomScale -= 50;
            this.mcScope.MapContainer.map.zoomInOnPin(this.lastPinClicked,false);
         }
      }
      if(_loc2_[0] == "mapUP")
      {
         this.mcScope.MapContainer.map.move("up");
      }
      if(_loc2_[0] == "mapDOWN")
      {
         this.mcScope.MapContainer.map.move("down");
      }
      if(_loc2_[0] == "mapLEFT")
      {
         this.mcScope.MapContainer.map.move("left");
      }
      if(_loc2_[0] == "mapRIGHT")
      {
         this.mcScope.MapContainer.map.move("right");
      }
      this.filterChange = false;
      this.sortChange = false;
      this.locationChange = false;
      var _loc7_;
      var _loc6_;
      if(_loc2_[0] == "sizeAll" || _loc2_[0] == "sizeHigh" || _loc2_[0] == "sizeMed" || _loc2_[0] == "sizeLow" || _loc2_[0] == "sizeNew")
      {
         switch(_loc2_[0])
         {
            case "sizeAll":
               if(this.sizeArray[0].sizeAll == false)
               {
                  this.filterChange = true;
               }
               this.sizeArray[0].sizeAll = true;
               this.sizeArray[0].sizeHigh = false;
               this.sizeArray[0].sizeMed = false;
               this.sizeArray[0].sizeLow = false;
               this.sizeArray[0].sizeNew = false;
               _loc7_ = this.locationArray[0].locationDowntown + this.locationArray[0].locationEastLS + this.locationArray[0].locationWestLS + this.locationArray[0].locationNorthLS + this.locationArray[0].locationSouthLS + this.locationArray[0].locationBlaineCounty;
               this.locationArray[0].locationDowntown = true;
               this.locationArray[0].locationEastLS = true;
               this.locationArray[0].locationWestLS = true;
               this.locationArray[0].locationNorthLS = true;
               this.locationArray[0].locationSouthLS = true;
               this.locationArray[0].locationBlaineCounty = true;
               _loc6_ = this.locationArray[0].locationDowntown + this.locationArray[0].locationEastLS + this.locationArray[0].locationWestLS + this.locationArray[0].locationNorthLS + this.locationArray[0].locationSouthLS + this.locationArray[0].locationBlaineCounty;
               if(_loc7_ != _loc6_)
               {
                  this.filterChange = true;
               }
               break;
            case "sizeHigh":
               if(this.sizeArray[0].sizeHigh == false)
               {
                  this.filterChange = true;
               }
               this.sizeArray[0].sizeAll = false;
               this.sizeArray[0].sizeHigh = true;
               this.sizeArray[0].sizeMed = false;
               this.sizeArray[0].sizeLow = false;
               this.sizeArray[0].sizeNew = false;
               break;
            case "sizeMed":
               if(this.sizeArray[0].sizeMed == false)
               {
                  this.filterChange = true;
               }
               this.sizeArray[0].sizeAll = false;
               this.sizeArray[0].sizeHigh = false;
               this.sizeArray[0].sizeMed = true;
               this.sizeArray[0].sizeLow = false;
               this.sizeArray[0].sizeNew = false;
               break;
            case "sizeLow":
               if(this.sizeArray[0].sizeLow == false)
               {
                  this.filterChange = true;
               }
               this.sizeArray[0].sizeAll = false;
               this.sizeArray[0].sizeHigh = false;
               this.sizeArray[0].sizeMed = false;
               this.sizeArray[0].sizeLow = true;
               this.sizeArray[0].sizeNew = false;
               break;
            case "sizeNew":
               if(this.sizeArray[0].sizeNew == false)
               {
                  this.filterChange = true;
               }
               this.sizeArray[0].sizeAll = false;
               this.sizeArray[0].sizeHigh = false;
               this.sizeArray[0].sizeMed = false;
               this.sizeArray[0].sizeLow = false;
               this.sizeArray[0].sizeNew = true;
               _loc7_ = this.locationArray[0].locationDowntown + this.locationArray[0].locationEastLS + this.locationArray[0].locationWestLS + this.locationArray[0].locationNorthLS + this.locationArray[0].locationSouthLS + this.locationArray[0].locationBlaineCounty;
               this.locationArray[0].locationDowntown = true;
               this.locationArray[0].locationEastLS = true;
               this.locationArray[0].locationWestLS = true;
               this.locationArray[0].locationNorthLS = true;
               this.locationArray[0].locationSouthLS = true;
               this.locationArray[0].locationBlaineCounty = true;
               _loc6_ = this.locationArray[0].locationDowntown + this.locationArray[0].locationEastLS + this.locationArray[0].locationWestLS + this.locationArray[0].locationNorthLS + this.locationArray[0].locationSouthLS + this.locationArray[0].locationBlaineCounty;
               if(_loc7_ != _loc6_)
               {
                  this.filterChange = true;
               }
         }
      }
      if(_loc2_[0] == "priceLowToHigh" || _loc2_[0] == "priceHighToLow")
      {
         switch(_loc2_[0])
         {
            case "priceLowToHigh":
               if(this.priceArray[0].priceLowToHigh == false)
               {
                  this.sortChange = true;
               }
               this.priceArray[0].priceLowToHigh = true;
               this.priceArray[0].priceHighToLow = false;
               break;
            case "priceHighToLow":
               if(this.priceArray[0].priceHighToLow == false)
               {
                  this.sortChange = true;
               }
               this.priceArray[0].priceLowToHigh = false;
               this.priceArray[0].priceHighToLow = true;
         }
      }
      var _loc5_;
      if(_loc2_[0] == "locationDowntown" || _loc2_[0] == "locationEastLS" || _loc2_[0] == "locationWestLS" || _loc2_[0] == "locationNorthLS" || _loc2_[0] == "locationSouthLS" || _loc2_[0] == "locationBlaineCounty")
      {
         _loc5_ = this.locationArray[0].locationDowntown + this.locationArray[0].locationEastLS + this.locationArray[0].locationWestLS + this.locationArray[0].locationNorthLS + this.locationArray[0].locationSouthLS + this.locationArray[0].locationBlaineCounty;
         switch(_loc2_[0])
         {
            case "locationDowntown":
               if(this.locationArray[0].locationDowntown == true && _loc5_ == 1)
               {
                  break;
               }
               this.locationArray[0].locationDowntown = !this.locationArray[0].locationDowntown;
               this.locationChange = true;
               break;
            case "locationEastLS":
               if(this.locationArray[0].locationEastLS == true && _loc5_ == 1)
               {
                  break;
               }
               this.locationArray[0].locationEastLS = !this.locationArray[0].locationEastLS;
               this.locationChange = true;
               break;
            case "locationWestLS":
               if(this.locationArray[0].locationWestLS == true && _loc5_ == 1)
               {
                  break;
               }
               this.locationArray[0].locationWestLS = !this.locationArray[0].locationWestLS;
               this.locationChange = true;
               break;
            case "locationNorthLS":
               if(this.locationArray[0].locationNorthLS == true && _loc5_ == 1)
               {
                  break;
               }
               this.locationArray[0].locationNorthLS = !this.locationArray[0].locationNorthLS;
               this.locationChange = true;
               break;
            case "locationSouthLS":
               if(this.locationArray[0].locationSouthLS == true && _loc5_ == 1)
               {
                  break;
               }
               this.locationArray[0].locationSouthLS = !this.locationArray[0].locationSouthLS;
               this.locationChange = true;
               break;
            case "locationBlaineCounty":
               if(this.locationArray[0].locationBlaineCounty == true && _loc5_ == 1)
               {
                  break;
               }
               this.locationArray[0].locationBlaineCounty = !this.locationArray[0].locationBlaineCounty;
               this.locationChange = true;
         }
      }
      this.updateFilterButtons();
      if(this.filterChange == true || this.sortChange == true || this.locationChange == true)
      {
         this.comeFromAnotherPage = true;
         this.sortProperties();
      }
   }
   function addVisiblePropertyID(id)
   {
      var _loc2_ = 0;
      var _loc3_ = this.visiblePropertyIDs.length;
      while(_loc2_ < _loc3_)
      {
         if(this.visiblePropertyIDs[_loc2_] == id)
         {
            return undefined;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.visiblePropertyIDs.push(id);
   }
   function removeVisiblePropertyID(id)
   {
      var _loc2_ = 0;
      var _loc3_ = this.visiblePropertyIDs.length;
      while(_loc2_ < _loc3_)
      {
         if(this.visiblePropertyIDs[_loc2_] == id)
         {
            this.visiblePropertyIDs.splice(_loc2_,1);
            return undefined;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function scrollListingsPage(_position, _instant)
   {
      var _loc4_ = _position;
      var _loc2_ = 179 - _loc4_;
      var _loc3_ = - (this.CONTENT.BOUNDING_BOX._height - 627);
      if(_loc2_ < _loc3_)
      {
         _loc2_ = _loc3_;
      }
      if(_loc2_ > 0)
      {
         _loc2_ = 0;
      }
      if(_instant == false)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,0.25,{_y:_loc2_,ease:com.rockstargames.ui.tweenStar.Ease.SINE_OUT,onComplete:com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf,onCompleteScope:this,onCompleteArgs:[this.CONTENT]});
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.mcScope.MapContainer,0.25,{_y:304 + Math.abs(_loc2_),ease:com.rockstargames.ui.tweenStar.Ease.SINE_OUT,onComplete:com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf,onCompleteScope:this,onCompleteArgs:[this.mcScope.MapContainer]});
      }
      else
      {
         this.CONTENT._y = _loc2_;
         this.mcScope.MapContainer._y = 304 + Math.abs(_loc2_);
      }
   }
   function sortProperties()
   {
      var _loc12_;
      var _loc10_;
      var _loc13_;
      var _loc6_;
      if(this.firstRun == true)
      {
         _loc12_ = [];
         _loc10_ = [];
         _loc13_ = [];
         _loc6_ = 0;
         while(_loc6_ < this.sortedPropertyArray.length)
         {
            if(this.sortedPropertyArray[_loc6_].INTERIORS)
            {
               _loc12_.push(this.sortedPropertyArray[_loc6_]);
            }
            else if(this.sortedPropertyArray[_loc6_].DLC != undefined)
            {
               _loc10_.push(this.sortedPropertyArray[_loc6_]);
            }
            else
            {
               _loc13_.push(this.sortedPropertyArray[_loc6_]);
            }
            _loc6_ = _loc6_ + 1;
         }
         _loc12_.sortOn(["SORTING_PRICE","INDEX"],[Array.DESCENDING | Array.NUMERIC,Array.NUMERIC]);
         _loc10_.sortOn(["SORTING_PRICE","INDEX"],[Array.DESCENDING | Array.NUMERIC,Array.NUMERIC]);
         _loc13_.sortOn(["SORTING_PRICE","INDEX"],[Array.DESCENDING | Array.NUMERIC,Array.NUMERIC]);
         this.sortedPropertyArray = _loc12_.concat(_loc10_.concat(_loc13_));
      }
      else if(this.priceArray[0].priceLowToHigh == true)
      {
         this.sortedPropertyArray.sortOn(["SORTING_PRICE","INDEX"],[Array.NUMERIC,Array.NUMERIC]);
      }
      else if(this.priceArray[0].priceHighToLow == true)
      {
         this.sortedPropertyArray.sortOn(["SORTING_PRICE","INDEX"],[Array.DESCENDING | Array.NUMERIC,Array.NUMERIC]);
      }
      this.highEnd = 0;
      this.medEnd = 0;
      this.lowEnd = 0;
      this.downtown = 0;
      this.northls = 0;
      this.southls = 0;
      this.eastls = 0;
      this.westls = 0;
      this.blaine = 0;
      this.noLocation = 0;
      var _loc11_;
      var _loc8_ = 0;
      var _loc7_ = 179;
      var _loc14_ = this.propertyButtonContainer.shadowMC;
      _loc14_._visible = false;
      _loc6_ = 0;
      var _loc2_;
      var _loc3_;
      var _loc5_;
      var _loc4_;
      while(_loc6_ < this.sortedPropertyArray.length)
      {
         _loc2_ = this.sortedPropertyArray[_loc6_].INDEX;
         _loc3_ = this.propertyButtonContainer["property_" + _loc2_];
         _loc3_.highlight._visible = false;
         _loc5_ = this.mcScope.MapContainer.map.pinContainer["pin_" + _loc2_];
         if(this.propertyArray[_loc2_].SIZE == 3 || this.propertyArray[_loc2_].SIZE == 6 || this.propertyArray[_loc2_].SIZE == 7)
         {
            this.highEnd = this.highEnd + 1;
         }
         if(this.propertyArray[_loc2_].SIZE == 2 || this.propertyArray[_loc2_].SIZE == 5)
         {
            this.medEnd = this.medEnd + 1;
         }
         if(this.propertyArray[_loc2_].SIZE == 1 || this.propertyArray[_loc2_].SIZE == 4)
         {
            this.lowEnd = this.lowEnd + 1;
         }
         if(this.propertyArray[_loc2_].LOCATION == 0)
         {
            this.noLocation = this.noLocation + 1;
         }
         if(this.propertyArray[_loc2_].LOCATION == 1)
         {
            this.northls = this.northls + 1;
         }
         if(this.propertyArray[_loc2_].LOCATION == 2)
         {
            this.downtown = this.downtown + 1;
         }
         if(this.propertyArray[_loc2_].LOCATION == 3)
         {
            this.westls = this.westls + 1;
         }
         if(this.propertyArray[_loc2_].LOCATION == 4)
         {
            this.eastls = this.eastls + 1;
         }
         if(this.propertyArray[_loc2_].LOCATION == 5)
         {
            this.southls = this.southls + 1;
         }
         if(this.propertyArray[_loc2_].LOCATION == 6)
         {
            this.blaine = this.blaine + 1;
         }
         _loc4_ = true;
         if(this.sizeArray[0].sizeAll == false)
         {
            if(this.sizeArray[0].sizeHigh == false)
            {
               if(this.propertyArray[_loc2_].SIZE == 3 || this.propertyArray[_loc2_].SIZE == 6 || this.propertyArray[_loc2_].SIZE == 7)
               {
                  _loc4_ = false;
               }
            }
            if(this.sizeArray[0].sizeMed == false)
            {
               if(this.propertyArray[_loc2_].SIZE == 2 || this.propertyArray[_loc2_].SIZE == 5)
               {
                  _loc4_ = false;
               }
            }
            if(this.sizeArray[0].sizeLow == false)
            {
               if(this.propertyArray[_loc2_].SIZE == 1 || this.propertyArray[_loc2_].SIZE == 4)
               {
                  _loc4_ = false;
               }
            }
         }
         if(this.sizeArray[0].sizeNew)
         {
            _loc4_ = this.propertyArray[_loc2_].IS_NEW;
         }
         if(this.locationArray[0].locationNorthLS == false && this.propertyArray[_loc2_].LOCATION == 0)
         {
            _loc4_ = false;
         }
         if(this.locationArray[0].locationNorthLS == false && this.propertyArray[_loc2_].LOCATION == 1)
         {
            _loc4_ = false;
         }
         if(this.locationArray[0].locationDowntown == false && this.propertyArray[_loc2_].LOCATION == 2)
         {
            _loc4_ = false;
         }
         if(this.locationArray[0].locationWestLS == false && this.propertyArray[_loc2_].LOCATION == 3)
         {
            _loc4_ = false;
         }
         if(this.locationArray[0].locationEastLS == false && this.propertyArray[_loc2_].LOCATION == 4)
         {
            _loc4_ = false;
         }
         if(this.locationArray[0].locationSouthLS == false && this.propertyArray[_loc2_].LOCATION == 5)
         {
            _loc4_ = false;
         }
         if(this.locationArray[0].locationBlaineCounty == false && this.propertyArray[_loc2_].LOCATION == 6)
         {
            _loc4_ = false;
         }
         this.sortedPropertyArray[_loc6_].VISIBLE == _loc4_;
         if(_loc4_ == true)
         {
            if(_loc8_ == 0)
            {
               _loc11_ = _loc2_;
            }
            _loc3_._y = _loc7_;
            _loc3_.disabled = false;
            _loc3_._visible = true;
            _loc5_.disabled = false;
            _loc5_._visible = true;
            _loc5_._alpha = 100;
            _loc7_ += Math.round(_loc3_.background._height) + 2;
            this.bottomLine = _loc7_;
            _loc8_ = _loc8_ + 1;
         }
         else
         {
            _loc3_._y = -1000;
            _loc3_.disabled = true;
            _loc3_._visible = false;
            _loc5_.disabled = true;
            _loc5_._visible = false;
            _loc5_._alpha = 0;
            if(_loc3_["propertyMC" + _loc2_] != undefined)
            {
               _loc3_["propertyMC" + _loc2_].removeImage();
            }
         }
         _loc3_.highlight._visible = false;
         _loc3_.propertyTF.textColor = this.textColGrey;
         _loc3_.descTF.textColor = this.textColGrey;
         _loc3_.locationTF.textColor = this.textColGrey;
         _loc6_ = _loc6_ + 1;
      }
      if(this.firstRun == true || this.filterChange == true || this.sortChange == true || this.locationChange == true)
      {
         this.lastPinClicked = _loc11_;
         this.comeFromAnotherPage = true;
         this.firstRun = false;
      }
      if(this.forceTopOfList == true)
      {
         this.lastPinClicked = _loc11_;
         this.forceTopOfList = false;
      }
      if(this.mcScope.MapContainer.map.pinContainer["pin_" + this.lastPinClicked]._visible == false)
      {
         this.lastPinClicked = _loc11_;
      }
      var _loc9_;
      var _loc17_;
      if(_loc8_ > 0)
      {
         this.mcScope.MapContainer.map.zoomScale = 250;
         if(this.sizeArray[0].sizeNew == true)
         {
            this.mcScope.MapContainer.map.zoomInOnPin(this.lastPinClicked,false,true);
         }
         else
         {
            this.mcScope.MapContainer.map.zoomInOnPin(this.lastPinClicked,false);
         }
         _loc9_ = this.propertyButtonContainer["property_" + this.lastPinClicked];
         this.scrollListingsPage(_loc9_._y,this.comeFromAnotherPage);
         this.comeFromAnotherPage = false;
         _loc9_.highlight._visible = true;
         if(_loc9_.buyMC == undefined)
         {
            _loc17_ = _loc9_.attachMovie("buyMC","buyMC",_loc9_.getNextHighestDepth(),{_x:236,_y:171.5});
            if(this.buyTextString == "")
            {
               com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc9_.buyMC.buyTF,"DYN_BUY",0,true);
               this.buyTextString = _loc9_.buyMC.buyTF.htmlText;
            }
            _loc9_.buyMC.buyTF.htmlText = this.buyTextString;
            _loc9_.buyMC.buyTF.textAutoSize = "shrink";
         }
      }
      _loc14_._height = this.bottomLine - (_loc3_.background._height - 44);
      this.newHeight = this.bottomLine + 239;
      if(this.newHeight < 627)
      {
         this.newHeight = 627;
      }
      this.CONTENT.BOUNDING_BOX._height = this.newHeight;
      this.mcScope.backgroundMC._height = this.newHeight;
      this.mcScope.footerMC._y = this.newHeight;
      this.browser.RESIZE_WEBSITE();
      if(_loc8_ > 0)
      {
         if(this.resultsString == "")
         {
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.MapContainer.resultsTF,"DYN_NUMPROPS",0,false);
            this.resultsString = this.mcScope.MapContainer.resultsTF.text;
         }
         this.mcScope.MapContainer.resultsTF.htmlText = _loc8_.toString() + " " + this.resultsString;
         _loc14_._visible = true;
      }
      else
      {
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.MapContainer.resultsTF,"DYN_LIST_NORESULTS",0,false);
         _loc14_._visible = false;
      }
      this.mcScope.MapContainer.resultsTF.textAutoSize = "shrink";
   }
   function updateFilterButtons()
   {
      this.headerMC.sizeAll.highlight._visible = this.sizeArray[0].sizeAll;
      this.headerMC.sizeAll.textTF.textColor = !this.sizeArray[0].sizeAll ? this.textColGreen : this.textColWhite;
      this.headerMC.sizeHigh.highlight._visible = this.sizeArray[0].sizeHigh;
      this.headerMC.sizeHigh.textTF.textColor = !this.sizeArray[0].sizeHigh ? this.textColGreen : this.textColWhite;
      this.headerMC.sizeMed.highlight._visible = this.sizeArray[0].sizeMed;
      this.headerMC.sizeMed.textTF.textColor = !this.sizeArray[0].sizeMed ? this.textColGreen : this.textColWhite;
      this.headerMC.sizeLow.highlight._visible = this.sizeArray[0].sizeLow;
      this.headerMC.sizeLow.textTF.textColor = !this.sizeArray[0].sizeLow ? this.textColGreen : this.textColWhite;
      this.headerMC.sizeNew.highlight._visible = this.sizeArray[0].sizeNew;
      this.headerMC.sizeNew.textTF.textColor = !this.sizeArray[0].sizeNew ? this.textColGreen : this.textColWhite;
      var _loc2_ = this.headerMC.filterButtonsMC;
      _loc2_.priceLowToHigh.textTF.textColor = !this.priceArray[0].priceLowToHigh ? this.textColDarkGreen : this.textColYellow;
      _loc2_.priceLowToHigh.tickMC._visible = this.priceArray[0].priceLowToHigh;
      _loc2_.priceHighToLow.textTF.textColor = !this.priceArray[0].priceHighToLow ? this.textColDarkGreen : this.textColYellow;
      _loc2_.priceHighToLow.tickMC._visible = this.priceArray[0].priceHighToLow;
      _loc2_.locationDowntown.textTF.textColor = !this.locationArray[0].locationDowntown ? this.textColDarkGreen : this.textColYellow;
      _loc2_.locationDowntown.tickMC._visible = this.locationArray[0].locationDowntown;
      _loc2_.locationEastLS.textTF.textColor = !this.locationArray[0].locationEastLS ? this.textColDarkGreen : this.textColYellow;
      _loc2_.locationEastLS.tickMC._visible = this.locationArray[0].locationEastLS;
      _loc2_.locationWestLS.textTF.textColor = !this.locationArray[0].locationWestLS ? this.textColDarkGreen : this.textColYellow;
      _loc2_.locationWestLS.tickMC._visible = this.locationArray[0].locationWestLS;
      _loc2_.locationNorthLS.textTF.textColor = !this.locationArray[0].locationNorthLS ? this.textColDarkGreen : this.textColYellow;
      _loc2_.locationNorthLS.tickMC._visible = this.locationArray[0].locationNorthLS;
      _loc2_.locationSouthLS.textTF.textColor = !this.locationArray[0].locationSouthLS ? this.textColDarkGreen : this.textColYellow;
      _loc2_.locationSouthLS.tickMC._visible = this.locationArray[0].locationSouthLS;
      _loc2_.locationBlaineCounty.textTF.textColor = !this.locationArray[0].locationBlaineCounty ? this.textColDarkGreen : this.textColYellow;
      _loc2_.locationBlaineCounty.tickMC._visible = this.locationArray[0].locationBlaineCounty;
   }
   function zoomAndScrollToLastProperty()
   {
      var _loc2_;
      if(this.lastPinClicked >= 0)
      {
         _loc2_ = "pin_" + this.lastPinClicked;
         this.lastPinClicked = -1;
         this.goToAnchor(_loc2_);
      }
   }
   function POPULATE_TEXT(_pageName, searchArgs, newPage)
   {
      this.pageName = _pageName;
      clearInterval(this.intervalId);
      var _loc3_ = com.rockstargames.ui.utils.Localisation.setTextWithTranslation;
      var _loc49_ = new Array(0,2,6,10,2,6,10,20,0,0,0,0,50);
      var _loc47_ = new Array("No size data","DYN_FILTER_LOWEND","DYN_FILTER_MEDIUM","DYN_FILTER_HIGHEND","DYN_FILTER_LOWEND","DYN_FILTER_MEDIUM","DYN_FILTER_HIGHEND","DYN_FILTER_HIGHEND","No size data","No size data","No size data","No size data","DYN_FILTER_HIGHEND");
      var _loc50_ = new Array("No location data","DYN_FILTER_NORTHLS","DYN_FILTER_DOWNTOWN","DYN_FILTER_WESTLS","DYN_FILTER_EASTLS","DYN_FILTER_SOUTHLS","DYN_FILTER_BLAINE");
      this.defaultButtonOnColour = 1141559;
      this.defaultButtonOffColour = 16777215;
      this.browser.SET_BUTTON_MASK();
      var _loc15_;
      if(this.propLocArray[0] == false)
      {
         _loc15_ = 1;
         while(_loc15_ < this.propLocArray.length)
         {
            _loc3_(this.CONTENT.localisationTF,this.propLocArray[_loc15_],0,false);
            this.propLocArray[_loc15_] = this.CONTENT.localisationTF.text;
            _loc15_ = _loc15_ + 1;
         }
         this.CONTENT.localisationTF.text = "";
         this.propLocArray[0] = true;
      }
      this.browser.GUTTER._height = 627;
      this.browser.GUTTER._y = this.browser.TOOLBAR._y + 45;
      var _loc58_;
      var _loc57_;
      var _loc55_;
      var _loc53_;
      var _loc20_;
      var _loc14_;
      var _loc5_;
      var _loc11_;
      var _loc54_;
      var _loc70_;
      var _loc67_;
      var _loc69_;
      var _loc65_;
      var _loc61_;
      var _loc63_;
      var _loc13_;
      var _loc10_;
      var _loc16_;
      var _loc6_;
      var _loc9_;
      var _loc36_;
      var _loc7_;
      var _loc60_;
      var _loc56_;
      var _loc43_;
      var _loc17_;
      var _loc2_;
      var _loc48_;
      var _loc18_;
      var _loc19_;
      var _loc52_;
      var _loc45_;
      var _loc4_;
      var _loc22_;
      var _loc21_;
      var _loc44_;
      var _loc12_;
      var _loc8_;
      var _loc51_;
      var _loc0_;
      switch(this.pageName)
      {
         case "PAGE1":
            this.firstRun = true;
            this.mcScope = this.CONTENT.PAGE1;
            this.comeFromAnotherPage = true;
            this.CONTENT._y = 0;
            this.defaultButtonOnColour = this.textColLightGreen;
            this.defaultButtonOffColour = this.textColWhite;
            if(newPage == true)
            {
               _loc58_ = this.mcScope.images.attachMovie("propertyTextureMC","propertyMC1",this.mcScope.images.getNextHighestDepth(),{_x:116,_y:0});
               _loc57_ = this.mcScope.images.attachMovie("propertyTextureMC","propertyMC2",this.mcScope.images.getNextHighestDepth(),{_x:380,_y:0});
               _loc55_ = this.mcScope.images.attachMovie("propertyTextureMC","propertyMC3",this.mcScope.images.getNextHighestDepth(),{_x:116,_y:136});
               _loc53_ = this.mcScope.images.attachMovie("propertyTextureMC","propertyMC4",this.mcScope.images.getNextHighestDepth(),{_x:380,_y:136});
               _loc20_ = [];
               _loc15_ = 6;
               while(_loc15_ < 36)
               {
                  _loc14_ = false;
                  _loc5_ = 0;
                  _loc11_ = this.visiblePropertyIDs.length;
                  while(_loc5_ < _loc11_)
                  {
                     if(this.visiblePropertyIDs[_loc5_] == _loc15_)
                     {
                        _loc14_ = true;
                        break;
                     }
                     _loc5_ = _loc5_ + 1;
                  }
                  if(!_loc14_)
                  {
                     _loc20_.push(_loc15_);
                  }
                  _loc15_ = _loc15_ + 1;
               }
               _loc58_.updateImage("DYN_MP_" + _loc20_.splice(this.randRange(0,_loc20_.length,this.visiblePropertyIDs),1));
               _loc57_.updateImage("DYN_MP_" + _loc20_.splice(this.randRange(0,_loc20_.length,this.visiblePropertyIDs),1));
               _loc55_.updateImage("DYN_MP_" + _loc20_.splice(this.randRange(0,_loc20_.length,this.visiblePropertyIDs),1));
               _loc53_.updateImage("DYN_MP_" + _loc20_.splice(this.randRange(0,_loc20_.length,this.visiblePropertyIDs),1));
               _loc3_(this.mcScope.header_strapline,"DYN_PG1_HEADER",0,true);
               this.mcScope.bodyTF._visible = false;
               _loc3_(this.mcScope.bodyTF,"DYN_PG1_BODY",0,true);
               this.dataTextScope = new Array();
               this.dataTextScope[0] = this.mcScope.LOS_D_SANTOS.btnTxt;
               _loc3_(this.mcScope.LOS_D_SANTOS.btnTxt,"DYN_VIEWLISTINGS",0,false);
               this.mcScope.LOS_D_SANTOS.btnTxt.autoSize = "center";
               this.mcScope.LOS_D_SANTOS.btnTxt._x = - this.mcScope.LOS_D_SANTOS.btnTxt.textWidth / 2;
               this.mcScope.LOS_D_SANTOS.background._width = 20 + this.mcScope.LOS_D_SANTOS.btnTxt.textWidth;
               this.mcScope.LOS_D_SANTOS.backgroundOutline._width = this.mcScope.LOS_D_SANTOS.background._width + 4;
               this.mcScope.LOS_D_SANTOS.backgroundOutline._height = this.mcScope.LOS_D_SANTOS.background._height + 4;
               _loc3_(this.mcScope.WWW_DYNASTY8EXECUTIVEREALTY_COM.strapline,"DYN8_EXEC_BANNER",0,false);
               this.dataTextScope[1] = this.mcScope.WWW_DYNASTY8EXECUTIVEREALTY_COM.btnTxt;
               this.mcScope.bodyTF._visible = true;
               this.mcScope.LOS_D_SANTOS._alpha = 100;
            }
            if(this.browser.player != 1)
            {
               this.mcScope.LOS_D_SANTOS._name = "MAINTENANCE";
               this.mcScope.LOS_D_SANTOS._x = 640;
            }
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            this.CONTENT.BOUNDING_BOX._height = 887;
            break;
         case "LOS_D_SANTOS":
            this.mcScope = this.CONTENT.LOS_D_SANTOS;
            this.defaultButtonOnColour = this.textColBlack;
            this.defaultButtonOffColour = this.textColBlack;
            if(this.mcScope.MapContainer.map == undefined)
            {
               this.CONTENT._y = 0;
               this.dataTextScope = new Array();
               this.MapMC = this.mcScope.MapContainer.attachMovie("map","map",this.mcScope.MapContainer.getNextHighestDepth());
               _loc54_ = this.mcScope.MapContainer.attachMovie("mapMask","mapMask",this.mcScope.MapContainer.getNextHighestDepth());
               this.MapMC.setMask(_loc54_);
               this.MapMC.location_1._visible = false;
               this.MapMC.location_2._visible = false;
               this.MapMC.location_3._visible = false;
               this.MapMC.location_4._visible = false;
               this.MapMC.location_5._visible = false;
               this.pinHitArea = this.mcScope.MapContainer.attachMovie("pinHitArea","pinHitArea",this.mcScope.MapContainer.getNextHighestDepth(),{_visible:false});
               _loc70_ = this.mcScope.MapContainer.attachMovie("button_zoom_in","zoomIn",this.mcScope.MapContainer.getNextHighestDepth(),{_x:265,_y:-107});
               _loc67_ = this.mcScope.MapContainer.attachMovie("button_zoom_out","zoomOut",this.mcScope.MapContainer.getNextHighestDepth(),{_x:265,_y:-83});
               _loc69_ = this.mcScope.MapContainer.attachMovie("button_map_move","mapUP",this.mcScope.MapContainer.getNextHighestDepth(),{_x:-224,_y:-97});
               _loc65_ = this.mcScope.MapContainer.attachMovie("button_map_move","mapDOWN",this.mcScope.MapContainer.getNextHighestDepth(),{_x:-224,_y:-57,_rotation:180});
               _loc61_ = this.mcScope.MapContainer.attachMovie("button_map_move","mapLEFT",this.mcScope.MapContainer.getNextHighestDepth(),{_x:-244,_y:-77,_rotation:270});
               _loc63_ = this.mcScope.MapContainer.attachMovie("button_map_move","mapRIGHT",this.mcScope.MapContainer.getNextHighestDepth(),{_x:-204,_y:-77,_rotation:90});
               this.headerMC = this.mcScope.MapContainer.header;
               com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.MapContainer.mapTF,"DYN_INTMAP",0,false);
               _loc3_(this.headerMC.sizeAll.textTF,"DYN_FILTER_ALL",0,true);
               _loc3_(this.headerMC.sizeHigh.textTF,"DYN_FILTER_HIGHEND",0,true);
               _loc3_(this.headerMC.sizeMed.textTF,"DYN_FILTER_MEDIUM",0,true);
               _loc3_(this.headerMC.sizeLow.textTF,"DYN_FILTER_LOWEND",0,true);
               _loc3_(this.headerMC.sizeNew.textTF,"DYN_FILTER_NEW",0,true);
               _loc3_(this.headerMC.filterButtonsMC.priceTF,"DYN_TITLE_PRICE",0,true);
               _loc3_(this.headerMC.filterButtonsMC.priceLowToHigh.textTF,"DYN_SORT_LOWTOHIGH",0,true);
               _loc3_(this.headerMC.filterButtonsMC.priceHighToLow.textTF,"DYN_SORT_HIGHTOLOW",0,true);
               _loc3_(this.headerMC.filterButtonsMC.locationTF,"DYN_TITLE_LOCATION",0,true);
               _loc3_(this.headerMC.filterButtonsMC.locationDowntown.textTF,"DYN_FILTER_DOWNTOWN",0,true);
               _loc3_(this.headerMC.filterButtonsMC.locationEastLS.textTF,"DYN_FILTER_EASTLS",0,true);
               _loc3_(this.headerMC.filterButtonsMC.locationWestLS.textTF,"DYN_FILTER_WESTLS",0,true);
               _loc3_(this.headerMC.filterButtonsMC.locationNorthLS.textTF,"DYN_FILTER_NORTHLS",0,true);
               _loc3_(this.headerMC.filterButtonsMC.locationSouthLS.textTF,"DYN_FILTER_SOUTHLS",0,true);
               _loc3_(this.headerMC.filterButtonsMC.locationBlaineCounty.textTF,"DYN_FILTER_BLAINE",0,true);
               this.headerMC.filterButtonsMC.priceLowToHigh.tickMC._visible = false;
               this.headerMC.filterButtonsMC.priceHighToLow.tickMC._visible = false;
               this.headerMC.filterButtonsMC.locationDowntown.tickMC._visible = false;
               this.headerMC.filterButtonsMC.locationEastLS.tickMC._visible = false;
               this.headerMC.filterButtonsMC.locationWestLS.tickMC._visible = false;
               this.headerMC.filterButtonsMC.locationNorthLS.tickMC._visible = false;
               this.headerMC.filterButtonsMC.locationSouthLS.tickMC._visible = false;
               this.headerMC.filterButtonsMC.locationBlaineCounty.tickMC._visible = false;
               _loc13_ = new Array("priceLowToHigh","priceHighToLow");
               _loc10_ = this.headerMC.filterButtonsMC.priceTF._x + this.headerMC.filterButtonsMC.priceTF.textWidth + 10;
               _loc16_ = 14;
               _loc15_ = 0;
               while(_loc15_ < _loc13_.length)
               {
                  _loc6_ = this.headerMC.filterButtonsMC[_loc13_[_loc15_]];
                  _loc9_ = _loc6_.textTF.textWidth + 4;
                  _loc6_.textTF._width = _loc9_;
                  _loc6_.textTF._x = - _loc9_ / 2;
                  _loc6_.background._width = _loc9_;
                  _loc6_._x = _loc10_ + _loc9_ / 2;
                  _loc10_ += _loc9_ + _loc16_;
                  if(_loc15_ == 0)
                  {
                     _loc36_ = this.headerMC.filterButtonsMC.attachMovie("nav_divider","nav_divider_price",this.headerMC.filterButtonsMC.getNextHighestDepth(),{_x:_loc10_ - _loc16_ / 2,_y:_loc6_._y});
                  }
                  _loc15_ = _loc15_ + 1;
               }
               _loc13_ = new Array("locationBlaineCounty","locationSouthLS","locationNorthLS","locationWestLS","locationEastLS","locationDowntown");
               _loc10_ = 870;
               _loc15_ = 0;
               while(_loc15_ < _loc13_.length)
               {
                  _loc6_ = this.headerMC.filterButtonsMC[_loc13_[_loc15_]];
                  _loc9_ = _loc6_.textTF.textWidth + 4;
                  _loc6_.textTF._width = _loc9_;
                  _loc6_.textTF._x = - _loc9_ / 2;
                  _loc6_.background._width = _loc9_;
                  _loc6_._x = _loc10_ - _loc9_ / 2;
                  _loc10_ -= _loc9_ + _loc16_;
                  if(_loc15_ < _loc13_.length - 1)
                  {
                     _loc36_ = this.headerMC.filterButtonsMC.attachMovie("nav_divider","nav_divider_" + _loc15_,this.headerMC.filterButtonsMC.getNextHighestDepth(),{_x:_loc10_ + _loc16_ / 2,_y:_loc6_._y});
                  }
                  _loc15_ = _loc15_ + 1;
               }
               this.headerMC.filterButtonsMC.locationTF._x = _loc10_ - this.headerMC.filterButtonsMC.locationTF._width + _loc16_;
               com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.MapContainer.resultsTF,"DYN_RETRIEVING_DATA",0,false);
               this.mcScope.MapContainer.resultsTF.textAutoSize = "shrink";
               this.updateFilterButtons();
            }
            if(this.dataProviderUI.length > 10)
            {
               this.propertyArray = [];
               this.sortedPropertyArray = [];
               _loc15_ = 0;
               while(_loc15_ < this.dataProviderUI.length)
               {
                  _loc7_ = this.dataProviderUI[_loc15_][3];
                  if(this.dataProviderUI[_loc15_][12] && this.dataProviderUI[_loc15_][12] > 0)
                  {
                     _loc7_ = this.dataProviderUI[_loc15_][12];
                  }
                  if(isNaN(_loc7_))
                  {
                     _loc7_ = 0;
                  }
                  this.propertyArray.push({PROPERTY:this.dataProviderUI[_loc15_][0],INDEX:_loc15_,XPOS:this.dataProviderUI[_loc15_][1],YPOS:this.dataProviderUI[_loc15_][2],PRICE:this.dataProviderUI[_loc15_][3],TXD:this.dataProviderUI[_loc15_][4],DESCRIPTION:this.dataProviderUI[_loc15_][5],SIZE:this.dataProviderUI[_loc15_][6],LOCATION:this.dataProviderUI[_loc15_][7],DLC:this.dataProviderUI[_loc15_][8],SALE:this.dataProviderUI[_loc15_][9],INTERIORS:this.dataProviderUI[_loc15_][10],REBATE:this.dataProviderUI[_loc15_][11],SALE_PRICE:this.dataProviderUI[_loc15_][12],SORTING_PRICE:_loc7_,IS_NEW:this.dataProviderUI[_loc15_][13] !== false,STARTER_PACK:this.dataProviderUI[_loc15_][14],TINTS:this.dataProviderUI[_loc15_][15]});
                  this.sortedPropertyArray.push({INDEX:_loc15_,PRICE:this.dataProviderUI[_loc15_][3],VISIBLE:true,TXD:this.dataProviderUI[_loc15_][4],DLC:this.dataProviderUI[_loc15_][8],SALE:this.dataProviderUI[_loc15_][9],INTERIORS:this.dataProviderUI[_loc15_][10],REBATE:this.dataProviderUI[_loc15_][11],SALE_PRICE:this.dataProviderUI[_loc15_][12],SORTING_PRICE:_loc7_,IS_NEW:this.dataProviderUI[_loc15_][13] !== false,STARTER_PACK:this.dataProviderUI[_loc15_][14]});
                  _loc15_ = _loc15_ + 1;
               }
            }
            if(newPage == false)
            {
               _loc60_ = this.mcScope.MapContainer.attachMovie("button_mask","button_mask",this.mcScope.MapContainer.getNextHighestDepth(),{_visible:false});
               this.browser.SET_BUTTON_MASK(this.mcScope.MapContainer.button_mask);
               _loc56_ = this.mcScope.MapContainer.attachMovie("property_hitArea","property_hitArea",this.mcScope.MapContainer.getNextHighestDepth(),{_visible:false});
               this.mcScope.MapContainer.map.initialiseMap(this);
               this.propertyButtonContainer = this.mcScope.buttonBase.attachMovie("buttonContainerMC","propertyButtonContainer",this.mcScope.getNextHighestDepth());
               _loc43_ = 213;
               _loc17_ = 179;
               _loc48_ = this.propertyButtonContainer.attachMovie("shadowMC","shadowMC",this.propertyButtonContainer.getNextHighestDepth(),{_x:_loc43_ - 10,_y:_loc17_ - 5,_width:296,_visible:false});
               if(this.mcScope.MapContainer.map.pinReferenceMC != undefined)
               {
                  pinReferenceMC.removeMovieClip();
               }
               var pinReferenceMC = this.mcScope.MapContainer.map.attachMovie("pinReferenceMC","pinReferenceMC",this.mcScope.MapContainer.map.getNextHighestDepth());
               _loc15_ = 0;
               while(_loc15_ < this.propertyArray.length)
               {
                  pinReferenceMC._x = this.mcScope.MapContainer.map.pinContainer["pin_" + _loc15_]._x;
                  pinReferenceMC._y = this.mcScope.MapContainer.map.pinContainer["pin_" + _loc15_]._y;
                  if(this.mcScope.MapContainer.map.location_1.hitTest(pinReferenceMC) == true)
                  {
                     this.propertyArray[_loc15_].LOCATION = 1;
                  }
                  else if(this.mcScope.MapContainer.map.location_2.hitTest(pinReferenceMC) == true)
                  {
                     this.propertyArray[_loc15_].LOCATION = 2;
                  }
                  else if(this.mcScope.MapContainer.map.location_3.hitTest(pinReferenceMC) == true)
                  {
                     this.propertyArray[_loc15_].LOCATION = 3;
                  }
                  else if(this.mcScope.MapContainer.map.location_4.hitTest(pinReferenceMC) == true)
                  {
                     this.propertyArray[_loc15_].LOCATION = 4;
                  }
                  else if(this.mcScope.MapContainer.map.location_5.hitTest(pinReferenceMC) == true)
                  {
                     this.propertyArray[_loc15_].LOCATION = 5;
                  }
                  else
                  {
                     this.propertyArray[_loc15_].LOCATION = 6;
                  }
                  _loc18_ = "property_" + _loc15_;
                  _loc2_ = this.propertyButtonContainer.attachMovie("button_propertyList",_loc18_,this.propertyButtonContainer.getNextHighestDepth(),{_x:_loc43_,_y:_loc17_});
                  _loc2_.highlight._visible = false;
                  _loc19_ = "propertyMC" + _loc15_;
                  this.propertyMC = _loc2_.attachMovie("propertyTextureMC",_loc19_,_loc2_.getNextHighestDepth(),{_x:10,_y:9});
                  if(this.propertyArray[_loc15_].SALE && this.propertyArray[_loc15_].SALE_PRICE != this.propertyArray[_loc15_].PRICE)
                  {
                     _loc2_.saleBanner.label.autoSize = "left";
                     com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.saleBanner.label,"WEB_VEHICLE_SALE",0,false);
                     if(this.propertyArray[_loc15_].SALE_PRICE)
                     {
                        _loc2_.saleBanner.label.text = _loc2_.saleBanner.label.text + ": " + this.formatAmount(this.propertyArray[_loc15_].SALE_PRICE);
                     }
                     _loc52_ = _loc2_.saleBanner.label._width;
                     _loc2_.saleBanner.right._x = _loc2_.saleBanner.label._x + _loc52_;
                     _loc2_.saleBanner.centre._width = _loc2_.saleBanner.right._x - _loc2_.saleBanner.centre._x;
                     _loc2_.saleBanner.swapDepths(_loc2_.getNextHighestDepth());
                  }
                  else
                  {
                     _loc2_.saleBanner._visible = false;
                  }
                  if(this.propertyArray[_loc15_].REBATE && this.propertyArray[_loc15_].REBATE != "")
                  {
                     _loc2_.rebateBanner.swapDepths(_loc2_.getNextHighestDepth());
                     _loc2_.rebateBanner.label.textAutoSize = "shrink";
                     _loc2_.rebateBanner.label.text = this.propertyArray[_loc15_].REBATE;
                  }
                  else
                  {
                     _loc2_.rebateBanner._visible = false;
                  }
                  if(this.propertyArray[_loc15_].STARTER_PACK)
                  {
                     _loc2_.starterPack.swapDepths(_loc2_.getNextHighestDepth());
                  }
                  else
                  {
                     _loc2_.starterPack._visible = false;
                  }
                  if(this.propertyArray[_loc15_].DLC != undefined)
                  {
                     this.propertyMC.dlcText = this.propertyArray[_loc15_].DLC;
                  }
                  _loc17_ += Math.round(_loc2_.background._height) + 2;
                  this.bottomLine = _loc17_;
                  this.dataTextScope[_loc15_] = _loc2_.btnTxt;
                  this.dataTextScope[_loc15_ + this.propertyArray.length] = this.mcScope.MapContainer.map.pinContainer["pin_" + _loc15_].btnTxt;
                  _loc15_ = _loc15_ + 1;
               }
               pinReferenceMC.removeMovieClip();
               _loc48_._height = this.bottomLine - (_loc2_.background._height - 44);
               _loc48_._visible = true;
               this.propertyButtonContainer.initHitArea(this,_loc56_);
               this.newHeight = this.bottomLine + 239;
               if(this.newHeight < 627)
               {
                  this.newHeight = 627;
               }
               this.CONTENT.BOUNDING_BOX._height = this.newHeight;
               this.mcScope.backgroundMC._height = this.newHeight;
               this.mcScope.footerMC._y = this.newHeight;
               this.dataTextScope[this.propertyArray.length * 2 + 1] = this.mcScope.MapContainer.zoomIn.btnTxt;
               this.dataTextScope[this.propertyArray.length * 2 + 2] = this.mcScope.MapContainer.zoomOut.btnTxt;
               this.dataTextScope[this.propertyArray.length * 2 + 3] = this.headerMC.sizeAll.btnTxt;
               this.dataTextScope[this.propertyArray.length * 2 + 4] = this.headerMC.sizeHigh.btnTxt;
               this.dataTextScope[this.propertyArray.length * 2 + 5] = this.headerMC.sizeMed.btnTxt;
               this.dataTextScope[this.propertyArray.length * 2 + 6] = this.headerMC.sizeLow.btnTxt;
               this.dataTextScope[this.propertyArray.length * 2 + 7] = this.headerMC.sizeNew.btnTxt;
               this.dataTextScope[this.propertyArray.length * 2 + 8] = this.headerMC.filterButtonsMC.priceLowToHigh.btnTxt;
               this.dataTextScope[this.propertyArray.length * 2 + 9] = this.headerMC.filterButtonsMC.priceHighToLow.btnTxt;
               this.dataTextScope[this.propertyArray.length * 2 + 10] = this.headerMC.filterButtonsMC.locationDowntown.btnTxt;
               this.dataTextScope[this.propertyArray.length * 2 + 11] = this.headerMC.filterButtonsMC.locationEastLS.btnTxt;
               this.dataTextScope[this.propertyArray.length * 2 + 12] = this.headerMC.filterButtonsMC.locationWestLS.btnTxt;
               this.dataTextScope[this.propertyArray.length * 2 + 13] = this.headerMC.filterButtonsMC.locationNorthLS.btnTxt;
               this.dataTextScope[this.propertyArray.length * 2 + 14] = this.headerMC.filterButtonsMC.locationSouthLS.btnTxt;
               this.dataTextScope[this.propertyArray.length * 2 + 15] = this.headerMC.filterButtonsMC.locationBlaineCounty.btnTxt;
               this.dataTextScope[this.propertyArray.length * 2 + 16] = this.mcScope.MapContainer.mapUP.btnTxt;
               this.dataTextScope[this.propertyArray.length * 2 + 17] = this.mcScope.MapContainer.mapDOWN.btnTxt;
               this.dataTextScope[this.propertyArray.length * 2 + 18] = this.mcScope.MapContainer.mapLEFT.btnTxt;
               this.dataTextScope[this.propertyArray.length * 2 + 19] = this.mcScope.MapContainer.mapRIGHT.btnTxt;
               this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
               this.sortProperties();
            }
            if(newPage == false)
            {
               this.zoomAndScrollToLastProperty();
               this.dataProviderUI = new Array();
            }
            this.browser.GUTTER._height = 477;
            this.browser.GUTTER._y = this.browser.TOOLBAR._y + 45 + 150;
            break;
         case "PROPERTY_D_DETAILS":
            this.mcScope = this.CONTENT.PROPERTY_D_DETAILS;
            this.CONTENT._y = 0;
            this.comeFromAnotherPage = true;
            this.defaultButtonOnColour = this.textColGreen;
            this.defaultButtonOffColour = this.textColDarkGreen;
            _loc3_(this.mcScope.header_strapline,"DYN_PG1_HEADER",0,true);
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.LOS_D_SANTOS_S_.btnTxt;
            this.dataTextScope[1] = this.mcScope.LOS_D_SANTOS.btnTxt;
            _loc3_(this.mcScope.LOS_D_SANTOS.btnTxt,"DYN_VIEWLISTINGS",0,false);
            this.mcScope.LOS_D_SANTOS.btnTxt.autoSize = "center";
            this.mcScope.LOS_D_SANTOS.btnTxt._x = - this.mcScope.LOS_D_SANTOS.btnTxt.textWidth / 2;
            this.mcScope.LOS_D_SANTOS.background._width = this.mcScope.LOS_D_SANTOS.btnTxt.textWidth;
            this.mcScope.LOS_D_SANTOS._x = 1064 - this.mcScope.LOS_D_SANTOS._width / 2;
            if(!this.propertyArray[this.pinNumber].INTERIORS)
            {
               this.dataTextScope[2] = this.mcScope.PURCHASE.btnTxt;
               _loc3_(this.mcScope.PURCHASE.btnTxt,"DYN_PURCHASEPROP",0,false);
               this.mcScope.PURCHASE.btnTxt.autoSize = "center";
               this.mcScope.PURCHASE.onColour = this.textColLightGreen;
               this.mcScope.PURCHASE.offColour = this.textColWhite;
               this.mcScope.PURCHASE.btnTxt._x = - this.mcScope.PURCHASE.btnTxt.textWidth / 2;
               this.mcScope.PURCHASE.background._width = 20 + this.mcScope.PURCHASE.btnTxt.textWidth;
               this.mcScope.PURCHASE._x = 1064 - this.mcScope.PURCHASE._width / 2;
            }
            this.mcScope.PURCHASE._visible = !this.propertyArray[this.pinNumber].INTERIORS;
            this.dataTextScope[3] = this.mcScope.GETDIRECTIONS.btnTxt;
            _loc3_(this.mcScope.GETDIRECTIONS.btnTxt,"DYN_PROP_GETDIR",0,false);
            this.mcScope.GETDIRECTIONS.btnTxt.autoSize = "left";
            this.mcScope.GETDIRECTIONS.btnTxt._width = this.mcScope.GETDIRECTIONS.btnTxt.textWidth + 4;
            this.mcScope.GETDIRECTIONS.btnTxt._x = 150 - this.mcScope.GETDIRECTIONS.btnTxt.textWidth / 2;
            this.mcScope.GETDIRECTIONS.directionsIcon._x = this.mcScope.GETDIRECTIONS.btnTxt._x - 24;
            if(this.propertyArray[this.pinNumber].INTERIORS)
            {
               this.dataTextScope[4] = this.mcScope.PROPERTY_D_INTERIORS.btnTxt;
               _loc3_(this.mcScope.PROPERTY_D_INTERIORS.btnTxt,"DYN_SELECT_INTERIORS",0,false);
               this.mcScope.PROPERTY_D_INTERIORS.btnTxt.autoSize = "center";
               this.mcScope.PROPERTY_D_INTERIORS.onColour = this.textColLightGreen;
               this.mcScope.PROPERTY_D_INTERIORS.offColour = this.textColWhite;
               this.mcScope.PROPERTY_D_INTERIORS.btnTxt._x = - this.mcScope.PROPERTY_D_INTERIORS.btnTxt.textWidth / 2;
               this.mcScope.PROPERTY_D_INTERIORS.background._width = 20 + this.mcScope.PROPERTY_D_INTERIORS.btnTxt.textWidth;
               this.mcScope.PROPERTY_D_INTERIORS._x = 1064 - this.mcScope.PROPERTY_D_INTERIORS._width / 2;
            }
            this.mcScope.PROPERTY_D_INTERIORS._visible = this.propertyArray[this.pinNumber].INTERIORS;
            if(this.propertyArray[this.pinNumber].SALE && this.propertyArray[this.pinNumber].SALE_PRICE != this.propertyArray[this.pinNumber].PRICE)
            {
               this.mcScope.saleBanner.label.autoSize = "left";
               com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.saleBanner.label,"WEB_VEHICLE_SALE",0,false);
               _loc52_ = this.mcScope.saleBanner.label._width;
               this.mcScope.saleBanner.right._x = this.mcScope.saleBanner.label._x + _loc52_;
               this.mcScope.saleBanner.centre._width = this.mcScope.saleBanner.right._x - this.mcScope.saleBanner.centre._x;
            }
            else
            {
               this.mcScope.saleBanner._visible = false;
            }
            this.mcScope.propertyTF.htmlText = this.propertyArray[this.pinNumber].PROPERTY;
            this.mcScope.propertyTF2.htmlText = this.propertyArray[this.pinNumber].PROPERTY + "       " + _loc49_[this.propertyArray[this.pinNumber].SIZE];
            this.mcScope.carIcon._x = this.mcScope.propertyTF2._x + this.mcScope.propertyTF2.textWidth + 6;
            this.mcScope.locationTF.htmlText = this.propLocArray[this.propertyArray[this.pinNumber].LOCATION];
            _loc3_(this.mcScope.filterSizeTF,_loc47_[this.propertyArray[this.pinNumber].SIZE],0,false);
            this.mcScope.filterSizeTF.autoSize = "left";
            this.mcScope.filterSlashTF._x = this.mcScope.filterSizeTF._x + this.mcScope.filterSizeTF._width;
            this.mcScope.filterLocationTF._x = this.mcScope.filterSlashTF._x + this.mcScope.filterSlashTF.textWidth;
            _loc3_(this.mcScope.filterLocationTF,_loc50_[this.propertyArray[this.pinNumber].LOCATION],0,false);
            this.mcScope.filterLocationTF.autoSize = "left";
            this.mcScope.propertyCost.htmlText = this.formatAmount(this.propertyArray[this.pinNumber].PRICE);
            this.mcScope.descTF.autoSize = "left";
            this.mcScope.descTF.htmlText = this.propertyArray[this.pinNumber].DESCRIPTION;
            _loc45_ = this.mcScope.descTF._y + this.mcScope.descTF.textHeight + 10;
            if(_loc45_ > this.mcScope.PURCHASE._y)
            {
               this.mcScope.PURCHASE._y = _loc45_;
               this.mcScope.PROPERTY_D_INTERIORS._y = _loc45_;
               this.mcScope.underlines._y = _loc45_;
               this.mcScope.propertyCost._y = _loc45_ + 3;
            }
            if(this.propertyArray[this.pinNumber].TXD != undefined && this.propertyArray[this.pinNumber].TXD != "")
            {
               if(this.mcScope.propertyMC == undefined)
               {
                  this.propertyMC = this.mcScope.attachMovie("propertyTextureMC","propertyMC",this.mcScope.getNextHighestDepth(),{_x:223,_y:255});
                  if(this.propertyArray[this.pinNumber].DLC != undefined)
                  {
                     this.propertyMC.dlcText = this.propertyArray[this.pinNumber].DLC;
                  }
                  this.propertyMC.updateImage(this.propertyArray[this.pinNumber].TXD);
               }
            }
            if(this.propertyArray[this.pinNumber].SALE_PRICE && this.propertyArray[this.pinNumber].SALE_PRICE != this.propertyArray[this.pinNumber].PRICE)
            {
               this.mcScope.saleCost._x = this.mcScope.propertyCost._x + this.mcScope.propertyCost.textWidth + 10;
               this.mcScope.saleCost.text = this.formatAmount(this.propertyArray[this.pinNumber].SALE_PRICE);
               this.mcScope.redLine._width = this.mcScope.propertyCost.textWidth;
            }
            else
            {
               this.mcScope.redLine._visible = false;
            }
            this.mcScope.saleBanner.swapDepths(this.mcScope.getNextHighestDepth());
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            this.CONTENT.BOUNDING_BOX._height = 627;
            break;
         case "PROPERTY_D_INTERIORS":
            this.mcScope = this.CONTENT.PROPERTY_D_INTERIORS;
            this.CONTENT._y = 0;
            this.comeFromAnotherPage = true;
            if(this.propertyArray[this.pinNumber].TINTS)
            {
               this.useTints = true;
            }
            else
            {
               this.useTints = false;
            }
            this.defaultButtonOnColour = this.textColGreen;
            this.defaultButtonOffColour = this.textColDarkGreen;
            _loc3_(this.mcScope.header_strapline,"DYN_PG1_HEADER",0,true);
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.LOS_D_SANTOS_S_.btnTxt;
            _loc3_(this.mcScope.LOS_D_SANTOS.btnTxt,"DYN_VIEWLISTINGS",0,false);
            this.mcScope.LOS_D_SANTOS.btnTxt.autoSize = "center";
            this.mcScope.LOS_D_SANTOS.btnTxt._x = - this.mcScope.LOS_D_SANTOS.btnTxt.textWidth / 2;
            this.mcScope.LOS_D_SANTOS.background._width = this.mcScope.LOS_D_SANTOS.btnTxt.textWidth;
            this.mcScope.LOS_D_SANTOS._x = 1064 - this.mcScope.LOS_D_SANTOS._width / 2;
            _loc15_ = 1;
            while(_loc15_ <= com.rockstargames.gtav.web.WWW_DYNASTY8REALESTATE_COM.NUM_INTERIOR_OPTIONS)
            {
               _loc4_ = this.mcScope["PURCHASE_" + _loc15_];
               this.dataTextScope[_loc15_] = _loc4_.btnTxt;
               _loc3_(_loc4_.btnTxt,"DYN_PURCHASEPROP",0,false);
               _loc4_.btnTxt.textAutoSize = "shrink";
               _loc4_.onColour = this.textColLightGreen;
               _loc4_.offColour = this.textColWhite;
               _loc4_.btnTxt._x = -138;
               _loc4_.btnTxt._width = 276;
               _loc4_.background._width = 276;
               _loc4_._x = 1064 - _loc4_._width / 2;
               _loc15_ = _loc15_ + 1;
            }
            this.dataTextScope[9] = this.mcScope.LOS_D_SANTOS.btnTxt;
            this.dataTextScope[10] = this.mcScope.GETDIRECTIONS.btnTxt;
            _loc3_(this.mcScope.GETDIRECTIONS.btnTxt,"DYN_PROP_GETDIR",0,false);
            this.mcScope.GETDIRECTIONS.btnTxt.textAutoSize = "shrink";
            _loc22_ = 1;
            _loc21_ = this.mcScope.OPTION_0._y;
            _loc44_ = this.mcScope.OPTION_1._y - this.mcScope.OPTION_0._y;
            if(this.propertyArray[this.pinNumber].INTERIORS === true)
            {
               this.propertyArray[this.pinNumber].INTERIORS = 255;
            }
            _loc15_ = 0;
            while(_loc15_ < com.rockstargames.gtav.web.WWW_DYNASTY8REALESTATE_COM.NUM_INTERIOR_OPTIONS)
            {
               if((this.propertyArray[this.pinNumber].INTERIORS & _loc22_) >> _loc15_ == 0 || this.useTints && _loc15_ > 2)
               {
                  this.mcScope["OPTION_" + _loc15_]._visible = false;
               }
               else
               {
                  this.mcScope["OPTION_" + _loc15_]._y = _loc21_;
                  _loc21_ += _loc44_;
                  _loc12_ = this.mcScope["OPTION_" + _loc15_].btnTxt;
                  this.dataTextScope[_loc15_ + 11] = _loc12_;
                  _loc12_.autoSize = "left";
                  if(this.useTints)
                  {
                     _loc3_(_loc12_,"PIM_MSG_STY_" + _loc15_,0,false);
                  }
                  else
                  {
                     _loc3_(_loc12_,"DYN_INTERIOR_OPTION_" + (_loc15_ + 1),0,false);
                  }
               }
               _loc22_ <<= 1;
               _loc15_ = _loc15_ + 1;
            }
            this.interiorMC = this.mcScope.attachMovie("interiorTextureMC","interiorMC",this.mcScope.getNextHighestDepth(),{_x:223,_y:196});
            this.updateOptions(0,0);
            this.mcScope.propertyTF2.htmlText = this.propertyArray[this.pinNumber].PROPERTY + "       " + _loc49_[this.propertyArray[this.pinNumber].SIZE];
            this.mcScope.carIcon._x = this.mcScope.propertyTF2._x + this.mcScope.propertyTF2.textWidth + 6;
            this.mcScope.locationTF.htmlText = this.propLocArray[this.propertyArray[this.pinNumber].LOCATION];
            _loc3_(this.mcScope.filterSizeTF,_loc47_[this.propertyArray[this.pinNumber].SIZE],0,false);
            this.mcScope.filterSizeTF.autoSize = "left";
            this.mcScope.filterSlashTF._x = this.mcScope.filterSizeTF._x + this.mcScope.filterSizeTF._width;
            this.mcScope.filterLocationTF._x = this.mcScope.filterSlashTF._x + this.mcScope.filterSlashTF.textWidth;
            _loc3_(this.mcScope.filterLocationTF,_loc50_[this.propertyArray[this.pinNumber].LOCATION],0,false);
            this.mcScope.filterLocationTF.autoSize = "left";
            this.mcScope.descTF.autoSize = "left";
            if(this.useTints)
            {
               _loc15_ = 0;
               while(_loc15_ < com.rockstargames.gtav.web.WWW_DYNASTY8REALESTATE_COM.NUM_INTERIOR_TINTS)
               {
                  _loc8_ = this.mcScope.tintButtons["TINT_" + _loc15_];
                  _loc8_.onColour = 16777215;
                  _loc8_.offColour = 16777215;
                  _loc8_.swatch.gotoAndStop(_loc15_ + 1);
                  _loc8_.selected._visible = false;
                  this.dataTextScope.push(_loc8_.btnTxt);
                  _loc15_ = _loc15_ + 1;
               }
               this.mcScope.tintButtons._visible = true;
               this.mcScope.descTF._y = this.mcScope.tintButtons._y + this.mcScope.tintButtons._height + 15;
               _loc3_(this.mcScope.descTF,"PIM_MSG_STY_D_0",0,true);
            }
            else
            {
               this.mcScope.tintButtons._visible = false;
               this.mcScope.descTF._y = _loc21_ + 15;
               _loc3_(this.mcScope.descTF,"DYN_INTERIOR_DESCRIPTION_1",0,true);
            }
            this.mcScope.propertyCost.htmlText = this.formatAmount(this.propertyArray[this.pinNumber].PRICE);
            this.mcScope.propertyCost._y = this.mcScope.descTF._y + this.mcScope.descTF._height + 5;
            _loc15_ = 1;
            while(_loc15_ <= com.rockstargames.gtav.web.WWW_DYNASTY8REALESTATE_COM.NUM_INTERIOR_OPTIONS)
            {
               this.mcScope["PURCHASE_" + _loc15_]._y = this.mcScope.propertyCost._y + 40;
               _loc15_ = _loc15_ + 1;
            }
            this.mcScope.columnBG._height = this.mcScope.PURCHASE_1._y - this.mcScope.columnBG._y;
            if(this.propertyArray[this.pinNumber].TXD != undefined && this.propertyArray[this.pinNumber].TXD != "")
            {
               if(this.mcScope.propertyMC == undefined)
               {
                  this.propertyMC = this.mcScope.attachMovie("propertyTextureMC","propertyMC",this.mcScope.getNextHighestDepth(),{_x:796,_y:195});
                  if(this.propertyArray[this.pinNumber].DLC != undefined)
                  {
                     this.propertyMC.dlcText = this.propertyArray[this.pinNumber].DLC;
                  }
                  this.propertyMC.updateImage(this.propertyArray[this.pinNumber].TXD);
               }
            }
            if(this.propertyArray[this.pinNumber].SALE && this.propertyArray[this.pinNumber].SALE_PRICE != this.propertyArray[this.pinNumber].PRICE)
            {
               this.mcScope.saleBanner.label.autoSize = "left";
               com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.saleBanner.label,"WEB_VEHICLE_SALE",0,false);
               _loc52_ = this.mcScope.saleBanner.label._width;
               this.mcScope.saleBanner.right._x = this.mcScope.saleBanner.label._x + _loc52_;
               this.mcScope.saleBanner.centre._width = this.mcScope.saleBanner.right._x - this.mcScope.saleBanner.centre._x;
               this.mcScope.saleBanner.swapDepths(this.mcScope.getNextHighestDepth());
            }
            else
            {
               this.mcScope.saleBanner._visible = false;
            }
            if(this.propertyArray[this.pinNumber].SALE_PRICE && this.propertyArray[this.pinNumber].SALE_PRICE != this.propertyArray[this.pinNumber].PRICE)
            {
               if(this.displayConfig.isAsian == 1)
               {
                  _loc51_ = this.mcScope.propertyCost._width;
                  this.mcScope.propertyCost._yscale = _loc0_ = 75;
                  this.mcScope.propertyCost._xscale = _loc0_;
                  this.mcScope.propertyCost._width = _loc51_ / 0.75;
                  this.mcScope.redLine._width = 0.75 * this.mcScope.propertyCost.textWidth;
                  this.mcScope.propertyCost.htmlText += " <font color=\'#cc0000\'>" + this.formatAmount(this.propertyArray[this.pinNumber].SALE_PRICE) + "</font>";
                  this.mcScope.redLine._x = this.mcScope.propertyCost._x + 0.5 * (this.mcScope.propertyCost._width - 0.75 * this.mcScope.propertyCost.textWidth);
                  this.mcScope.redLine._y = this.mcScope.propertyCost._y + 2;
               }
               else
               {
                  this.mcScope.redLine._width = this.mcScope.propertyCost.textWidth;
                  this.mcScope.propertyCost.htmlText += " <font color=\'#cc0000\'>" + this.formatAmount(this.propertyArray[this.pinNumber].SALE_PRICE) + "</font>";
                  this.mcScope.redLine._x = this.mcScope.propertyCost._x + 0.5 * (this.mcScope.propertyCost._width - this.mcScope.propertyCost.textWidth);
                  this.mcScope.redLine._y = this.mcScope.propertyCost._y + 8;
               }
            }
            else
            {
               this.mcScope.redLine._visible = false;
            }
            this.mcScope.footerMC._y = Math.max(this.mcScope.PURCHASE_1._y + 100,800);
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            this.CONTENT.BOUNDING_BOX._height = this.mcScope.footerMC._y;
            break;
         case "GETDIRECTIONS":
            this.mcScope = this.CONTENT.GETDIRECTIONS;
            this.CONTENT._y = 0;
            this.comeFromAnotherPage = true;
            this.defaultButtonOnColour = this.textColLightGreen;
            this.defaultButtonOffColour = this.textColWhite;
            _loc3_(this.mcScope.header_strapline,"DYN_PG1_HEADER",0,true);
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.LOS_D_SANTOS_S_.btnTxt;
            _loc3_(this.mcScope.heading,"LAR_SENTTOGPS",0,true);
            this.dataTextScope[1] = this.mcScope.LOS_D_SANTOS.btnTxt;
            _loc3_(this.mcScope.LOS_D_SANTOS.btnTxt,"LAR_RETURNTOMAP",0,false);
            this.mcScope.LOS_D_SANTOS.btnTxt.autoSize = "center";
            this.mcScope.LOS_D_SANTOS.btnTxt._x = - this.mcScope.LOS_D_SANTOS.btnTxt.textWidth / 2;
            this.mcScope.LOS_D_SANTOS.background._width = 20 + this.mcScope.LOS_D_SANTOS.btnTxt.textWidth;
            this.mcScope.body.text = "";
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            this.CONTENT.BOUNDING_BOX._height = 627;
            break;
         case "PURCHASE":
            this.mcScope = this.CONTENT.PURCHASE;
            this.CONTENT._y = 0;
            this.comeFromAnotherPage = true;
            this.defaultButtonOnColour = this.textColLightGreen;
            this.defaultButtonOffColour = this.textColWhite;
            _loc3_(this.mcScope.header_strapline,"DYN_PG1_HEADER",0,true);
            _loc3_(this.mcScope.heading,"WEB_PROCESSINGTRANSACTION",0,true);
            this.mcScope.body.text = "";
            this.mcScope.signMC._alpha = 0;
            this.mcScope.LOS_D_SANTOS._visible = false;
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            this.CONTENT.BOUNDING_BOX._height = 627;
            break;
         case "PURCHASE_D_SUCCESS":
            this.mcScope = this.CONTENT.PURCHASE;
            this.CONTENT._y = 0;
            this.comeFromAnotherPage = true;
            this.defaultButtonOnColour = this.textColLightGreen;
            this.defaultButtonOffColour = this.textColWhite;
            _loc3_(this.mcScope.header_strapline,"DYN_PG1_HEADER",0,true);
            this.mcScope.heading2.text = "";
            this.mcScope.body.text = "";
            this.mcScope.LOS_D_SANTOS._visible = true;
            _loc3_(this.mcScope.heading,"DYN_PURCHASED",0,true);
            _loc3_(this.mcScope.body,"DYN_DISCLAIMER",0,true);
            _loc3_(this.mcScope.signMC.signTF,"DYN_THANKYOU",0,true);
            this.mcScope.signMC.signTF.autoSize = "center";
            this.mcScope.signMC.signTF._y = 118 - this.mcScope.signMC.signTF.textHeight / 2;
            this.mcScope.signMC._alpha = 100;
            this.dataTextScope[1] = this.mcScope.LOS_D_SANTOS.btnTxt;
            _loc3_(this.mcScope.LOS_D_SANTOS.btnTxt,"LAR_RETURNTOMAP",0,false);
            this.mcScope.LOS_D_SANTOS.btnTxt.autoSize = "center";
            this.mcScope.LOS_D_SANTOS.btnTxt._x = - this.mcScope.LOS_D_SANTOS.btnTxt.textWidth / 2;
            this.mcScope.LOS_D_SANTOS.background._width = 20 + this.mcScope.LOS_D_SANTOS.btnTxt.textWidth;
            this.mcScope.LOS_D_SANTOS._x = 530 + this.mcScope.LOS_D_SANTOS._width / 2;
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            this.CONTENT.BOUNDING_BOX._height = 627;
            break;
         case "PURCHASE_D_FAILED":
            this.mcScope = this.CONTENT.PURCHASE_D_FAILED;
            this.CONTENT._y = 0;
            this.comeFromAnotherPage = true;
            this.defaultButtonOnColour = this.textColLightGreen;
            this.defaultButtonOffColour = this.textColWhite;
            _loc3_(this.mcScope.header_strapline,"DYN_PG1_HEADER",0,true);
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.LOS_D_SANTOS_S_.btnTxt;
            _loc3_(this.mcScope.heading,"LAR_FAILED",0,true);
            _loc3_(this.mcScope.body,"WEB_SORRY",0,true);
            _loc3_(this.mcScope.signMC.signTF,"DYN_SORRY",0,true);
            this.mcScope.signMC.signTF.autoSize = "center";
            this.mcScope.signMC.signTF._y = 118 - this.mcScope.signMC.signTF.textHeight / 2;
            this.mcScope.signMC._alpha = 100;
            this.dataTextScope[1] = this.mcScope.LOS_D_SANTOS.btnTxt;
            _loc3_(this.mcScope.LOS_D_SANTOS.btnTxt,"LAR_RETURNTOMAP",0,false);
            this.mcScope.LOS_D_SANTOS.btnTxt.autoSize = "center";
            this.mcScope.LOS_D_SANTOS.btnTxt._x = - this.mcScope.LOS_D_SANTOS.btnTxt.textWidth / 2;
            this.mcScope.LOS_D_SANTOS.background._width = 20 + this.mcScope.LOS_D_SANTOS.btnTxt.textWidth;
            this.mcScope.LOS_D_SANTOS._x = 530 + this.mcScope.LOS_D_SANTOS._width / 2;
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            this.CONTENT.BOUNDING_BOX._height = 627;
            break;
         case "PURCHASE_D_ERROR":
            this.mcScope = this.CONTENT.PURCHASE_D_ERROR;
            this.CONTENT._y = 0;
            this.comeFromAnotherPage = true;
            this.defaultButtonOnColour = this.textColLightGreen;
            this.defaultButtonOffColour = this.textColWhite;
            _loc3_(this.mcScope.header_strapline,"DYN_PG1_HEADER",0,true);
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.LOS_D_SANTOS_S_.btnTxt;
            _loc3_(this.mcScope.signMC.signTF,"DYN_SORRY",0,true);
            this.mcScope.signMC.signTF.autoSize = "center";
            this.mcScope.signMC.signTF._y = 118 - this.mcScope.signMC.signTF.textHeight / 2;
            this.mcScope.signMC._alpha = 100;
            this.dataTextScope[1] = this.mcScope.LOS_D_SANTOS.btnTxt;
            _loc3_(this.mcScope.LOS_D_SANTOS.btnTxt,"LAR_RETURNTOMAP",0,false);
            this.mcScope.LOS_D_SANTOS.btnTxt.autoSize = "center";
            this.mcScope.LOS_D_SANTOS.btnTxt._x = - this.mcScope.LOS_D_SANTOS.btnTxt.textWidth / 2;
            this.mcScope.LOS_D_SANTOS.background._width = 20 + this.mcScope.LOS_D_SANTOS.btnTxt.textWidth;
            this.mcScope.LOS_D_SANTOS._x = 530 + this.mcScope.LOS_D_SANTOS._width / 2;
            if(newPage != true)
            {
               if(this.dataProviderUI[0] != undefined)
               {
                  this.mcScope.heading.text = this.dataProviderUI[0];
               }
               if(this.dataProviderUI[1] != undefined)
               {
                  this.mcScope.body.text = this.dataProviderUI[1];
               }
            }
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            this.CONTENT.BOUNDING_BOX._height = 627;
            break;
         case "PURCHASE_D_CONFIRM":
            this.mcScope = this.CONTENT.PURCHASE_D_CONFIRM;
            this.CONTENT._y = 0;
            this.comeFromAnotherPage = true;
            this.defaultButtonOnColour = this.textColLightGreen;
            this.defaultButtonOffColour = this.textColWhite;
            _loc3_(this.mcScope.header_strapline,"DYN_PG1_HEADER",0,true);
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.LOS_D_SANTOS_S_.btnTxt;
            this.mcScope.heading.htmlText = this.dataProviderUI[1];
            this.dataTextScope[2] = this.mcScope.PURCHASE.btnTxt;
            this.mcScope.PURCHASE.btnTxt.autoSize = "center";
            this.mcScope.PURCHASE.btnTxt._x = - this.mcScope.PURCHASE.btnTxt.textWidth / 2;
            this.mcScope.PURCHASE.background._width = 20 + this.mcScope.PURCHASE.btnTxt.textWidth;
            this.dataTextScope[3] = this.mcScope.PURCHASE_D_FAILED.btnTxt;
            this.mcScope.PURCHASE_D_FAILED.btnTxt.autoSize = "center";
            this.mcScope.PURCHASE_D_FAILED.btnTxt._x = - this.mcScope.PURCHASE_D_FAILED.btnTxt.textWidth / 2;
            this.mcScope.PURCHASE_D_FAILED.background._width = 20 + this.mcScope.PURCHASE_D_FAILED.btnTxt.textWidth;
            if(newPage != true)
            {
               if(this.dataProviderUI[2] != undefined)
               {
                  this.dataTextScope[2].htmlText = this.dataProviderUI[2];
               }
               if(this.dataProviderUI[3] != undefined)
               {
                  this.dataTextScope[3].htmlText = this.dataProviderUI[3];
               }
            }
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            this.forceTopOfList = true;
            break;
         case "MAINTENANCE":
            this.mcScope = this.CONTENT.MAINTENANCE;
            this.CONTENT._y = 0;
            _loc3_(this.mcScope.header_strapline,"DYN_PG1_HEADER",0,true);
            this.dataTextScope = new Array();
            _loc3_(this.mcScope.heading,"WEB_MAINTENANCE",0,true);
            _loc3_(this.mcScope.body,"DYN_MAINTENANCE",0,true);
            _loc3_(this.mcScope.signMC.signTF,"DYN_UNDERCONSTRUCT",0,true);
            this.mcScope.signMC.signTF.autoSize = "center";
            this.mcScope.signMC.signTF._y = 118 - this.mcScope.signMC.signTF.textHeight / 2;
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
         default:
            return;
      }
   }
   function updateOptions(selectedIndex, selectedTint)
   {
      var _loc3_ = this.CONTENT.PROPERTY_D_INTERIORS;
      var _loc5_;
      var _loc2_;
      _loc5_ = 0;
      while(_loc5_ < com.rockstargames.gtav.web.WWW_DYNASTY8REALESTATE_COM.NUM_INTERIOR_OPTIONS)
      {
         _loc2_ = _loc3_["PURCHASE_" + (_loc5_ + 1)];
         _loc2_._visible = selectedIndex == _loc5_;
         _loc2_.disabled = selectedIndex != _loc5_;
         _loc5_ = _loc5_ + 1;
      }
      _loc5_ = 0;
      while(_loc5_ < com.rockstargames.gtav.web.WWW_DYNASTY8REALESTATE_COM.NUM_INTERIOR_OPTIONS)
      {
         _loc2_ = _loc3_["OPTION_" + _loc5_];
         _loc2_.selected = selectedIndex == _loc5_;
         _loc2_.disabled = selectedIndex == _loc5_;
         _loc2_.selectedIcon._visible = selectedIndex == _loc5_;
         _loc5_ = _loc5_ + 1;
      }
      _loc5_ = 0;
      while(_loc5_ < com.rockstargames.gtav.web.WWW_DYNASTY8REALESTATE_COM.NUM_INTERIOR_TINTS)
      {
         _loc2_ = _loc3_.tintButtons["TINT_" + _loc5_];
         _loc2_.swatch.gotoAndStop(selectedIndex * com.rockstargames.gtav.web.WWW_DYNASTY8REALESTATE_COM.NUM_INTERIOR_TINTS + _loc5_ + 1);
         _loc2_.selected = selectedTint == _loc5_;
         _loc2_.hilight._visible = selectedTint == _loc5_;
         _loc2_.disabled = selectedTint == _loc5_;
         _loc5_ = _loc5_ + 1;
      }
      this.interiorMC.removeImage();
      if(this.useTints)
      {
         this.interiorMC.updateImage("DYN_DLC_GARAGES_DYN_MP_GAR_" + selectedIndex + "_" + selectedTint);
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc3_.descTF,"PIM_MSG_STY_D_" + selectedIndex,0,true);
      }
      else
      {
         this.interiorMC.updateImage("DYN_DLC_APARTMENTS_DYN_MP_INT_" + selectedIndex);
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc3_.descTF,"DYN_INTERIOR_DESCRIPTION_" + (selectedIndex + 1),0,true);
      }
      _loc3_.propertyCost._y = _loc3_.descTF._y + _loc3_.descTF._height + 5;
      _loc5_ = 1;
      while(_loc5_ <= com.rockstargames.gtav.web.WWW_DYNASTY8REALESTATE_COM.NUM_INTERIOR_OPTIONS)
      {
         _loc3_["PURCHASE_" + _loc5_]._y = _loc3_.propertyCost._y + 40;
         _loc5_ = _loc5_ + 1;
      }
      _loc3_.redLine._y = _loc3_.propertyCost._y + 8;
      _loc3_.columnBG._height = _loc3_.PURCHASE_1._y - _loc3_.columnBG._y;
      _loc3_.footerMC._y = Math.max(_loc3_.PURCHASE_1._y + 100,800);
      this.CONTENT.BOUNDING_BOX._height = _loc3_.footerMC._y;
      this.browser.RESIZE_WEBSITE();
   }
   function TXD_HAS_LOADED(textureDict, success, uniqueID)
   {
      var _loc2_;
      var _loc4_;
      var _loc5_;
      if(success == true)
      {
         if(uniqueID == "propertyMC")
         {
            _loc2_ = this.mcScope[uniqueID];
            if(_loc2_ != undefined)
            {
               _loc2_.showImage();
            }
         }
         else if(uniqueID == "interiorMC")
         {
            _loc2_ = this.mcScope[uniqueID];
            if(_loc2_ != undefined)
            {
               _loc2_.showImage();
            }
         }
         else if(this.pageName == "PAGE1")
         {
            _loc2_ = this.mcScope.images[uniqueID];
            if(_loc2_ != undefined)
            {
               _loc2_.showImage();
            }
         }
         else
         {
            _loc4_ = uniqueID.split("propertyMC").join("");
            _loc5_ = this.propertyButtonContainer["property_" + _loc4_];
            _loc2_ = _loc5_[uniqueID];
            if(_loc2_ != undefined)
            {
               if(this.sortedPropertyArray[_loc4_].VISIBLE == true)
               {
                  _loc2_.showImage();
               }
               else if(_loc2_.loadedStatus == "pending")
               {
                  _loc2_.removeImage();
               }
            }
         }
      }
   }
   function formatAmount(value)
   {
      var _loc2_ = "$";
      var _loc3_;
      var _loc5_;
      var _loc1_;
      if(typeof value != "string")
      {
         _loc3_ = value.toString().length;
         _loc5_ = ",";
         _loc1_ = 0;
         while(_loc1_ < _loc3_)
         {
            if((_loc3_ - _loc1_) % 3 == 0 && _loc1_ != 0)
            {
               _loc2_ += _loc5_;
            }
            _loc2_ += value.toString().charAt(_loc1_);
            _loc1_ = _loc1_ + 1;
         }
      }
      else
      {
         _loc2_ = value;
      }
      return _loc2_;
   }
   function randRange(min, max, blacklist)
   {
      return Math.floor(Math.random() * (max - min)) + min;
   }
   function CLEANUP()
   {
      this.browser.GUTTER._height = 627;
      this.browser.GUTTER._y = this.browser.TOOLBAR._y + 45;
      return true;
   }
}
