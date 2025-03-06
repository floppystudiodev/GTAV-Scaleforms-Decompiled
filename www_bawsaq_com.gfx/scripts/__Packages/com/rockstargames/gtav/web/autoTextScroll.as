class com.rockstargames.gtav.web.autoTextScroll extends MovieClip
{
   var textContainer;
   var targetTF;
   var maxscr;
   var direction = 1;
   var delay = 0;
   function autoTextScroll()
   {
      super();
      this.textContainer = this;
      this.targetTF = this.textContainer.companyName;
   }
   function onEnterFrame()
   {
      this.maxscr = this.targetTF.maxhscroll;
      if(this.maxscr > 0)
      {
         this.targetTF.hscroll += this.direction;
         var _loc2_ = this.targetTF.hscroll;
         if(_loc2_ == this.maxscr || _loc2_ == 0)
         {
            this.delay = this.delay + 1;
         }
         if(this.delay > 100)
         {
            this.direction = - this.direction;
            this.delay = 0;
         }
      }
   }
}
