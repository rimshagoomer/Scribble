function num=convert(pred)
   if pred>=11&&pred<=36
       num=54+pred;
   elseif pred>=1&&pred<=10
        num=pred+47;
   elseif pred>=37&&pred<=62
        num=60+pred;
   end
