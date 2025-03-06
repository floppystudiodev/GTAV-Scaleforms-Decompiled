class com.rockstargames.gtav.web.WWW_DOCKTEASE_COM extends com.rockstargames.ui.core.BaseWebsite
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
   var intervalId;
   var mcScope;
   var dataTextScope;
   var dataProviderUI;
   var currentRank = 0;
   var isMP = false;
   function WWW_DOCKTEASE_COM()
   {
      super();
      this._name = "WWW_DOCKTEASE_COM";
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
      this.PAGE_NAMES[12] = "PURCHASE";
      this.PAGE_NAMES[13] = "PURCHASE_D_FAILED";
      this.PAGE_NAMES[14] = "PURCHASE_D_ERROR";
      this.PAGE_NAMES[15] = "PURCHASE_D_CONFIRM";
      this.CAN_STORE_PAGE = new Array();
      this.CAN_STORE_PAGE[1] = true;
      this.CAN_STORE_PAGE[2] = false;
      this.CAN_STORE_PAGE[3] = true;
      this.CAN_STORE_PAGE[4] = true;
      this.CAN_STORE_PAGE[5] = true;
      this.CAN_STORE_PAGE[9] = true;
      this.CAN_STORE_PAGE[10] = true;
      this.CAN_STORE_PAGE[11] = false;
      this.CAN_STORE_PAGE[12] = false;
      this.CAN_STORE_PAGE[13] = false;
      this.CAN_STORE_PAGE[14] = false;
      this.CAN_STORE_PAGE[15] = false;
      this.CAN_STORE_PAGE[16] = false;
      this.defaultButtonOnColour = 16777215;
      this.defaultButtonOffColour = 16777215;
      this.vehicleData = new Array();
      this.vehicleData.push(undefined);
      this.vehicleData.push({VEHICLE:"MARQUIS",PAGEID:3,PRICE:-1,RANK:-1,SEATS:"04",IS_DLC:false});
      this.vehicleData.push({VEHICLE:"JETMAX",PAGEID:4,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({VEHICLE:"SPEEDER",PAGEID:5,PRICE:-1,RANK:-1,SEATS:"04",IS_DLC:true});
      this.vehicleData.push({VEHICLE:"SQUALO",PAGEID:6,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({VEHICLE:"SUNTRAP",PAGEID:7,PRICE:-1,RANK:-1,SEATS:"04",IS_DLC:false});
      this.vehicleData.push({VEHICLE:"TROPIC",PAGEID:8,PRICE:-1,RANK:-1,SEATS:"04",IS_DLC:false});
      this.vehicleData.push({VEHICLE:"SEASHARK",PAGEID:9,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({VEHICLE:"SUB2",PAGEID:10,PRICE:-1,RANK:-1,SEATS:"01",IS_DLC:true});
      this.displayArray = new Array();
      if(this.isMP == false)
      {
         this.displayArray = [1,2,3,4,5,6,7,8];
      }
      else
      {
         this.displayArray = [3,1,2,4,5,6,7,8];
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
      var _loc2_ = new Array();
      _loc2_ = AnchorLink.split("_");
      this.itemNumber = parseInt(_loc2_[1]);
      this.browser.GO_TO_WEBPAGE("WWW_DOCKTEASE_COM_S_DETAILS" + this.itemNumber);
   }
   function labelAsDlcPack(targetMc, selection)
   {
      if(!this.isMP)
      {
         return undefined;
      }
      var _loc2_ = targetMc.itemImages.dlcPackTF;
      _loc2_.text = "";
      _loc2_._visible = false;
      _loc2_.autoSize = "center";
      _loc2_.multiline = true;
      _loc2_.wordWrap = true;
      if(this.vehicleData[selection].IS_DLC == true)
      {
         if(selection == 3)
         {
            this.set_localised_text(-1,_loc2_,"SSS_BEACHBUM",true);
         }
         _loc2_._visible = true;
      }
   }
   function POPULATE_TEXT(pageName, searchArgs, newPage)
   {
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
      com.rockstargames.ui.utils.Debug.log("WWW_DOCKTEASE_COM::POPULATE_TEXT: " + arguments);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
      this.CONTENT._y = 0;
      switch(pageName)
      {
         case "PAGE1":
            clearInterval(this.intervalId);
            this.mcScope = this.CONTENT.PAGE1;
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_DOCKTEASE_COM.btnTxt;
            var _loc14_ = 1560;
            var _loc7_ = 648;
            var _loc9_ = 610;
            var _loc3_ = undefined;
            var _loc13_ = undefined;
            var _loc5_ = 8;
            if(newPage == false)
            {
               var _loc6_ = 0;
               while(_loc6_ < this.displayArray.length)
               {
                  var _loc4_ = this.displayArray[_loc6_];
                  _loc3_ = "item_" + _loc4_;
                  if(this.vehicleData[_loc4_].PRICE != -1)
                  {
                     if(this.mcScope[_loc3_] != undefined)
                     {
                        this.mcScope[_loc3_].removeMovieClip();
                     }
                     _loc13_ = this.mcScope.attachMovie("car_box",_loc3_,this.mcScope.getNextHighestDepth(),{_x:_loc7_,_y:_loc9_,_alpha:0});
                     var _loc8_ = this.vehicleData[_loc4_].VEHICLE;
                     this.mcScope[_loc3_].itemImages.gotoAndStop(_loc8_);
                     this.set_localised_text(_loc5_,this.mcScope[_loc3_].btnTxt,_loc8_,true);
                     this.dataTextScope[_loc5_] = undefined;
                     if(typeof this.vehicleData[_loc4_].PRICE == "string")
                     {
                        this.mcScope[_loc3_].itemImages.outOfStock._alpha = 0;
                        this.set_price_text(this.mcScope[_loc3_].priceTF,this.vehicleData[_loc4_].PRICE);
                        this.dataTextScope[_loc5_] = this.mcScope[_loc3_].btnTxt;
                     }
                     else if(this.vehicleData[_loc4_].PRICE == 0)
                     {
                        this.mcScope[_loc3_].itemImages.outOfStock._alpha = 100;
                        this.set_localised_text(-1,this.mcScope[_loc3_].itemImages.outOfStock.outOfStockTF,"WEB_OUTOFSTOCK",false);
                        this.mcScope[_loc3_].priceTF.text = "";
                     }
                     else if(this.vehicleData[_loc4_].PRICE > 0)
                     {
                        this.mcScope[_loc3_].itemImages.outOfStock._alpha = 0;
                        this.set_price_text(this.mcScope[_loc3_].priceTF,this.vehicleData[_loc4_].PRICE);
                        this.dataTextScope[_loc5_] = this.mcScope[_loc3_].btnTxt;
                     }
                     this.labelAsDlcPack(this.mcScope[_loc3_],_loc4_);
                     if(this.isMP == true)
                     {
                        if(this.vehicleData[_loc4_].RANK > this.currentRank)
                        {
                           this.mcScope[_loc3_].MPrank.rankTF.text = this.vehicleData[_loc4_].RANK;
                           this.mcScope[_loc3_].MPrank._alpha = 100;
                           this.dataTextScope[_loc5_] = undefined;
                        }
                        else
                        {
                           this.mcScope[_loc3_].MPrank._alpha = 0;
                        }
                        if(this.vehicleData[_loc4_].SEATS != "")
                        {
                           this.mcScope[_loc3_].MPseats.seatsTF.text = this.vehicleData[_loc4_].SEATS;
                           this.mcScope[_loc3_].MPseats._alpha = 100;
                        }
                        else
                        {
                           this.mcScope[_loc3_].MPseats._alpha = 0;
                        }
                     }
                     this.mcScope[_loc3_]._alpha = 100;
                     _loc5_ = _loc5_ + 1;
                     _loc14_ = _loc9_;
                     _loc7_ += 394;
                     if(_loc7_ > 648)
                     {
                        _loc7_ = 254;
                        _loc9_ += 238;
                     }
                  }
                  _loc6_ = _loc6_ + 1;
               }
               if(_loc13_._x == 254)
               {
                  _loc13_._x = 456;
               }
            }
            this.mcScope.footer._y = _loc14_ + 238;
            var _loc16_ = undefined;
            _loc16_ = this.mcScope.footer._y + 110;
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            this.scan_and_set_localised_text(this.mcScope);
            this.set_localised_text(-1,this.mcScope.footer.DOCKTEASE_FOOTER,"DOCKTEASE_FOOTER");
            this.CONTENT.BOUNDING_BOX._height = _loc16_;
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"BOATS_TOOLBAR",this.CONTENT.localisationTF);
            this.browser.SET_TITLEBAR_TEXT(this.CONTENT.localisationTF.text,14474460);
            break;
         case "DETAILS1":
         case "DETAILS2":
         case "DETAILS3":
         case "DETAILS4":
         case "DETAILS5":
         case "DETAILS6":
         case "DETAILS7":
         case "DETAILS8":
         case "DETAILS9":
         case "DETAILS10":
            clearInterval(this.intervalId);
            this.mcScope = this.CONTENT.DETAILS;
            var _loc15_ = pageName.split("DETAILS");
            this.itemNumber = parseInt(_loc15_[1]);
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_DOCKTEASE_COM.btnTxt;
            this.set_localised_text(5,this.mcScope.body,"BOATS_" + this.vehicleData[this.itemNumber].VEHICLE);
            this.set_localised_text(6,this.mcScope.nameTF,this.vehicleData[this.itemNumber].VEHICLE);
            this.set_price_text(this.mcScope.priceTF,this.vehicleData[this.itemNumber].PRICE);
            this.set_localised_text(8,this.mcScope.WWW_DOCKTEASE_COM_S_PURCHASE.btnTxt,"BOATS_BUYNOW");
            this.mcScope.itemImages.gotoAndStop(this.vehicleData[this.itemNumber].VEHICLE);
            this.labelAsDlcPack(this.mcScope,this.itemNumber);
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            this.scan_and_set_localised_text(this.mcScope);
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
            this.CONTENT.BOUNDING_BOX._height = 720;
            break;
         case "PURCHASE":
            clearInterval(this.intervalId);
            this.mcScope = this.CONTENT.PURCHASE;
            this.mcScope.nameTF._alpha = 0;
            this.mcScope.body1._alpha = 0;
            this.mcScope.soldTF._alpha = 0;
            this.mcScope.sold_banner._alpha = 0;
            this.mcScope.DOCKTEASE_DELIVER._alpha = 0;
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_DOCKTEASE_COM.btnTxt;
            this.set_localised_text(5,this.mcScope.body1,"BOATS_PURCHASED");
            this.set_localised_text(6,this.mcScope.nameTF,this.vehicleData[this.itemNumber].VEHICLE);
            this.set_localised_text(7,this.mcScope.soldTF,"WEB_SOLD");
            this.mcScope.itemImages.gotoAndStop(this.vehicleData[this.itemNumber].VEHICLE);
            this.labelAsDlcPack(this.mcScope,this.itemNumber);
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            this.scan_and_set_localised_text(this.mcScope);
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
            this.CONTENT.BOUNDING_BOX._height = 720;
            this.intervalId = setInterval(this,"displayPurchasedText",1500);
            break;
         case "PURCHASE_D_FAILED":
            clearInterval(this.intervalId);
            this.mcScope = this.CONTENT.PURCHASE_D_FAILED;
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_DOCKTEASE_COM.btnTxt;
            this.set_localised_text(5,this.mcScope.body1,"BOATS_FAILED");
            this.set_localised_text(6,this.mcScope.nameTF,this.vehicleData[this.itemNumber].VEHICLE);
            this.set_localised_text(7,this.mcScope.soldTF,"WEB_SORRY");
            this.mcScope.itemImages.gotoAndStop(this.vehicleData[this.itemNumber].VEHICLE);
            this.labelAsDlcPack(this.mcScope,this.itemNumber);
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
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
            this.scan_and_set_localised_text(this.mcScope);
            this.CONTENT.BOUNDING_BOX._height = 720;
            break;
         case "PURCHASE_D_ERROR":
            this.mcScope = this.CONTENT.PURCHASE_D_ERROR;
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_DOCKTEASE_COM.btnTxt;
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
            this.mcScope.itemImages.gotoAndStop(this.vehicleData[this.itemNumber].VEHICLE);
            this.labelAsDlcPack(this.mcScope,this.itemNumber);
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            this.scan_and_set_localised_text(this.mcScope);
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
            this.CONTENT.BOUNDING_BOX._height = 720;
            break;
         case "PURCHASE_D_CONFIRM":
            this.mcScope = this.CONTENT.PURCHASE_D_CONFIRM;
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_DOCKTEASE_COM.btnTxt;
            this.mcScope.body.multiline = true;
            this.mcScope.body.wordWrap = true;
            this.dataTextScope[1] = this.mcScope.body;
            if(this.dataProviderUI[1] != undefined)
            {
               this.dataTextScope[1].htmlText = this.dataProviderUI[1];
            }
            this.dataTextScope[2] = this.mcScope.WWW_DOCKTEASE_COM_S_PURCHASE.btnTxt;
            if(this.dataProviderUI[2] != undefined)
            {
               this.dataTextScope[2].htmlText = this.dataProviderUI[2];
            }
            this.dataTextScope[3] = this.mcScope.WWW_DOCKTEASE_COM_S_PURCHASE_D_FAILED.btnTxt;
            if(this.dataProviderUI[3] != undefined)
            {
               this.dataTextScope[3].htmlText = this.dataProviderUI[3];
            }
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            this.CONTENT.BOUNDING_BOX._height = 720;
      }
   }
   function displayPurchasedText()
   {
      clearInterval(this.intervalId);
      this.mcScope.nameTF._alpha = 100;
      this.mcScope.body1._alpha = 100;
      this.mcScope.soldTF._alpha = 100;
      this.mcScope.sold_banner._alpha = 100;
      this.mcScope.DOCKTEASE_DELIVER._alpha = 100;
      this.mcScope.white_flash.gotoAndPlay(2);
   }
   function scan_and_set_localised_text(scope)
   {
      for(var _loc4_ in scope)
      {
         var _loc1_ = scope[_loc4_]._name;
         if(_loc1_.substr(0,10) == "DOCKTEASE_")
         {
            var _loc2_ = scope[_loc4_];
            _loc2_.html = true;
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,_loc1_,_loc2_,true);
         }
      }
   }
   function set_localised_text(slotID, TF, TextLabel, setDataSlot, isHtml)
   {
      this.dataTextScope[slotID] = TF;
      isHtml = TF.html;
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,TextLabel,TF,isHtml);
   }
   function set_price_text(TF, price)
   {
      TF.text = "";
      if(Number(price) > 0 || typeof price == "string")
      {
         TF._visible = false;
         TF._height = 25;
         if(typeof price == "string")
         {
            TF.multiline = true;
            TF.wordWrap = true;
            TF.autoSize = "right";
            TF.htmlText = price;
         }
         else
         {
            var _loc6_ = undefined;
            var _loc4_ = price.toString();
            var _loc8_ = _loc4_.length;
            if(_loc8_ > 3)
            {
               var _loc7_ = "";
               var _loc3_ = _loc4_.slice(0,-3);
               var _loc9_ = "," + _loc4_.slice(-3);
               if(_loc3_.length > 3)
               {
                  _loc7_ = _loc3_.slice(0,-3) + ",";
                  _loc3_ = _loc3_.slice(-3);
               }
               _loc6_ = _loc7_ + _loc3_ + _loc9_;
            }
            else
            {
               _loc6_ = _loc4_;
            }
            TF.text = "$" + _loc6_;
         }
         if(this.mcScope == this.CONTENT.PAGE1)
         {
            if(TF._height > 25)
            {
               TF._y = 227 - TF._height;
            }
            else
            {
               TF._y = 193;
            }
         }
         else if(TF._height > 30)
         {
            TF._y = 534.5;
         }
         else
         {
            TF._y = 544.5;
         }
         TF._visible = true;
      }
   }
}
