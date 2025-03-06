class com.rockstargames.gtav.web.dynasty8ExecutiveRealty.PersonnelPage extends com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page
{
   var website;
   var prevPageName;
   var nextPageName;
   var progressPanel;
   var view;
   var summaryPageName;
   static var TXD = "DYN8_EXEC_DEFAULT";
   static var IMAGES = ["PERSONNEL_FEMALE","PERSONNEL_MALE"];
   function PersonnelPage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"personnelPage",pageName,isFirstPage,progressPanel,header);
      this.init();
   }
   function init()
   {
      if(this.website.style == -1)
      {
         this.website.style = 0;
      }
      if(this.website.personnel == -1)
      {
         this.website.personnel = 0;
      }
      this.prevPageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.STYLE_PAGE.name;
      this.nextPageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.SIGNAGE_PAGE.name;
      this.progressPanel.show();
      this.progressPanel.initProgress(2);
      if(this.website.styleWhenLastOnSignagePage != -1 && this.website.styleWhenLastOnSignagePage != this.website.style)
      {
         this.progressPanel.showSignageExclamation();
      }
      this.initPersonnelButton(this.view.personnelButton_0,this.view.personnelImage_0,"DYN8_EXEC_PERSONNEL_0",0);
      this.initPersonnelButton(this.view.personnelButton_1,this.view.personnelImage_1,"DYN8_EXEC_PERSONNEL_1",1);
      this.updateSelectedItem();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function initPersonnelButton(buttonView, imageView, label, index)
   {
      buttonView.onColour = com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page.DROP_DOWN_GREEN;
      buttonView.offColour = com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page.DROP_DOWN_GREEN;
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(buttonView.btnTxt,label,false);
      buttonView.btnTxt.text = buttonView.btnTxt.text.toUpperCase();
      this.website.dataTextScope.push(buttonView.btnTxt);
      imageView.image.onDisplayImage = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.delegate(this,this.onDisplayImage,imageView,index);
      this.website.imageManager.addImage(com.rockstargames.gtav.web.dynasty8ExecutiveRealty.PersonnelPage.TXD,com.rockstargames.gtav.web.dynasty8ExecutiveRealty.PersonnelPage.IMAGES[index],imageView.image);
   }
   function onDisplayImage(buttonView, index)
   {
      var _loc2_ = index != this.website.personnel ? 75 : 0;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(buttonView.reveal,0.25,{_alpha:_loc2_});
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "personnelButton":
            this.website.personnel = parseInt(id);
            this.updateSelectedItem();
            break;
         case "purchaseButton":
            this.website.dispatchPlayerSelections();
            this.website.browser.GO_TO_WEBPAGE(this.summaryPageName);
      }
   }
   function updateSelectedItem()
   {
      this.progressPanel.updateCosts();
      var _loc2_ = this.website.personnel == 0;
      var _loc3_ = !_loc2_ ? "DYN8_EXEC_PERSONNEL_DESCRIPTION_MALE" : "DYN8_EXEC_PERSONNEL_DESCRIPTION_FEMALE";
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.description,_loc3_,false);
      this.view.personnelButton_0._y = this.view.description._y + this.view.description.textHeight + 20;
      this.view.personnelButton_1._y = this.view.description._y + this.view.description.textHeight + 20;
      this.view.personnelButton_0.tick._visible = _loc2_;
      this.view.personnelButton_1.tick._visible = !_loc2_;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.personnelImage_0.reveal,0.25,{_alpha:(!_loc2_ ? 75 : 0)});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.personnelImage_1.reveal,0.25,{_alpha:(!_loc2_ ? 0 : 75)});
   }
   function handleLB()
   {
      this.website.browser.GO_TO_WEBPAGE(this.prevPageName);
   }
   function handleRB()
   {
      this.website.browser.GO_TO_WEBPAGE(this.nextPageName);
   }
   function dispose()
   {
      delete this.view.personnelButton_0.image.onDisplayImage;
      delete this.view.personnelButton_1.image.onDisplayImage;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.personnelButton_0.reveal);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.personnelButton_1.reveal);
      super.dispose();
   }
}
