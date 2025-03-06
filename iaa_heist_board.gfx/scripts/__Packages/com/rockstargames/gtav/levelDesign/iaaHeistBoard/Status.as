class com.rockstargames.gtav.levelDesign.iaaHeistBoard.Status
{
   var index;
   var view;
   var highlight;
   static var FADE_IN_SPEED = 0.3;
   static var FADE_IN_OFFSET = 0.1;
   static var POSITIONS = [];
   function Status(index, view)
   {
      this.index = index;
      this.view = view;
      this.init();
   }
   function init()
   {
      com.rockstargames.gtav.levelDesign.iaaHeistBoard.Status.POSITIONS[this.index] = this.view._x;
      this.setLocalisedText(this.view.title,"IAA_STATUS");
      this.setLocalisedText(this.view.notReady.label,"IAA_NOT_READY");
      this.setLocalisedText(this.view.ready.label,"IAA_READY");
      this.view.notReady._visible = true;
      this.view.ready._visible = false;
      this.view.highlight._visible = false;
      this.view._visible = false;
      this.highlight = new com.rockstargames.gtav.levelDesign.iaaHeistBoard.NavigationElement(this.view.highlight,com.rockstargames.gtav.levelDesign.iaaHeistBoard.NavigationIDs["FINALE_PLAYER_" + this.index + "_STATUS"]);
      this.view._alpha = 0;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view,com.rockstargames.gtav.levelDesign.iaaHeistBoard.Status.FADE_IN_SPEED,{delay:this.index * com.rockstargames.gtav.levelDesign.iaaHeistBoard.Status.FADE_IN_OFFSET,_alpha:100});
   }
   function setLocalisedText(tf, label)
   {
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,label,tf,tf.html);
      return tf.text;
   }
   function update(player, positionIndex)
   {
      if(this.view._x != com.rockstargames.gtav.levelDesign.iaaHeistBoard.Status.POSITIONS[positionIndex])
      {
         this.view._x = com.rockstargames.gtav.levelDesign.iaaHeistBoard.Status.POSITIONS[positionIndex];
         this.highlight.updateBounds();
      }
      this.view.notReady._visible = !player.isReady;
      this.view.ready._visible = player.isReady;
      this.view._visible = player.isEnabled;
      this.highlight.enabled = player.isEnabled && player.isLocal;
   }
   function updateStatus(isReady)
   {
      this.view.notReady._visible = !isReady;
      this.view.ready._visible = isReady;
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
   }
}
