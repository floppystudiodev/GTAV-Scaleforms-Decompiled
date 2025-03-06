class com.rockstargames.gtav.web.WWW_LEGENDARYMOTORSPORT_NET extends com.rockstargames.ui.core.BaseWebsite
{
   var browser;
   var PAGE_NAMES;
   var CAN_STORE_PAGE;
   var defaultButtonOnColour;
   var defaultButtonOffColour;
   var vehicleData;
   var displayArray;
   var TXDarray;
   var carNameStr;
   var carColoursArray;
   var carNumber;
   var colourNumber;
   var mcScope;
   var dataTextScope;
   var prevColourY;
   var prevColourNumber;
   var CONTENT;
   var outOfStockStr;
   var buyNowStr;
   var convertableString;
   var decommissionedString;
   var currentPage;
   var prevCarNumber;
   var intervalId;
   var dataProviderUI;
   var TIMELINE;
   var currentRank = 0;
   var isMP = false;
   function WWW_LEGENDARYMOTORSPORT_NET()
   {
      super();
      this._name = "WWW_LEGENDARYMOTORSPORT_NET";
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
      this.PAGE_NAMES = new Array();
      this.PAGE_NAMES[1] = "PAGE1";
      this.PAGE_NAMES[2] = "SEARCH";
      this.PAGE_NAMES[3] = "CAR_D_DETAILS1";
      this.PAGE_NAMES[4] = "CAR_D_DETAILS2";
      this.PAGE_NAMES[5] = "CAR_D_DETAILS3";
      this.PAGE_NAMES[6] = "CAR_D_DETAILS4";
      this.PAGE_NAMES[7] = "CAR_D_DETAILS5";
      this.PAGE_NAMES[8] = "CAR_D_DETAILS6";
      this.PAGE_NAMES[9] = "CAR_D_DETAILS7";
      this.PAGE_NAMES[10] = "CAR_D_DETAILS8";
      this.PAGE_NAMES[11] = "CAR_D_DETAILS9";
      this.PAGE_NAMES[12] = "PURCHASECAR";
      this.PAGE_NAMES[13] = "PURCHASE_D_FAILED";
      this.PAGE_NAMES[14] = "PURCHASE_D_ERROR";
      this.PAGE_NAMES[15] = "PURCHASE_D_CONFIRM";
      this.PAGE_NAMES[16] = "INVENTORY";
      this.PAGE_NAMES[17] = "CAR_D_DETAILS15";
      this.PAGE_NAMES[18] = "CAR_D_DETAILS16";
      this.PAGE_NAMES[19] = "CAR_D_DETAILS17";
      this.PAGE_NAMES[20] = "CAR_D_DETAILS18";
      this.PAGE_NAMES[21] = "CAR_D_DETAILS19";
      this.PAGE_NAMES[22] = "CAR_D_DETAILS20";
      this.PAGE_NAMES[23] = "CAR_D_DETAILS21";
      this.PAGE_NAMES[24] = "CAR_D_DETAILS22";
      this.PAGE_NAMES[25] = "CAR_D_DETAILS23";
      this.PAGE_NAMES[26] = "CAR_D_DETAILS24";
      this.PAGE_NAMES[27] = "CAR_D_DETAILS25";
      this.PAGE_NAMES[28] = "CAR_D_DETAILS26";
      this.PAGE_NAMES[29] = "CAR_D_DETAILS27";
      this.PAGE_NAMES[30] = "CAR_D_DETAILS28";
      this.PAGE_NAMES[31] = "CAR_D_DETAILS29";
      this.PAGE_NAMES[32] = "CAR_D_DETAILS30";
      this.PAGE_NAMES[33] = "CAR_D_DETAILS31";
      this.PAGE_NAMES[34] = "UNUSED";
      this.PAGE_NAMES[35] = "CAR_D_DETAILS33";
      this.PAGE_NAMES[36] = "CAR_D_DETAILS34";
      this.PAGE_NAMES[37] = "CAR_D_DETAILS35";
      this.PAGE_NAMES[38] = "CAR_D_DETAILS36";
      this.PAGE_NAMES[39] = "CAR_D_DETAILS37";
      this.PAGE_NAMES[40] = "CAR_D_DETAILS38";
      this.PAGE_NAMES[41] = "CAR_D_DETAILS39";
      this.PAGE_NAMES[42] = "CAR_D_DETAILS40";
      this.PAGE_NAMES[43] = "CAR_D_DETAILS41";
      this.PAGE_NAMES[44] = "CAR_D_DETAILS42";
      this.PAGE_NAMES[45] = "CAR_D_DETAILS43";
      this.PAGE_NAMES[46] = "CAR_D_DETAILS44";
      this.PAGE_NAMES[47] = "CAR_D_DETAILS45";
      this.PAGE_NAMES[48] = "CAR_D_DETAILS46";
      this.PAGE_NAMES[49] = "CAR_D_DETAILS47";
      this.PAGE_NAMES[50] = "CAR_D_DETAILS48";
      this.PAGE_NAMES[51] = "CAR_D_DETAILS49";
      this.PAGE_NAMES[52] = "CAR_D_DETAILS50";
      this.CAN_STORE_PAGE = new Array();
      this.CAN_STORE_PAGE[1] = true;
      this.CAN_STORE_PAGE[2] = false;
      this.CAN_STORE_PAGE[3] = true;
      this.CAN_STORE_PAGE[4] = true;
      this.CAN_STORE_PAGE[5] = true;
      this.CAN_STORE_PAGE[6] = true;
      this.CAN_STORE_PAGE[7] = true;
      this.CAN_STORE_PAGE[8] = true;
      this.CAN_STORE_PAGE[9] = true;
      this.CAN_STORE_PAGE[10] = true;
      this.CAN_STORE_PAGE[11] = true;
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
      this.CAN_STORE_PAGE[42] = true;
      this.CAN_STORE_PAGE[43] = true;
      this.CAN_STORE_PAGE[44] = true;
      this.CAN_STORE_PAGE[45] = true;
      this.CAN_STORE_PAGE[46] = true;
      this.CAN_STORE_PAGE[47] = true;
      this.CAN_STORE_PAGE[48] = true;
      this.CAN_STORE_PAGE[49] = true;
      this.CAN_STORE_PAGE[50] = true;
      this.CAN_STORE_PAGE[51] = true;
      this.CAN_STORE_PAGE[52] = true;
      this.defaultButtonOnColour = 16777215;
      this.defaultButtonOffColour = 16777215;
      this.vehicleData = new Array();
      this.vehicleData.push(undefined);
      this.vehicleData.push({BRAND:"TRUFFADE",VEHICLE:"ZTYPE",PAGEID:3,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({BRAND:"GROTTI",VEHICLE:"STINGER",PAGEID:4,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({BRAND:"DEWBAUCH",VEHICLE:"JB700",PAGEID:5,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({BRAND:"GROTTI",VEHICLE:"CHEETAH",PAGEID:6,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({BRAND:"OVERFLOD",VEHICLE:"ENTITYXF",PAGEID:7,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({BRAND:"TRUFFADE",VEHICLE:"ADDER",PAGEID:8,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({BRAND:"PEGASSI",VEHICLE:"MONROE",PAGEID:9,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({BRAND:"ENUS",VEHICLE:"COGCABRI",PAGEID:10,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({BRAND:"PEGASSI",VEHICLE:"VACCA",PAGEID:11,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push(undefined);
      this.vehicleData.push(undefined);
      this.vehicleData.push(undefined);
      this.vehicleData.push(undefined);
      this.vehicleData.push(undefined);
      this.vehicleData.push({BRAND:"VAPID",VEHICLE:"BULLET",PAGEID:17,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({BRAND:"GROTTI",VEHICLE:"CARBONIZ",PAGEID:18,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({BRAND:"INVERTO",VEHICLE:"COQUETTE",PAGEID:19,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({BRAND:"DEWBAUCH",VEHICLE:"EXEMPLAR",PAGEID:20,PRICE:-1,RANK:-1,SEATS:"04",IS_DLC:false});
      this.vehicleData.push({BRAND:"BENEFAC",VEHICLE:"FELTZER",PAGEID:21,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({BRAND:"PEGASSI",VEHICLE:"INFERNUS",PAGEID:22,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({BRAND:"OBEY",VEHICLE:"NINEF",PAGEID:23,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({BRAND:"OBEY",VEHICLE:"NINEF2",PAGEID:24,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({BRAND:"DEWBAUCH",VEHICLE:"RAPIDGT",PAGEID:25,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({BRAND:"DEWBAUCH",VEHICLE:"RAPIDGT2",PAGEID:26,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({BRAND:"GROTTI",VEHICLE:"STINGERG",PAGEID:27,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({BRAND:"ENUS",VEHICLE:"SUPERD",PAGEID:28,PRICE:-1,RANK:-1,SEATS:"04",IS_DLC:false});
      this.vehicleData.push({BRAND:"ANNIS",VEHICLE:"ELEGY2",PAGEID:29,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({BRAND:"HIJAK",VEHICLE:"KHAMEL",PAGEID:30,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({BRAND:"VAPID",VEHICLE:"HOTKNIFE",PAGEID:31,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({BRAND:"NAGASAKI",VEHICLE:"CARBON",PAGEID:32,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false,NOCOLOUR:true});
      this.vehicleData.push({BRAND:"COIL",VEHICLE:"VOLTIC_TLESS",PAGEID:33,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push(undefined);
      this.vehicleData.push({BRAND:"BENEFAC",VEHICLE:"SURANO_CONVERTABLE",PAGEID:35,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({BRAND:"BRAVADO",VEHICLE:"BANSHEE",PAGEID:36,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({BRAND:"PFISTER",VEHICLE:"COMET2",PAGEID:37,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({BRAND:"ALBANY",VEHICLE:"ROOSEVELT",PAGEID:38,PRICE:-1,RANK:-1,SEATS:"06",IS_DLC:true,TXD:"LGM_DLC_VALENTINES"});
      this.vehicleData.push({BRAND:"DINKA",VEHICLE:"JESTER",PAGEID:39,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:true,TXD:"LGM_DLC_BUSINESS"});
      this.vehicleData.push({BRAND:"DEWBAUCH",VEHICLE:"MASSACRO",PAGEID:40,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:true,TXD:"LGM_DLC_BUSINESS2"});
      this.vehicleData.push({BRAND:"GROTTI",VEHICLE:"TURISMOR",PAGEID:41,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:true,TXD:"LGM_DLC_BUSINESS"});
      this.vehicleData.push({BRAND:"PEGASSI",VEHICLE:"ZENTORNO",PAGEID:42,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:true,TXD:"LGM_DLC_BUSINESS2"});
      this.vehicleData.push({BRAND:"ENUS",VEHICLE:"HUNTLEY",PAGEID:43,PRICE:-1,RANK:-1,SEATS:"04",IS_DLC:true,TXD:"LGM_DLC_BUSINESS2"});
      this.vehicleData.push({BRAND:"ALBANY",VEHICLE:"ALPHA",PAGEID:44,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:true,TXD:"LGM_DLC_BUSINESS"});
      this.vehicleData.push({BRAND:"INVERTO",VEHICLE:"COQUETTE_TLESS",PAGEID:45,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:true,TXD:"LGM_DLC_BUSINESS2"});
      this.vehicleData.push({BRAND:"BRAVADO",VEHICLE:"BANSHEE_TLESS",PAGEID:46,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:true,TXD:"LGM_DLC_BUSINESS2"});
      this.vehicleData.push({BRAND:"GROTTI",VEHICLE:"STINGER_TLESS",PAGEID:47,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:true,TXD:"LGM_DLC_BUSINESS2"});
      this.vehicleData.push({BRAND:"COIL",VEHICLE:"VOLTIC_HTOP",PAGEID:48,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:true,TXD:"LGM_DLC_BUSINESS2"});
      this.vehicleData.push({BRAND:"DINKA",VEHICLE:"THRUST",PAGEID:49,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:true,TXD:"LGM_DLC_BUSINESS2"});
      this.vehicleData.push({BRAND:"INVERTO",VEHICLE:"COQUETTE2",PAGEID:50,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:true,TXD:"LGM_DLC_PILOT"});
      this.vehicleData.push({BRAND:"INVERTO",VEHICLE:"COQUETTE2_TLESS",PAGEID:51,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:true,TXD:"LGM_DLC_PILOT"});
      this.vehicleData.push({BRAND:"LAMPADATI",VEHICLE:"FURORE",PAGEID:52,PRICE:-1,RANK:200,SEATS:"02",IS_DLC:true,TXD:"LGM_DLC_LTS_CREATOR"});
      this.displayArray = new Array();
      if(this.isMP == false)
      {
         this.displayArray = [48,49,39,40,29,30,1,2,3,4,5,6,7,8,9];
      }
      else
      {
         this.displayArray = [50,48,49,47,38,40,41,37,39,42,36,28,29,30,27,1,2,45,25,3,4,5,6,7,8,9,15,16,17,43,18,19,20,21,22,23,24,26,31,46,35,33,34,44];
      }
      this.TXDarray = new Array();
      this.carNameStr = new Array();
      this.carColoursArray = new Array();
      this.carColoursArray.push(new Array(0,0,0));
      this.carColoursArray.push(new Array(204,0,0));
      this.carColoursArray.push(new Array(255,0,153));
      this.carColoursArray.push(new Array(255,255,0));
      this.carColoursArray.push(new Array(253,173,7));
      this.carColoursArray.push(new Array(102,204,51));
      this.carColoursArray.push(new Array(0,102,204));
      this.carColoursArray.push(new Array(25,25,25));
      this.carColoursArray.push(new Array(255,255,255));
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
      var _loc3_ = new Array();
      _loc3_ = AnchorLink.split("_");
      if(_loc3_[0] == "car")
      {
         this.carNumber = parseInt(_loc3_[1]);
         this.browser.GO_TO_WEBPAGE("WWW_LEGENDARYMOTORSPORT_NET_S_CAR_D_DETAILS" + this.carNumber);
      }
      else if(_loc3_[0] == "colour")
      {
         this.colourNumber = parseInt(_loc3_[1]);
         this.setColourPicker(this.colourNumber);
      }
      else if(_loc3_[0] == "PURCHASECAR")
      {
         this.browser.GO_TO_WEBPAGE("WWW_LEGENDARYMOTORSPORT_NET_S_PURCHASECAR");
      }
      else if(_loc3_[0] == "thumbnail")
      {
         this.carNumber = parseInt(_loc3_[1]);
         this.mcScope.colourSelectedMC._y = -50;
         var _loc2_ = 1;
         while(_loc2_ < 10)
         {
            this.mcScope["PURCHASECAR_" + _loc2_]._y = -50;
            _loc2_ = _loc2_ + 1;
         }
         this.browser.GO_TO_WEBPAGE("WWW_LEGENDARYMOTORSPORT_NET_S_CAR_D_DETAILS" + this.carNumber);
         this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
      }
   }
   function setColourPicker(col)
   {
      if(col == 0)
      {
         this.colourNumber = 1;
      }
      else
      {
         this.colourNumber = col;
      }
      this.prevColourY = this.mcScope.colourSelectedMC._y;
      com.rockstargames.ui.utils.Colour.Colourise(this.mcScope.colourSelectedMC.colourBgMC,this.carColoursArray[this.colourNumber][0],this.carColoursArray[this.colourNumber][1],this.carColoursArray[this.colourNumber][2],100);
      var _loc2_ = 1;
      while(_loc2_ < 10)
      {
         this.mcScope["PURCHASECAR_" + _loc2_]._y = -50;
         _loc2_ = _loc2_ + 1;
      }
      var _loc5_ = undefined;
      if(col == 0)
      {
         _loc5_ = this.mcScope.PURCHASECAR_1;
         this.browser.DISABLE_BUTTON(17,true);
         _loc5_._alpha = 10;
         this.mcScope.colourSelectedMC._y = -50;
      }
      else
      {
         _loc5_ = this.mcScope["PURCHASECAR_" + this.colourNumber];
         this.browser.DISABLE_BUTTON(col + 16,false);
         _loc5_._alpha = 100;
         this.mcScope.colourSelectedMC._x = this.mcScope["colour_" + this.colourNumber]._x;
         this.mcScope.colourSelectedMC._y = this.mcScope["colour_" + this.colourNumber]._y;
         this.prevColourNumber = this.colourNumber;
      }
      _loc5_._x = 817;
      _loc5_._y = 436;
      var _loc3_ = 100;
      if(this.isMP == true)
      {
         var _loc4_ = undefined;
         if(this.vehicleData[this.carNumber].NOCOLOUR == true)
         {
            _loc4_ = true;
            _loc3_ = 0;
            this.browser.DISABLE_BUTTON(17,false);
            this.mcScope.PURCHASECAR_1._alpha = 100;
            this.mcScope.PURCHASECAR_1._y = 436;
         }
         else
         {
            _loc4_ = false;
            _loc3_ = 100;
         }
         _loc2_ = 9;
         while(_loc2_ < 17)
         {
            this.browser.DISABLE_BUTTON(_loc2_,_loc4_);
            this.mcScope["colour_" + (_loc2_ - 8)]._alpha = _loc3_;
            _loc2_ = _loc2_ + 1;
         }
      }
      this.colouriseButtons(_loc3_);
   }
   function colouriseButtons(alphaValue)
   {
      if(alphaValue == undefined)
      {
         alphaValue = 100;
      }
      var _loc2_ = 1;
      while(_loc2_ < 9)
      {
         if(this.mcScope["colour_" + _loc2_] != undefined)
         {
            com.rockstargames.ui.utils.Colour.Colourise(this.mcScope["colour_" + _loc2_],this.carColoursArray[_loc2_][0],this.carColoursArray[_loc2_][1],this.carColoursArray[_loc2_][2],alphaValue);
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function makeThumbnails(startSlot)
   {
      var _loc8_ = 627;
      var _loc4_ = 263;
      var _loc6_ = 539;
      var _loc5_ = 0;
      while(_loc5_ < this.displayArray.length)
      {
         var _loc3_ = this.displayArray[_loc5_];
         var _loc2_ = "thumbnail_" + _loc3_;
         if(this.vehicleData[_loc3_].PRICE != -1)
         {
            if(this.mcScope[_loc2_] == undefined)
            {
               var _loc9_ = this.mcScope.attachMovie("car_thumbnail",_loc2_,this.mcScope.getNextHighestDepth(),{_x:_loc4_,_y:_loc6_,_alpha:0,_width:96.1,_height:83.35});
               this.displayVehicleImage(_loc2_,_loc3_,this.mcScope[_loc2_]);
            }
            else
            {
               this.mcScope[_loc2_]._x = _loc4_;
               this.mcScope[_loc2_]._y = _loc6_;
            }
            this.mcScope[_loc2_].btnTxt.htmlText = this.carNameStr[_loc3_];
            this.dataTextScope[startSlot] = this.mcScope[_loc2_].btnTxt;
            if(typeof this.vehicleData[_loc3_].PRICE == "string")
            {
               this.mcScope[_loc2_].carImages.outOfStock._alpha = 0;
            }
            else if(this.vehicleData[_loc3_].PRICE == 0)
            {
               this.mcScope[_loc2_].carImages.outOfStock._alpha = 100;
               this.mcScope[_loc2_].carImages.outOfStock.outOfStockTF.autoSize = "center";
               this.mcScope[_loc2_].carImages.outOfStock.outOfStockTF.multiline = true;
               this.mcScope[_loc2_].carImages.outOfStock.outOfStockTF.wordWrap = true;
               this.set_localised_text(-1,this.mcScope[_loc2_].carImages.outOfStock.outOfStockTF,"WEB_OUTOFSTOCK",false);
               this.mcScope[_loc2_].carImages.outOfStock.outOfStockTF._y = 146 - this.mcScope[_loc2_].carImages.outOfStock.outOfStockTF._height / 2;
               this.dataTextScope[startSlot] = undefined;
            }
            else if(this.vehicleData[_loc3_].PRICE > 0)
            {
               this.mcScope[_loc2_].carImages.outOfStock._alpha = 0;
            }
            if(this.vehicleData[_loc3_].RANK > this.currentRank)
            {
               this.mcScope[_loc2_].MPrank.rankTF.text = this.vehicleData[_loc3_].RANK;
               this.mcScope[_loc2_].MPrank._alpha = 100;
               this.dataTextScope[startSlot] = undefined;
            }
            else
            {
               this.mcScope[_loc2_].MPrank._alpha = 0;
            }
            this.mcScope[_loc2_]._alpha = 100;
            startSlot = startSlot + 1;
            _loc8_ = _loc6_ + 58;
            _loc4_ += 94.31;
            if(_loc4_ > 1018)
            {
               _loc4_ = 263;
               _loc6_ += 84;
            }
         }
         _loc5_ = _loc5_ + 1;
      }
      this.mcScope.footer._y = _loc8_ + 8;
      _loc8_ += 30;
      if(_loc8_ < 627)
      {
         _loc8_ = 627;
      }
      return _loc8_;
   }
   function labelAsDlcPack(targetMc, selection)
   {
      if(!this.isMP)
      {
         return undefined;
      }
      targetMc.carImages.dlcPackTF.text = "";
      if(this.vehicleData[selection].IS_DLC == true)
      {
         var _loc2_ = targetMc.carImages.dlcPackTF;
         _loc2_._visible = false;
         _loc2_.autoSize = "center";
         _loc2_.multiline = true;
         _loc2_.wordWrap = true;
         if(this.vehicleData[selection].TXD == "LGM_DLC_VALENTINES")
         {
            this.set_localised_text(-1,_loc2_,"WEB_VALENTINESPACK",true);
         }
         if(this.vehicleData[selection].TXD == "LGM_DLC_BUSINESS")
         {
            this.set_localised_text(-1,_loc2_,"WEB_BUSINESSPACK",true);
         }
         if(this.vehicleData[selection].TXD == "LGM_DLC_BUSINESS2")
         {
            this.set_localised_text(-1,_loc2_,"WEB_BUSINESSPACK2",true);
         }
         if(this.vehicleData[selection].TXD == "LGM_DLC_PILOT")
         {
            this.set_localised_text(-1,_loc2_,"WEB_PILOTPACK",true);
         }
         if(this.vehicleData[selection].TXD == "LGM_DLC_LTS_CREATOR")
         {
            this.set_localised_text(-1,_loc2_,"WEB_LTSCREATORPACK",true);
         }
         _loc2_._visible = true;
      }
   }
   function getCarStrings()
   {
      if(this.carNameStr.length == 0)
      {
         this.set_localised_text(-1,this.CONTENT.localisationTF,"WEB_OUTOFSTOCK");
         this.outOfStockStr = this.CONTENT.localisationTF.text;
         this.set_localised_text(-1,this.CONTENT.localisationTF,"LGM_BUYNOW");
         this.buyNowStr = this.CONTENT.localisationTF.text;
         this.set_localised_text(-1,this.CONTENT.localisationTF,"LGM_CONVERTABLE");
         this.convertableString = this.CONTENT.localisationTF.text;
         this.set_localised_text(-1,this.CONTENT.localisationTF,"LGM_DECOMMISSIONED");
         this.decommissionedString = this.CONTENT.localisationTF.text;
         var _loc3_ = 0;
         while(_loc3_ < this.displayArray.length)
         {
            var _loc2_ = this.displayArray[_loc3_];
            if(this.vehicleData[_loc2_] != undefined)
            {
               if(this.vehicleData[_loc2_].VEHICLE == "RAPIDGT2")
               {
                  this.set_localised_text(-1,this.CONTENT.localisationTF,"RAPIDGT");
               }
               else
               {
                  this.set_localised_text(-1,this.CONTENT.localisationTF,this.vehicleData[_loc2_].VEHICLE);
               }
               this.carNameStr[_loc2_] = this.CONTENT.localisationTF.text;
            }
            if(this.vehicleData[_loc2_].VEHICLE == "RAPIDGT2")
            {
               this.carNameStr[_loc2_] += " " + this.convertableString;
            }
            if(this.vehicleData[_loc2_].VEHICLE == "CARBONIZ")
            {
               this.carNameStr[_loc2_] += " " + this.convertableString;
            }
            if(this.vehicleData[_loc2_].VEHICLE == "JB700")
            {
               this.carNameStr[_loc2_] += " " + this.decommissionedString;
            }
            _loc3_ = _loc3_ + 1;
         }
         this.set_localised_text(-1,this.CONTENT.localisationTF,"LGM_TOOLBAR");
         this.browser.SET_TITLEBAR_TEXT(this.CONTENT.localisationTF.text,14474460);
      }
   }
   function POPULATE_TEXT(pageName, searchArgs, newPage)
   {
      this.currentPage = pageName;
      this.CONTENT._y = 0;
      this.getCarStrings();
      var _loc12_ = pageName;
      if(_loc12_.substring(0,13) == "CAR_D_DETAILS")
      {
         _loc12_ = "CAR_D_DETAILS";
      }
      else
      {
         this.prevCarNumber = undefined;
      }
      if(this.TXDarray.length > 0)
      {
         var _loc3_ = 0;
         while(_loc3_ < this.TXDarray.length)
         {
            com.rockstargames.ui.game.GameInterface.call("REQUEST_TXD_AND_ADD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"WEB_BROWSER",this.TXDarray[_loc3_],"loadedCheck");
            _loc3_ = _loc3_ + 1;
         }
      }
      switch(_loc12_)
      {
         case "PAGE1":
            clearInterval(this.intervalId);
            this.mcScope = this.CONTENT.PAGE1;
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_LEGENDARYMOTORSPORT_NET.btnTxt;
            this.dataTextScope[2] = this.mcScope.WWW_LIFEINVADER_COM.btnTxt;
            this.dataTextScope[3] = this.mcScope.WWW_BLEATER_COM.btnTxt;
            this.set_localised_text(4,this.mcScope.header2,"LGM_PG1_HEADER2");
            this.set_localised_text(5,this.mcScope.header,"LGM_PG1_HEADER");
            this.set_localised_text(6,this.mcScope.body1,"LGM_PG1_BODY1");
            this.set_localised_text(7,this.mcScope.body2,"LGM_PG1_BODY2");
            var _loc11_ = 1185;
            var _loc4_ = 217;
            var _loc6_ = 504;
            var _loc5_ = 8;
            if(newPage == false)
            {
               _loc3_ = 0;
               while(_loc3_ < this.displayArray.length)
               {
                  var _loc2_ = this.displayArray[_loc3_];
                  var _loc15_ = "car_" + _loc2_;
                  if(this.vehicleData[_loc2_].PRICE != -1)
                  {
                     if(this.mcScope[_loc15_] != undefined)
                     {
                        this.mcScope[_loc15_].removeMovieClip();
                     }
                     var _loc7_ = this.mcScope.attachMovie("car_box",_loc15_,this.mcScope.getNextHighestDepth(),{_x:_loc4_,_y:_loc6_,_alpha:0});
                     this.displayVehicleImage(_loc15_,_loc2_,_loc7_);
                     this.mcScope[_loc15_].btnTxt.htmlText = this.carNameStr[_loc2_];
                     this.dataTextScope[_loc5_] = this.mcScope[_loc15_].btnTxt;
                     if(typeof this.vehicleData[_loc2_].PRICE == "string")
                     {
                        this.mcScope[_loc15_].carImages.outOfStock._alpha = 0;
                        this.set_price_text(this.mcScope[_loc15_].priceTF,this.vehicleData[_loc2_].PRICE);
                     }
                     else if(this.vehicleData[_loc2_].PRICE == 0)
                     {
                        this.mcScope[_loc15_].carImages.outOfStock.outOfStockTF.autoSize = "center";
                        this.mcScope[_loc15_].carImages.outOfStock.outOfStockTF.multiline = true;
                        this.mcScope[_loc15_].carImages.outOfStock.outOfStockTF.wordWrap = true;
                        this.mcScope[_loc15_].carImages.outOfStock.outOfStockTF.htmlText = this.outOfStockStr;
                        this.mcScope[_loc15_].carImages.outOfStock.outOfStockTF._y = 146 - this.mcScope[_loc15_].carImages.outOfStock.outOfStockTF._height / 2;
                        this.mcScope[_loc15_].carImages.outOfStock._alpha = 100;
                        this.mcScope[_loc15_].priceTF.text = "";
                        this.dataTextScope[_loc5_] = undefined;
                     }
                     else if(this.vehicleData[_loc2_].PRICE > 0)
                     {
                        this.mcScope[_loc15_].carImages.outOfStock._alpha = 0;
                        this.set_price_text(this.mcScope[_loc15_].priceTF,this.vehicleData[_loc2_].PRICE);
                     }
                     if(this.isMP == true)
                     {
                        if(this.vehicleData[_loc2_].RANK > this.currentRank)
                        {
                           this.mcScope[_loc15_].MPrank.rankTF.text = this.vehicleData[_loc2_].RANK;
                           this.mcScope[_loc15_].MPrank._alpha = 100;
                           this.dataTextScope[_loc5_] = undefined;
                        }
                        else
                        {
                           this.mcScope[_loc15_].MPrank._alpha = 0;
                        }
                        if(this.vehicleData[_loc2_].SEATS != "")
                        {
                           this.mcScope[_loc15_].MPseats.seatsTF.text = this.vehicleData[_loc2_].SEATS;
                           this.mcScope[_loc15_].MPseats._alpha = 100;
                        }
                        else
                        {
                           this.mcScope[_loc15_].MPseats._alpha = 0;
                        }
                     }
                     this.mcScope[_loc15_]._alpha = 100;
                     _loc5_ = _loc5_ + 1;
                     _loc11_ = _loc6_ + 200;
                     _loc4_ += 286;
                     if(_loc4_ > 789)
                     {
                        _loc4_ = 217;
                        _loc6_ += 214;
                     }
                  }
                  _loc3_ = _loc3_ + 1;
               }
            }
            this.mcScope.footer._y = _loc11_;
            if(this.isMP == true)
            {
               this.mcScope.footer.gotoAndStop(2);
            }
            else
            {
               this.mcScope.footer.gotoAndStop(1);
            }
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            this.CONTENT.BOUNDING_BOX._height = _loc11_ + this.mcScope.footer._height + 48;
            break;
         case "CAR_D_DETAILS":
            clearInterval(this.intervalId);
            this.mcScope = this.CONTENT.CAR_D_DETAILS;
            this.colouriseButtons();
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_LEGENDARYMOTORSPORT_NET.btnTxt;
            var _loc13_ = pageName.split("CAR_D_DETAILS");
            this.carNumber = parseInt(_loc13_[1]);
            _loc15_ = "mainImage_" + this.carNumber;
            if(this.prevCarNumber != this.carNumber)
            {
               this.mcScope.carImages.vehicleTF.text = "";
               this.prevCarNumber = this.carNumber;
            }
            this.displayVehicleImage(_loc15_,this.carNumber,this.mcScope);
            if(this.vehicleData[this.carNumber].BRAND != "")
            {
               this.mcScope.carBadge.gotoAndStop(this.vehicleData[this.carNumber].BRAND);
               this.mcScope.carBadge._visible = true;
               this.mcScope.carNameTF._x = 310;
            }
            else
            {
               this.mcScope.carBadge.gotoAndStop(1);
               this.mcScope.carNameTF._x = 222;
               this.mcScope.carBadge._visible = false;
            }
            if(typeof this.vehicleData[_loc2_].PRICE == "number" && this.vehicleData[this.carNumber].PRICE == 0)
            {
               this.mcScope[_loc15_].carImages.outOfStock._alpha = 100;
               this.set_localised_text(-1,this.mcScope[_loc15_].carImages.outOfStock.outOfStockTF,"WEB_OUTOFSTOCK",false);
            }
            else
            {
               this.mcScope[_loc15_].carImages.outOfStock._alpha = 0;
               if(this.carNumber != 30)
               {
                  this.set_localised_text(8,this.mcScope.selectColourTF,"LGM_COLOUR");
               }
               else
               {
                  this.mcScope.selectColourTF.text = "";
               }
               this.dataTextScope[9] = this.mcScope.colour_1.btnTxt;
               this.dataTextScope[10] = this.mcScope.colour_2.btnTxt;
               this.dataTextScope[11] = this.mcScope.colour_3.btnTxt;
               this.dataTextScope[12] = this.mcScope.colour_4.btnTxt;
               this.dataTextScope[13] = this.mcScope.colour_5.btnTxt;
               this.dataTextScope[14] = this.mcScope.colour_6.btnTxt;
               this.dataTextScope[15] = this.mcScope.colour_7.btnTxt;
               this.dataTextScope[16] = this.mcScope.colour_8.btnTxt;
            }
            var _loc14_ = this.vehicleData[this.carNumber].VEHICLE;
            this.set_localised_text(4,this.mcScope.statsTF,"LGM_STATS_" + _loc14_);
            this.mcScope.body.multiline = true;
            this.mcScope.body.wordWrap = true;
            this.set_localised_text(5,this.mcScope.body,"LGM_" + _loc14_);
            this.mcScope.carNameTF.text = this.carNameStr[this.carNumber];
            this.set_price_text(this.mcScope.priceTF,this.vehicleData[this.carNumber].PRICE);
            if(this.isMP == true)
            {
               if(this.vehicleData[this.carNumber].SEATS != "")
               {
                  this.mcScope.MPseats.seatsTF.text = this.vehicleData[this.carNumber].SEATS;
                  this.mcScope.MPseats._alpha = 100;
               }
               else
               {
                  this.mcScope.MPseats._alpha = 0;
               }
            }
            _loc3_ = 1;
            while(_loc3_ < 9)
            {
               this.mcScope["PURCHASECAR_" + _loc3_].btnTxt.text = this.buyNowStr;
               this.dataTextScope[_loc3_ + 16] = this.mcScope["PURCHASECAR_" + _loc3_].btnTxt;
               _loc3_ = _loc3_ + 1;
            }
            this.setColourPicker(0);
            this.CONTENT.BOUNDING_BOX._height = this.makeThumbnails(50);
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            break;
         case "PURCHASECAR":
            clearInterval(this.intervalId);
            this.mcScope = this.CONTENT.PURCHASECAR;
            this.colouriseButtons();
            this.mcScope.body1._alpha = 0;
            this.mcScope.body2._alpha = 0;
            this.mcScope.soldTF._alpha = 0;
            _loc15_ = "mainImage_" + this.carNumber;
            this.displayVehicleImage(_loc15_,this.carNumber,this.mcScope);
            if(this.vehicleData[this.carNumber].BRAND != "")
            {
               this.mcScope.carBadge.gotoAndStop(this.vehicleData[this.carNumber].BRAND);
               this.mcScope.carBadge._visible = true;
               this.mcScope.carNameTF._x = 310;
            }
            else
            {
               this.mcScope.carBadge.gotoAndStop(1);
               this.mcScope.carNameTF._x = 222;
               this.mcScope.carBadge._visible = false;
            }
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_LEGENDARYMOTORSPORT_NET.btnTxt;
            this.set_localised_text(5,this.mcScope.body1,"LGM_PURCHASED");
            this.mcScope.body1.autoSize = true;
            this.set_localised_text(6,this.mcScope.body2,"LGM_DISCLAIMER");
            this.set_localised_text(7,this.mcScope.soldTF,"WEB_SOLD");
            this.mcScope.body.multiline = true;
            this.mcScope.body.wordWrap = true;
            _loc14_ = this.carNameStr[this.carNumber];
            this.mcScope.carNameTF.text = _loc14_;
            this.set_price_text(this.mcScope.priceTF,this.vehicleData[this.carNumber].PRICE);
            if(this.isMP == true)
            {
               if(this.vehicleData[this.carNumber].SEATS != "")
               {
                  this.mcScope.MPseats.seatsTF.text = this.vehicleData[this.carNumber].SEATS;
                  this.mcScope.MPseats._alpha = 100;
               }
               else
               {
                  this.mcScope.MPseats._alpha = 0;
               }
            }
            this.setColourPicker(0);
            this.CONTENT.BOUNDING_BOX._height = this.makeThumbnails(50);
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            this.intervalId = setInterval(this,"displayPurchasedText",1500);
            break;
         case "PURCHASE_D_FAILED":
            this.mcScope = this.CONTENT.PURCHASE_D_FAILED;
            this.colouriseButtons();
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_LEGENDARYMOTORSPORT_NET.btnTxt;
            this.set_localised_text(1,this.mcScope.soldTF,"WEB_NOT_SOLD");
            this.mcScope.body.multiline = true;
            this.mcScope.body.wordWrap = true;
            if(this.vehicleData[this.carNumber].BRAND != "")
            {
               this.mcScope.carBadge.gotoAndStop(this.vehicleData[this.carNumber].BRAND);
               this.mcScope.carBadge._visible = true;
               this.mcScope.carNameTF._x = 310;
            }
            else
            {
               this.mcScope.carBadge.gotoAndStop(1);
               this.mcScope.carNameTF._x = 222;
               this.mcScope.carBadge._visible = false;
            }
            _loc15_ = "mainImage_" + this.carNumber;
            this.displayVehicleImage(_loc15_,this.carNumber,this.mcScope);
            _loc14_ = this.carNameStr[this.carNumber];
            this.mcScope.carNameTF.text = _loc14_;
            this.set_price_text(this.mcScope.priceTF,this.vehicleData[this.carNumber].PRICE);
            this.set_localised_text(7,this.mcScope.body1,"LGM_FAILED");
            if(this.isMP == true)
            {
               if(this.vehicleData[this.carNumber].SEATS != "")
               {
                  this.mcScope.MPseats.seatsTF.text = this.vehicleData[this.carNumber].SEATS;
                  this.mcScope.MPseats._alpha = 100;
               }
               else
               {
                  this.mcScope.MPseats._alpha = 0;
               }
            }
            this.setColourPicker(0);
            this.CONTENT.BOUNDING_BOX._height = this.makeThumbnails(50);
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            break;
         case "PURCHASE_D_ERROR":
            this.mcScope = this.CONTENT.PURCHASE_D_ERROR;
            this.colouriseButtons();
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_LEGENDARYMOTORSPORT_NET.btnTxt;
            this.dataTextScope[1] = this.mcScope.soldTF;
            if(this.dataProviderUI[1][0] != undefined)
            {
               this.dataTextScope[1].text = this.dataProviderUI[1][0];
            }
            this.mcScope.body.multiline = true;
            this.mcScope.body.wordWrap = true;
            this.dataTextScope[2] = this.mcScope.body1;
            if(this.dataProviderUI[2][0] != undefined)
            {
               this.dataTextScope[2].text = this.dataProviderUI[2][0];
            }
            _loc15_ = "mainImage_" + this.carNumber;
            this.displayVehicleImage(_loc15_,this.carNumber,this.mcScope);
            if(this.vehicleData[this.carNumber].BRAND != "")
            {
               this.mcScope.carBadge.gotoAndStop(this.vehicleData[this.carNumber].BRAND);
               this.mcScope.carBadge._visible = true;
               this.mcScope.carNameTF._x = 310;
            }
            else
            {
               this.mcScope.carBadge.gotoAndStop(1);
               this.mcScope.carNameTF._x = 222;
               this.mcScope.carBadge._visible = false;
            }
            _loc14_ = this.carNameStr[this.carNumber];
            this.mcScope.carNameTF.text = _loc14_;
            this.set_price_text(this.mcScope.priceTF,this.vehicleData[this.carNumber].PRICE);
            if(this.isMP == true)
            {
               if(this.vehicleData[this.carNumber].SEATS != "")
               {
                  this.mcScope.MPseats.seatsTF.text = this.vehicleData[this.carNumber].SEATS;
                  this.mcScope.MPseats._alpha = 100;
               }
               else
               {
                  this.mcScope.MPseats._alpha = 0;
               }
            }
            this.setColourPicker(0);
            this.CONTENT.BOUNDING_BOX._height = this.makeThumbnails(50);
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            break;
         case "PURCHASE_D_CONFIRM":
            this.mcScope = this.CONTENT.PURCHASE_D_CONFIRM;
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_LEGENDARYMOTORSPORT_NET.btnTxt;
            this.mcScope.body.multiline = true;
            this.mcScope.body.wordWrap = true;
            this.dataTextScope[1] = this.mcScope.body;
            if(this.dataProviderUI[1] != undefined)
            {
               this.dataTextScope[1].htmlText = this.dataProviderUI[1];
            }
            this.dataTextScope[2] = this.mcScope.WWW_LEGENDARYMOTORSPORT_NET_S_PURCHASECAR.btnTxt;
            if(this.dataProviderUI[2] != undefined)
            {
               this.dataTextScope[2].htmlText = this.dataProviderUI[2];
            }
            this.dataTextScope[3] = this.mcScope.WWW_LEGENDARYMOTORSPORT_NET_S_PURCHASE_D_FAILED.btnTxt;
            if(this.dataProviderUI[3] != undefined)
            {
               this.dataTextScope[3].htmlText = this.dataProviderUI[3];
            }
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            this.CONTENT.BOUNDING_BOX._height = 627;
      }
   }
   function displayPurchasedText()
   {
      clearInterval(this.intervalId);
      this.mcScope.body1._alpha = 100;
      this.mcScope.body2._alpha = 100;
      this.mcScope.soldTF._alpha = 100;
   }
   function set_localised_text(slotID, TF, TextLabel, setDataSlot)
   {
      this.dataTextScope[slotID] = TF;
      var _loc3_ = TF.html;
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,TextLabel,TF,_loc3_);
   }
   function set_price_text(TF, price)
   {
      TF.text = "";
      if(Number(price) > 0 || typeof price == "string")
      {
         TF._visible = false;
         if(typeof price == "string")
         {
            TF.multiline = true;
            TF.wordWrap = true;
            TF.textAutoSize = "shrink";
            TF.htmlText = price;
         }
         else
         {
            var _loc5_ = undefined;
            var _loc3_ = price.toString();
            var _loc7_ = _loc3_.length;
            if(_loc7_ > 3)
            {
               var _loc6_ = "";
               var _loc2_ = _loc3_.slice(0,-3);
               var _loc8_ = "," + _loc3_.slice(-3);
               if(_loc2_.length > 3)
               {
                  _loc6_ = _loc2_.slice(0,-3) + ",";
                  _loc2_ = _loc2_.slice(-3);
               }
               _loc5_ = _loc6_ + _loc2_ + _loc8_;
            }
            else
            {
               _loc5_ = _loc3_;
            }
            TF.text = "$" + _loc5_;
         }
         TF._visible = true;
      }
   }
   function displayVehicleImage(mcName, vehicleIndex, targetMc)
   {
      if(this.vehicleData[vehicleIndex].TXD == undefined)
      {
         targetMc.carImages.gotoAndStop(this.vehicleData[vehicleIndex].VEHICLE);
      }
      else
      {
         targetMc.carImages.gotoAndStop(1);
         if(this.hasTxdLoaded(this.vehicleData[vehicleIndex].TXD) == true)
         {
            this.addImageToTextfield(this.vehicleData[vehicleIndex].TXD,mcName);
         }
         else
         {
            com.rockstargames.ui.game.GameInterface.call("REQUEST_TXD_AND_ADD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"WEB_BROWSER",this.vehicleData[vehicleIndex].TXD,mcName,true);
         }
      }
      if(mcName.substr(0,9) != "thumbnail")
      {
         this.labelAsDlcPack(targetMc,vehicleIndex);
      }
   }
   function TXD_HAS_LOADED(textureDict, success, uniqueID)
   {
      if(success == true)
      {
         if(this.hasTxdLoaded(textureDict) == false)
         {
            this.TXDarray.push(textureDict);
         }
         this.addImageToTextfield(textureDict,uniqueID);
      }
   }
   function addImageToTextfield(textureDict, mcName)
   {
      var _loc2_ = new Array();
      _loc2_ = mcName.split("_");
      var _loc4_ = parseInt(_loc2_[1]);
      var _loc5_ = this.vehicleData[_loc4_].VEHICLE;
      var _loc3_ = undefined;
      if(_loc2_[0] == "mainImage")
      {
         _loc3_ = this.mcScope;
      }
      else
      {
         _loc3_ = this.mcScope[mcName];
      }
      _loc3_.carImages.vehicleTF.htmlText = "<img src=\'img://" + textureDict + "/" + _loc5_ + "\' vspace=\'0\' hspace=\'0\' width=\'512\' height=\'372\'/>";
   }
   function hasTxdLoaded(textureDict)
   {
      var _loc3_ = false;
      var _loc2_ = 0;
      while(_loc2_ < this.TXDarray.length)
      {
         if(this.TXDarray[_loc2_] == textureDict)
         {
            _loc3_ = true;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      return _loc3_;
   }
   function CLEANUP()
   {
      if(this.TXDarray.length > 0)
      {
         this.TIMELINE.CONTENT.gotoAndStop(1);
         var _loc2_ = 0;
         while(_loc2_ < this.TXDarray.length)
         {
            if(this.TXDarray[_loc2_] != undefined)
            {
               com.rockstargames.ui.game.GameInterface.call("REMOVE_TXD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"WEB_BROWSER",this.TXDarray[_loc2_]);
               this.TXDarray[_loc2_] = undefined;
            }
            _loc2_ = _loc2_ + 1;
         }
         this.TXDarray = new Array();
      }
   }
}
