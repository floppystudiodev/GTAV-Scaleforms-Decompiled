class com.rockstargames.gtav.utils.GTAVUIUtils
{
   function GTAVUIUtils()
   {
   }
   static function getAdjustedSegmentPct(pct, segmentW, gapW, numSegments)
   {
      var _loc1_ = segmentW * numSegments;
      var _loc2_ = _loc1_ + gapW * (numSegments - 1);
      var _loc5_ = 100 / numSegments;
      var _loc4_ = pct / 100;
      var _loc6_ = (Math.floor(pct / _loc5_) * gapW + _loc4_ * _loc1_) / _loc2_ * 100;
      return _loc6_;
   }
   static function parseHTMLForFonts(str, stdPtSize)
   {
      str = str.split("<C>").join("<FONT FACE=\'" + com.rockstargames.gtav.utils.GTAVUIConfig.CONDENSED_FONT + "\' SIZE=\'" + (stdPtSize + 3) + "\'>");
      str = str.split("</C>").join("<FONT FACE=\'" + com.rockstargames.gtav.utils.GTAVUIConfig.DEFAULT_FONT + "\' SIZE=\'" + stdPtSize + "\'>");
      return str;
   }
   static function colourRankIcon(rankMC)
   {
      com.rockstargames.ui.utils.Colour.ApplyHudColour(rankMC.innerMC,116);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(rankMC.bgMC,2);
   }
   static function trimTextToFit(str, tf)
   {
      var _loc1_ = str;
      var _loc3_ = "...";
      if(tf.multiline)
      {
         tf.text = _loc1_;
         if(tf.textHeight > tf._height)
         {
            _loc1_ = _loc1_.substr(0,_loc1_.length * tf._height / tf.textHeight);
            tf.text = _loc1_ + _loc3_;
            if(tf.textHeight <= tf._height)
            {
               while(tf.textHeight <= tf._height)
               {
                  _loc1_ += str.charAt(_loc1_.length);
                  tf.text = _loc1_ + _loc3_;
               }
               _loc1_ = _loc1_.substr(0,_loc1_.length - 1);
            }
            else
            {
               while(tf.textHeight > tf._height)
               {
                  _loc1_ = _loc1_.substr(0,_loc1_.length - 1);
                  tf.text = _loc1_ + _loc3_;
               }
            }
            _loc1_ += _loc3_;
         }
      }
      else
      {
         tf.text = _loc1_;
         if(tf.textWidth > tf._width)
         {
            _loc1_ = _loc1_.substr(0,_loc1_.length * tf._width / tf.textWidth);
            tf.text = _loc1_ + _loc3_;
            if(tf.textWidth < tf._width)
            {
               while(tf.textWidth < tf._width)
               {
                  _loc1_ += str.charAt(_loc1_.length);
                  tf.text = _loc1_ + _loc3_;
               }
               _loc1_ = _loc1_.substr(0,_loc1_.length - 1);
            }
            else
            {
               while(tf.textWidth >= tf._width)
               {
                  _loc1_ = _loc1_.substr(0,_loc1_.length - 1);
                  tf.text = _loc1_ + _loc3_;
               }
            }
            _loc1_ += _loc3_;
         }
      }
      return _loc1_;
   }
   static function trimTextToFitNumLines(str, tf, numLines, isHTMLText)
   {
      var _loc5_ = str;
      if(tf.autoSize != "none")
      {
         com.rockstargames.gtav.utils.GTAVUIUtils.setText(tf,_loc5_,isHTMLText);
         if(tf.bottomScroll - tf.scroll + 1 > numLines)
         {
            var _loc6_ = "...";
            var _loc7_ = _loc6_.length;
            var _loc4_ = 0;
            var _loc3_ = _loc5_.length - 1;
            var _loc1_ = Math.floor((_loc4_ + _loc3_) / 2);
            while(_loc4_ <= _loc3_)
            {
               _loc5_ = str.substring(0,_loc1_ - _loc7_) + _loc6_;
               com.rockstargames.gtav.utils.GTAVUIUtils.setText(tf,_loc5_,true);
               if(tf.bottomScroll - tf.scroll + 1 > numLines)
               {
                  _loc3_ = _loc1_ - 1;
               }
               else
               {
                  _loc4_ = _loc1_ + 1;
               }
               _loc1_ = Math.floor((_loc4_ + _loc3_) / 2);
            }
         }
      }
      return _loc5_;
   }
   static function setText(textField, str, isHTML)
   {
      if(isHTML)
      {
         textField.htmlText = str;
      }
      else
      {
         textField.text = str;
      }
   }
   static function getLastValidCharByIndex(str, isHTML, index)
   {
      if(isHTML)
      {
         if(str.charAt(index) == ">")
         {
            while(index >= 0 && str.charAt(index) != "<")
            {
               index = index - 1;
            }
            index = index - 1;
            return index;
         }
      }
      return index;
   }
   static function removeCharAt(str, index)
   {
      if(index == 0)
      {
         return str.substring(1,str.length);
      }
      if(index == str.length - 1)
      {
         return str.substring(0,str.length - 1);
      }
      var _loc4_ = "";
      var _loc3_ = "";
      _loc4_ = str.substring(0,index);
      _loc3_ = str.substring(index + 1,str.length);
      return _loc4_.concat(_loc3_);
   }
   static function getFontSizeToFitSingle(str, tf)
   {
      tf.text = str;
      var _loc2_ = tf.getTextFormat();
      if(tf.multiline)
      {
         do
         {
            tf.setNewTextFormat(_loc2_);
            tf.text = str;
            _loc2_.size = _loc2_.size - 1;
         }
         while(tf.bottomScroll - tf.scroll > 0 && _loc2_.size > 0);
         
      }
      return _loc2_.size;
   }
}
