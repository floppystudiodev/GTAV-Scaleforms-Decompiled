class com.rockstargames.gtav.FrontendGen9.progressHub.screens.ContentTypeScreen extends com.rockstargames.gtav.FrontendGen9.progressHub.screens.Screen
{
   var _carousel;
   var app;
   var dataObject;
   var screenDataArray;
   var screenDataObject;
   var setUpText;
   var setupCarousel;
   var view;
   function ContentTypeScreen(app, viewContainer, cursor, dataObject)
   {
      super(app,viewContainer,cursor,"ContentTypeScreen",dataObject);
      this.init();
   }
   function init()
   {
      this.setUpText(this.view.screenTitle,this.dataObject.screenTitle,false,"center");
      this.setUpText(this.view.messageText,this.dataObject.message,false,"center",-0.3);
      this.setupCarousel();
   }
   function updateScreen(index)
   {
      this.screenDataObject = this.screenDataArray[index];
      this.setUpText(this.view.titleText,this.screenDataObject.title,true,"center");
      this.view.descriptionText._height = 306;
      this.setUpText(this.view.descriptionText,this.screenDataObject.description,false,"top",0.15);
      this.view.descriptionText.html = true;
      this.view.descriptionText.htmlText = this.view.descriptionText.text;
      this.app.imageManager.addImage(this.screenDataObject.backgroundTXD,this.screenDataObject.backgroundImage,this.view.backgroundImage);
      this._carousel.SHOW_CURRENT_ITEM();
   }
}
