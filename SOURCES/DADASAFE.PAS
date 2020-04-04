program dadarun;
uses crt;
var s:string;
    a:char;
    toask,again,r,ima,compt,nbr,X,Y,avance,stoprace,winner,finline,fincol,refreshrate,remember:integer;
    b100,b50,b20,p10,p5,p1,bb100,bb50,bb20,pp10,pp5,pp1,choix,cheval:longint;
    chevalx: array[1..10] of integer;
    chevaly:array[1..10] of integer;
    cote,valeurdonnee,gain,Totalcaisse:real;

procedure drwtrack;
var gol:integer;
begin
gotoxy(1,3);
writeln('ÚÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿');
writeln('');
gol:=3;
repeat
gol:=gol+2;
gotoxy(1,gol); 
writeln('ÃÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´');
writeln('');
until gol=21;
writeln('ÀÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ');
end;

procedure menu(aide:string);
begin
gotoxy(1,1);
writeln('ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»');
writeln('º                                                                            º');
write('ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼');
gotoxy(1,22);
writeln('ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»');
writeln('º                                                                            º');
write('ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼');
gotoxy(2,23);
write(aide);
end;

procedure windrw(title:string; help:string);
begin
gotoxy(20,7);
write('ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»');
for r:=8 to 12 do
begin
gotoxy(20,r);
write('º                                     º');
end;
gotoxy(20,13);
write('ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹');
gotoxy(20,14);
write('º                                     º');
gotoxy(20,15);
write('ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼');
gotoxy(21,7);
write(title);
gotoxy(21,14);
write(help);
end;

procedure dialog(title:string; txt:string; help:string; delai:integer);
begin
ima:=1;
windrw(title,help);
nbr:=trunc(length(txt)/35);
nbr:=trunc(nbr+1);
for compt:=0 to nbr do
begin
gotoxy(21,9+compt);
write(copy(txt,ima,35));
ima:=ima+35;
end;
if delai<>0 then
delay(delai*1000)
else
begin
repeat
until readkey<>#0;
end;
end;

{Chaque ligne contient 35 caract‚res.}


procedure request(title:string; toprint:string; help:string);
begin
repeat
windrw(title,help);
gotoxy(21,9);
writeln(toprint);
gotoxy(40,11);
{$I-}
read(toask);
{$I+}
until ioresult=0;
end;

{Dans toprint est stock‚ le txt accompagnant la saisie}
{Exemple : Quel est votre ƒge ?}
{La saisie est stock‚e dans la variable globale toask}


procedure finalmenu(items:string; v,b,n:char);
begin
gotoxy(6,2);
write(items);
repeat
a:=readkey;
a:=upcase(a);
until (a=v) or (a=b) or (a=n);
if a=v then
choix:=1;
if a=b then
choix:=2;
if a=n then
choix:=3;
end;

{Cette proc‚dure g‚re les ‚v‚nements menus}


