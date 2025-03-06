class com.rockstargames.gtav.web.buttons.WebButton extends MovieClip
{
   var browser;
   var buttonType = -1;
   var isBrowserButton = false;
   var disabled = false;
   var topLevel = false;
   function WebButton()
   {
      super();
      this.browser = _level0.TIMELINE;
   }
   function buttonEvent()
   {
   }
   function SHOW(xPos)
   {
      this._visible = true;
      this.disabled = false;
      this._x = xPos;
   }
   function HIDE()
   {
      this._visible = false;
      this.disabled = true;
      this._x = 1300;
   }
}
