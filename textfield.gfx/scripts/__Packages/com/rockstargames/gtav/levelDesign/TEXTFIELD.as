class com.rockstargames.gtav.levelDesign.TEXTFIELD extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
   var CONTENT;
   var tf;
   var bgMC;
   var imageLoader;
   var blipLayerMC;
   static var GFX_NAME = "textfield";
   function TEXTFIELD()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.CONTENT._visible = false;
      this.tf = this.CONTENT.tf;
      this.tf.autoSize = "left";
      this.bgMC = this.CONTENT.bgMC;
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
   }
   function SET_BACKGROUND_IMAGE(txd, txn, alpha)
   {
      if(!this.imageLoader)
      {
         this.imageLoader = com.rockstargames.ui.media.ImageLoaderMC(this.CONTENT.attachMovie("GenericImageLoader","GenericImageLoader",this.CONTENT.getNextHighestDepth(),{_x:this.bgMC._x,_y:this.bgMC._y,_width:this.bgMC._width,_height:this.bgMC._height}));
      }
      if(this.imageLoader.getDepth() > this.tf.getDepth())
      {
         this.imageLoader.swapDepths(this.tf.getDepth());
      }
      if(this.imageLoader.textureDict == txd && this.imageLoader.isLoaded)
      {
         this.imageLoader.init(com.rockstargames.gtav.levelDesign.TEXTFIELD.GFX_NAME,txd,txn,this.bgMC._width,this.bgMC._height,this.bgMC._x,this.bgMC._y);
         this.imageLoader.displayTxdResponse(txd);
      }
      else
      {
         this.startNewTextureLoad(txd,txn);
      }
      if(alpha != undefined)
      {
         this.imageLoader._alpha = alpha;
      }
      else
      {
         this.imageLoader._alpha = 100;
      }
      this.bgMC._visible = false;
   }
   function SET_TEXT_POINT_SIZE(size)
   {
      var _loc2_ = this.tf.getTextFormat();
      _loc2_.size = size;
      this.tf.setTextFormat(_loc2_);
      this.resizeBackground();
   }
   function SET_TEXT(str)
   {
      if(str == "")
      {
         this.CONTENT._visible = false;
      }
      else
      {
         this.CONTENT._visible = true;
         var _loc2_ = this.tf.getTextFormat();
         var _loc3_ = new com.rockstargames.ui.utils.Text();
         if(this.blipLayerMC)
         {
            this.blipLayerMC.removeMovieClip();
         }
         this.blipLayerMC = this.CONTENT.createEmptyMovieClip("blipLayerMC",this.CONTENT.getNextHighestDepth(),{_x:this.tf._x,_y:this.tf._y});
         _loc3_.setTextWithIcons(str,this.blipLayerMC,this.tf,0,_loc2_.size,2,false);
         this.tf.setTextFormat(_loc2_);
         this.resizeBackground();
      }
   }
   function CLEAR_BACKGROUND_IMAGE()
   {
      this.bgMC._visible = true;
      if(this.imageLoader.isLoaded)
      {
         this.imageLoader.removeTxdRef();
      }
   }
   function ADD_TXD_REF_RESPONSE(textureDict, uniqueID, success)
   {
      com.rockstargames.ui.utils.Debug.log("ADD_TXD_REF_RESPONSE: " + arguments);
      if(success)
      {
         this.imageLoader.displayTxdResponse();
      }
   }
   function startNewTextureLoad(txd, txn)
   {
      if(txd != undefined && txn != undefined && txd != "" && txn != "")
      {
         if(this.imageLoader.isLoaded)
         {
            this.imageLoader.removeTxdRef();
         }
         this.imageLoader.init(com.rockstargames.gtav.levelDesign.TEXTFIELD.GFX_NAME,txd,txn,this.bgMC._width,this.bgMC._height,this.bgMC._x,this.bgMC._y);
         this.imageLoader.addTxdRef(String(this));
      }
   }
   function resizeBackground()
   {
      this.bgMC._height = this.tf.textHeight + 9;
      this.imageLoader._height = this.bgMC._height;
   }
}
