class com.rockstargames.gtav.web.BANKS_baseclass extends com.rockstargames.ui.core.BaseWebsite
{
   var CAN_STORE_PAGE;
   var CONTENT;
   var PAGE_NAMES;
   var _name;
   var browser;
   var container;
   var currPage;
   var dataProviderUI;
   var dataTextScope;
   var defaultButtonOffColour;
   var defaultButtonOnColour;
   var mcScope;
   var thisWebsite;
   var containerDepth = 40;
   var lineXPos = 237;
   var lineYPos = 222;
   var lineSpacing = 35;
   function BANKS_baseclass()
   {
      super();
      _global.gfxExtensions = true;
      this.IS_SITE_DYNAMIC = 1;
      this.PAGE_NAMES = new Array();
      this.PAGE_NAMES[1] = "PAGE1";
      this.PAGE_NAMES[2] = "TRANSACTIONS";
      this.PAGE_NAMES[3] = "MAINMENU";
      this.PAGE_NAMES[4] = "WITHDRAW";
      this.PAGE_NAMES[5] = "DEPOSIT";
      this.PAGE_NAMES[6] = "ERROR";
      this.PAGE_NAMES[7] = "MAINTENANCE";
      this.PAGE_NAMES[8] = "MESSAGE";
      this.CAN_STORE_PAGE = new Array();
      this.CAN_STORE_PAGE[1] = true;
      this.CAN_STORE_PAGE[2] = true;
      this.CAN_STORE_PAGE[3] = false;
      this.CAN_STORE_PAGE[4] = false;
      this.CAN_STORE_PAGE[5] = false;
      this.CAN_STORE_PAGE[6] = false;
      this.CAN_STORE_PAGE[7] = true;
      this.CAN_STORE_PAGE[8] = false;
      this.browser = _level0.TIMELINE;
      this.browser.DebugTextContent = true;
      this.defaultButtonOnColour = 16777215;
      this.defaultButtonOffColour = 15790320;
   }
   function READY()
   {
   }
   function POPULATE_TEXT(pageName, searchArgs, newPage)
   {
      this.thisWebsite = this._name;
      if(pageName == this.currPage)
      {
         if(newPage)
         {
            return undefined;
         }
      }
      else
      {
         this.currPage = pageName;
      }
      var _loc13_;
      var _loc11_;
      var _loc16_;
      var _loc12_;
      var _loc3_;
      var _loc7_;
      var _loc5_;
      var _loc6_;
      var _loc14_;
      var _loc10_;
      var _loc8_;
      var _loc4_;
      var _loc17_;
      var _loc15_;
      var _loc19_;
      var _loc2_;
      switch(pageName)
      {
         case "PAGE1":
            this.mcScope = this.CONTENT.PAGE1;
            this.dataTextScope = new Array();
            switch(this.browser.player)
            {
               case 0:
                  _loc13_ = "ACCNA_MIKE";
                  break;
               case 2:
                  _loc13_ = "ACCNA_FRANKLIN";
                  break;
               case 3:
                  _loc13_ = "ACCNA_TREVOR";
                  break;
               case 1:
               case 4:
            }
            _loc11_ = false;
            switch(this.thisWebsite)
            {
               case "WWW_MAZE_D_BANK_COM":
                  if(this.browser.player != 0 && this.browser.player != 1)
                  {
                     _loc11_ = true;
                  }
                  break;
               case "WWW_THEBANKOFLIBERTY_COM":
                  if(this.browser.player != 3)
                  {
                     _loc11_ = true;
                  }
                  break;
               case "WWW_FLEECA_COM":
                  if(this.browser.player != 2)
                  {
                     _loc11_ = true;
                  }
            }
            if(_loc11_ == true)
            {
               if(this.browser.player != 1)
               {
                  com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.headerTF,"BNK_UNRECOGNIZED",0,false);
                  com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.characterNameTF,"BNK_NOACCOUNT",0,false);
               }
               else
               {
                  com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.headerTF,"WEB_SORRY",0,false);
                  com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.characterNameTF,"WEB_MAINTENANCE",0,false);
               }
            }
            else
            {
               if(_loc13_ != undefined)
               {
                  com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.headerTF,"BNK_WELCOME",0,false);
                  com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.characterNameTF,_loc13_,0,false);
                  com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.TRANSACTIONS.btnTxt,"BNK_TRANSACTIONS",0,false);
                  this.adjustButtonText(this.mcScope.TRANSACTIONS.btnTxt);
                  this.dataTextScope[0] = this.mcScope.TRANSACTIONS.btnTxt;
                  this.mcScope.TRANSACTIONS._y = 361;
                  this.mcScope.MAINMENU._y = -361;
               }
               else if(newPage == false)
               {
                  com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.headerTF,"BNK_WELCOME",0,false);
                  com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.MAINMENU.btnTxt,"BNK_MAINMENU",0,false);
                  if(this.dataProviderUI[1] != undefined)
                  {
                     this.mcScope.characterNameTF.htmlText = this.dataProviderUI[1];
                  }
                  this.adjustButtonText(this.mcScope.MAINMENU.btnTxt);
                  this.dataTextScope[0] = this.mcScope.MAINMENU.btnTxt;
                  this.mcScope.MAINMENU._y = 361;
                  this.mcScope.TRANSACTIONS._y = -361;
               }
               this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            }
            this.CONTENT.BOUNDING_BOX._height = 627;
            break;
         case "MAINMENU":
            this.mcScope = this.CONTENT.MAINMENU;
            this.dataTextScope = new Array();
            this.mcScope.DEPOSIT._visible = false;
            this.mcScope.WITHDRAW._visible = false;
            this.mcScope.TRANSACTIONS._visible = false;
            if(newPage == false)
            {
               if(this.dataProviderUI[1] != undefined)
               {
                  this.mcScope.nameTF.text = this.dataProviderUI[1];
               }
               if(this.dataProviderUI[2] != undefined)
               {
                  this.mcScope.headerTF.text = this.dataProviderUI[2];
               }
               this.updateBalance(this.dataProviderUI[0]);
               if(this.dataProviderUI[3] != undefined && this.dataProviderUI[3] != "" && this.dataProviderUI[3] != null)
               {
                  this.mcScope.DEPOSIT.btnTxt.text = this.dataProviderUI[3];
                  this.adjustButtonText(this.mcScope.DEPOSIT.btnTxt);
                  this.dataTextScope[3] = this.mcScope.DEPOSIT.btnTxt;
                  this.mcScope.DEPOSIT._visible = true;
               }
               if(this.dataProviderUI[4] != undefined && this.dataProviderUI[4] != "" && this.dataProviderUI[4] != null)
               {
                  this.mcScope.WITHDRAW.btnTxt.text = this.dataProviderUI[4];
                  this.adjustButtonText(this.mcScope.WITHDRAW.btnTxt);
                  this.dataTextScope[4] = this.mcScope.WITHDRAW.btnTxt;
                  this.mcScope.WITHDRAW._visible = true;
               }
               if(this.dataProviderUI[5] != undefined && this.dataProviderUI[5] != "" && this.dataProviderUI[5] != null)
               {
                  this.mcScope.TRANSACTIONS.btnTxt.text = this.dataProviderUI[5];
                  this.adjustButtonText(this.mcScope.TRANSACTIONS.btnTxt);
                  this.dataTextScope[5] = this.mcScope.TRANSACTIONS.btnTxt;
                  this.mcScope.TRANSACTIONS._visible = true;
               }
               this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            }
            this.CONTENT.BOUNDING_BOX._height = 627;
            break;
         case "TRANSACTIONS":
            this.mcScope = this.CONTENT.TRANSACTIONS;
            this.dataTextScope = new Array();
            if(newPage == false)
            {
               if(this.browser.player == 1)
               {
                  com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.MAINMENU.btnTxt,"BNK_MAINMENU",0,false);
                  this.adjustButtonText(this.mcScope.MAINMENU.btnTxt);
                  this.dataTextScope[0] = this.mcScope.MAINMENU.btnTxt;
                  this.mcScope.MAINMENU._y = 134;
               }
               this.updateBalance(this.dataProviderUI[0]);
               if(this.dataProviderUI[1] != undefined)
               {
                  this.mcScope.nameTF.text = this.dataProviderUI[1];
               }
               if(this.dataProviderUI[2] != undefined)
               {
                  this.mcScope.headerTF.text = this.dataProviderUI[2];
               }
               _loc16_ = this.dataProviderUI[3][1];
               _loc12_ = this.dataProviderUI[3][0];
               if(_loc12_ == undefined)
               {
                  _loc12_ = 0;
               }
               if(this.container != undefined)
               {
                  this.container.removeMovieClip();
               }
               this.container = this.mcScope.createEmptyMovieClip("container",this.containerDepth);
               _loc8_ = 0;
               _loc4_ = 0;
               while(_loc4_ < this.dataProviderUI.length - 4)
               {
                  if(this.dataProviderUI[_loc4_ + 4] != undefined)
                  {
                     _loc3_ = "item" + _loc4_;
                     this.container.attachMovie("textLine",_loc3_,this.container.getNextHighestDepth(),{_x:this.lineXPos,_y:this.lineSpacing * _loc4_ + this.lineYPos});
                     this.dataTextScope[_loc4_ + 4] = this.mcScope.container[_loc3_];
                     _loc10_ = this.dataTextScope[_loc4_ + 4];
                     _loc7_ = this.dataProviderUI[_loc4_ + 4][2];
                     if(this.dataProviderUI[_loc4_ + 4][0] == 0)
                     {
                        _loc5_ = "";
                        _loc6_ = "-" + this.formatAmount(this.dataProviderUI[_loc4_ + 4][1]) + ".00 DB";
                     }
                     else
                     {
                        _loc5_ = this.formatAmount(this.dataProviderUI[_loc4_ + 4][1]) + ".00 CR";
                        _loc6_ = "";
                     }
                     this.container[_loc3_].TFtext.text = _loc7_;
                     this.container[_loc3_].TFcredit.text = _loc5_;
                     this.container[_loc3_].TFdebit.text = _loc6_;
                     _loc8_ = _loc8_ + 1;
                  }
                  _loc4_ = _loc4_ + 1;
               }
               _loc17_ = this.container.attachMovie("balanceLine","balanceLine",this.container.getNextHighestDepth(),{_x:this.lineXPos,_y:this.container._y + this.container._height + this.lineYPos + 36});
               if(_loc16_ != undefined)
               {
                  _loc17_.TFtext.text = _loc16_;
               }
               _loc15_ = "";
               if(_loc12_ < 0)
               {
                  _loc15_ = "-";
               }
               _loc17_.balanceTF.text = _loc15_ + this.formatAmount(_loc12_) + ".00";
               if(_loc8_ > 0)
               {
                  this.mcScope.latestTransactionsTF._visible = false;
                  com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.latestTransactionsTF,"BNK_LASTTRANSACTIONS",0,false);
                  _loc19_ = _loc8_.toString();
                  this.mcScope.latestTransactionsTF.text = this.mcScope.latestTransactionsTF.text.split("<X>").join(_loc19_);
                  this.mcScope.latestTransactionsTF._visible = true;
               }
               _loc14_ = this.container._y + this.container._height + this.lineYPos + 50;
               if(_loc14_ > 627)
               {
                  this.CONTENT.BOUNDING_BOX._height = _loc14_;
                  this.mcScope.BACKGROUND._height = _loc14_;
               }
               this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            }
            else
            {
               this.CONTENT.BOUNDING_BOX._height = 627;
            }
            break;
         case "WITHDRAW":
            this.mcScope = this.CONTENT.WITHDRAW;
            this.dataTextScope = new Array();
            if(newPage == false)
            {
               this.updateBalance(this.dataProviderUI[0]);
               if(this.dataProviderUI[1] != undefined)
               {
                  this.mcScope.nameTF.text = this.dataProviderUI[1];
               }
               if(this.dataProviderUI[2] != undefined)
               {
                  this.mcScope.headerTF.text = this.dataProviderUI[2];
               }
               _loc4_ = 0;
               while(_loc4_ < 6)
               {
                  _loc2_ = _loc4_ + 3;
                  if(this.dataProviderUI[_loc2_] != undefined && this.dataProviderUI[_loc2_] != "" && this.dataProviderUI[_loc2_] != null)
                  {
                     this.mcScope["menu_" + _loc4_].btnTxt.text = this.dataProviderUI[_loc2_];
                     this.adjustButtonText(this.mcScope["menu_" + _loc4_].btnTxt);
                     this.dataTextScope[_loc2_] = this.mcScope["menu_" + _loc4_].btnTxt;
                     this.mcScope["menu_" + _loc4_]._visible = true;
                  }
                  else
                  {
                     this.mcScope["menu_" + _loc4_]._visible = false;
                  }
                  _loc4_ = _loc4_ + 1;
               }
               com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.MAINMENU.btnTxt,"BNK_MAINMENU",0,false);
               this.adjustButtonText(this.mcScope.MAINMENU.btnTxt);
               this.dataTextScope[0] = this.mcScope.MAINMENU.btnTxt;
               this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            }
            else
            {
               _loc4_ = 0;
               while(_loc4_ < 6)
               {
                  this.mcScope["menu_" + _loc4_]._visible = false;
                  _loc4_ = _loc4_ + 1;
               }
            }
            this.CONTENT.BOUNDING_BOX._height = 627;
            break;
         case "DEPOSIT":
            this.mcScope = this.CONTENT.DEPOSIT;
            this.dataTextScope = new Array();
            if(newPage == false)
            {
               this.updateBalance(this.dataProviderUI[0]);
               if(this.dataProviderUI[1] != undefined)
               {
                  this.mcScope.nameTF.text = this.dataProviderUI[1];
               }
               if(this.dataProviderUI[2] != undefined)
               {
                  this.mcScope.headerTF.text = this.dataProviderUI[2];
               }
               _loc4_ = 0;
               while(_loc4_ < 6)
               {
                  _loc2_ = _loc4_ + 3;
                  if(this.dataProviderUI[_loc2_] != undefined && this.dataProviderUI[_loc2_] != "" && this.dataProviderUI[_loc2_] != null)
                  {
                     this.mcScope["menu_" + _loc4_].btnTxt.text = this.dataProviderUI[_loc2_];
                     this.adjustButtonText(this.mcScope["menu_" + _loc4_].btnTxt);
                     this.dataTextScope[_loc2_] = this.mcScope["menu_" + _loc4_].btnTxt;
                     this.mcScope["menu_" + _loc4_]._visible = true;
                  }
                  else
                  {
                     this.mcScope["menu_" + _loc4_]._visible = false;
                  }
                  _loc4_ = _loc4_ + 1;
               }
               com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.MAINMENU.btnTxt,"BNK_MAINMENU",0,false);
               this.adjustButtonText(this.mcScope.MAINMENU.btnTxt);
               this.dataTextScope[0] = this.mcScope.MAINMENU.btnTxt;
               this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            }
            else
            {
               _loc4_ = 0;
               while(_loc4_ < 6)
               {
                  this.mcScope["menu_" + _loc4_]._visible = false;
                  _loc4_ = _loc4_ + 1;
               }
            }
            this.CONTENT.BOUNDING_BOX._height = 627;
            break;
         case "ERROR":
            this.mcScope = this.CONTENT.ERROR;
            this.dataTextScope = new Array();
            if(newPage == false)
            {
               if(this.dataProviderUI[0] != undefined)
               {
                  this.mcScope.messageTF.text = this.dataProviderUI[0];
               }
               this.dataTextScope[0] = this.mcScope.MAINMENU.btnTxt;
               com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.MAINMENU.btnTxt,"BNK_MAINMENU",0,false);
               this.adjustButtonText(this.mcScope.MAINMENU.btnTxt);
               this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            }
            this.CONTENT.BOUNDING_BOX._height = 627;
            break;
         case "MAINTENANCE":
            this.mcScope = this.CONTENT.MAINTENANCE;
            this.dataTextScope = new Array();
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.messageTF,"WEB_MAINTENANCE",0,false);
            this.mcScope.MAINMENU._visible = false;
            this.CONTENT.BOUNDING_BOX._height = 627;
            break;
         case "MESSAGE":
            this.mcScope = this.CONTENT.MESSAGE;
            this.dataTextScope = new Array();
            if(newPage == false)
            {
               if(this.dataProviderUI[0] != undefined)
               {
                  this.mcScope.messageTF.text = this.dataProviderUI[0];
               }
               if(this.dataProviderUI[2] != undefined && this.dataProviderUI[2] != "" && this.dataProviderUI[2] != null)
               {
                  this.mcScope.NO.btnTxt.text = this.dataProviderUI[2];
                  this.adjustButtonText(this.mcScope.NO.btnTxt);
                  this.dataTextScope[1] = this.mcScope.NO.btnTxt;
                  this.mcScope.NO._visible = true;
               }
               else
               {
                  this.mcScope.NO._visible = false;
               }
               if(this.dataProviderUI[1] != undefined && this.dataProviderUI[1] != "" && this.dataProviderUI[1] != null)
               {
                  this.mcScope.YES.btnTxt.text = this.dataProviderUI[1];
                  this.adjustButtonText(this.mcScope.YES.btnTxt);
                  this.dataTextScope[0] = this.mcScope.YES.btnTxt;
                  if(this.mcScope.NO._visible == false)
                  {
                     this.mcScope.YES._x = 535;
                  }
                  this.mcScope.YES._visible = true;
               }
               else
               {
                  this.mcScope.YES._visible = false;
               }
               this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            }
            this.CONTENT.BOUNDING_BOX._height = 627;
         default:
            return;
      }
   }
   function formatAmount(value)
   {
      var _loc2_ = "$";
      var _loc3_ = value.toString().length;
      var _loc4_ = ",";
      var _loc1_ = 0;
      while(_loc1_ < _loc3_)
      {
         if((_loc3_ - _loc1_) % 3 == 0 && _loc1_ != 0)
         {
            _loc2_ += _loc4_;
         }
         _loc2_ += value.toString().charAt(_loc1_);
         _loc1_ = _loc1_ + 1;
      }
      return _loc2_;
   }
   function updateBalance(balance)
   {
      var _loc3_;
      var _loc5_;
      var _loc4_;
      if(balance != undefined)
      {
         balance = balance.toString();
         _loc3_ = 0;
         while(_loc3_ < 2)
         {
            if(balance.charAt(0) == "-")
            {
               balance = balance.substr(1);
            }
            else if(balance.charAt(0) == "$")
            {
               balance = balance.substr(1);
            }
            _loc3_ = _loc3_ + 1;
         }
         this.mcScope.balanceTF.autoSize = "right";
         _loc5_ = "";
         _loc4_ = Math.floor(parseFloat(balance));
         if(_loc4_ < 0)
         {
            _loc5_ = "-";
         }
         this.mcScope.balanceTF.text = _loc5_ + this.formatAmount(_loc4_) + ".00";
         this.mcScope.balanceStringTF.autoSize = true;
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.balanceStringTF,"MPATM_ACBA",0,false);
         this.mcScope.balanceStringTF._x = this.mcScope.balanceTF._x - this.mcScope.balanceStringTF._width - 8;
      }
   }
   function adjustButtonText(TF)
   {
      TF.autoSize = "center";
      if(TF._height > 30)
      {
         TF._y = 0;
      }
   }
}
