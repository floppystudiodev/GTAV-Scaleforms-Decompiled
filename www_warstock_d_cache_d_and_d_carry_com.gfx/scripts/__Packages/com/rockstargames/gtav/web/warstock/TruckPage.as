class com.rockstargames.gtav.web.warstock.TruckPage
{
   var buttons;
   var progressPanel;
   var view;
   var website;
   static var VOID_MODULE = 0;
   static var MODULE_DATA = [{type:1,label:"CANDC_EMPTY",locations:[2,4],costIndexes:[5,5],unique:false},{type:2,label:"CANDC_LIVING_QTRS",locations:[1,2,4],costIndexes:[6,11,11],unique:false},{type:3,label:"CANDC_CMD_CENTRE",locations:[1],costIndexes:[7],unique:true},{type:4,label:"CANDC_ARMORY",locations:[2,4],costIndexes:[8,8],unique:true},{type:5,label:"CANDC_VMOD_ARMORY",locations:[6],costIndexes:[9],unique:false},{type:6,label:"CANDC_VSTORAGE",locations:[4],costIndexes:[10],unique:true}];
   static var TXD = "CANDC_TRUCK";
   static var DROPDOWN_ITEM_SPACING = 47;
   static var DROPDOWN_HEADER_OFFSET = 48;
   static var DROPDOWN_ON_TEXT_COLOUR = 16777215;
   static var DROPDOWN_OFF_TEXT_COLOUR = 16777215;
   function TruckPage(view, website, progressPanel)
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
