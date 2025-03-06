class com.rockstargames.gtav.Multiplayer.MP_BOUNTY_BOARD extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
   var BOUNTY;
   var CONTENT;
   var _texture;
   var loaderObject;
   var thisObj;
   function MP_BOUNTY_BOARD()
   {
      super();
   }
   function INITIALISE(mc)
   {
      this.BOUNTY = this.CONTENT.BOUNTY;
   }
   function SET_BOUNTY(bountysName, bountValue, bountyCharacterTexture, bountyCharacterDictionary)
   {
      this.BOUNTY.nameTF.text = bountysName;
      this.BOUNTY.valueTF.text = "$" + bountValue.toString();
      this._texture = bountyCharacterTexture;
      com.rockstargames.ui.game.GameInterface.call("REQUEST_TXD",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"MP_BOUNTY_BOARD",bountyCharacterDictionary);
   }
   function loadComponent(txd, texture)
   {
      var thisObj = this;
      this.loaderObject._depth = 100;
      this.loaderObject._mc = this.BOUNTY.picMC;
      this.loaderObject._loader = new MovieClipLoader();
      this.loaderObject._listener = new Object();
      this.loaderObject._loader.addListener(this.loaderObject._listener);
      this.loaderObject._listener.thisObj = thisObj;
      this.loaderObject._listener.onLoadInit = function(target_mc)
      {
         var _loc2_ = this.thisObj.loaderObject;
         _loc2_._loader.removeListener(_loc2_._listener);
         _loc2_._loader = null;
      };
      var _loc3_ = "img://" + txd + "/" + texture;
      this.loaderObject._loader.loadClip(_loc3_,this.loaderObject._mc);
   }
   function TXD_HAS_LOADED(textureDict, success)
   {
      if(success)
      {
         this.loadComponent(textureDict,this._texture);
      }
   }
}
