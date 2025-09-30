class com.rockstargames.gtav.web.TICKERTAPE extends MovieClip
{
   var TICKER;
   var onEnterFrame;
   var tickerText;
   var tickerTextDuplicate;
   function TICKERTAPE()
   {
      super();
      this.TICKER = this;
      this.tickerText = this.TICKER.tickerTextField;
      this.tickerText.html = true;
      this.tickerTextDuplicate = this.TICKER.tickerTextFieldDuplicate;
      this.tickerTextDuplicate.html = true;
   }
   function SET_TICKER_TEXT(scrollSpeed, displyText)
   {
      this.tickerText.htmlText = displyText;
      this.tickerText.autoSize = "left";
      this.tickerTextDuplicate.htmlText = displyText;
      this.tickerTextDuplicate.autoSize = "left";
      this.tickerTextDuplicate._x = this.tickerText._x + this.tickerText.textWidth;
      if(scrollSpeed == undefined)
      {
         scrollSpeed = 1;
      }
      this.Scroll(scrollSpeed);
   }
   function Scroll(speed)
   {
      this.onEnterFrame = function()
      {
         this.tickerText._x -= speed;
         this.tickerTextDuplicate._x -= speed;
         if(this.tickerText._x <= this._x - this.tickerText.textWidth)
         {
            this.tickerText._x = this._x;
            this.tickerTextDuplicate._x = this._x + this.tickerText.textWidth;
         }
      };
   }
}
