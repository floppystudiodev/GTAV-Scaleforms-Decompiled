class com.rockstargames.gtav.web.WWW_IWILLSURVIVEITALL_COM extends com.rockstargames.ui.core.BaseWebsite
{
   var CAN_STORE_PAGE;
   var CONTENT;
   var OnColour;
   var PAGE_NAMES;
   var _isUser;
   var _userName;
   var browser;
   var currencyTypes;
   var dataProviderUI;
   var dataTextScope;
   var defaultButtonOnColour;
   var intervalId;
   var mcScope;
   function WWW_IWILLSURVIVEITALL_COM()
   {
      super();
      _global.gfxExtensions = true;
      this.currencyTypes = "Afghan afghani, Albanian lek, Alderney pound, Algerian dinar, Angolan kwanza, Argentine peso, Armenian dram, Aruban florin, Ascension pound, Australian dollar, Azerbaijani manat, Bahamian dollar, Bahraini dinar, Bangladeshi taka, Barbadian dollar, Belarusian ruble, Belize dollar, Bermudian dollar, Bhutanese ngultrum, Bolivian boliviano, Bosnia and Herzegovina convertible mark, Botswana pula, Brazilian real, British pound, British Virgin Islands dollar, Brunei dollar, Bulgarian lev, Burmese kyat, Burundian franc, Cambodian riel, Canadian dollar, Cape Verdean escudo, Cayman Islands dollar, Central African CFA franc, CFP franc, Chilean peso, Chinese yuan, Colombian peso, Comorian franc, Congolese franc, Cook Islands dollar, Costa Rican colon, Croatian kuna, Cuban convertible peso, Cuban peso, Czech koruna, Danish krone, Djiboutian franc, Dominican peso, East Caribbean dollar, Egyptian pound, Eritrean nakfa, Ethiopian birr, Euro, Falkland Islands pound, Faroese krona, Fijian dollar, Gambian dalasi, Georgian lari, Ghana cedi, Gibraltar pound, Guatemalan quetzal, Guernsey pound, Guinean franc, Guyanese dollar, Haitian gourde, Honduran lempira, Hong Kong dollar, Hungarian forint, Icelandic krona, Indian rupee, Indonesian rupiah, Iranian rial, Iraqi dinar, Israeli new shekel, Jamaican dollar, Japanese yen, Jersey pound, Jordanian dinar, Kazakhstani tenge, Kenyan shilling, Kiribati dollar, Kuwaiti dinar, Kyrgyzstani som, Lao kip, Latvian lats, Lebanese pound, Lesotho loti, Liberian dollar, Libyan dinar, Lithuanian litas, Macanese pataca, Macedonian denar, Malagasy ariary, Malawian kwacha, Malaysian ringgit, Maldivian rufiyaa, Manx pound, Mauritanian ouguiya, Mauritian rupee, Mexican peso, Micronesian dollar, Moldovan leu, Mongolian togrog, Moroccan dirham, Mozambican metical, Nagorno-Karabakh dram, Namibian dollar, Nauruan dollar, Nepalese rupee, Netherlands Antillean guilder, New Taiwan dollar, New Zealand dollar, Nicaraguan cordoba, Nigerian naira, Niuean dollar, North Korean won, Norwegian krone, Omani rial, Pakistani rupee, Palauan dollar, Panamanian balboa, Papua New Guinean kina, Paraguayan guarani, Peruvian nuevo sol, Philippine peso, Pitcairn Islands dollar, Polish zloty, Qatari riyal, Romanian leu, Russian ruble, Rwandan franc, Sahrawi peseta, Saint Helena pound, Salvadoran colon, Samoan tala, Sao Tome and Principe dobra, Saudi riyal, Serbian dinar, Seychellois rupee, Sierra Leonean leone, Singapore dollar, Solomon Islands dollar, Somali shilling, Somaliland shilling, South African rand, South Georgia and the South Sandwich Islands pound, South Korean won, South Sudanese pound, Sri Lankan rupee, Sudanese pound, Surinamese dollar, Swazi lilangeni, Swedish krona, Swiss franc, Syrian pound, Tajikistani somoni, Tanzanian shilling, Thai baht, Tongan pa\'anga, Transnistrian ruble, Trinidad and Tobago dollar, Tristan da Cunha pound, Tunisian dinar, Turkish lira, Turkmenistan manat, Tuvaluan dollar, Ugandan shilling, Ukrainian hryvnia, United Arab Emirates dirham, Uruguayan peso, Uzbekistani som, Vanuatu vatu, Venezuelan bolivar, Vietnamese dong, West African CFA franc, Yemeni rial, Zambian kwacha, Zimbabwean dollar"
      .split(", ");
      this.IS_SITE_DYNAMIC = 0;
      this.browser = _level0.TIMELINE;
      this.browser.DebugTextContent = true;
      this.PAGE_NAMES = new Array();
      this.PAGE_NAMES[1] = "PAGE1";
      this.PAGE_NAMES[2] = "SIGNUP";
      this.PAGE_NAMES[3] = "MY_D_PORTFOLIO";
      this.PAGE_NAMES[4] = "USER_D_PROTECTION";
      this.PAGE_NAMES[14] = "PURCHASE_D_ERROR";
      this.PAGE_NAMES[15] = "PURCHASE_D_CONFIRM";
      this.CAN_STORE_PAGE = new Array();
      this.CAN_STORE_PAGE[1] = true;
      this.CAN_STORE_PAGE[2] = true;
      this.CAN_STORE_PAGE[3] = false;
      this.CAN_STORE_PAGE[4] = false;
      this.CAN_STORE_PAGE[14] = false;
      this.CAN_STORE_PAGE[15] = false;
   }
   function READY()
   {
   }
   function goToAnchor(AnchorLink)
   {
      switch(AnchorLink)
      {
         case "signUpMC":
            this.browser.GO_TO_WEBPAGE("WWW_IWILLSURVIVEITALL_COM_S_SIGNUP");
            break;
         case "myPortfolioMC":
            if(this._isUser)
            {
               this.browser.GO_TO_WEBPAGE("WWW_IWILLSURVIVEITALL_COM_S_MY_D_PORTFOLIO");
            }
            else
            {
               this.browser.GO_TO_WEBPAGE("WWW_IWILLSURVIVEITALL_COM_S_SIGNUP");
            }
            break;
         case "confirmMC":
            if(this._isUser)
            {
               this.browser.GO_TO_WEBPAGE("WWW_IWILLSURVIVEITALL_COM_S_MY_D_PORTFOLIO");
            }
            else
            {
               this.browser.GO_TO_WEBPAGE("WWW_IWILLSURVIVEITALL_COM_S_PURCHASE_D_CONFIRM");
            }
         default:
            return;
      }
   }
   function POPULATE_TEXT(pageName)
   {
      this.CONTENT._y = 0;
      clearInterval(this.intervalId);
      switch(this.browser.player)
      {
         case 0:
            this._userName = "Michael";
            break;
         case 2:
            this._userName = "Franklin";
            break;
         case 3:
            this._userName = "Trevor";
            break;
         case 1:
         default:
            this._userName = "investor";
      }
      this.mcScope = this.CONTENT[pageName];
      this.dataTextScope = new Array();
      var _loc3_ = 0;
      var _loc2_;
      for(var _loc6_ in this.mcScope)
      {
         if(typeof this.mcScope[_loc6_] == "movieclip")
         {
            if(this.mcScope[_loc6_].btnTxt != undefined)
            {
               this.mcScope[_loc6_].offColour = this.mcScope[_loc6_].btnTxt.textColor;
               _loc2_ = this.mcScope[_loc6_];
               this.dataTextScope[_loc3_] = _loc2_.btnTxt;
               _loc3_ = _loc3_ + 1;
            }
         }
      }
      this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
      var _loc5_;
      var _loc4_;
      switch(this.browser.pageName)
      {
         case "PURCHASE_D_CONFIRM":
            this._isUser = true;
            this.mcScope.messageTF._alpha = 0;
            this.mcScope.processingTF._alpha = 100;
            if(this.dataProviderUI[0] != undefined && this.dataProviderUI[0] != "")
            {
               this.mcScope.messageTF.text = this.dataProviderUI[0];
            }
            this.intervalId = setInterval(this,"displayPurchasedText",2000);
            break;
         case "PURCHASE_D_ERROR":
            this._isUser = false;
            if(this.dataProviderUI[0] != undefined && this.dataProviderUI[0] != "")
            {
               this.mcScope.messageTF.text = this.dataProviderUI[0];
            }
            break;
         case "MY_D_PORTFOLIO":
            this.mcScope.greetingTF.text = "Welcome back, " + this._userName + "!";
            if(Math.random() > 0.75)
            {
               _loc5_ = this.addCommas(Math.round(Math.random() * 99999999));
               _loc4_ = this.currencyTypes[Math.floor(Math.random() * this.currencyTypes.length)];
            }
            else if(Math.random() > 0.5)
            {
               _loc5_ = this.addCommas(Math.round(Math.random() * 999999));
               _loc4_ = Math.random() <= 0.75 ? "" : "United States dollar";
            }
            else if(Math.random() > 0.25)
            {
               _loc5_ = this.addCommas(Math.round(Math.random() * 9999));
               _loc4_ = Math.random() <= 0.66 ? "" : "United States dollar";
            }
            else
            {
               _loc5_ = Math.round(Math.random() * 99) + "";
               _loc4_ = Math.random() <= 0.5 ? "" : "United States dollar";
            }
            _loc5_ += "." + Math.round(Math.random() * 9) + Math.round(Math.random() * 9);
            if(_loc4_ == "")
            {
               _loc4_ = this.currencyTypes[Math.floor(Math.random() * this.currencyTypes.length)];
            }
            this.mcScope.amountTF.textAutoSize = "shrink";
            this.mcScope.amountTF.text = _loc5_ + " " + _loc4_;
      }
      if(this.CONTENT.globalColourMouseOver != undefined)
      {
         this.OnColour = this.CONTENT.globalColourMouseOver.textColor;
      }
      if(this.mcScope.colourMouseOver != undefined)
      {
         this.OnColour = this.mcScope.colourMouseOver.textColor;
      }
      this.defaultButtonOnColour = this.OnColour;
   }
   function displayPurchasedText()
   {
      clearInterval(this.intervalId);
      if(this.mcScope.messageTF != undefined)
      {
         this.mcScope.messageTF._alpha = 100;
      }
      if(this.mcScope.processingTF != undefined)
      {
         this.mcScope.processingTF._alpha = 0;
      }
   }
   function addCommas(val)
   {
      var _loc3_ = val.toString();
      var _loc1_ = _loc3_.length;
      var _loc2_ = [];
      var _loc5_;
      while(_loc1_ > 0)
      {
         _loc2_.push(_loc3_.substring(_loc1_ - 3,_loc1_));
         _loc1_ -= 3;
      }
      _loc2_.reverse();
      return _loc2_.join(",");
   }
   function CLEANUP()
   {
      clearInterval(this.intervalId);
   }
}
