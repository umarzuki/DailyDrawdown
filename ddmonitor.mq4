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
   //accbal=100.00;
   //Comment("Balance: ");
   double DDPercent = 0.05;
   accbal=AccountBalance();
   double DailyDD=accbal*DDPercent;
   Comment("Balance: ",accbal,"\nMax Daily DD ",DailyDD);
  }
//+------------------------------------------------------------------+
