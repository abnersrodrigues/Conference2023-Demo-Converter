unit Controllers.Criptografia;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
     System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

{$region 'Declara��o das Fun��es'}
  function Criptografar(const aEntrada:string): string;
  function Descriptografar(const aEntrada:string): string;
{$endRegion}

implementation

{$region 'Criptografar'}
function Criptografar(const aEntrada:string): string;
Var i, iQtdeEnt, iIntervalo:Integer;
    sSaida:String;
    sProximoCaracter :String;
begin
  iIntervalo:= 6;

  if (aEntrada <> EmptyStr) then
  begin
    iQtdeEnt    := Length(aEntrada);
    for i  := iQtdeEnt downto 1 do //Faz o Loop Contr�rio
    begin
      sProximoCaracter  := Copy(aEntrada, i, 1);
      sSaida := sSaida + (char(ord(sProximoCaracter[1])+iIntervalo));
    end;
  end;

  Result:= sSaida;
end;
{$endregion}

{$region 'Descriptografar'}
function Descriptografar(const aEntrada:string): string;
Var i, iQtdeEnt, iIntervalo:Integer;
    sSaida:String;
    sProximoCaracter :String;
begin
  iIntervalo := 6;
  if (aEntrada <> EmptyStr) then begin
    iQtdeEnt := Length(aEntrada);

    for i := iQtdeEnt downto 1 do
    begin
      sProximoCaracter  := Copy(aEntrada, i, 1);
      sSaida := sSaida + (char(ord(sProximoCaracter[1])-iIntervalo));
    end;
  end;

  Result:= sSaida;
end;
{$endregion}

end.
