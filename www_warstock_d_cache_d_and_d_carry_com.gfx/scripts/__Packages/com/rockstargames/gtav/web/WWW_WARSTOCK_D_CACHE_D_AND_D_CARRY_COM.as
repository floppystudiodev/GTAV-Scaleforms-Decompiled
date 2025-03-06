class com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM extends com.rockstargames.ui.core.BaseWebsite
{
   var browser;
   var CONTENT;
   var PAGE_NAMES;
   var CAN_STORE_PAGE;
   var defaultButtonOnColour;
   var defaultButtonOffColour;
   var vehicleData;
   var displayArray;
   var itemNumber;
   var colourNumber;
   var mcScope;
   var dataTextScope;
   var prevColourNumber;
   var intervalId;
   var dataProviderUI;
   var currentRank = 0;
   var isMP = false;
   function WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM()
   {
      super();
      this._name = "WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM";
      this.IS_SITE_DYNAMIC = 0;
      this.browser = _level0.TIMELINE;
      this.browser.DebugTextContent = true;
      if(this.browser.player == 1)
      {
         this.isMP = true;
      }
      else
      {
         this.isMP = false;
      }
      this.CONTENT.localisationTF.autoSize = true;
      this.PAGE_NAMES = new Array();
      this.PAGE_NAMES[1] = "PAGE1";
      this.PAGE_NAMES[2] = "SEARCH";
      this.PAGE_NAMES[3] = "DETAILS1";
      this.PAGE_NAMES[4] = "DETAILS2";
      this.PAGE_NAMES[5] = "DETAILS3";
      this.PAGE_NAMES[6] = "DETAILS4";
      this.PAGE_NAMES[7] = "DETAILS5";
      this.PAGE_NAMES[8] = "DETAILS6";
      this.PAGE_NAMES[9] = "DETAILS7";
      this.PAGE_NAMES[10] = "DETAILS8";
      this.PAGE_NAMES[11] = "DETAILS9";
      this.PAGE_NAMES[12] = "PURCHASESTOCK";
      this.PAGE_NAMES[13] = "PURCHASE_D_FAILED";
      this.PAGE_NAMES[14] = "PURCHASE_D_ERROR";
      this.PAGE_NAMES[15] = "PURCHASE_D_CONFIRM";
      this.PAGE_NAMES[16] = "INVENTORY";
      this.PAGE_NAMES[17] = "DETAILS15";
      this.PAGE_NAMES[18] = "DETAILS16";
      this.PAGE_NAMES[19] = "DETAILS17";
      this.PAGE_NAMES[20] = "DETAILS18";
      this.PAGE_NAMES[21] = "DETAILS19";
      this.PAGE_NAMES[22] = "DETAILS20";
      this.PAGE_NAMES[23] = "DETAILS21";
      this.PAGE_NAMES[24] = "DETAILS22";
      this.PAGE_NAMES[25] = "DETAILS23";
      this.PAGE_NAMES[26] = "DETAILS24";
      this.PAGE_NAMES[27] = "DETAILS25";
      this.PAGE_NAMES[28] = "DETAILS26";
      this.PAGE_NAMES[29] = "DETAILS27";
      this.PAGE_NAMES[30] = "DETAILS28";
      this.PAGE_NAMES[31] = "DETAILS29";
      this.PAGE_NAMES[32] = "DETAILS30";
      this.PAGE_NAMES[33] = "DETAILS31";
      this.PAGE_NAMES[34] = "DETAILS32";
      this.PAGE_NAMES[35] = "DETAILS33";
      this.PAGE_NAMES[36] = "DETAILS34";
      this.PAGE_NAMES[37] = "DETAILS35";
      this.PAGE_NAMES[38] = "DETAILS36";
      this.PAGE_NAMES[39] = "DETAILS37";
      this.PAGE_NAMES[40] = "DETAILS38";
      this.PAGE_NAMES[41] = "DETAILS39";
      this.CAN_STORE_PAGE = new Array();
      this.CAN_STORE_PAGE[1] = true;
      this.CAN_STORE_PAGE[2] = false;
      this.CAN_STORE_PAGE[3] = true;
      this.CAN_STORE_PAGE[4] = false;
      this.CAN_STORE_PAGE[5] = true;
      this.CAN_STORE_PAGE[6] = false;
      this.CAN_STORE_PAGE[7] = true;
      this.CAN_STORE_PAGE[8] = true;
      this.CAN_STORE_PAGE[9] = false;
      this.CAN_STORE_PAGE[10] = true;
      this.CAN_STORE_PAGE[11] = false;
      this.CAN_STORE_PAGE[12] = false;
      this.CAN_STORE_PAGE[13] = false;
      this.CAN_STORE_PAGE[14] = false;
      this.CAN_STORE_PAGE[15] = false;
      this.CAN_STORE_PAGE[16] = true;
      this.CAN_STORE_PAGE[17] = true;
      this.CAN_STORE_PAGE[18] = true;
      this.CAN_STORE_PAGE[19] = true;
      this.CAN_STORE_PAGE[20] = true;
      this.CAN_STORE_PAGE[21] = true;
      this.CAN_STORE_PAGE[22] = true;
      this.CAN_STORE_PAGE[23] = true;
      this.CAN_STORE_PAGE[24] = true;
      this.CAN_STORE_PAGE[25] = true;
      this.CAN_STORE_PAGE[26] = true;
      this.CAN_STORE_PAGE[27] = true;
      this.CAN_STORE_PAGE[28] = true;
      this.CAN_STORE_PAGE[29] = true;
      this.CAN_STORE_PAGE[30] = true;
      this.CAN_STORE_PAGE[31] = true;
      this.CAN_STORE_PAGE[32] = true;
      this.CAN_STORE_PAGE[33] = true;
      this.CAN_STORE_PAGE[34] = true;
      this.CAN_STORE_PAGE[35] = true;
      this.CAN_STORE_PAGE[36] = true;
      this.CAN_STORE_PAGE[37] = true;
      this.CAN_STORE_PAGE[38] = true;
      this.CAN_STORE_PAGE[39] = true;
      this.CAN_STORE_PAGE[40] = true;
      this.CAN_STORE_PAGE[41] = true;
      this.defaultButtonOnColour = 16777215;
      this.defaultButtonOffColour = 16777215;
      this.vehicleData = new Array();
      this.vehicleData.push(undefined);
      this.vehicleData.push({VEHICLE:"RHINO",PAGEID:3,PRICE:-1,RANK:-1,SEATS:"01",IS_DLC:false,NOCOLOUR:true});
      this.vehicleData.push(undefined);
      this.vehicleData.push({VEHICLE:"BARRACKS",PAGEID:5,PRICE:-1,RANK:-1,SEATS:"10",IS_DLC:false,NOCOLOUR:true});
      this.vehicleData.push(undefined);
      this.vehicleData.push({VEHICLE:"CARGOBOB",PAGEID:7,PRICE:-1,RANK:-1,SEATS:"10",IS_DLC:false,NOCOLOUR:true});
      this.vehicleData.push({VEHICLE:"BUZZARD",PAGEID:8,PRICE:-1,RANK:-1,SEATS:"04",IS_DLC:false,NOCOLOUR:true});
      this.vehicleData.push(undefined);
      this.vehicleData.push({VEHICLE:"CRUSADER",PAGEID:10,PRICE:-1,RANK:-1,SEATS:"04",IS_DLC:false,NOCOLOUR:true});
      this.vehicleData.push(undefined);
      this.vehicleData.push(undefined);
      this.vehicleData.push(undefined);
      this.vehicleData.push(undefined);
      this.vehicleData.push(undefined);
      this.vehicleData.push(undefined);
      this.vehicleData.push({VEHICLE:"AIRBUS",PAGEID:17,PRICE:-1,RANK:-1,SEATS:"16",IS_DLC:false,NOCOLOUR:true});
      this.vehicleData.push({VEHICLE:"JOURNEY",PAGEID:18,PRICE:-1,RANK:-1,SEATS:"06",IS_DLC:false,NOCOLOUR:true});
      this.vehicleData.push(undefined);
      this.vehicleData.push({VEHICLE:"COACH",PAGEID:20,PRICE:-1,RANK:-1,SEATS:"10",IS_DLC:false,NOCOLOUR:true});
      this.vehicleData.push({VEHICLE:"BUS",PAGEID:21,PRICE:-1,RANK:-1,SEATS:"16",IS_DLC:false,NOCOLOUR:true});
      this.vehicleData.push(undefined);
      this.vehicleData.push(undefined);
      this.vehicleData.push({VEHICLE:"MULE",PAGEID:24,PRICE:-1,RANK:-1,SEATS:"06",IS_DLC:false,NOCOLOUR:true});
      this.vehicleData.push(undefined);
      this.vehicleData.push(undefined);
      this.vehicleData.push({VEHICLE:"RENTBUS",PAGEID:27,PRICE:-1,RANK:-1,SEATS:"10",IS_DLC:false,NOCOLOUR:true});
      this.vehicleData.push({VEHICLE:"DUMP",PAGEID:28,PRICE:-1,RANK:-1,SEATS:"01",IS_DLC:false,NOCOLOUR:true});
      this.vehicleData.push({VEHICLE:"DUBSTA3",PAGEID:29,PRICE:-1,RANK:-1,SEATS:"06",IS_DLC:true,NOCOLOUR:true});
      this.vehicleData.push({VEHICLE:"MONSTER",PAGEID:30,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:true,NOCOLOUR:true});
      this.vehicleData.push({VEHICLE:"BOXVILLE4",PAGEID:31,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:true,NOCOLOUR:true});
      this.vehicleData.push({VEHICLE:"VALKYRIE",PAGEID:32,PRICE:-1,RANK:-1,SEATS:"04",IS_DLC:true,NOCOLOUR:true});
      this.vehicleData.push({VEHICLE:"HYDRA",PAGEID:33,PRICE:-1,RANK:-1,SEATS:"01",IS_DLC:true,NOCOLOUR:true});
      this.vehicleData.push({VEHICLE:"INSURGENT",PAGEID:34,PRICE:-1,RANK:-1,SEATS:"09",IS_DLC:true,NOCOLOUR:true});
      this.vehicleData.push({VEHICLE:"INSURGENT2",PAGEID:35,PRICE:-1,RANK:-1,SEATS:"06",IS_DLC:true,NOCOLOUR:true});
      this.vehicleData.push({VEHICLE:"MULE3",PAGEID:36,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:true,NOCOLOUR:true});
      this.vehicleData.push({VEHICLE:"SAVAGE",PAGEID:37,PRICE:-1,RANK:-1,SEATS:"04",IS_DLC:true,NOCOLOUR:true});
      this.vehicleData.push({VEHICLE:"TECHNICAL",PAGEID:38,PRICE:-1,RANK:-1,SEATS:"03",IS_DLC:true,NOCOLOUR:true});
      this.vehicleData.push({VEHICLE:"MESA3",PAGEID:39,PRICE:-1,RANK:-1,SEATS:"04",IS_DLC:true,NOCOLOUR:true});
      this.vehicleData.push({VEHICLE:"PBUS",PAGEID:40,PRICE:-1,RANK:-1,SEATS:"11",IS_DLC:true,NOCOLOUR:true});
      this.vehicleData.push({VEHICLE:"MARSHALL",PAGEID:41,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false,LIVERY1:"FLAG",NOCOLOUR:false});
      this.displayArray = new Array();
      if(this.isMP == false)
      {
         this.displayArray = [39,1,3,5,6,8];
      }
      else
      {
         this.displayArray = [39,29,30,31,32,33,34,35,36,37,38,28,27,1,3,6,8,15,16,18,19,22,25,26];
      }
   }
   function READY()
   {
   }
   function SET_PRICES(slotID, price)
   {
      this.vehicleData[slotID - 2].PRICE = price;
   }
   function SET_RANKS(slotID, rank, current)
   {
      this.vehicleData[slotID - 2].RANK = rank;
      if(current != undefined)
      {
         this.currentRank = current;
      }
   }
   function goToAnchor(AnchorLink)
   {
      com.rockstargames.ui.utils.Debug.log("************AnchorLink " + AnchorLink);
      var _loc2_ = new Array();
      _loc2_ = AnchorLink.split("_");
      com.rockstargames.ui.utils.Debug.log("************temp " + _loc2_);
      com.rockstargames.ui.utils.Debug.log("************itemNumber " + this.itemNumber);
      com.rockstargames.ui.utils.Debug.log("temp[0] " + _loc2_[0]);
      if(_loc2_[0] == "item")
      {
         this.itemNumber = parseInt(_loc2_[1]);
         com.rockstargames.ui.utils.Debug.log("************itemNumber " + this.itemNumber);
         this.browser.GO_TO_WEBPAGE("WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM_S_DETAILS" + this.itemNumber);
      }
      else if(_loc2_[0] == "colour")
      {
         this.colourNumber = parseInt(_loc2_[1]);
         this.setColourPicker(this.colourNumber);
      }
      else if(_loc2_[0] == "PURCHASE")
      {
         this.browser.GO_TO_WEBPAGE("WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM_S_PURCHASESTOCK");
      }
   }
   function setColourPicker(col)
   {
      com.rockstargames.ui.utils.Debug.log("************col " + col);
      var _loc4_ = 25;
      if(col == 0)
      {
         this.colourNumber = 1;
      }
      else
      {
         this.colourNumber = col;
      }
      var _loc2_ = 1;
      while(_loc2_ < _loc4_)
      {
         this.mcScope["PURCHASE_" + _loc2_]._y = -50;
         _loc2_ = _loc2_ + 1;
      }
      var _loc3_ = undefined;
      if(this.vehicleData[this.itemNumber].NOCOLOUR == true)
      {
         _loc3_ = this.mcScope.PURCHASE_1;
         this.browser.DISABLE_BUTTON(1,false);
         _loc3_._alpha = 100;
         this.mcScope.colourSelectedMC._y = -50;
      }
      if(col == 0)
      {
         _loc3_ = this.mcScope.PURCHASE_1;
         this.browser.DISABLE_BUTTON(1,true);
         _loc3_._alpha = 10;
         this.mcScope.colourSelectedMC._y = -50;
      }
      else
      {
         _loc3_ = this.mcScope["PURCHASE_" + this.colourNumber];
         com.rockstargames.ui.utils.Debug.log("************dataTextScope " + this.dataTextScope[col + 1]._name);
         com.rockstargames.ui.utils.Debug.log("************dataTextScope _parent  " + this.dataTextScope[col + 1]._parent._name);
         com.rockstargames.ui.utils.Debug.log("************colourNumber " + this.colourNumber);
         this.browser.DISABLE_BUTTON(col + 2,false);
         _loc3_._alpha = 100;
         this.mcScope.colourSelectedMC._x = this.mcScope["colour_" + this.colourNumber]._x;
         com.rockstargames.ui.utils.Debug.log("************ mcScope[colour_ + colourNumber]._x " + this.mcScope["colour_" + this.colourNumber]._x);
         com.rockstargames.ui.utils.Debug.log("************ mcScope[colour_ + colourNumber]._y " + this.mcScope["colour_" + this.colourNumber]._y);
         this.mcScope.colourSelectedMC._y = this.mcScope["colour_" + this.colourNumber]._y;
         this.prevColourNumber = this.colourNumber;
      }
      com.rockstargames.ui.utils.Debug.log("************mcScope.colourSelectedMC._x " + this.mcScope.colourSelectedMC._x);
      com.rockstargames.ui.utils.Debug.log("************mcScope.colourSelectedMC._y " + this.mcScope.colourSelectedMC._y);
      _loc3_._x = 840;
      _loc3_._y = 511;
   }
   function labelAsDlcPack(targetMc, selection)
   {
      targetMc.dlcPackTF.text = "";
      if(this.vehicleData[selection].IS_DLC == true)
      {
         var _loc2_ = targetMc.dlcPackTF;
         _loc2_._visible = false;
         _loc2_.autoSize = "center";
         _loc2_.multiline = true;
         _loc2_.wordWrap = true;
         var _loc3_ = this.vehicleData[selection].VEHICLE;
         switch(_loc3_)
         {
            case "DUBSTA3":
               this.set_localised_text(-1,_loc2_,"WEB_HIPSTERPACK",true);
               break;
            case "MONSTER":
               this.set_localised_text(-1,_loc2_,"WEB_INDEPENDENCEPACK",true);
               break;
            case "BOXVILLE4":
            case "VALKYRIE":
            case "HYDRA":
            case "INSURGENT":
            case "INSURGENT2":
            case "MULE3":
            case "SAVAGE":
            case "TECHNICAL":
            case "MESA":
            case "PBUS":
               this.set_localised_text(-1,_loc2_,"WEB_HEISTPACK",true);
         }
         _loc2_._visible = true;
      }
   }
   function POPULATE_TEXT(pageName, searchArgs, newPage)
   {
      this.CONTENT._y = 0;
      com.rockstargames.ui.utils.Debug.log("************pageName " + pageName);
      switch(pageName)
      {
         case "PAGE1":
            clearInterval(this.intervalId);
            this.mcScope = this.CONTENT.PAGE1;
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.btnTxt;
            this.set_localised_text(5,this.mcScope.header,"CANDC_PG1_HEADER");
            this.set_localised_text(6,this.mcScope.body1,"CANDC_PG1_BODY1");
            this.set_localised_text(7,this.mcScope.body2,"CANDC_PG1_BODY2");
            var _loc13_ = 1185;
            var _loc6_ = 258.5;
            var _loc8_ = 364;
            var _loc4_ = 9;
            var _loc2_ = undefined;
            var _loc9_ = undefined;
            if(newPage == false)
            {
               var _loc5_ = 0;
               while(_loc5_ < this.displayArray.length)
               {
                  var _loc3_ = this.displayArray[_loc5_];
                  _loc2_ = "item_" + _loc3_;
                  if(this.vehicleData[_loc3_].PRICE != -1)
                  {
                     if(this.mcScope[_loc2_] != undefined)
                     {
                        this.mcScope[_loc2_].removeMovieClip();
                     }
                     _loc9_ = this.mcScope.attachMovie("car_box",_loc2_,this.mcScope.getNextHighestDepth(),{_x:_loc6_,_y:_loc8_,_alpha:0});
                     var _loc7_ = this.vehicleData[_loc3_].VEHICLE;
                     this.mcScope[_loc2_].itemImages.gotoAndStop(_loc7_);
                     this.set_localised_text(_loc4_,this.mcScope[_loc2_].btnTxt,_loc7_,true);
                     this.dataTextScope[_loc4_] = undefined;
                     this.labelAsDlcPack(_loc9_.itemImages,_loc3_);
                     if(typeof this.vehicleData[_loc3_].PRICE == "string")
                     {
                        this.mcScope[_loc2_].itemImages.outOfStock._alpha = 0;
                        this.set_price_text(this.mcScope[_loc2_].priceTF,this.vehicleData[_loc3_].PRICE);
                        this.dataTextScope[_loc4_] = this.mcScope[_loc2_].btnTxt;
                     }
                     else if(this.vehicleData[_loc3_].PRICE == 0)
                     {
                        this.mcScope[_loc2_].itemImages.outOfStock._alpha = 100;
                        this.set_localised_text(-1,this.mcScope[_loc2_].itemImages.outOfStock.outOfStockTF,"WEB_OUTOFSTOCK",false);
                        this.mcScope[_loc2_].priceTF.text = "";
                     }
                     else if(this.vehicleData[_loc3_].PRICE > 0)
                     {
                        this.mcScope[_loc2_].itemImages.outOfStock._alpha = 0;
                        this.set_price_text(this.mcScope[_loc2_].priceTF,this.vehicleData[_loc3_].PRICE);
                        this.dataTextScope[_loc4_] = this.mcScope[_loc2_].btnTxt;
                     }
                     if(this.isMP == true)
                     {
                        if(this.vehicleData[_loc3_].RANK > this.currentRank)
                        {
                           this.mcScope[_loc2_].MPrank.rankTF.text = this.vehicleData[_loc3_].RANK;
                           this.mcScope[_loc2_].MPrank._alpha = 100;
                           this.dataTextScope[_loc4_] = undefined;
                        }
                        else
                        {
                           this.mcScope[_loc2_].MPrank._alpha = 0;
                        }
                        if(this.vehicleData[_loc3_].SEATS != "")
                        {
                           this.mcScope[_loc2_].MPseats.seatsTF.text = this.vehicleData[_loc3_].SEATS;
                           this.mcScope[_loc2_].MPseats._alpha = 100;
                        }
                        else
                        {
                           this.mcScope[_loc2_].MPseats._alpha = 0;
                        }
                     }
                     this.mcScope[_loc2_]._alpha = 100;
                     _loc4_ = _loc4_ + 1;
                     _loc13_ = _loc8_;
                     _loc6_ += 385;
                     if(_loc6_ > 643.5)
                     {
                        _loc6_ = 258.5;
                        _loc8_ += 242;
                     }
                  }
                  _loc5_ = _loc5_ + 1;
               }
               if(_loc9_._x == 258.5)
               {
                  _loc9_._x = 451;
               }
            }
            this.mcScope.bgBlack._height = _loc13_ + 124;
            this.mcScope.bgWhite._height = this.mcScope.bgBlack._height - 14;
            var _loc16_ = undefined;
            _loc16_ = this.mcScope.bgBlack._y + this.mcScope.bgBlack._height + 40;
            this.CONTENT.BOUNDING_BOX._height = _loc16_;
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"CANDC_TOOLBAR",this.CONTENT.localisationTF);
            this.browser.SET_TITLEBAR_TEXT(this.CONTENT.localisationTF.text,14474460);
            break;
         case "SEARCH":
            this.browser.GO_TO_WEBPAGE("PAGE1");
            break;
         case "DETAILS1":
         case "DETAILS3":
         case "DETAILS5":
         case "DETAILS6":
         case "DETAILS8":
         case "DETAILS9":
         case "DETAILS15":
         case "DETAILS16":
         case "DETAILS18":
         case "DETAILS19":
         case "DETAILS22":
         case "DETAILS25":
         case "DETAILS26":
         case "DETAILS27":
         case "DETAILS28":
         case "DETAILS29":
         case "DETAILS30":
         case "DETAILS31":
         case "DETAILS32":
         case "DETAILS33":
         case "DETAILS34":
         case "DETAILS35":
         case "DETAILS36":
         case "DETAILS37":
         case "DETAILS38":
         case "DETAILS39":
            clearInterval(this.intervalId);
            this.mcScope = this.CONTENT.DETAILS;
            var _loc14_ = pageName.split("DETAILS");
            this.itemNumber = parseInt(_loc14_[1]);
            if(this.vehicleData[this.itemNumber].LIVERY1 != undefined)
            {
               this.mcScope.gotoAndStop("LIVERY");
            }
            else if(this.vehicleData[this.itemNumber].NOCOLOUR == true)
            {
               this.mcScope.gotoAndStop("NOCOLOURS");
            }
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.btnTxt;
            this.dataTextScope[1] = this.mcScope.WWW_RIGHTEOUSSLAUGHTER7_COM.btnTxt;
            this.dataTextScope[2] = this.mcScope.colour_1.btnTxt;
            this.dataTextScope[3] = this.mcScope.colour_2.btnTxt;
            this.dataTextScope[4] = this.mcScope.colour_3.btnTxt;
            this.dataTextScope[5] = this.mcScope.colour_4.btnTxt;
            this.dataTextScope[6] = this.mcScope.colour_5.btnTxt;
            this.dataTextScope[7] = this.mcScope.colour_6.btnTxt;
            this.dataTextScope[8] = this.mcScope.colour_7.btnTxt;
            this.dataTextScope[9] = this.mcScope.colour_8.btnTxt;
            this.dataTextScope[10] = this.mcScope.colour_9.btnTxt;
            this.dataTextScope[11] = this.mcScope.colour_10.btnTxt;
            this.dataTextScope[12] = this.mcScope.colour_11.btnTxt;
            this.dataTextScope[13] = this.mcScope.colour_12.btnTxt;
            this.dataTextScope[14] = this.mcScope.colour_13.btnTxt;
            this.dataTextScope[15] = this.mcScope.colour_14.btnTxt;
            this.dataTextScope[16] = this.mcScope.colour_15.btnTxt;
            this.dataTextScope[17] = this.mcScope.colour_16.btnTxt;
            this.dataTextScope[18] = this.mcScope.colour_17.btnTxt;
            this.dataTextScope[19] = this.mcScope.colour_18.btnTxt;
            this.dataTextScope[20] = this.mcScope.colour_19.btnTxt;
            this.dataTextScope[21] = this.mcScope.colour_20.btnTxt;
            this.dataTextScope[22] = this.mcScope.colour_21.btnTxt;
            this.dataTextScope[23] = this.mcScope.colour_22.btnTxt;
            this.dataTextScope[24] = this.mcScope.colour_23.btnTxt;
            this.dataTextScope[25] = this.mcScope.colour_24.btnTxt;
            this.dataTextScope[26] = this.mcScope.colour_25.btnTxt;
            this.set_localised_text(27,this.mcScope.PURCHASE_1.btnTxt,"CANDC_BUYNOW");
            this.set_localised_text(28,this.mcScope.PURCHASE_2.btnTxt,"CANDC_BUYNOW");
            this.set_localised_text(29,this.mcScope.PURCHASE_3.btnTxt,"CANDC_BUYNOW");
            this.set_localised_text(30,this.mcScope.PURCHASE_4.btnTxt,"CANDC_BUYNOW");
            this.set_localised_text(31,this.mcScope.PURCHASE_5.btnTxt,"CANDC_BUYNOW");
            this.set_localised_text(32,this.mcScope.PURCHASE_6.btnTxt,"CANDC_BUYNOW");
            this.set_localised_text(33,this.mcScope.PURCHASE_7.btnTxt,"CANDC_BUYNOW");
            this.set_localised_text(34,this.mcScope.PURCHASE_8.btnTxt,"CANDC_BUYNOW");
            this.set_localised_text(35,this.mcScope.PURCHASE_9.btnTxt,"CANDC_BUYNOW");
            this.set_localised_text(36,this.mcScope.PURCHASE_10.btnTxt,"CANDC_BUYNOW");
            this.set_localised_text(37,this.mcScope.PURCHASE_11.btnTxt,"CANDC_BUYNOW");
            this.set_localised_text(38,this.mcScope.PURCHASE_12.btnTxt,"CANDC_BUYNOW");
            this.set_localised_text(39,this.mcScope.PURCHASE_13.btnTxt,"CANDC_BUYNOW");
            this.set_localised_text(40,this.mcScope.PURCHASE_14.btnTxt,"CANDC_BUYNOW");
            this.set_localised_text(41,this.mcScope.PURCHASE_15.btnTxt,"CANDC_BUYNOW");
            this.set_localised_text(42,this.mcScope.PURCHASE_16.btnTxt,"CANDC_BUYNOW");
            this.set_localised_text(43,this.mcScope.PURCHASE_17.btnTxt,"CANDC_BUYNOW");
            this.set_localised_text(44,this.mcScope.PURCHASE_18.btnTxt,"CANDC_BUYNOW");
            this.set_localised_text(45,this.mcScope.PURCHASE_19.btnTxt,"CANDC_BUYNOW");
            this.set_localised_text(46,this.mcScope.PURCHASE_20.btnTxt,"CANDC_BUYNOW");
            this.set_localised_text(47,this.mcScope.PURCHASE_21.btnTxt,"CANDC_BUYNOW");
            this.set_localised_text(48,this.mcScope.PURCHASE_22.btnTxt,"CANDC_BUYNOW");
            this.set_localised_text(49,this.mcScope.PURCHASE_23.btnTxt,"CANDC_BUYNOW");
            this.set_localised_text(50,this.mcScope.PURCHASE_24.btnTxt,"CANDC_BUYNOW");
            this.set_localised_text(51,this.mcScope.PURCHASE_25.btnTxt,"CANDC_BUYNOW");
            this.set_localised_text(52,this.mcScope.body,"CANDC_" + this.vehicleData[this.itemNumber].VEHICLE);
            this.set_localised_text(53,this.mcScope.nameTF,this.vehicleData[this.itemNumber].VEHICLE);
            this.mcScope.priceTF.textAutoSize = "shrink";
            this.set_price_text(this.mcScope.priceTF,this.vehicleData[this.itemNumber].PRICE);
            this.mcScope.itemImages.gotoAndStop(this.vehicleData[this.itemNumber].VEHICLE);
            this.labelAsDlcPack(this.mcScope.itemImages,this.itemNumber);
            if(this.isMP == true)
            {
               if(this.vehicleData[this.itemNumber].SEATS != "")
               {
                  this.mcScope.MPseats.seatsTF.text = this.vehicleData[this.itemNumber].SEATS;
                  this.mcScope.MPseats._alpha = 100;
               }
               else
               {
                  this.mcScope.MPseats._alpha = 0;
               }
            }
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            this.CONTENT.BOUNDING_BOX._height = 700;
            break;
         case "PURCHASESTOCK":
            clearInterval(this.intervalId);
            this.mcScope = this.CONTENT.PURCHASE;
            this.mcScope.body1._alpha = 0;
            this.mcScope.body2._alpha = 0;
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.btnTxt;
            this.dataTextScope[1] = this.mcScope.WWW_RIGHTEOUSSLAUGHTER7_COM.btnTxt;
            this.set_localised_text(5,this.mcScope.body1,"CANDC_PURCHASED");
            this.set_localised_text(6,this.mcScope.body2,"CANDC_DISCLAIMER");
            this.mcScope.itemImages.gotoAndStop(this.vehicleData[this.itemNumber].VEHICLE);
            this.labelAsDlcPack(this.mcScope.itemImages,this.itemNumber);
            if(this.isMP == true)
            {
               if(this.vehicleData[this.itemNumber].SEATS != "")
               {
                  this.mcScope.MPseats.seatsTF.text = this.vehicleData[this.itemNumber].SEATS;
                  this.mcScope.MPseats._alpha = 100;
               }
               else
               {
                  this.mcScope.MPseats._alpha = 0;
               }
            }
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            this.intervalId = setInterval(this,"displayPurchasedText",1500);
            this.CONTENT.BOUNDING_BOX._height = 700;
            break;
         case "PURCHASE_D_FAILED":
            clearInterval(this.intervalId);
            this.mcScope = this.CONTENT.PURCHASE_D_FAILED;
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.btnTxt;
            this.dataTextScope[1] = this.mcScope.WWW_RIGHTEOUSSLAUGHTER7_COM.btnTxt;
            this.set_localised_text(5,this.mcScope.body1,"CANDC_FAILED");
            this.mcScope.body1.autoSize = "center";
            this.mcScope.itemImages.gotoAndStop(this.vehicleData[this.itemNumber].VEHICLE);
            this.labelAsDlcPack(this.mcScope.itemImages,this.itemNumber);
            if(this.isMP == true)
            {
               if(this.vehicleData[this.itemNumber].SEATS != "")
               {
                  this.mcScope.MPseats.seatsTF.text = this.vehicleData[this.itemNumber].SEATS;
                  this.mcScope.MPseats._alpha = 100;
               }
               else
               {
                  this.mcScope.MPseats._alpha = 0;
               }
            }
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            this.CONTENT.BOUNDING_BOX._height = 700;
            break;
         case "PURCHASE_D_ERROR":
            this.mcScope = this.CONTENT.PURCHASE_D_ERROR;
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.btnTxt;
            this.dataTextScope[1] = this.mcScope.soldTF;
            if(this.dataProviderUI[1][0] != undefined)
            {
               this.dataTextScope[1].text = this.dataProviderUI[1][0];
            }
            this.mcScope.soldTF.autoSize = "center";
            this.mcScope.body.multiline = true;
            this.dataTextScope[2] = this.mcScope.body1;
            if(this.dataProviderUI[2][0] != undefined)
            {
               this.dataTextScope[2].text = this.dataProviderUI[2][0];
            }
            this.mcScope.body1.autoSize = "center";
            this.dataTextScope[1] = this.mcScope.WWW_RIGHTEOUSSLAUGHTER7_COM.btnTxt;
            this.mcScope.itemImages.gotoAndStop(this.vehicleData[this.itemNumber].VEHICLE);
            this.labelAsDlcPack(this.mcScope.itemImages,this.itemNumber);
            if(this.isMP == true)
            {
               if(this.vehicleData[this.itemNumber].SEATS != "")
               {
                  this.mcScope.MPseats.seatsTF.text = this.vehicleData[this.itemNumber].SEATS;
                  this.mcScope.MPseats._alpha = 100;
               }
               else
               {
                  this.mcScope.MPseats._alpha = 0;
               }
            }
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            this.CONTENT.BOUNDING_BOX._height = 700;
            break;
         case "PURCHASE_D_CONFIRM":
            this.mcScope = this.CONTENT.PURCHASE_D_CONFIRM;
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.btnTxt;
            this.mcScope.body.multiline = true;
            this.mcScope.body.wordWrap = true;
            if(this.dataProviderUI[1] != undefined)
            {
               this.mcScope.body.htmlText = this.dataProviderUI[1];
            }
            this.dataTextScope[2] = this.mcScope.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM_S_PURCHASE.btnTxt;
            if(this.dataProviderUI[2] != undefined)
            {
               this.dataTextScope[2].htmlText = this.dataProviderUI[2];
            }
            this.dataTextScope[3] = this.mcScope.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM_S_PURCHASE_D_FAILED.btnTxt;
            if(this.dataProviderUI[3] != undefined)
            {
               this.dataTextScope[3].htmlText = this.dataProviderUI[3];
            }
            this.dataTextScope[1] = this.mcScope.WWW_RIGHTEOUSSLAUGHTER7_COM.btnTxt;
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            this.CONTENT.BOUNDING_BOX._height = 700;
      }
   }
   function displayPurchasedText()
   {
      clearInterval(this.intervalId);
      this.mcScope.body1._alpha = 100;
      this.mcScope.body2._alpha = 100;
   }
   function set_localised_text(slotID, TF, TextLabel, setDataSlot)
   {
      this.dataTextScope[slotID] = TF;
      var _loc3_ = TF.html;
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,TextLabel,TF,_loc3_);
   }
   function set_price_text(TF, price)
   {
      TF._visible = false;
      TF._height = 25;
      if(typeof price == "string")
      {
         TF.multiline = true;
         TF.wordWrap = true;
         if(this.mcScope == this.CONTENT.PAGE1)
         {
            TF.autoSize = "right";
         }
         else
         {
            TF.textAutoSize = "shrink";
         }
         TF.htmlText = price;
      }
      else
      {
         var _loc5_ = undefined;
         var _loc4_ = price.toString();
         var _loc7_ = _loc4_.length;
         if(_loc7_ > 3)
         {
            var _loc6_ = "";
            var _loc3_ = _loc4_.slice(0,-3);
            var _loc9_ = "," + _loc4_.slice(-3);
            if(_loc3_.length > 3)
            {
               _loc6_ = _loc3_.slice(0,-3) + ",";
               _loc3_ = _loc3_.slice(-3);
            }
            _loc5_ = _loc6_ + _loc3_ + _loc9_;
         }
         else
         {
            _loc5_ = _loc4_;
         }
         TF.text = "$" + _loc5_;
      }
      if(this.mcScope == this.CONTENT.PAGE1)
      {
         if(TF._height > 25)
         {
            TF._y = 189;
         }
         else
         {
            TF._y = 197;
         }
      }
      TF._visible = true;
   }
}
