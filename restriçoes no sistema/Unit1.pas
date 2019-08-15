unit Unit1;

interface

uses
 Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
 Dialogs, Registry;

const
 SISTEMA = 'software\Microsoft\Windows\CurrentVersion\Policies\System';
 EXPLORER = 'Software\Microsoft\Windows\CurrentVersion\Policies\Explorer';
 NETWORK = 'Software\Microsoft\Windows\CurrentVersion\Policies\Network';
 UNINSTALL = 'Software\Microsoft\Windows\CurrentVersion\Policies\Uninstall';
 DOS = 'Software\Policies\Microsoft\Windows\System';
 
type
 TForm1 = class(TForm)
 private
  { Private declarations }
 public
  { Public declarations }
 end;
 
var
 Form1: TForm1;
 
implementation

{$R *.dfm}

procedure RestringirVideo(UmParaSimZeroParaNao: Integer);
var
 key: TRegistry;
begin
 key := TRegistry.Create;
 key.RootKey := HKEY_CURRENT_USER;
 key.OpenKey(SISTEMA, TRUE);
 
 //Desabilita p�gina do papel de parede
 key.WriteInteger('NoDispBackgroundPage', UmParaSimZeroParaNao);
 //Desabilita p�gina da apar�ncia
 key.WriteInteger('NoDispAppearancePage', UmParaSimZeroParaNao);
 //Desabilita p�gina da prote��o de tela
 key.WriteInteger('NoDispScrSavPage', UmParaSimZeroParaNao);
 //Desabilita p�gina Configura��es
 key.WriteInteger('NoDispSettingsPage', UmParaSimZeroParaNao);
 //Deabilita toda propriedade do video
 key.WriteInteger('NoDispCPL', UmParaSimZeroParaNao);
 
 key.CloseKey;
end;

procedure RestringirDesktop(UmParaSimZeroParaNao: Integer);
var
 key: TRegistry;
begin
 key := TRegistry.Create;
 key.RootKey := HKEY_CURRENT_USER;
 key.OpenKey(EXPLORER, TRUE);
 //N�o mostrar �cones do Desktop
 key.WriteInteger('NoDeskTop', UmParaSimZeroParaNao);
 //Desabilita o active Desktop (essa eu n�o testei ainda)
 key.WriteInteger('NoActiveDesktop', UmParaSimZeroParaNao);
 key.CloseKey;
end;

procedure RestringirIniciar(UmParaSimZeroParaNao: Integer);
var
 key: TRegistry;
begin
 key := TRegistry.Create;
 key.RootKey := HKEY_CURRENT_USER;
 key.OpenKey(Explorer, true);
 
 //N�o mostrar o rel�gio da barra de tarefas
 key.WriteInteger('HideClock', UmParaSimZeroParaNao);
 //Desabilita o popup Propriedades da Barra de tarefas
 key.WriteInteger('NoSetTaskbar', UmParaSimZeroParaNao);
 //Desabilita o popup completo da barra de tarefas               KEY.WriteInteger('NoTrayContextMenu',UmParaSimZeroParaNao);
 //Oculta os icones vizinho ao rel�gio da barra de tarefas
 kEY.WriteInteger('NoTrayItemsDisplay', UmParaSimZeroParaNao);
 key.CloseKey;
end;

procedure RestringirExplorer(UmParaSimZeroParaNao: Integer);
var
 key: TRegistry;
begin
 
 key := TRegistry.Create;
 key.RootKey := HKEY_CURRENT_USER;
 key.OpenKey(EXPLORER, TRUE);
 
 //Desabilita a exibi��o do Drive C
 if UmParaSimZeroParaNao = 1 then
  key.WriteInteger('NoDrives', 4)
 else
  key.WriteInteger('NoDrives', 0);
 
 //Desabilita o menu Op��es de pastas
 key.WriteInteger('NoFolderOptions', UmParaSimZeroParaNao);
 //Desabilita o menu Arquivo
 key.WriteInteger('NoFileMenu', UmParaSimZeroParaNao);
 //Desabilita o menu Favoritos
 key.WriteInteger('NoFavoritesMenu', UmParaSimZeroParaNao);
 //Limpa a lista de documentos recentes ao sair do windows
 key.WriteInteger('ClearRecentDocsOnExit', UmParaSimZeroParaNao);
 //Limpa o hist�rico da internet ao sair (N�o testei ainda)
 key.WriteInteger('NoRecentDocsHistory', UmParaSimZeroParaNao);
 //N�o mostra o �cone do Internet Explore no Desktop (N�o testei ainda)
 key.WriteInteger('NoInternetIcon', UmParaSimZeroParaNao);
 key.CloseKey;
