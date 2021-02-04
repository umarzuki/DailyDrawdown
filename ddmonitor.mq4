//+------------------------------------------------------------------+
//|                                                    ddmonitor.mq4 |
//|                                                 Umarzuki Mochlis |
//|                                                                  |
//+------------------------------------------------------------------+
#property copyright "Umarzuki Mochlis"
#property link      ""
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+

void OnTick()
  {
//---
   double accbal;
   //set to 5 percent as per MyForexFunds rule
   double DDPercent = 0.05; 
   accbal=AccountBalance();
   double DailyDD=accbal*DDPercent;
   
   //calculations for today profit grabbed from https://www.mql5.com/en/forum/151587
   double todayprofit=0;
   datetime Openday= iTime(Symbol(),PERIOD_D1,0); 
 
   for(int xx=OrdersHistoryTotal()-1;xx>=0;xx--)
   { if(!OrderSelect(xx,SELECT_BY_POS,MODE_HISTORY))continue;
      if(OrderCloseTime()<Openday)break;
      if(OrderType()<2)todayprofit+=OrderProfit()+OrderSwap()+OrderCommission(); 
   }  
   double todaybal=accbal-todayprofit;
   double TodayMaxDailyDD=todaybal*DDPercent;
   Comment("Max Daily DD ",DoubleToStr(TodayMaxDailyDD,2));
  }
//+------------------------------------------------------------------+
