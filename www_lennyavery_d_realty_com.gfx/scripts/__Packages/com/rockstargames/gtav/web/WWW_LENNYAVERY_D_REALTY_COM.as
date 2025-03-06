class com.rockstargames.gtav.web.WWW_LENNYAVERY_D_REALTY_COM extends com.rockstargames.ui.core.BaseWebsite
{
   var PAGE_NAMES;
   var CAN_STORE_PAGE;
   var browser;
   var data;
   var TXDstring;
   var descriptionArray;
   var pinNumber;
   var pageName;
   var propertyMC;
   var mcScope;
   var pinContainer;
   var CONTENT;
   var defaultButtonOnColour;
   var defaultButtonOffColour;
   var dataTextScope;
   var isSP = false;
   var firstRun = true;
   function WWW_LENNYAVERY_D_REALTY_COM()
   {
      super();
      _global.gfxExtensions = true;
      this._name = "WWW_LENNYAVERY_D_REALTY_COM";
      this.IS_SITE_DYNAMIC = 0;
      _level0.TIMELINE.DebugTextContent = true;
      this.PAGE_NAMES = new Array();
      this.PAGE_NAMES[1] = "PAGE1";
      this.PAGE_NAMES[2] = "LOS_D_SANTOS";
      this.PAGE_NAMES[3] = "";
      this.PAGE_NAMES[4] = "";
      this.PAGE_NAMES[5] = "GETDIRECTIONS";
      this.PAGE_NAMES[6] = "PROPERTY_D_DETAILS1";
      this.PAGE_NAMES[7] = "PROPERTY_D_DETAILS2";
      this.PAGE_NAMES[8] = "PROPERTY_D_DETAILS3";
      this.PAGE_NAMES[9] = "PROPERTY_D_DETAILS4";
      this.PAGE_NAMES[10] = "PROPERTY_D_DETAILS5";
      this.PAGE_NAMES[11] = "PROPERTY_D_DETAILS6";
      this.PAGE_NAMES[12] = "PROPERTY_D_DETAILS7";
      this.PAGE_NAMES[13] = "PROPERTY_D_DETAILS8";
      this.PAGE_NAMES[14] = "PROPERTY_D_DETAILS9";
      this.PAGE_NAMES[15] = "PROPERTY_D_DETAILS10";
      this.PAGE_NAMES[16] = "PROPERTY_D_DETAILS11";
      this.PAGE_NAMES[17] = "PROPERTY_D_DETAILS12";
      this.PAGE_NAMES[18] = "PROPERTY_D_DETAILS13";
      this.PAGE_NAMES[19] = "PROPERTY_D_DETAILS14";
      this.PAGE_NAMES[20] = "PROPERTY_D_DETAILS15";
      this.CAN_STORE_PAGE = new Array();
      this.CAN_STORE_PAGE[1] = true;
      this.CAN_STORE_PAGE[2] = true;
      this.CAN_STORE_PAGE[3] = false;
      this.CAN_STORE_PAGE[4] = false;
      this.CAN_STORE_PAGE[5] = true;
      this.CAN_STORE_PAGE[6] = true;
      this.CAN_STORE_PAGE[7] = true;
      this.CAN_STORE_PAGE[8] = true;
      this.CAN_STORE_PAGE[9] = true;
      this.CAN_STORE_PAGE[10] = true;
      this.CAN_STORE_PAGE[11] = true;
      this.CAN_STORE_PAGE[12] = true;
      this.CAN_STORE_PAGE[13] = true;
      this.CAN_STORE_PAGE[14] = true;
      this.CAN_STORE_PAGE[15] = true;
      this.CAN_STORE_PAGE[16] = true;
      this.CAN_STORE_PAGE[17] = true;
      this.CAN_STORE_PAGE[18] = true;
      this.CAN_STORE_PAGE[19] = true;
      this.CAN_STORE_PAGE[20] = true;
      this.browser = _level0.TIMELINE;
      this.data = new Array();
      this.TXDstring = undefined;
   }
   function READY()
   {
   }
   function goToAnchor(AnchorLink)
   {
      this.descriptionArray = new Array();
      var _loc2_ = new Array();
      _loc2_ = AnchorLink.split("pin");
      this.pinNumber = parseInt(_loc2_[1]);
      this.descriptionArray = this.data[this.pinNumber];
      this.browser.GO_TO_WEBPAGE("PROPERTY_D_DETAILS" + (this.pinNumber + 1));
   }
   function TXD_HAS_LOADED(textureDict, success, uniqueID)
   {
      if(success == true)
      {
         if(this.pageName == "PROPERTY_D_DETAILS")
         {
            if(this.propertyMC != undefined)
            {
               this.propertyMC.removeMovieClip();
            }
            this.propertyMC = this.mcScope.attachMovie("propertyTextureMC","propertyMC",this.mcScope.getNextHighestDepth(),{_x:277,_y:251});
            this.propertyMC.propertyTF.htmlText = "<img src=\'img://" + textureDict + "/" + textureDict + "\' vspace=\'0\' hspace=\'0\' width=\'256\' height=\'128\'/>";
         }
         else
         {
            this.CLEANUP();
         }
      }
   }
   function onLoadError(target_mc)
   {
   }
   function POPULATE_TEXT(_pageName)
   {
      this.createContentLOS_D_SANTOS();
      this.pageName = _pageName;
      if(this.pinContainer != undefined)
      {
         this.pinContainer.removeMovieClip();
      }
      this.CLEANUP();
      switch(this.pageName)
      {
         case "PAGE1":
            this.mcScope = this.CONTENT.PAGE1;
            this.defaultButtonOnColour = 16777215;
            this.defaultButtonOffColour = 16777215;
            this.dataTextScope = new Array();
            if(this.browser.player != 1)
            {
               com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.header,"LAR_PG1_HEADER",0,true);
               com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.body,"LAR_PG1_BODY",0,true);
               this.dataTextScope[0] = this.mcScope.LOS_D_SANTOS.btnTxt;
               com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.LOS_D_SANTOS.btnTxt,"LAR_PG1_FINDPROPERTIES",0,false);
               this.mcScope.LOS_D_SANTOS._alpha = 100;
               this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            }
            else
            {
               com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.maintenanceTF,"WEB_MAINTENANCE",0,false);
            }
            this.CONTENT.BOUNDING_BOX._height = 627;
            break;
         case "LOS_D_SANTOS":
            this.mcScope = this.CONTENT.LOS_D_SANTOS;
            this.defaultButtonOnColour = 16777215;
            this.defaultButtonOffColour = 16777215;
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_LENNYAVERY_D_REALTY_COM.btnTxt;
            this.pinContainer = this.mcScope.createEmptyMovieClip("pinContainer",this.mcScope.getNextHighestDepth());
            this.pinContainer._x = this.mcScope.mapCenter._x;
            this.pinContainer._y = this.mcScope.mapCenter._y;
            var _loc6_ = 500 / this.mcScope.mapCenter._width;
            var _loc5_ = 500 / this.mcScope.mapCenter._height;
            var _loc3_ = 0;
            while(_loc3_ < this.data.length)
            {
               var _loc2_ = "pin" + _loc3_;
               var _loc4_ = this.pinContainer.attachMovie("button_Pin",_loc2_,this.pinContainer.getNextHighestDepth());
               this.pinContainer[_loc2_]._x = this.data[_loc3_][1] / _loc6_;
               this.pinContainer[_loc2_]._y = - this.data[_loc3_][2] / _loc5_;
               this.pinContainer[_loc2_].btnTxt._xscale = 0;
               this.pinContainer[_loc2_].topLevel = true;
               this.pinContainer[_loc2_].btnTxt.text = this.data[_loc3_][0];
               this.dataTextScope[_loc3_ + 1] = this.pinContainer[_loc2_].btnTxt;
               _loc3_ = _loc3_ + 1;
            }
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.messageTF,"LAR_CLICKTOVIEW",0,false);
            this.CONTENT.BOUNDING_BOX._height = 627;
            break;
         case "PROPERTY_D_DETAILS1":
         case "PROPERTY_D_DETAILS2":
         case "PROPERTY_D_DETAILS3":
         case "PROPERTY_D_DETAILS4":
         case "PROPERTY_D_DETAILS5":
         case "PROPERTY_D_DETAILS6":
         case "PROPERTY_D_DETAILS7":
         case "PROPERTY_D_DETAILS8":
         case "PROPERTY_D_DETAILS9":
         case "PROPERTY_D_DETAILS10":
         case "PROPERTY_D_DETAILS11":
         case "PROPERTY_D_DETAILS12":
         case "PROPERTY_D_DETAILS13":
         case "PROPERTY_D_DETAILS14":
         case "PROPERTY_D_DETAILS15":
            this.mcScope = this.CONTENT.PROPERTY_D_DETAILS;
            this.mcScope.housePhoto._visible = false;
            this.defaultButtonOnColour = 16777215;
            this.defaultButtonOffColour = 16777215;
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_LENNYAVERY_D_REALTY_COM.btnTxt;
            this.dataTextScope[1] = this.mcScope.LOS_D_SANTOS.btnTxt;
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.LOS_D_SANTOS.btnTxt,"LAR_RETURNTOMAP",0,false);
            this.dataTextScope[3] = this.mcScope.GETDIRECTIONS.btnTxt;
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.GETDIRECTIONS.btnTxt,"LAR_PROP_GETDIR",0,false);
            this.dataTextScope[5] = this.mcScope.header;
            this.mcScope.header.htmlText = this.descriptionArray[0];
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.propertyCost,"LAR_PROP_PRICE",0,true);
            this.dataTextScope[6] = this.mcScope.body;
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.body,"LAR_SP_" + (this.pinNumber + 1) + "_DESC",0,true);
            this.dataTextScope[7] = this.mcScope.footer;
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.footer,"LAR_PROP_FOOTER",0,true);
            this.mcScope.housePhoto.gotoAndStop(this.pinNumber + 1);
            this.mcScope.housePhoto._visible = true;
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            this.CONTENT.BOUNDING_BOX._height = 627;
            break;
         case "GETDIRECTIONS":
            this.mcScope = this.CONTENT.GETDIRECTIONS;
            this.defaultButtonOnColour = 16777215;
            this.defaultButtonOffColour = 16777215;
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_LENNYAVERY_D_REALTY_COM.btnTxt;
            this.dataTextScope[1] = this.mcScope.LOS_D_SANTOS.btnTxt;
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.LOS_D_SANTOS.btnTxt,"LAR_RETURNTOMAP",0,false);
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.header,"LAR_SENTTOGPS",0,true);
            this.mcScope.body.text = "";
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            this.CONTENT.BOUNDING_BOX._height = 627;
      }
   }
   function CLEANUP()
   {
      if(this.propertyMC != undefined)
      {
         this.propertyMC.removeMovieClip();
      }
      if(this.TXDstring != undefined)
      {
         com.rockstargames.ui.game.GameInterface.call("REMOVE_TXD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"WEB_BROWSER",this.TXDstring);
         this.TXDstring = undefined;
      }
   }
   function createContentLOS_D_SANTOS()
   {
      _level0.TIMELINE.SET_DATA_SLOT_EMPTY();
      this.data.push(new Array("Ace Jones Drive",-1569.525,444.04,200000,"SP","Spacious apartment on Ace Jones Drive. Awaiting copy."));
      this.data.push(new Array("Vinewood Hills",-1352.88,613.77,200000,"SP","Spacious apartment with a retro-cum-futuristic look in Vinewood Hills. Awaiting copy."));
      this.data.push(new Array("Sam Austin Drive",-1467,-5.5,200000,"SP","Spacious apartment in a building on Sam Austin Drive with as much cosmopolitan appeal as its namesake. Awaiting copy."));
      this.data.push(new Array("Cougar Avenue",-1632.8329,-413.8573,200000,"SP","Spacious apartment with a stunning view of the marina on Cougar Avenue. Hello, sailor! Awaiting copy."));
      this.data.push(new Array("Playa Vista",-1765.6779,-423.9763,200000,"SP","Spacious apartment with stunning views of the Vinewood sign and a parking lot in Playa Vista. Awaiting copy."));
      this.data.push(new Array("Eclipse",-380.75,427.79,200000,"SP","Spacious apartment, conveniently placed for the retail loving individual in Eclipse. Awaiting copy."));
      this.data.push(new Array("Marlowe Drive",-163.2826,989.2324,200000,"SP","Spacious apartment on Marlowe Drive with a retro-cum-futuristic look. Awaiting copy."));
      this.data.push(new Array("Vine Drive",-493.083,588.6333,200000,"SP","Spacious apartment with a charming and unique look on Vine Drive. Awaiting copy."));
      this.data.push(new Array("Abe Milton Parkway",-818.84,434.74,800000,"SP","Unique apartment down Abe Milton Parkway, perfect for BMX connoisseurs. Awaiting copy."));
      this.data.push(new Array("Vinewood Hills",-910.2,785.9,800000,"SP","Unique apartment in a desirable part of Vinewood Hills. Awaiting copy."));
      this.data.push(new Array("Hampstead Drive",-825.92,-26.67,800000,"SP","Spacious Unique apartment on Hampstead Drive, in original condition. Awaiting copy."));
      this.data.push(new Array("Vinewood Hills",-1103.5,587.29,800000,"SP","Unique apartment in Vinewood Hills with great access to a number of comically named stores. Awaiting copy."));
      this.data.push(new Array("Milton Drive",-1253.4395,491.05,800000,"SP","Unique apartment in Milton Drive, a friendly neighbourhood. Awaiting copy."));
      this.data.push(new Array("Vinewood Hills",164.4179,487.3199,800000,"SP","Charming apartment in Vinewood Hills, a friendly neighbourhood. Awaiting copy."));
      this.data.push(new Array("Greenwich Place",-1163.859,319.19,800000,"SP","Unique apartment in Greenwich Place overlooking the marina. Hello, sailor! Awaiting copy."));
   }
}