end;

procedure RestringirSistema(UmParaSimZeroParaNao: Integer);
var
 key: TRegistry;
begin
 key := TRegistry.Create;
 key.RootKey := HKEY_CURRENT_USER;
 
 key.OpenKey(DOS, TRUE);
 //Desabilita o Prompt de Dos
 key.WriteInteger('DisableCMD', UmParaSimZeroParaNao);
 key.CloseKey;
 
 key.OpenKey(EXPLORER, true);
 //Desabilita o Executar (Tecla Win + R)
 key.WriteInteger('NoRun', UmParaSimZeroParaNao);
 //Desabilita o Localizar (Tecla Win + f)
 key.WriteInteger('NoFind', UmParaSimZeroParaNao);
 key.CloseKey;
 
 key.OpenKey(SISTEMA, true);
 //Desabilita o Regedit
 key.WriteInteger('DisableRegistryTools', UmParaSimZeroParaNao);
 key.CloseKey;
 
end;

procedure RestringirPainel(UmParaSimZeroParaNao: integer);
var
 key: TRegistry;
begin
 key := TRegistry.Create;
 key.RootKey := HKEY_CURRENT_USER;
 key.OpenKey(EXPLORER, true);
 //Desabilita a propriedade de Sistema
 key.WriteInteger('NoPropertiesMyComputer', UmParaSimZeroParaNao);
 //N�o tenho certeza mais parece que desabilita a propriedade de pastas
 key.WriteInteger('NoSetFolders', UmParaSimZeroParaNao);
 //Desabilita o painel de controle
 Key.WriteInteger('NoControlPanel', UmParaSimZeroParaNao);
 //Bloqueia a adi��o de novas impressoras
 key.WriteInteger('NoAddPrinter', UmParaSimZeroParaNao);
 //Bloqueia a exclus�o de impressoras
 key.WriteInteger('NoDeletePrinter', UmParaSimZeroParaNao);
 key.CloseKey;
 key.OpenKey(UNINSTALL, TRUE);
 //Desabilita o Adicionar e Remover programas    KEY.WriteInteger('NoAddRemovePrograms',UmParaSimZeroParaNao);
 key.CloseKey;
 
end;

procedure RestringirOutros(UmParaSimZeroParaNao: Integer);
var
 key: TRegistry;
begin
 key := TRegistry.Create;
 key.RootKey := HKEY_CURRENT_USER;
 key.OpenKey(EXPLORER, TRUE);
 //Desabilita o bot�o Logoff do menu Iniciar
 key.WriteInteger('StartMenuLogOff', UmParaSimZeroParaNao);
 //Desabilita o bot�o desligar computador do MenuIniciar
 key.WriteInteger('NoClose', UmParaSimZeroParaNao);
 //N�o testei ainda mais parece que n�o gravas as altera��es feitas na sess�o ao sair
 key.WriteInteger('NoSaveSettings', UmParaSimZeroParaNao);
 //N�o testei ainda mais parece que desabilita as atualiza��es autom�ticas do windows
 key.WriteInteger('NoDevMgrUpdate', UmParaSimZeroParaNao);
 key.CloseKey;
end;

end.

{
Begin
  RestringirVideo(1);//Para restringir
  RestringirVideo(0);//Para desrestringir
end;
}
{

No programa que eu desenvolvi para LanHouse para cada restri��o eu criei um campo no banco de dados referente a cada m�quina, dai eu s� restrinjo o que me interessa:
ex:

var
  key:TRegistry;
begin
  key := TRegistry.Create;
  key.RootKey := HKEY_CURRENT_USER;
  key.OpenKey(EXPLORER,TRUE);
  With QrRestricoes do
  Begin
    //Desabilita o bot�o Logoff do menu Iniciar
    key.WriteInteger('StartMenuLogOff',FieldByName('NoLogoff').AsInteger);
    //Desabilita o bot�o desligar computador do MenuIniciar
    key.WriteInteger('NoClose',FieldByName('NoDesligar').AsInteger);
    //N�o testei ainda mais parece que n�o gravas as altera��es feitas na sess�o ao sair
    key.WriteInteger('NoSaveSettings',FieldByName('SalvarSessao').AsInteger);
    //N�o testei ainda mais parece que desabilita as atualiza��es   autom�ticas do windows
    key.WriteInteger('NoDevMgrUpdate',FieldByName('AtualizarWindows').AsInteger);
  end;
  key.CloseKey;
end;

}

