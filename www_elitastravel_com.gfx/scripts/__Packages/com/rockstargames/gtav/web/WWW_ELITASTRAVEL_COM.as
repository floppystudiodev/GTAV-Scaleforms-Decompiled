class com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM extends com.rockstargames.ui.core.BaseWebsite
{
   var browser;
   var PAGE_NAMES;
   var CAN_STORE_PAGE;
   var vehicleData;
   var displayArray;
   var planeNumber;
   var colourNumber;
   var mcScope;
   var prevColourNumber;
   var CONTENT;
   var intervalId;
   var defaultButtonOnColour;
   var defaultButtonOffColour;
   var TXDarray;
   var dataTextScope;
   var dataProviderUI;
   var TIMELINE;
   var currentRank = 0;
   var isMP = false;
   var PLANE_SWIFT = 22;
   function WWW_ELITASTRAVEL_COM()
   {
      super();
      this._name = "WWW_ELITASTRAVEL_COM";
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
      this.PAGE_NAMES[3] = "PLANE_D_DETAILS1";
      this.PAGE_NAMES[4] = "PLANE_D_DETAILS2";
      this.PAGE_NAMES[5] = "PLANE_D_DETAILS3";
      this.PAGE_NAMES[6] = "PLANE_D_DETAILS4";
      this.PAGE_NAMES[7] = "PLANE_D_DETAILS5";
      this.PAGE_NAMES[8] = "PLANE_D_DETAILS6";
      this.PAGE_NAMES[9] = "PLANE_D_DETAILS7";
      this.PAGE_NAMES[10] = "PLANE_D_DETAILS8";
      this.PAGE_NAMES[11] = "PLANE_D_DETAILS9";
      this.PAGE_NAMES[12] = "PURCHASEPLANE";
      this.PAGE_NAMES[13] = "PURCHASE_D_FAILED";
      this.PAGE_NAMES[14] = "PURCHASE_D_ERROR";
      this.PAGE_NAMES[15] = "PURCHASE_D_CONFIRM";
      this.PAGE_NAMES[16] = "INVENTORY";
      this.PAGE_NAMES[17] = "PLANE_D_DETAILS15";
      this.PAGE_NAMES[18] = "PLANE_D_DETAILS16";
      this.PAGE_NAMES[19] = "PLANE_D_DETAILS17";
      this.PAGE_NAMES[20] = "PLANE_D_DETAILS18";
      this.PAGE_NAMES[21] = "PLANE_D_DETAILS19";
      this.PAGE_NAMES[22] = "PLANE_D_DETAILS20";
      this.PAGE_NAMES[23] = "PLANE_D_DETAILS21";
      this.PAGE_NAMES[24] = "PLANE_D_DETAILS22";
      this.PAGE_NAMES[25] = "PLANE_D_DETAILS23";
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
      this.vehicleData = new Array();
      this.vehicleData.push(undefined);
      this.vehicleData.push(undefined);
      this.vehicleData.push({VEHICLE:"DUSTER",PAGEID:4,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false,NOCOLOUR:true});
      this.vehicleData.push({VEHICLE:"SHAMAL",PAGEID:5,PRICE:-1,RANK:-1,SEATS:"10",IS_DLC:false,NOCOLOUR:true});
      this.vehicleData.push({VEHICLE:"CUBAN800",PAGEID:6,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false,NOCOLOUR:true});
      this.vehicleData.push({VEHICLE:"LUXOR",PAGEID:7,PRICE:-1,RANK:-1,SEATS:"10",IS_DLC:false,NOCOLOUR:true});
      this.vehicleData.push({VEHICLE:"STUNT",PAGEID:8,PRICE:-1,RANK:-1,SEATS:"01",IS_DLC:false,NOCOLOUR:true});
      this.vehicleData.push({VEHICLE:"FROGGER",PAGEID:9,PRICE:-1,RANK:-1,SEATS:"04",IS_DLC:false,NOCOLOUR:true});
      this.vehicleData.push({VEHICLE:"MAVERICK",PAGEID:10,PRICE:-1,RANK:-1,SEATS:"04",IS_DLC:false,NOCOLOUR:true});
      this.vehicleData.push(undefined);
      this.vehicleData.push(undefined);
      this.vehicleData.push(undefined);
      this.vehicleData.push(undefined);
      this.vehicleData.push(undefined);
      this.vehicleData.push(undefined);
      this.vehicleData.push({VEHICLE:"ANNIHL",PAGEID:17,PRICE:-1,RANK:-1,SEATS:"06",IS_DLC:false,NOCOLOUR:true});
      this.vehicleData.push({VEHICLE:"MAMMATUS",PAGEID:18,PRICE:-1,RANK:-1,SEATS:"04",IS_DLC:false,NOCOLOUR:true});
      this.vehicleData.push({VEHICLE:"TITAN",PAGEID:19,PRICE:-1,RANK:-1,SEATS:"10",IS_DLC:false,NOCOLOUR:true});
      this.vehicleData.push({VEHICLE:"VELUM",PAGEID:20,PRICE:-1,RANK:-1,SEATS:"04",IS_DLC:false,NOCOLOUR:true});
      this.vehicleData.push({VEHICLE:"VESTRA",PAGEID:21,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:true,TXD:"ELT_DLC_BUSINESS",NOCOLOUR:true});
      this.vehicleData.push({VEHICLE:"MILJET",PAGEID:22,PRICE:-1,RANK:-1,SEATS:"16",IS_DLC:true,TXD:"ELT_DLC_PILOT",NOCOLOUR:true});
      this.vehicleData.push({VEHICLE:"BESRA",PAGEID:23,PRICE:-1,RANK:-1,SEATS:"01",IS_DLC:true,TXD:"ELT_DLC_PILOT",NOCOLOUR:true});
      this.vehicleData.push({VEHICLE:"SWIFT",PAGEID:24,PRICE:-1,RANK:-1,SEATS:"04",IS_DLC:true,TXD:"ELT_DLC_PILOT",LIVERY1:"ELT_DLC_LIV1",LIVERY2:"ELT_DLC_LIV2",LIVERY_PRICE2:undefined});
      this.vehicleData.push({VEHICLE:"DODO",PAGEID:25,PRICE:-1,RANK:-1,SEATS:"04",IS_DLC:false,NOCOLOUR:true});
      this.displayArray = new Array();
      if(this.isMP == false)
      {
         this.displayArray = [23,19,20,21,22,2,3,4,5,6,7,8];
      }
      else
      {
         this.displayArray = [23,22,20,21,19,2,3,4,5,6,7,8,15,16,17,18];
      }
   }
   function READY()
   {
   }
   function SET_PRICES(slotID, price, secondaryPrice)
   {
      if(secondaryPrice != undefined)
      {
         this.vehicleData[slotID - 2].LIVERY_PRICE2 = secondaryPrice;
      }
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
      var _loc2_ = new Array();
      _loc2_ = AnchorLink.split("_");
      if(_loc2_[0] == "plane")
      {
         this.planeNumber = parseInt(_loc2_[1]);
         this.browser.GO_TO_WEBPAGE("WWW_ELITASTRAVEL_COM_S_PLANE_D_DETAILS" + this.planeNumber);
      }
      else if(_loc2_[0] == "colour")
      {
         this.colourNumber = parseInt(_loc2_[1]);
         this.setColourPicker(this.colourNumber);
      }
      else if(_loc2_[0] == "PURCHASEPLANE")
      {
         this.browser.GO_TO_WEBPAGE("WWW_ELITASTRAVEL_COM_S_PURCHASEPLANE");
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
      var _loc2_ = 1;
      while(_loc2_ < 9)
      {
         this.mcScope["PURCHASEPLANE_" + _loc2_]._y = -50;
         _loc2_ = _loc2_ + 1;
      }
      var _loc3_ = undefined;
      if(col == 0)
      {
         _loc3_ = this.mcScope.PURCHASEPLANE_1;
         this.browser.DISABLE_BUTTON(7,true);
         _loc3_._alpha = 10;
         this.mcScope.colourSelectedMC._y = -50;
      }
      else
      {
         _loc3_ = this.mcScope["PURCHASEPLANE_" + this.colourNumber];
         this.browser.DISABLE_BUTTON(col + 6,false);
         _loc3_._alpha = 100;
         this.mcScope.colourSelectedMC._x = this.mcScope["colour_" + this.colourNumber]._x;
         this.mcScope.colourSelectedMC._y = this.mcScope["colour_" + this.colourNumber]._y;
         this.prevColourNumber = this.colourNumber;
      }
      if(this.vehicleData[this.planeNumber].NOCOLOUR == true)
      {
         _loc3_ = this.mcScope.PURCHASEPLANE_1;
         this.browser.DISABLE_BUTTON(7,false);
         _loc3_._alpha = 100;
         this.mcScope.colourSelectedMC._y = -50;
      }
      _loc3_._x = 845;
      _loc3_._y = 521;
   }
   function labelAsDlcPack(targetMc, selection)
   {
      if(!this.isMP)
      {
         return undefined;
      }
      targetMc.planeImages.dlcPackTF.text = "";
      if(this.vehicleData[selection].IS_DLC == true)
      {
         var _loc2_ = targetMc.planeImages.dlcPackTF;
         _loc2_._visible = false;
         _loc2_.autoSize = "center";
         _loc2_.multiline = true;
         _loc2_.wordWrap = true;
         if(this.vehicleData[selection].TXD == "ELT_DLC_BUSINESS")
         {
            this.set_localised_text(-1,_loc2_,"WEB_BUSINESSPACK",true);
         }
         if(this.vehicleData[selection].TXD == "ELT_DLC_PILOT")
         {
            this.set_localised_text(-1,_loc2_,"WEB_PILOTPACK",true);
         }
         _loc2_._visible = true;
      }
   }
   function POPULATE_TEXT(pageName, searchArgs, newPage)
   {
      this.CONTENT._y = 0;
      clearInterval(this.intervalId);
      this.defaultButtonOnColour = 0;
      this.defaultButtonOffColour = 0;
      var _loc17_ = pageName;
      if(_loc17_.substring(0,15) == "PLANE_D_DETAILS")
      {
         _loc17_ = "PLANE_D_DETAILS";
      }
      if(this.TXDarray.length > 0)
      {
         var _loc4_ = 0;
         while(_loc4_ < this.TXDarray.length)
         {
            com.rockstargames.ui.game.GameInterface.call("REQUEST_TXD_AND_ADD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"WEB_BROWSER",this.TXDarray[_loc4_],"loadedCheck");
            _loc4_ = _loc4_ + 1;
         }
      }
      switch(_loc17_)
      {
         case "PLANE_D_DETAILS1":
            this.browser.GO_TO_WEBPAGE("PAGE1");
            break;
         case "PAGE1":
            this.prevColourNumber = undefined;
            this.mcScope = this.CONTENT.PAGE1;
            this.defaultButtonOnColour = 16777215;
            this.defaultButtonOffColour = 16777215;
            this.dataTextScope = new Array();
            this.set_localised_text(1,this.mcScope.header,"ELT_PG1_HEADER");
            this.set_localised_text(2,this.mcScope.body1,"ELT_PG1_BODY1");
            this.set_localised_text(3,this.mcScope.body2,"ELT_PG1_BODY2");
            this.set_localised_text(4,this.mcScope.body3,"ELT_PG1_BODY3");
            this.set_localised_text(5,this.mcScope.inStock,"ELT_PG1_INSTOCK");
            this.set_localised_text(6,this.mcScope.footer.footerTF,"ELT_FOOTER");
            var _loc16_ = 1185;
            var _loc5_ = 254;
            var _loc6_ = 602;
            var _loc3_ = 10;
            var _loc19_ = undefined;
            var _loc10_ = undefined;
            if(newPage == false)
            {
               _loc4_ = 0;
               while(_loc4_ < this.displayArray.length)
               {
                  var _loc2_ = this.displayArray[_loc4_];
                  _loc19_ = "plane_" + _loc2_;
                  if(this.vehicleData[_loc2_].PRICE != -1)
                  {
                     if(this.mcScope[_loc19_] != undefined)
                     {
                        this.mcScope[_loc19_].removeMovieClip();
                     }
                     _loc10_ = this.mcScope.attachMovie("plane_box",_loc19_,this.mcScope.getNextHighestDepth(),{_x:_loc5_,_y:_loc6_,_width:378,_height:182,_alpha:0});
                     var _loc7_ = this.vehicleData[_loc2_].VEHICLE;
                     this.displayVehicleImage(_loc19_,_loc2_,_loc10_);
                     this.set_localised_text(_loc3_,this.mcScope[_loc19_].btnTxt,_loc7_,true);
                     this.dataTextScope[_loc3_] = undefined;
                     if(typeof this.vehicleData[_loc2_].PRICE == "string")
                     {
                        this.mcScope[_loc19_].planeImages.outOfStock._alpha = 0;
                        this.set_price_text(this.mcScope[_loc19_].priceTF,this.vehicleData[_loc2_].PRICE);
                        this.dataTextScope[_loc3_] = this.mcScope[_loc19_].btnTxt;
                     }
                     else if(this.vehicleData[_loc2_].PRICE == 0)
                     {
                        this.mcScope[_loc19_].planeImages.outOfStock.outOfStockTF.autoSize = "center";
                        this.mcScope[_loc19_].planeImages.outOfStock.outOfStockTF.multiline = true;
                        this.mcScope[_loc19_].planeImages.outOfStock.outOfStockTF.wordWrap = true;
                        this.set_localised_text(-1,this.mcScope[_loc19_].planeImages.outOfStock.outOfStockTF,"WEB_OUTOFSTOCK",false);
                        this.mcScope[_loc19_].planeImages.outOfStock.outOfStockTF._y = 98 - this.mcScope[_loc19_].planeImages.outOfStock.outOfStockTF._height / 2;
                        this.mcScope[_loc19_].planeImages.outOfStock._alpha = 100;
                        this.mcScope[_loc19_].priceTF.text = "";
                     }
                     else if(this.vehicleData[_loc2_].PRICE > 0)
                     {
                        if(this.vehicleData[_loc2_].LIVERY_PRICE2 != undefined)
                        {
                           var _loc8_ = undefined;
                           var _loc9_ = undefined;
                           this.set_price_text(this.mcScope[_loc19_].priceTF,this.vehicleData[_loc2_].PRICE);
                           _loc8_ = this.mcScope[_loc19_].priceTF.text;
                           this.set_price_text(this.mcScope[_loc19_].priceTF,this.vehicleData[_loc2_].LIVERY_PRICE2);
                           _loc9_ = this.mcScope[_loc19_].priceTF.text;
                           this.mcScope[_loc19_].priceTF.text = _loc8_ + " - " + _loc9_;
                        }
                        else
                        {
                           this.set_price_text(this.mcScope[_loc19_].priceTF,this.vehicleData[_loc2_].PRICE);
                        }
                        this.mcScope[_loc19_].planeImages.outOfStock._alpha = 0;
                        this.dataTextScope[_loc3_] = this.mcScope[_loc19_].btnTxt;
                     }
                     if(this.isMP == true)
                     {
                        if(this.vehicleData[_loc2_].RANK > this.currentRank)
                        {
                           this.mcScope[_loc19_].MPrank.rankTF.text = this.vehicleData[_loc2_].RANK;
                           this.mcScope[_loc19_].MPrank._alpha = 100;
                           this.dataTextScope[_loc3_] = undefined;
                        }
                        else
                        {
                           this.mcScope[_loc19_].MPrank._alpha = 0;
                        }
                        if(this.vehicleData[_loc2_].SEATS != "")
                        {
                           this.mcScope[_loc19_].MPseats.seatsTF.text = this.vehicleData[_loc2_].SEATS;
                           this.mcScope[_loc19_].MPseats._alpha = 100;
                        }
                        else
                        {
                           this.mcScope[_loc19_].MPseats._alpha = 0;
                        }
                     }
                     this.mcScope[_loc19_]._alpha = 100;
                     _loc3_ = _loc3_ + 1;
                     _loc16_ = _loc6_ + 196;
                     _loc5_ += 394;
                     if(_loc5_ > 648)
                     {
                        _loc5_ = 254;
                        _loc6_ += 196;
                     }
                  }
                  _loc4_ = _loc4_ + 1;
               }
               if(_loc10_._x == 254)
               {
                  _loc10_._x = 464;
               }
            }
            this.mcScope.footer._y = _loc16_;
            this.CONTENT.BOUNDING_BOX._height = _loc16_ + 80;
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            break;
         case "PLANE_D_DETAILS":
            this.mcScope = this.CONTENT.PLANE_D_DETAILS;
            if(this.vehicleData[this.planeNumber].LIVERY1 != undefined)
            {
               this.mcScope.gotoAndStop("LIVERY");
            }
            else if(this.vehicleData[this.planeNumber].NOCOLOUR == true)
            {
               this.mcScope.gotoAndStop("NOCOLOURS");
            }
            var _loc18_ = pageName.split("PLANE_D_DETAILS");
            this.planeNumber = parseInt(_loc18_[1]);
            _loc19_ = "mainImage_" + this.planeNumber;
            this.displayVehicleImage(_loc19_,this.planeNumber,this.CONTENT);
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_ELITASTRAVEL_COM.btnTxt;
            this.set_localised_text(1,this.mcScope.footer,"ELT_FOOTER");
            this.set_localised_text(5,this.mcScope.body,"ELT_" + this.vehicleData[this.planeNumber].VEHICLE);
            this.set_localised_text(6,this.mcScope.nameTF,this.vehicleData[this.planeNumber].VEHICLE);
            this.set_price_text(this.mcScope.priceTF,this.vehicleData[this.planeNumber].PRICE);
            if(this.vehicleData[this.planeNumber].LIVERY_PRICE2 > 0)
            {
               if(this.mcScope.livery2PriceTF != undefined)
               {
                  this.set_price_text(this.mcScope.livery2PriceTF,this.vehicleData[this.planeNumber].LIVERY_PRICE2);
               }
            }
            this.dataTextScope[7] = this.mcScope.PURCHASEPLANE_1.btnTxt;
            this.dataTextScope[8] = this.mcScope.PURCHASEPLANE_2.btnTxt;
            this.set_localised_text(7,this.mcScope.PURCHASEPLANE_1.btnTxt,"ELT_BUYNOW");
            this.set_localised_text(8,this.mcScope.PURCHASEPLANE_2.btnTxt,"ELT_BUYNOW");
            if(this.vehicleData[this.planeNumber].LIVERY1 != undefined)
            {
               this.set_localised_text(9,this.mcScope.colour_1.btnTxt,this.vehicleData[this.planeNumber].LIVERY1);
               this.set_localised_text(10,this.mcScope.colour_2.btnTxt,this.vehicleData[this.planeNumber].LIVERY2);
            }
            if(this.isMP == true)
            {
               if(this.vehicleData[this.planeNumber].SEATS != "")
               {
                  this.mcScope.MPseats.seatsTF.text = this.vehicleData[this.planeNumber].SEATS;
                  this.mcScope.MPseats._alpha = 100;
               }
               else
               {
                  this.mcScope.MPseats._alpha = 0;
               }
            }
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            this.CONTENT.BOUNDING_BOX._height = 627;
            break;
         case "PURCHASEPLANE":
            this.mcScope = this.CONTENT.PURCHASEPLANE;
            this.mcScope.nameTF._alpha = 0;
            this.mcScope.body1._alpha = 0;
            this.mcScope.soldTF._alpha = 0;
            _loc19_ = "mainImage_" + this.planeNumber;
            this.displayVehicleImage(_loc19_,this.planeNumber,this.CONTENT);
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_ELITASTRAVEL_COM.btnTxt;
            this.set_localised_text(3,this.mcScope.nameTF,this.vehicleData[this.planeNumber].VEHICLE);
            this.set_localised_text(4,this.mcScope.body1,"ELT_PURCHASED");
            this.set_localised_text(5,this.mcScope.soldTF,"WEB_SOLD");
            if(this.planeNumber == this.PLANE_SWIFT)
            {
               if(this.colourNumber == 1)
               {
                  this.set_price_text(this.mcScope.priceTF,this.vehicleData[this.planeNumber].PRICE);
               }
               else
               {
                  this.set_price_text(this.mcScope.priceTF,this.vehicleData[this.planeNumber].LIVERY_PRICE2);
               }
            }
            else
            {
               this.set_price_text(this.mcScope.priceTF,this.vehicleData[this.planeNumber].PRICE);
            }
            if(this.isMP == true)
            {
               if(this.vehicleData[this.planeNumber].SEATS != "")
               {
                  this.mcScope.MPseats.seatsTF.text = this.vehicleData[this.planeNumber].SEATS;
                  this.mcScope.MPseats._alpha = 100;
               }
               else
               {
                  this.mcScope.MPseats._alpha = 0;
               }
            }
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            this.CONTENT.BOUNDING_BOX._height = 627;
            this.intervalId = setInterval(this,"displayPurchasedText",1500);
            break;
         case "PURCHASE_D_FAILED":
            this.mcScope = this.CONTENT.PURCHASE_D_FAILED;
            _loc19_ = "mainImage_" + this.planeNumber;
            this.displayVehicleImage(_loc19_,this.planeNumber,this.CONTENT);
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_ELITASTRAVEL_COM.btnTxt;
            this.set_localised_text(2,this.mcScope.body,"ELT_" + this.vehicleData[this.planeNumber].VEHICLE);
            this.set_localised_text(3,this.mcScope.nameTF,this.vehicleData[this.planeNumber].VEHICLE);
            this.set_localised_text(4,this.mcScope.body1,"ELT_FAILED");
            this.set_localised_text(5,this.mcScope.soldTF,"WEB_NO_FUNDS");
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            this.CONTENT.BOUNDING_BOX._height = 627;
            break;
         case "PURCHASE_D_ERROR":
            this.mcScope = this.CONTENT.PURCHASE_D_ERROR;
            _loc19_ = "mainImage_" + this.planeNumber;
            this.displayVehicleImage(_loc19_,this.planeNumber,this.CONTENT);
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_ELITASTRAVEL_COM.btnTxt;
            this.dataTextScope[1] = this.mcScope.soldTF;
            if(this.dataProviderUI[1][0] != undefined)
            {
               this.mcScope.soldTF.text = this.dataProviderUI[1][0];
            }
            this.mcScope.body.multiline = true;
            this.mcScope.body.wordWrap = true;
            this.dataTextScope[2] = this.mcScope.body;
            if(this.dataProviderUI[2][0] != undefined)
            {
               this.mcScope.body.text = this.dataProviderUI[2][0];
            }
            this.set_localised_text(3,this.mcScope.nameTF,this.vehicleData[this.planeNumber].VEHICLE);
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            this.CONTENT.BOUNDING_BOX._height = 627;
            break;
         case "PURCHASE_D_CONFIRM":
            this.mcScope = this.CONTENT.PURCHASE_D_CONFIRM;
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_ELITASTRAVEL_COM.btnTxt;
            this.mcScope.body.multiline = true;
            this.mcScope.body.wordWrap = true;
            this.dataTextScope[1] = this.mcScope.body;
            if(this.dataProviderUI[1] != undefined)
            {
               this.dataTextScope[1].htmlText = this.dataProviderUI[1];
            }
            this.dataTextScope[2] = this.mcScope.WWW_ELITASTRAVEL_COM_S_PURCHASEPLANE.btnTxt;
            if(this.dataProviderUI[2] != undefined)
            {
               this.dataTextScope[2].htmlText = this.dataProviderUI[2];
            }
            this.dataTextScope[3] = this.mcScope.WWW_ELITASTRAVEL_COM_S_PURCHASE_D_FAILED.btnTxt;
            if(this.dataProviderUI[3] != undefined)
            {
               this.dataTextScope[3].htmlText = this.dataProviderUI[3];
            }
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            this.CONTENT.BOUNDING_BOX._height = 627;
      }
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"ELT_TOOLBAR",this.CONTENT.localisationTF);
      this.browser.SET_TITLEBAR_TEXT(this.CONTENT.localisationTF.text,14474460);
   }
   function displayPurchasedText()
   {
      clearInterval(this.intervalId);
      this.mcScope.nameTF._alpha = 100;
      this.mcScope.body1._alpha = 100;
      this.mcScope.soldTF._alpha = 100;
      this.mcScope.white_flash.gotoAndPlay(2);
   }
   function set_localised_text(slotID, TF, TextLabel, setDataSlot, IS_HTML)
   {
      if(TF != undefined)
      {
         this.dataTextScope[slotID] = TF;
         IS_HTML = TF.html;
         com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,TextLabel,TF,IS_HTML);
      }
   }
   function set_price_text(TF, price)
   {
      TF._visible = false;
      TF._height = 26.7;
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
         if(_loc5_ != undefined)
         {
            TF.text = "$" + _loc5_;
         }
      }
      if(this.mcScope == this.CONTENT.PAGE1)
      {
         if(TF._height > 30)
         {
            TF._y = 193.4;
         }
         else
         {
            TF._y = 206.75;
         }
      }
      TF._visible = true;
   }
   function displayVehicleImage(mcName, vehicleIndex, targetMc)
   {
      if(this.vehicleData[vehicleIndex].TXD == undefined)
      {
         targetMc.planeImages.gotoAndStop(this.vehicleData[vehicleIndex].VEHICLE);
      }
      else
      {
         targetMc.planeImages.gotoAndStop(1);
         if(this.hasTxdLoaded(this.vehicleData[vehicleIndex].TXD) == true)
         {
            this.addImageToTextfield(this.vehicleData[vehicleIndex].TXD,mcName);
         }
         else
         {
            com.rockstargames.ui.game.GameInterface.call("REQUEST_TXD_AND_ADD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"WEB_BROWSER",this.vehicleData[vehicleIndex].TXD,mcName,true);
         }
      }
      this.labelAsDlcPack(targetMc,vehicleIndex);
   }
   function TXD_HAS_LOADED(textureDict, success, uniqueID)
   {
      if(success == true)
      {
         if(this.hasTxdLoaded(textureDict) == false)
         {
            this.TXDarray.push(textureDict);
         }
         if(uniqueID != "loadedCheck")
         {
            this.addImageToTextfield(textureDict,uniqueID);
         }
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
         _loc3_ = this.CONTENT;
      }
      else
      {
         _loc3_ = this.mcScope[mcName];
      }
      _loc3_.planeImages.vehicleTF.htmlText = "<img src=\'img://" + textureDict + "/" + _loc5_ + "\' vspace=\'0\' hspace=\'0\' width=\'509\' height=\'245\'/>";
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
