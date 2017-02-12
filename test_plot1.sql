 CREATE OR REPLACE FUNCTION f_graph() RETURNS text AS
'
 str <- pg.spi.exec("select x as a, y as b from temp");
 pdf("D:/plot.pdf");
 plot(str,type="l", main="Graphics Demonstrations",sub="Line Graph");
 dev.off();
 print("done");
'
LANGUAGE 'plr';

select f_graph();