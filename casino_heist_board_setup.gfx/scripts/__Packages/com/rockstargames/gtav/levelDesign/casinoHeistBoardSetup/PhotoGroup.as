class com.rockstargames.gtav.levelDesign.casinoHeistBoardSetup.PhotoGroup
{
   var colWidth;
   var numCols;
   var numPhotos;
   var photoLinkage;
   var randomR;
   var randomX;
   var randomY;
   var rowHeight;
   var view;
   var xOffset;
   var yOffset;
   static var MAX_TITLE_WIDTH = 100;
   function PhotoGroup(view, titleLabel, photoLinkage, numCols, colWidth, rowHeight, xOffset, yOffset, randomX, randomY, randomR)
   {
      this.view = view;
      this.photoLinkage = photoLinkage;
      this.numCols = numCols;
      this.colWidth = colWidth;
      this.rowHeight = rowHeight;
      this.xOffset = xOffset;
      this.yOffset = yOffset;
      this.randomX = randomX;
      this.randomY = randomY;
      this.randomR = randomR;
      this.numPhotos = 0;
      view.title.label.autoSize = "left";
      com.rockstargames.gtav.levelDesign.CASINO_HEIST_BOARD_SETUP.setLocalisedText(view.title.label,titleLabel);
      var _loc3_;
      var _loc4_;
      if(view.title.label._width > com.rockstargames.gtav.levelDesign.casinoHeistBoardSetup.PhotoGroup.MAX_TITLE_WIDTH)
      {
         _loc3_ = view.title.label.getTextFormat();
         _loc3_.align = "center";
         view.title.label.setTextFormat(_loc3_);
         _loc4_ = view.title.label._y + view.title.label._height;
         view.title.label._width = com.rockstargames.gtav.levelDesign.casinoHeistBoardSetup.PhotoGroup.MAX_TITLE_WIDTH;
         view.title.label.wordWrap = true;
         view.title.label.multiline = true;
         view.title.label._y = _loc4_ - view.title.label._height;
      }
      view.title.rightAsterisk._x = view.title.label._x + view.title.label._width;
      view.title._x = -0.5 * view.title._width;
   }
   function addPhotos(frames)
   {
      var _loc3_ = 0;
      var _loc7_ = frames.length;
      var _loc4_;
      var _loc2_;
      var _loc6_;
      var _loc5_;
      while(_loc3_ < _loc7_)
      {
         _loc4_ = this.view.getNextHighestDepth();
         _loc2_ = this.view.attachMovie(this.photoLinkage,"photo" + _loc4_,_loc4_);
         _loc6_ = this.numPhotos % this.numCols * this.colWidth + this.xOffset;
         _loc5_ = Math.floor(this.numPhotos / this.numCols) * this.rowHeight + this.yOffset;
         _loc6_ += Math.random() * 2 * this.randomX - this.randomX;
         _loc5_ += Math.random() * 2 * this.randomY - this.randomY;
         _loc2_.gotoAndStop(frames[_loc3_]);
         _loc2_._x = _loc6_;
         _loc2_._y = _loc5_;
         _loc2_._rotation = Math.random() * 2 * this.randomR - this.randomR;
         this.numPhotos = this.numPhotos + 1;
         _loc3_ = _loc3_ + 1;
      }
   }
}
