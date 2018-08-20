unit main;

{$mode objfpc}{$H+}



interface

uses
  Classes, SysUtils, fpcgi, fpjson, HTTPDefs, fastplaz_handler, database_lib
  ;

type
  TMainModule = class(TMyCustomWebModule)
  private

    procedure BeforeRequestHandler(Sender: TObject; ARequest: TRequest);
  public
    constructor CreateNew(AOwner: TComponent; CreateMode: integer); override;
    destructor Destroy; override;

    procedure Get; override;
    procedure Post; override;
  end;

implementation

uses json_lib, common;

constructor TMainModule.CreateNew(AOwner: TComponent; CreateMode: integer);
begin
  inherited CreateNew(AOwner, CreateMode);
  BeforeRequest := @BeforeRequestHandler;
end;

destructor TMainModule.Destroy;
begin
  inherited Destroy;
end;

// Init First
procedure TMainModule.BeforeRequestHandler(Sender: TObject; ARequest: TRequest);
begin

end;

// GET Method Handler
procedure TMainModule.Get;
begin

end;

// POST Method Handler
// CURL example:
//   curl -X POST -H "Authorization: Basic dW5hbWU6cGFzc3dvcmQ=" "yourtargeturl"
procedure TMainModule.Post;
var
  json : TJSONUtil;
  authstring : string;
begin
  authstring := Header['Authorization'];
  if authstring <> 'YourAuthKey' then
  begin
    //
  end;
  json := TJSONUtil.Create;

  json['code'] := Int16(0);
  json['data'] := 'yourdatahere';
  json['path01/path02/var01'] := 'value01';
  json['path01/path02/var02'] := 'value02';
  CustomHeader[ 'ThisIsCustomHeader'] := 'datacustomheader';

  //---
  Response.Content := json.AsJSON;
  json.Free;
end;



end.

