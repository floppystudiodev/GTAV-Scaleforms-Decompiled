class com.rockstargames.gtav.web.Dynasty8realestateButtonContainer extends MovieClip
{
   var hitAreaMC;
   var onEnterFrame;
   var textColBlack;
   var textColGrey;
   var website = undefined;
   var indexCounter = 0;
   var indexSpan = 3;
   function Dynasty8realestateButtonContainer()
   {
      super();
   }
   function Dynasty8realestateImgLoader()
   {
   }
   function initHitArea(_website, _hitAreaMC)
   {
      this.website = _website;
      this.textColGrey = this.website.textColGrey;
      this.textColBlack = this.website.textColBlack;
      this.hitAreaMC = _hitAreaMC;
      this.onEnterFrame = function()
      {
         this.processPropertyImages();
      };
   }
   function processPropertyImages()
   {
      var _loc3_ = this.indexCounter;
      var _loc5_;
      var _loc2_;
      var _loc4_;
      var _loc7_;
      var _loc6_;
      while(_loc3_ < this.indexCounter + this.indexSpan)
      {
         _loc5_ = this.website.sortedPropertyArray[_loc3_].INDEX;
         _loc2_ = this["property_" + _loc5_];
         if(_loc2_._y > 0)
         {
            if(this.hitAreaMC.hitTest(_loc2_) == true)
            {
               if(_loc2_.propertyListTextMC == undefined)
               {
                  _loc4_ = _loc2_.attachMovie("propertyListTextMC","propertyListTextMC",_loc2_.getNextHighestDepth());
                  _loc7_ = new Array(0,2,6,10,2,6,10,20,0,0,0,0,50);
                  _loc4_.propertyTF.htmlText = this.website.propertyArray[_loc5_].PROPERTY + "       " + _loc7_[this.website.propertyArray[_loc5_].SIZE];
                  _loc4_.carIcon._x = _loc4_.propertyTF._x + _loc4_.propertyTF.textWidth + 6;
                  _loc4_.priceTF.htmlText = this.website.formatAmount(this.website.propertyArray[_loc5_].PRICE);
                  _loc4_.locationTF.htmlText = this.website.propLocArray[this.website.propertyArray[_loc5_].LOCATION];
                  if(this.website.propertyArray[_loc5_].SALE_PRICE && this.website.propertyArray[_loc5_].SALE_PRICE != this.website.propertyArray[_loc5_].PRICE)
                  {
                     _loc4_.redLine._width = _loc4_.priceTF.textWidth + 5;
                  }
                  else
                  {
                     _loc4_.redLine._visible = false;
                  }
               }
               _loc2_.propertyListTextMC.propertyTF.textColor = !_loc2_.highlight._visible ? this.textColGrey : this.textColBlack;
               _loc2_.propertyListTextMC.carIcon._alpha = !_loc2_.highlight._visible ? 44 : 100;
               _loc2_.propertyListTextMC.priceTF.textColor = !_loc2_.highlight._visible ? this.textColGrey : this.textColBlack;
               _loc2_.propertyListTextMC.locationTF.textColor = !_loc2_.highlight._visible ? this.textColGrey : this.textColBlack;
               if(_loc2_["propertyMC" + this.website.sortedPropertyArray[_loc3_].INDEX].loadedStatus == "")
               {
                  _loc2_["propertyMC" + this.website.sortedPropertyArray[_loc3_].INDEX].updateImage(this.website.sortedPropertyArray[_loc3_].TXD);
                  _loc6_ = parseInt(this.website.sortedPropertyArray[_loc3_].TXD.substring(7));
                  this.website.addVisiblePropertyID(_loc6_);
               }
            }
            else if(_loc2_["propertyMC" + this.website.sortedPropertyArray[_loc3_].INDEX].loadedStatus == "displayed")
            {
               if(_loc2_.propertyListTextMC != undefined)
               {
                  _loc2_.propertyListTextMC.removeMovieClip();
                  _loc2_["propertyMC" + this.website.sortedPropertyArray[_loc3_].INDEX].removeImage();
                  _loc6_ = parseInt(this.website.sortedPropertyArray[_loc3_].TXD.substring(7));
                  this.website.removeVisiblePropertyID(_loc6_);
               }
            }
         }
         _loc3_ = _loc3_ + 1;
      }
      this.indexCounter += this.indexSpan;
      if(this.indexCounter >= this.website.sortedPropertyArray.length)
      {
         this.indexCounter = 0;
      }
   }
}