begin
textcolor(white);
textbackground(black);
clrscr;
bb100:=0;bb50:=0;bb20:=0;pp10:=0;pp5:=0;pp1:=0;totalcaisse:=0;Valeurdonnee:=0;
repeat
request(' DADARUN v1.0 ',' IDCode Administrateur ?',' Entrez votre code IDCode.');
until toask=1980;
request(' Requˆte du systŠme ','  CPU=486(1), 586(2) ou 686(3) ?',' Tapez le nø du CPU du PC.');
case toask of
1:refreshrate:=5;
2:refreshrate:=50;
3:refreshrate:=1000;
else
refreshrate:=50;
end;
dialog(' Course de chevaux ','      Alimentation de la caisse.',' Appuyez sur une touche...',0);
request(' Course de chevaux ','      ş Billets de 100 francs ?',' Entrez un nombre.');
b100:=toask;
request(' Course de chevaux ','      ş Billets de 50 francs ?',' Entrez un nombre.');
b50:=toask;
request(' Course de chevaux ','      ş Billets de 20 francs ?',' Entrez un nombre.');
b20:=toask;
request(' Course de chevaux ','      ş PiŠces de 10 francs ?',' Entrez un nombre.');
p10:=toask;
request(' Course de chevaux ','      ş PiŠces de 5 francs ?',' Entrez un nombre.');
p5:=toask;
request(' Course de chevaux ','      ş PiŠces de 1 franc ?',' Entrez un nombre.');
p1:=toask;
Totalcaisse:=(b100*100)+(b50*50)+(b20*20)+(p10*10)+(p5*5)+(p1*1);
str(totalcaisse:2:0,s);
dialog(' Course de chevaux ',concat('   Total de la caisse : ',s,' Francs'),' Appuyez sur une touche...',0);
repeat
textcolor(white);
textbackground(black);
clrscr;
choix:=0;
clrscr;
menu(' S‚l‚ctionnez une option (M, C ou Q).');
finalmenu(' Miser      Caisse      Quitter','M','C','Q');
Case choix of

     1:Begin
            Clrscr;
            dialog(' Course de chevaux ','                Mise',' Appuyez sur une touche...',0);
            Randomize;
            cote:=random(4)+1;
            cote:=cote+(0.1*random(9)+1);
            cote:=cote+(0.01*random(9)+1);
            str(cote:2:2,s);
            dialog(' Course de chevaux ',concat('         La cote est de ',s,'.'),' Appuyez sur une touche...',0);
            request(' Course de chevaux ','      ş Billets de 100 francs ?',' Entrez un nombre.');
            bb100:=toask;
            request(' Course de chevaux ','      ş Billets de 50 francs ?',' Entrez un nombre.');
            bb50:=toask;
            request(' Course de chevaux ','      ş Billets de 20 francs ?',' Entrez un nombre.');
            bb20:=toask;
            request(' Course de chevaux ','      ş PiŠces de 10 francs ?',' Entrez un nombre.');
            pp10:=toask;
            request(' Course de chevaux ','      ş PiŠces de 5 francs ?',' Entrez un nombre.');
            pp5:=toask;
            request(' Course de chevaux ','      ş PiŠces de 1 franc ?',' Entrez un nombre.');
            pp1:=toask;
            Valeurdonnee:=(bb100*100)+(bb50*50)+(bb20*20)+(pp10*10)+(pp5*5)+(pp1*1);
            str(valeurdonnee:2:0,s);
            dialog(' Course de chevaux ',concat('    La mise s''‚lŠve … ',s,' Francs'),' Appuyez sur une touche...',0);
            request(' Course de chevaux ','    Quel cheval choisissez-vous ?',' Entrez un chiffre.');
            cheval:=toask;
            clrscr;
            randomize;
            stoprace:=0;
            textcolor(white);
            textbackground(green);
            for finline:=2 to 24 do
            for fincol:=1 to 79 do
            begin
            gotoxy(fincol,finline);
            textcolor(green);
            writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
            end;
            for finline:=4 to 22 do
            begin
            textcolor(white);
            gotoxy(70,finline);
            write('°');
            end;

            for X:=1 to 10 do
            chevalx[X]:=2;

            for Y:=2 to 11 do
            begin
            r:=y-1;
            chevaly[r]:=y*2;
            gotoxy(chevalx[r],chevaly[r]);
            write(r);
            end;
            drwtrack;
            gotoxy(2,24);
            str(cheval,s);
            write(' Vous avez pari‚ sur le nø',s,'.');
            gotoxy(2,2);
            write('Prˆt ?');
            delay(refreshrate*50);
            gotoxy(2,2);
            write('Feu !   ');
            delay(refreshrate*50);
            gotoxy(2,2);
            write('Partez !');
            delay(refreshrate*50);

            for again:=2 to 11 do
            begin
            gotoxy(2,again*2);
            write('  ');
            end;

            remember:=0;
            repeat
            for avance:=10 downto 1 do
            begin
            chevalx[avance]:=chevalx[avance]+trunc(random(3)+1);
            gotoxy(chevalx[avance],chevaly[avance]);
            write('     ',avance);
            if chevalx[avance]>remember then
            begin
            remember:=chevalx[avance];
            gotoxy(2,2);
            str(avance,s);
            write('Le cheval nø',s,' prend la tˆte de la course !');
            end;
            delay(refreshrate);
            if chevalx[avance]>=60 then
            begin
            for finline:=2 to 11 do
            begin
            gotoxy(70,finline*2);
            writeln('°');
            end;
            end;
            if chevalx[avance]>=70 then
            begin
            stoprace:=1;
            winner:=avance;
            end;
            end;
            until stoprace=1;
            gotoxy(2,2);
            write('La course est termin‚e !!                         ');
            str(winner,s);
            dialog(' Course de chevaux ',concat('  Le cheval gagnant est le nø',s,'.'),' Appuyez sur une touche...',0);
            if (winner=cheval) and (valeurdonnee>totalcaisse) then
            begin
            dialog(' Course de chevaux ','  Vous avez gagn‚ !!!',' Appuyez sur une touche...',0);
            dialog(' Course de chevaux ','  Je vous imprime un ch‚que.',' Gros ch‚que en vue !!!',0);
            gain:=valeurdonnee*cote;
            str(gain:2:0,s);
            dialog(' Course de chevaux ',concat('  Gain : ',s,' Francs.'),' Appuyez sur une touche...',0);
            end;
            if (winner=cheval) and (valeurdonnee<=totalcaisse) then
            begin
            dialog(' Course de chevaux ','  Vous avez gagn‚ !!!',' Gros ch‚que en vue !!!',0);
            b100:=b100-bb100;
            b50:=b50-bb50;
            b20:=b20-bb20;
            p10:=p10-pp10;
            p5:=p5-pp5;
            p1:=p1-pp1;
            totalcaisse:=b100+b50+b20+p10+p5+p1;
            gain:=valeurdonnee*cote;
            str(gain:2:0,s);
            dialog(' Course de chevaux ',concat('  Gain : ',s,' Francs.'),' Appuyez sur une touche...',0);
            end;
            if winner<>cheval then
            begin
            dialog(' Course de chevaux ','  Vous avez perdu :-(',' Par ici la monnaie !',0);
            b100:=b100+bb100;
            b50:=b50+bb50;
            b20:=b20+bb20;
            p10:=p10+pp10;
            p5:=p5+pp5;
            p1:=p1+pp1;
            totalcaisse:=b100+b50+b20+p10+p5+p1;
            gain:=valeurdonnee*cote;
            str(gain:2:0,s);
            dialog(' Course de chevaux ',concat('  Perte : ',s,' Francs.'),' Appuyez sur une touche...',0);
            end;
       End;
     
     2:Begin
            Clrscr;
            request(' Requˆte du systŠme ',' IDCode Administrateur ?',' Entrez votre code IDCode.');
            if toask=1980 then
            begin
            dialog(' Course de chevaux ','         Etat de la caisse',' Appuyez sur une touche...',0);
            str(b100,s);
            dialog(' Course de chevaux ',concat(' ş Billets de 100 francs : ',s),' Appuyez sur une touche...',0);
            str(b50,s);
            dialog(' Course de chevaux ',concat(' ş Billets de 50 francs : ',s),' Appuyez sur une touche...',0);
            str(b20,s);
            dialog(' Course de chevaux ',concat(' ş Billets de 20 francs : ',s),' Appuyez sur une touche...',0);
            str(p10,s);
            dialog(' Course de chevaux ',concat(' ş PiŠces de 10 francs : ',s),' Appuyez sur une touche...',0);
            str(p5,s);
            dialog(' Course de chevaux ',concat(' ş PiŠces de 5 francs : ',s),' Appuyez sur une touche...',0);
            str(p1,s);
            dialog(' Course de chevaux ',concat(' ş PiŠces de 1 franc : ',s),' Appuyez sur une touche...',0);
            Totalcaisse:=Totalcaisse+Valeurdonnee;
            str(totalcaisse:2:0,s);
            dialog(' Course de chevaux ',concat('  Total de la caisse : ',s,' francs.'),' Appuyez sur une touche...',0);
            end;
            if toask<>1980 then
            dialog(' Message du systŠme ','  L''IDCode saisi n''est pas valide.',' Appelez un agent TME Software.',0);
End;

          3:Begin
            Clrscr;
            request(' Requˆte du systŠme ',' IDCode Administrateur ?',' Entrez votre code IDCode.');
            if toask=1980 then
            dialog(' Course de chevaux ','----->>> A bient“t ;-)',' Appuyez sur une touche...',0)
            else
            begin
            dialog(' Message du systŠme ','  L''IDCode saisi n''est pas valide.',' Appelez un agent TME Software.',0);
            choix:=0;
            end;
            End;
End;
until choix=3;
end.