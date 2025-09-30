class com.rockstargames.gtav.web.warstock.HackerPage
{
   var buttons;
   var progressPanel;
   var view;
   var website;
   static var TXD = "CANDC_HACKER";
   function HackerPage(view, website, progressPanel)
   {
      this.view = view;
      this.website = website;
      this.progressPanel = progressPanel;
      this.init();
   }
   function init()
   {
      this.buttons = [];
      this.buttons = this.buttons.concat(this.progressPanel.buttons);
   }
   function setLocalisedText(tf, label, forceUpperCase)
   {
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,label,tf,tf.html);
      if(forceUpperCase)
      {
         tf.text = tf.text.toUpperCase();
      }
      return tf.text;
   }
   function handleClick(id, attribute)
   {
   }
   function enable()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.buttons.length)
      {
         this.buttons[_loc2_]._parent.disabled = false;
         _loc2_ = _loc2_ + 1;
      }
   }
   function disable()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.buttons.length)
      {
         this.buttons[_loc2_]._parent.disabled = true;
         _loc2_ = _loc2_ + 1;
      }
   }
   function dispose()
   {
      this.view = null;
      this.website = null;
      this.progressPanel = null;
      this.buttons = null;
   }
}
