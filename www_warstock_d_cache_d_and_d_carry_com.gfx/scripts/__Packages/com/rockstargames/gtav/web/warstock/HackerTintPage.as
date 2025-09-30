class com.rockstargames.gtav.web.warstock.HackerTintPage extends com.rockstargames.gtav.web.warstock.HackerPage
{
   var buttons;
   var nextPageName;
   var prevPageName;
   var progressPanel;
   var view;
   var website;
   function HackerTintPage(view, website, progressPanel)
   {
      super(view,website,progressPanel);
   }
   function init()
   {
      super.init();
      this.prevPageName = "PAGE1";
      this.nextPageName = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_DECAL_PAGE;
      if(this.website.hackerTint == -1)
      {
         this.website.hackerTint = 0;
      }
      this.setLocalisedText(this.view.description,"CANDC_HACKER_TNT_DESC_" + this.website.hackerTint);
      this.website.imageManager.addImage("CANDC_HACKER","TINT" + this.website.hackerTint,this.view.image.tf);
      this.progressPanel.updateCosts();
      this.progressPanel.showBuyButton();
      this.progressPanel.setActiveStep(0);
      this.progressPanel.enable();
      this.initButtons();
      this.view.tintButtons._y = this.view.description._y + this.view.description.textHeight + 40;
   }
   function initButtons()
   {
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < 9)
      {
         _loc3_ = this.view.tintButtons["tintButton_" + _loc2_];
         _loc3_.highlight._visible = _loc2_ == this.website.hackerTint;
         _loc3_.swatch.gotoAndStop(_loc2_ + 1);
         this.buttons.push(_loc3_.btnTxt);
         _loc2_ = _loc2_ + 1;
      }
   }
   function handleClick(id, attribute)
   {
      var _loc4_;
      var _loc2_;
      var _loc3_;
      if(id == "tintButton")
      {
         _loc4_ = parseInt(attribute);
         this.website.hackerTint = _loc4_;
         this.progressPanel.updateCosts();
         _loc2_ = 0;
         while(_loc2_ < 9)
         {
            _loc3_ = this.view.tintButtons["tintButton_" + _loc2_];
            _loc3_.highlight._visible = _loc2_ == this.website.hackerTint;
            _loc2_ = _loc2_ + 1;
         }
      }
      this.setLocalisedText(this.view.description,"CANDC_HACKER_TNT_DESC_" + this.website.hackerTint);
      this.website.imageManager.addImage("CANDC_HACKER","TINT" + this.website.hackerTint,this.view.image.tf);
   }
   function dispose()
   {
      super.dispose();
   }
}
