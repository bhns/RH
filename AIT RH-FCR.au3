#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=ait_new.ico
#AutoIt3Wrapper_Outfile=AIT RH-FCR ®.exe
#AutoIt3Wrapper_Res_Comment=AIT RH-FCR ® Visite  www.bhns.com.br
#AutoIt3Wrapper_Res_Description=AIT RH-FCR ® Utilitario de suporte a base de tickets e suporte remoto.
#AutoIt3Wrapper_Res_Fileversion=0.3.0.93
#AutoIt3Wrapper_Res_Fileversion_AutoIncrement=y
#AutoIt3Wrapper_Res_LegalCopyright=BHns Belo Horizonte Network Solutions
#AutoIt3Wrapper_Res_Language=1046
#AutoIt3Wrapper_Res_requestedExecutionLevel=highestAvailable
#AutoIt3Wrapper_Res_Field=Version|0.3
#AutoIt3Wrapper_Res_Field=Build | 2013.08.30
#AutoIt3Wrapper_Res_Field=Coded by | BHNS www.bhns.com.br
#AutoIt3Wrapper_Res_Field=Compile date|%longdate% %time%
#AutoIt3Wrapper_Res_Field=AutoIt Version|%AutoItVer%
#AutoIt3Wrapper_Run_AU3Check=n
#Au3Stripper_Parameters=/sf /sv /om /cs=0 /cn=0
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
;#RequireAdmin
#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <DateTimeConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <File.au3>
#include "bib\base64.au3"
#include "bib\WinHttp.au3"

;------------------PDF-------------------
#include "MPDF_UDF.au3"
#include <date.au3>
;------------------PDF-------------------
; Provas boas http://www.pciconcursos.com.br/provas/


Local $select_, $sexy_m, $sexy_f, $v_yes, $v_no, $v_c, $v_s, $v_d, $v_v, $v_u, $h_a, $h_b, $h_c, $h_d, $h_e, $h_ab, $h_ae, $h_ac, $h_ad, $h_an, $h_n
Local $BR_AC, $BR_AL, $BR_AP, $BR_AM, $BR_BA, $BR_CE, $BR_DF, $BR_ES, $BR_GO, $BR_MA, $BR_MT, $BR_MS, $BR_MG, $BR_PA, $BR_PB, $BR_PR, $BR_PE, $BR_PI, $BR_RJ, $BR_RN, $BR_RS, $BR_RO, $BR_RR, $BR_SC, $BR_SP, $BR_SE, $BR_TO
Local $ensino_f, $ensino_fi, $ensino_m, $ensino_mi, $ensino_t, $ensino_ti, $ensino_s, $ensino_si
Local $L_p, $L_ib, $L_it, $L_if, $L_eb, $L_ef, $L_ieb, $L_ief
Local $dep_func_s, $dep_grup_s, $form_int_pergunt, $form_int_sim, $form_int_nao, $form_int_asvezes
Local $pontos_inter, $modo_viwer_points
Local $headers_status, $response, $return, $str, $total_questions, $_total_questions, $area_2, $area_3, $form_mate, $_points_mate, $form_ingles, $_points_ingles, $patch_form, $form_points_in, $total_fom_mate, $total_fom_ingles
Local $arrayImput
		

$form_mate = "Matematica"
$_points_mate = 0
$form_ingles = "Ingles"
$_points_ingles = 0
$total_fom_mate = 0
$total_fom_ingles = 0


Local $data_ext_pt
if @WDAY = 1 Then
$data_ext_pt = "Domingo "&@MDAY
Elseif @WDAY = 2 Then
$data_ext_pt = "Segunda "&@MDAY
Elseif @WDAY = 3 Then
$data_ext_pt = "Terca-Feira "&@MDAY
Elseif @WDAY = 4 Then
$data_ext_pt = "Quarta-Feira "&@MDAY
Elseif @WDAY = 5 Then
$data_ext_pt = "Quinta-Feira "&@MDAY
Elseif @WDAY = 6 Then
$data_ext_pt = "Sexta-Feira "&@MDAY
Elseif @WDAY = 7 Then
$data_ext_pt = "Sabado "&@MDAY
EndIf


if @MON = 01 Then
$data_ext_pt = $data_ext_pt &" de Janeiro de "&@YEAR
Elseif @MON = 02 Then
$data_ext_pt = $data_ext_pt &" de Fevereiro de "&@YEAR
Elseif @MON = 03 Then
$data_ext_pt = $data_ext_pt &" de Marco de "&@YEAR
Elseif @MON = 04 Then
$data_ext_pt = $data_ext_pt &" de Abril de "&@YEAR
Elseif @MON = 05 Then
$data_ext_pt = $data_ext_pt &" de Maio de "&@YEAR
Elseif @MON = 06 Then
$data_ext_pt = $data_ext_pt &" de Junho de "&@YEAR
Elseif @MON = 07 Then
$data_ext_pt = $data_ext_pt &" de Julho de "&@YEAR
Elseif @MON = 08 Then
$data_ext_pt = $data_ext_pt &" de Agosto de "&@YEAR
Elseif @MON = 09 Then
$data_ext_pt = $data_ext_pt &" de Setembro de "&@YEAR
Elseif @MON = 10 Then
$data_ext_pt = $data_ext_pt &" de Outubro de "&@YEAR
Elseif @MON = 11 Then
$data_ext_pt = $data_ext_pt &" de Novembro de "&@YEAR
Elseif @MON = 12 Then
$data_ext_pt = $data_ext_pt &" de Desembro de "&@YEAR
EndIf


$data = ("" & @MDAY & "/" & @MON & "/" & @YEAR)
$horario = ("" & @HOUR & ":" & @MIN & ":" & @SEC)
$ipAddress = @IPAddress1



Local $pontos_inter = 0
Local $pontos_teste = 0
Local $_pontos_teste = 0
$form_int_pergunt = "Em conversas, as palavras lhe saem como você gostaria que elas saíssem ?;Quando alguém lhe faz uma pergunta que não seja clara, você pede para a pessoa explicar o significado da mesma ?;Quando você está tentando explicar alguma coisa, as pessoas tendem a ( botar palavras em sua boca ) ?;Você simplesmente presume que a outra pessoa sabe o que você quer dizer, sem que você tenha que explicar o que você quer realmente dizer ?;Você costuma pedir à outra pessoa lhe dizer como ela se sente sobre o ponto que você quer provar ?;É difícil para você conversar com outras pessoas ?;Em conversa, você fala sobre coisas que são de interesse tanto para você como para a outra pessoa ?;Você acha difícil expressar suas idéias quando as dos membros que o circundam são contrárias às suas ?;Em conversas, você tenta se colocar no lugar da outra pessoa ?;Em conversas, você tem a tendência de falar mais do que a outra pessoa ?;Você está ciente de que o tom de sua voz pode afetar os outros ?;Você evita dizer algo que você sabe só irá ferir os outros ou piorar as coisas ?;É difícil para você aceitar críticas construtivas de outros ?;Quando alguém fere seus sentimentos você discute o fato com a pessoa ?;Você se desculpa, depois, com alguém cujos sentimentos você tenha possivelmente ferido ?;O fato de alguém não concordar com você o deixa ( bastante ) chateado ?;Você acha difícil pensar com clareza quando você está zangado com alguém ?;Você deixa de discordar de outros porque você tem medo que eles fiquem zangados ?;Quando um problema surge entre você e uma outra pessoa, você consegue discuti-lo sem ficar zangado ?;Você está satisfeito com a maneira pela qual você resolve suas diferenças com os outros ?;Você fica amuado e aborrecido por muito tempo quando alguém o perturba ?;Você fica pouco a vontade quando alguém o elogia ?;De modo geral, você é capaz de acreditar nos outros ?;Você acha difícil exaltar/louvar e elogiar os outros ?;Você tenta deliberadamente esconder suas falhas dos outros ?;Você ajuda os outros a lhe entenderem dizendo como você pensa, sente e no que acredita ?;É difícil para você confiar aos outros ?;Você tem a tendência de mudar de assunto quando seus sentimentos entram numa discussão ?;Em conversas, você deixa a outra pessoa terminar de falar antes de reagir a o que ele está dizendo ?;Você nota às vezes não estar prestando atenção ?;Você tenta ouvir procurando o significado que se quer transmitir quando alguém está falando ?;Os outros parecem ouvi-lo quando você está falando ?;Numa discussão, é difícil para você ver as coisas através dos pontos de vista da outra pessoa ?;Você finge estar ouvindo a outras pessoas quando na verdade você não está ?;Em conversas, você consegue diferenciar o que a pessoa está dizendo do que ela pode estar sentindo ?;Ao falar, você procura se manter ciente de como as pessoas estão reagindo aquilo que você está dizendo ?;Você sente que os outros desejariam que você fosse um tipo diferente de pessoa ?;As outras pessoas entendem seus (os de você) sentimentos ?;Os outros costumam dizer que você sempre pensa estar certo ?;Você admite estar errado quando você sabe que você está errado sobre alguma coisa ?"
$form_int_sim = "3;3;1;1;3;1;3;1;3;1;3;3;1;3;3;1;1;1;3;3;1;3;3;1;1;3;1;1;3;1;3;3;1;1;3;3;3;3;1;3"
$form_int_nao = "1;1;3;3;1;3;1;3;1;3;1;1;3;1;1;3;3;3;1;1;3;1;1;3;3;1;3;3;1;3;1;1;3;3;1;1;1;1;3;1"
$form_int_asvezes = "2"



$L_p = "Somente Português"
$L_ib = "Inglês Básico"
$L_it = "Inglês Técnico"
$L_if = "Inglês Fluente"
$L_eb = "Espanhol Básico"
$L_ef = "Espanhol Fluente"
$L_ieb = "Inglês e Espanhol Básico"
$L_ief = "Inglês e Espanhol Fluente"

$ensino_f = "Fundamental"
$ensino_fi = "Fundamental Incompleto"
$ensino_m = "Nível médio"
$ensino_mi = "Nível médio Incompleto"
$ensino_t = "Tecnólogo"
$ensino_ti = "Tecnólogo Incompleto"
$ensino_s = "Nível superior"
$ensino_si = "Nível superior Incompleto"

$BR_AC = "AC"
$BR_AL = "AL"
$BR_AP = "AP"
$BR_AM = "AM"
$BR_BA = "BA"
$BR_CE = "CE"
$BR_DF = "DF"
$BR_ES = "ES"
$BR_GO = "GO"
$BR_MA = "MA"
$BR_MT = "MT"
$BR_MS = "MS"
$BR_MG = "MG"
$BR_PA = "PA"
$BR_PB = "PB"
$BR_PR = "PR"
$BR_PE = "PE"
$BR_PI = "PI"
$BR_RJ = "RJ"
$BR_RN = "RN"
$BR_RS = "RS"
$BR_RO = "RO"
$BR_RR = "RR"
$BR_SC = "SC"
$BR_SP = "SP"
$BR_SE = "SE"
$BR_TO = "TO"

$sexy_m = "Masculino"
$sexy_f = "Feminino"

$v_yes = "Sim"
$v_no = "Nao"

$v_c = "Casado(a)"
$v_s = "Solteiro(a)"
$v_d = "Divorciado(a)"
$v_v = "Viuvo(a)"
$v_u = "União Estável"


$h_a = "Categoria A"
$h_b = "Categoria B"
$h_c = "Categoria C"
$h_d = "Categoria D"
$h_e = "Categoria E"
$h_ab = "Categoria AB"
$h_ae = "Categoria AE"
$h_ac = "Categoria AC"
$h_ad = "Categoria AD"
$h_n = "Sem Habilitação"
$h_an = "Em Processo"

$select_ = "Selecione"


Local $sFldr2 = @ScriptDir & "\PROFILE";pra criar pasta
;Local $sFldr = "\Config\";pra criar pasta


If DirGetSize($sFldr2) = -1 Then

	DirCreate($sFldr2)
EndIf

;Cria arquivo de configuração caso ele não exista
Local $sFldr = @ScriptDir & "\Config";pra criar pasta
;Local $sFldr = "\Config\";pra criar pasta

If DirGetSize($sFldr) = -1 Then
	TrayTip("AIT HelpDesk ®", "Configurando pastas de configurações", 5, 1)
	Sleep(1000)
	DirCreate($sFldr)
	IniWrite($sFldr & "\config.ini", "ENTERPRISE", "NAME", "  POWER PC")
	IniWrite($sFldr & "\config.ini", "API", "HOST", "localhost")
	IniWrite($sFldr & "\config.ini", "API", "API-LINK", "ticket/api/tickets.json")
	IniWrite($sFldr & "\config.ini", "API", "KEY", "A9A1C1DB328E91F6B797853FA6FB38DF")
	IniWrite($sFldr & "\config.ini", "API", "FORCE-IP", "189.115.138.73")
	IniWrite($sFldr & "\config.ini", "API", "WEB-FRONT", "localhost/osticket/")
	IniWrite($sFldr & "\config.ini", "REPORT-EMAIL", "CLIENTE", "0")
	IniWrite($sFldr & "\config.ini", "REPORT-EMAIL", "API-DESK", "0")
	IniWrite($sFldr & "\config.ini", "DERPATAMENTOS", "GROUP", "Administrativo;Comercial;Contabil;Logisitíca;Prevenção de Perdas;Manutençao;Tecnologia da Informação")
	IniWrite($sFldr & "\config.ini", "DERPATAMENTOS", "FUNCAO", "Técnico de Manutenção;Técnico de Montagem;Técnico de Suporte")
	IniWrite($sFldr & "\config.ini", "EMAIL", "SERVER", "smtp.gmail.com")
	IniWrite($sFldr & "\config.ini", "EMAIL", "PORTA", "465")
	IniWrite($sFldr & "\config.ini", "EMAIL", "SSL", "1")
	IniWrite($sFldr & "\config.ini", "EMAIL", "USUARIO", "gpjticketos@gmail.com")
	IniWrite($sFldr & "\config.ini", "EMAIL", "SENHA", "power@123")
	IniWrite($sFldr & "\config.ini", "VIEWER", "POINTS", "0")
	IniWrite($sFldr & "\config.ini", "DP", "DPN_1", "RH")
	IniWrite($sFldr & "\config.ini", "DP", "DPN_ID_1", "1")
	IniWrite($sFldr & "\config.ini", "DELETE", "FILES", "1")
	IniWrite($sFldr & "\config.ini", "EMPRESA", "NOME", "PowerPC")
	IniWrite($sFldr & "\config.ini", "EMPRESA", "NOME-FICHA", "Ficha de Cadastro de Recrutamento RH")
	IniWrite($sFldr & "\config.ini", "EMPRESA", "CIDADE", "Belo Horizonte")
	IniWrite($sFldr & "\config.ini", "EMPRESA", "ENDERECO", "Av. Ivai 425, Dom Bosco, Belo Horizonte MG | Tel : 2519-0401")



	; ------------------------QUESTIONARIO---------------------------
	IniWrite($sFldr & "\form_7.ini", "FORM", "QUESTION", "O Que é a Informação?;O que é Informática?;O Que é Processamento de Dados?;O Que são ( Dados ) para a área de Informática?;Assinale a opção correta:;O que é Hardware?;O que é Software?;Marque a opção que mostra exemplos de software:;O que são periféricos?;Marque a opção correta:;Intel, IBM, HP, Apple e Microsoft são:;Para que serve o ( hífen ) no Google?;Qual a forma mais comum de contágio do vírus de computador?;Qual o principal objetivo do Site da Google?;No Google, como fazemos para pesquisar direto num site?;Dentre as opções abaixo, qual devemos fazer para não sermos infectados por um vírus de computador?;Ligar e desligar o computador a cada 5 minutos:;O que são Mainframes?;O DVD é:;O HD ou disco rígido:")
	IniWrite($sFldr & "\form_7.ini", "FORM", "RESPONSE_1", "É uma ação informada;São os elementos necessários para compor uma informação;Ciência da Informação;É um cubo com 6 lados;Os Computadores podem ser divididos basicamente em 2 categorias: PC´s ou Mainframes;É a parte física do computador;É um tipo de computador;Windows, Word, Excel, Powerpoint, DOS;São pessoas que moram na periferia;Unidade de entrada: monitor, teclado e impressora / Unidade de saída: scanner e caixa de som;Fabricantes de hardware;Para adicionar uma palavra na busca;Através do ar rarefeito;Ser um site de busca;Digitamos uma palavra;Usar um bom antivírus;Ajuda a limpar a CPU;São equipamentos empresariais destinados a grandes Bancos e empresas que processam uma grande quantidade de dados;Um tipo de filme da Blockbuster;São tipos de softwares")
	IniWrite($sFldr & "\form_7.ini", "FORM", "RESPONSE_2", "É um tipo de programa;É um conjunto de dados;É um microprocessador;São um tipo de hardware;Microcomputador não é a mesma coisa que PC;É a parte lógica do computador;É um hardware;Monitor e teclado;São os dispositivos ao redor da Unidade Central de Processamento;Unidade de entrada: Disquete / Unidade de saída: câmera digital e monitor;Somente fabricantes de Hardware;Para representar uma palavra composta, exemplo: guarda-chuva;Através do contato manual;Fazer manutenção de limpeza no seu computador;Digitamos a URL dele;Não ligarmos o computador;Ajuda a limpar o teclado;São computadores que ocupam salas inteiras;Um tipo de memória de massa;São tipos de antivírus")
	IniWrite($sFldr & "\form_7.ini", "FORM", "RESPONSE_3", "É um conjunto de dados;É manipular dados;É um processo na justiça;São um tipo de software;Os Microcomputadores ou Pc’s podem ser os palmtops, laptops ou desktops;É o Windows 95;É um dispositivo que emite sons;Acesso à Internet e Intranet;São programas que usamos para acessar à Internet;Unidade de entrada: DVD, CD e disquete / Unidade de saída: monitor, impressora e caixa de som;Fabricantes de software;Para ficar bonitinho;Através da impressora;Ajudar o internauta a procurar uma informação;Digitamos palavra site:URL;Limparmos sempre a CPU com um pano;Ajuda na manutenção do monitor;São computadores de grande porte;Um CD pra ouvir música;São fabricantes de hardware")
	IniWrite($sFldr & "\form_7.ini", "FORM", "RESPONSE_4", "É um programa feito pela Microsoft;Ciência que visa ao tratamento da informação através do uso de equipamentos e procedimentos da área de processamento de dados;É um conjunto de dados;São os elementos necessários para compor uma informação;Os Mainframes são computadores de Pequeno Porte;É a parte biológica do computador;É uma página de um livro;Windows, Word, Excel e mouse;São programas de Bate-papo na Internet;Unidade de entrada: DVD e CD / Unidade de saída: Impressora;Fabricantes de impressoras;Para fazer conta de subtração;Através do disquete e do email;B e C estão corretas;Usa-se a ajuda;A e B estão corretas;Pode causar danos na máquina;Somente A e B estão corretas;A e B estão corretas;São normalmente reconhecidos como unidade C:;")
	IniWrite($sFldr & "\form_7.ini", "FORM", "RESPONSE_5", "É a parte lógica do computador;Simplesmente Ciência da Informação;É manipular dados que tenham como finalidade obter resultados. Esse grupo de atividades envolve transmissão, armazenamento, recuperação, comparação e combinação de informações;É um sistema operacional;A Sigla PC significa em português ( Computador Paranormal );É o nome da pessoa que inventou o computador;É a parte biológica do computador;Mouse e CPU (gabinete);São tipos de computadores;Unidade de entrada: teclado e microfone / Unidade de saída: câmera digital;Somente Fabricante de microcomputadores;Para excluir uma palavra de uma busca;A e B estão corretas;A e C estão corretas;A e C estão corretas;B e C estão corretas;A e B estão corretas;Somente A e C estão corretas;B e C estão corretas;A e B estão corretas")
	IniWrite($sFldr & "\form_7.ini", "FORM", "RESPONSE_6", "As opções B e E estão corretas;As opções D e E estão corretas;São os elementos necessários para compor uma informação;É um programa que roda no Windows;As opções A e C;As opções A e B estão corretas;É a parte lógica do computador;As opções B e E estão corretas;A e B estão corretas;Unidade de entrada: teclado, scanner, mouse e microfone / Unidade de saída: impressora e caixa de som;A e C estão corretas;Para adicionar uma URL;A, B e C estão corretas;D e E estão corretas;B e D estão corretas;A e C estão corretas;A, B e C estão corretas;A, B e C estão corretas;A, B e C estão corretas;C e D estão corretas")
	IniWrite($sFldr & "\form_7.ini", "FORM", "RESPONSE_CORRECT", "3;6;5;4;3;1;6;1;2;6;6;5;4;5;3;1;4;6;2;4")
	IniWrite($sFldr & "\form_7.ini", "FORM", "FORM", "")

	; ------------------------MATEMATICA---------------------------
	IniWrite($sFldr & "\matematica.ini", "FORM", "QUESTION", "Qual a diferença entre o círculo e a circunferência?;Qual é a correta definição de número primo?;Qual é a base dos logaritmos naturais?;O que acontece quando dividimos um número por zero?;Qual a diferença entre axioma e teorema?;O que representa o símbolo i?;Que tipo de número é o número pi?;Quantas raízes reais tem uma equação do terceiro grau com coeficientes reais?;Quando por três pontos passa uma única reta?;Qual a diferença entre ortogonal e perpendicular?")
	IniWrite($sFldr & "\matematica.ini", "FORM", "RESPONSE_1", "A circunferência é aquela linha que contorna o círculo;Um número é primo quando somente é divisível por si próprio e pela unidade;Pi;O resultado é ( infinito);O axioma se encontra no início e o teorema no final;A raíz quadrada de menos dois;Real;Nenhuma;Quando os três pontos são harmônicos;Somente os eixos cartesianos são ortogonais")
	IniWrite($sFldr & "\matematica.ini", "FORM", "RESPONSE_2", "O círculo é a linha que contém a circunferência;Um número é primo quando não divisível por nenhum número;O número e de Neper;O resultado é o próprio número;O axioma se dá como demonstrado e o teorema se demonstra;A raíz quadrada de um;Complexo;Uma ou três soluções;Quando os três pontos são alinhados;Nenhuma")
	IniWrite($sFldr & "\matematica.ini", "FORM", "RESPONSE_3", "Nenhuma;Um número é primo quando somente é divisível por si próprio e por dois;Dez;O resultado é zero;O teorema é seguido do nome de um matemático;A raíz quadrada de menos um;Inteiro;Sempre três soluções;Sempre;Perpendicular quer dizer não paralelo")
	IniWrite($sFldr & "\matematica.ini", "FORM", "RESPONSE_4", "O círculo é um disco que não contém a circunferência;Um número é primo quando somente é divisível por si próprio;O número i;É impossível dividir um número por zero;O axioma é aquilo que se deve demonstrar de um teorema;A raíz quadrada de dois;Racional;Duas soluções;Nunca;Ortogonal relaciona-se com plano e perpendicular com reta")
	IniWrite($sFldr & "\matematica.ini", "FORM", "RESPONSE_CORRECT", "1;1;2;4;2;3;1;2;2;2")
	IniWrite($sFldr & "\matematica.ini", "FORM", "FORM", "")
	
		
	
		; ------------------------INGLES---------------------------
	IniWrite($sFldr & "\ingles.ini", "FORM", "QUESTION", "I speak English, Spanish ___________ French.;All of them __________ part of the same group.;I ___________ coffee.;_____________ is my boss.;She ___________ always very hungry.;All the players ____________ at the stadium right now.;What time__________ to the movies tonight?;Where is your _____________?;Both my sister and her friend ____________ outside.;I wonder if you could tell me __________?;They _____________ here since last year.;Mary __________ to the shopping center.;Who is ____________ man over there?;Don’t ___________ now.;Fruits _______ very healthy.;__________ several companies interested in our products.;I __________ go.;My dad ___________ to Chicago five months ago.")
	IniWrite($sFldr & "\ingles.ini", "FORM", "RESPONSE_1", "AND;IS;DON’T WANT;WIFE'S CHARLES;AM;ARRIVING;YOU AND YOUR WIFE ARE GOES;DESK SECRETARY;ARE WORKING;WHERE ARE THEY;HAVE WORK;GO;A;TALKING;AM;ARE THERE;WANT TO;MOVED")
	IniWrite($sFldr & "\ingles.ini", "FORM", "RESPONSE_2", "BUT;WAS;DOESN’T WANT;CHARLES WIFE;ARE;IS ARRIVING;ARE YOU AND YOUR WIFE GOING;SECRETARY DESK;IS WORKING;WHERE THEY HAVE BEEN;HAVE WORKED;GOED;THAT;TO TALK;IS;THERE IS;NEED;MOVES")
	IniWrite($sFldr & "\ingles.ini", "FORM", "RESPONSE_3", "OR;WERE;DON’T WANT TO;CHARLES'S WIFE;IS;ARE ARRIVING;IS YOU AND YOUR WIFE GOING;SECRETARY'S DESK;CAN WORKING;WHERE HAVE THEY BEEN;WORK;WENT;THIS;TO TALK;ARE;THERE ARE;WANT;HAS MOVED")
	IniWrite($sFldr & "\ingles.ini", "FORM", "RESPONSE_4", "Não Sei a Resposta;Não Sei a Resposta;Não Sei a Resposta;Não Sei a Resposta;Não Sei a Resposta;Não Sei a Resposta;Não Sei a Resposta;Não Sei a Resposta;Não Sei a Resposta;Não Sei a Resposta;Não Sei a Resposta;Não Sei a Resposta;Não Sei a Resposta;Não Sei a Resposta;Não Sei a Resposta;Não Sei a Resposta;Não Sei a Resposta;Não Sei a Resposta")
	IniWrite($sFldr & "\ingles.ini", "FORM", "RESPONSE_CORRECT", "1;3;1;3;3;3;2;3;1;2;2;3;2;2;3;3;1;1")
	IniWrite($sFldr & "\ingles.ini", "FORM", "FORM", "")
    
	
	
		; ------------------------Sobre a Empresa---------------------------
	IniWrite($sFldr & "\empresa.ini", "FORM", "QUESTION", "Como Você conchece nossa empresa ?;O que voce acha que pode fazer mais pela empresa")
	IniWrite($sFldr & "\empresa.ini", "FORM", "TITULO", "A Empresa Gostaria de saber mais de você !")
	IniWrite($sFldr & "\empresa.ini", "FORM", "TITULO-DETALHES", "Nao e obrigatorio preencher todas as perguntas, porem ficamos felizes se preencher, se sua visão de caminharmos juntos :.)")

	
	
	
	#CS	
		; ------------------------SAMPLE---------------------------
	IniWrite($sFldr & "\matematica.ini", "FORM", "QUESTION", "")
	IniWrite($sFldr & "\matematica.ini", "FORM", "RESPONSE_1", "")
	IniWrite($sFldr & "\matematica.ini", "FORM", "RESPONSE_2", "")
	IniWrite($sFldr & "\matematica.ini", "FORM", "RESPONSE_3", "")
	IniWrite($sFldr & "\matematica.ini", "FORM", "RESPONSE_4", "")
	IniWrite($sFldr & "\matematica.ini", "FORM", "RESPONSE_CORRECT", "")
	IniWrite($sFldr & "\matematica.ini", "FORM", "FORM", "")
    #CE
	
	
	
	TrayTip("AIT HelpDesk ®", "Não se esqueça de configurar servidor e banco de dados" & @LF & " no arquivo config.ini " & @LF & "configurações padrões aplicadas", 5, 1)
	Sleep(3000)

EndIf


$empresa = IniRead($sFldr & "\config.ini", "ENTERPRISE", "NAME", "")
$api_host = IniRead($sFldr & "\config.ini", "API", "HOST", "")
$api_link = IniRead($sFldr & "\config.ini", "API", "API-LINK", "")
$api_key = IniRead($sFldr & "\config.ini", "API", "KEY", "")
$api_ip = IniRead($sFldr & "\config.ini", "API", "FORCE-IP", "")
$api_web_front = IniRead($sFldr & "\config.ini", "API", "WEB-FRONT", "")
$report_user_mail = IniRead($sFldr & "\config.ini", "REPORT-EMAIL", "CLIENTE", "")
$report_api_mail = IniRead($sFldr & "\config.ini", "REPORT-EMAIL", "API-DESK", "")
$dep_name = IniRead($sFldr & "\config.ini", "DERPATAMENTOS", "GROUP", "")
$dep_func = IniRead($sFldr & "\config.ini", "DERPATAMENTOS", "FUNCAO", "")
$HOST_Server = IniRead($sFldr & "\config.ini", "EMAIL", "SERVER", "")
$emailPORT = IniRead($sFldr & "\config.ini", "EMAIL", "PORTA", "")
$emailSSL = IniRead($sFldr & "\config.ini", "EMAIL", "SSL", "")
$emailServer = IniRead($sFldr & "\config.ini", "EMAIL", "USUARIO", "")
$emailSenha = IniRead($sFldr & "\config.ini", "EMAIL", "SENHA", "")
$viewer_points = IniRead($sFldr & "\config.ini", "VIEWER", "POINTS", "")
$name_DPN_1 = IniRead($sFldr & "\config.ini", "DP", "DPN_1", "")
$id_DPN_1 = IniRead($sFldr & "\config.ini", "DP", "DPN_ID_1", "")
$Delete_files = IniRead($sFldr & "\config.ini", "DELETE", "FILES", "")
$empresa_nome = IniRead($sFldr & "\config.ini", "EMPRESA", "NOME", "")
$empresa_cidade = IniRead($sFldr & "\config.ini", "EMPRESA", "CIDADE", "")
$empresa_endereco = IniRead($sFldr & "\config.ini", "EMPRESA", "ENDERECO", "")
$titulo_curricul = IniRead($sFldr & "\config.ini", "EMPRESA", "NOME-FICHA", "")


if $Delete_files = 0 Then
DirRemove($sFldr2, 1)
If DirGetSize($sFldr2) = -1 Then
	DirCreate($sFldr2)

EndIf
EndIf



Local $S_IMG = @ScriptDir & "\Config\IMG";pra criar pasta
If DirGetSize($S_IMG) = -1 Then
	DirCreate($S_IMG)

EndIf
; Split Func departamento

Local $files_splits2 = StringSplit($dep_name, ";") ; Split the string of days using the delimiter "," and the default flag value.
; MsgBox(4096, "Lista =",$files_splits2[0])

For $i = 1 To $files_splits2[0] ; Loop through the array returned by StringSplit to display the individual values.


	If $files_splits2[0] > 1 Then

		If $dep_grup_s = $files_splits2[$i] Then


		Else

			$dep_grup_s = $dep_grup_s & "|" & $files_splits2[$i]

		EndIf


	Else

		$dep_grup_s = $files_splits2[$i]

	EndIf


Next

; Fim 	Split Func departamento



; Split Func vaga

Local $files_splits2 = StringSplit($dep_func, ";") ; Split the string of days using the delimiter "," and the default flag value.
; MsgBox(4096, "Lista =",$files_splits2[0])

For $i = 1 To $files_splits2[0] ; Loop through the array returned by StringSplit to display the individual values.


	If $files_splits2[0] > 1 Then

		If $dep_func_s = $files_splits2[$i] Then


		Else

			$dep_func_s = $dep_func_s & "|" & $files_splits2[$i]

		EndIf


	Else

		$dep_func_s = $files_splits2[$i]

	EndIf


Next

; Fim 	Split Func vaga


#Region ### START Koda GUI section ### Form=e:\rh\form1.kxf
$Form1_1 = GUICreate("AIT RH-FCR ®", 880, 716, -1, -1)
GUISetBkColor(0xA6CAF0)
$Group1 = GUICtrlCreateGroup("Dados Pessoais", 32, 32, 817, 161)
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$Label1 = GUICtrlCreateLabel("Nome :", 51, 60, 38, 17)
$Input1 = GUICtrlCreateInput("", 90, 56, 361, 21)
$Label2 = GUICtrlCreateLabel("Data de Nascimento :", 462, 59, 107, 17)
$Date1 = GUICtrlCreateDate("05/09/194", 575, 55, 90, 21, 0)
$Label3 = GUICtrlCreateLabel("Mãe :", 56, 86, 31, 17)
$Input2 = GUICtrlCreateInput("", 90, 84, 313, 21)
$Label4 = GUICtrlCreateLabel("Pai :", 414, 86, 25, 17)
$Input3 = GUICtrlCreateInput("", 447, 83, 313, 21)
$Label9 = GUICtrlCreateLabel("Naturalidade :", 51, 115, 70, 17)
$Input7 = GUICtrlCreateInput("", 121, 112, 169, 21)
$Label10 = GUICtrlCreateLabel("Estado Civil : ", 299, 115, 68, 17)
$Combo2 = GUICtrlCreateCombo("Selecione", 367, 112, 145, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $v_c & "|" & $v_s & "|" & $v_d & "|" & $v_v & "|" & $v_u, "Selecione")
$Label11 = GUICtrlCreateLabel("Filhos :", 525, 114, 37, 17)
$Combo3 = GUICtrlCreateCombo($select_, 567, 111, 81, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $v_yes & "|" & $v_no, $select_)
$Label12 = GUICtrlCreateLabel("Quantidade :", 653, 114, 65, 17)
$Input8 = GUICtrlCreateInput("", 719, 110, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_NUMBER))
$Label13 = GUICtrlCreateLabel("CPF :", 55, 142, 30, 17)
$Input9 = GUICtrlCreateInput("", 84, 139, 121, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_NUMBER))
$Label14 = GUICtrlCreateLabel("RG :", 214, 142, 26, 17)
$Input10 = GUICtrlCreateInput("", 241, 139, 121, 21)
$Label15 = GUICtrlCreateLabel("CTPS/Série :", 371, 142, 67, 17)
$Input11 = GUICtrlCreateInput("", 440, 140, 121, 21)
$Label23 = GUICtrlCreateLabel("Email :", 565, 142, 35, 17)
$Input17 = GUICtrlCreateInput("", 600, 139, 225, 21)
$Label36 = GUICtrlCreateLabel("Carteira de Habilitação :", 51, 168, 117, 17)
$Combo7 = GUICtrlCreateCombo($h_n, 167, 165, 297, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL)) ; $h_a, $h_b, $h_c, $h_d, $h_e, $h_ab, $h_ae, $h_ac, $h_ad, $h_an, $h_n
GUICtrlSetData(-1, $h_a & "|" & $h_b & "|" & $h_c & "|" & $h_d & "|" & $h_e & "|" & $h_ab & "|" & $h_ae & "|" & $h_ac & "|" & $h_ad & "|" & $h_an & "|" & $h_n, $h_n)
$Label38 = GUICtrlCreateLabel("Sexo :", 670, 58, 34, 17)
$Combo9 = GUICtrlCreateCombo("Selecione", 705, 55, 89, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $sexy_m & "|" & $sexy_f, "Selecione")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group2 = GUICtrlCreateGroup("Endereço", 32, 200, 529, 97)
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$Label5 = GUICtrlCreateLabel("Cep :", 47, 234, 29, 17)
$Input4 = GUICtrlCreateInput("", 79, 230, 113, 21)
$Label6 = GUICtrlCreateLabel("Endereço :", 211, 233, 56, 17)
$Input5 = GUICtrlCreateInput("", 269, 230, 281, 21)
$Label7 = GUICtrlCreateLabel("Cidade :", 223, 262, 43, 17)
$Input6 = GUICtrlCreateInput("", 269, 258, 153, 21)
$Label8 = GUICtrlCreateLabel("Estado :", 439, 261, 43, 17)
$Combo1 = GUICtrlCreateCombo($BR_MG, 485, 258, 65, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $BR_AC & "|" & $BR_AL & "|" & $BR_AP & "|" & $BR_AM & "|" & $BR_BA & "|" & $BR_CE & "|" & $BR_DF & "|" & $BR_ES & "|" & $BR_GO & "|" & $BR_MA & "|" & $BR_MT & "|" & $BR_MS & "|" & $BR_PA & "|" & $BR_PB & "|" & $BR_PR & "|" & $BR_PE & "|" & $BR_PI & "|" & $BR_RJ & "|" & $BR_RN & "|" & $BR_RS & "|" & $BR_RO & "|" & $BR_RR & "|" & $BR_SC & "|" & $BR_SP & "|" & $BR_SE & "|" & $BR_TO, $BR_MG)
$Label26 = GUICtrlCreateLabel("Bairro :", 39, 261, 37, 17)
$Input19 = GUICtrlCreateInput("", 80, 257, 137, 21)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group3 = GUICtrlCreateGroup("Números de Contato", 568, 200, 281, 185)
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$Label16 = GUICtrlCreateLabel("Tel. Fixo : ", 580, 229, 53, 17)
$Input12 = GUICtrlCreateInput("", 634, 226, 73, 21)
$Label17 = GUICtrlCreateLabel("Celular : ", 587, 259, 45, 17)
$Input13 = GUICtrlCreateInput("", 635, 256, 73, 21)
$Label18 = GUICtrlCreateLabel("Tel. Fixo Recado :", 588, 330, 91, 17)
$Input14 = GUICtrlCreateInput("", 747, 225, 73, 21)
$Label19 = GUICtrlCreateLabel("Celular Recado :", 596, 358, 83, 17)
$Input15 = GUICtrlCreateInput("", 748, 255, 73, 21)
$Label20 = GUICtrlCreateLabel("Tel.2 :", 713, 229, 34, 17)
$Label21 = GUICtrlCreateLabel("Cel.2 :", 713, 258, 34, 17)
$Input16 = GUICtrlCreateInput("", 681, 327, 73, 21)
$celrecado = GUICtrlCreateInput("", 681, 354, 73, 21)
$Label51 = GUICtrlCreateLabel("Nome de Contato para Recados", 630, 283, 157, 17)
$Label52 = GUICtrlCreateLabel("Nome :", 590, 304, 38, 17)
$Input38 = GUICtrlCreateInput("", 629, 301, 193, 21)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Label22 = GUICtrlCreateLabel("Ficha de Cadastro de Recrutamento RH", 228, 0, 430, 33)
GUICtrlSetFont(-1, 18, 400, 0, "MS Sans Serif")
$Group4 = GUICtrlCreateGroup("Nivel de Formação :", 32, 304, 529, 81)
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$Label24 = GUICtrlCreateLabel("Escolariedade :", 40, 328, 77, 17)
$Combo4 = GUICtrlCreateCombo($ensino_f, 116, 325, 201, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL)) ;$ensino_f & "|" & $ensino_fi & "|" & $ensino_m & "|" & $ensino_mi & "|" & $ensino_t & "|" & $ensino_ti & "|" & $ensino_s & "|" & $ensino_si
GUICtrlSetData(-1, $ensino_fi & "|" & $ensino_m & "|" & $ensino_mi & "|" & $ensino_t & "|" & $ensino_ti & "|" & $ensino_s & "|" & $ensino_si, $ensino_f)
$Label27 = GUICtrlCreateLabel("Idiomas :", 328, 328, 44, 17)
$Combo5 = GUICtrlCreateCombo($L_p, 380, 325, 177, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $L_ib & "|" & $L_it & "|" & $L_if & "|" & $L_eb & "|" & $L_ef & "|" & $L_ieb & "|" & $L_ief, $L_p)
$Label25 = GUICtrlCreateLabel("Nomes do Curso Técnico ou Superior :", 40, 360, 187, 17)
$Input18 = GUICtrlCreateInput("", 226, 357, 177, 21)
$Label53 = GUICtrlCreateLabel("Estudando ? :", 407, 359, 70, 17)
$Combo10 = GUICtrlCreateCombo("Selecione", 478, 355, 73, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $v_yes & "|" & $v_no, "Selecione")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group5 = GUICtrlCreateGroup("Vaga Prentendida", 32, 392, 649, 153)
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$Label28 = GUICtrlCreateLabel("Vaga pretendida :", 43, 441, 88, 17)
$Input20 = GUICtrlCreateInput("", 130, 438, 145, 21)
$Label29 = GUICtrlCreateLabel("Tempo de Experiência :", 280, 441, 116, 17)
$Input21 = GUICtrlCreateInput("", 396, 438, 97, 21)
$Label30 = GUICtrlCreateLabel("Prentenção Salarial R$ :", 496, 441, 119, 17)
$Input22 = GUICtrlCreateInput("", 615, 438, 57, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_NUMBER))
$Label31 = GUICtrlCreateLabel("Vaga Secundaria :", 39, 473, 92, 17)
$Input23 = GUICtrlCreateInput("", 130, 470, 145, 21)
$Label32 = GUICtrlCreateLabel("Tempo de Experiência :", 280, 473, 116, 17)
$Input24 = GUICtrlCreateInput("", 396, 470, 97, 21)
$Label33 = GUICtrlCreateLabel("Prentenção Salarial R$ :", 496, 473, 119, 17)
$Input25 = GUICtrlCreateInput("", 615, 470, 57, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_NUMBER))
;$Label34 = GUICtrlCreateLabel("", 667, 416, 4, 4)
$Label37 = GUICtrlCreateLabel("Aréa Pretendida :", 209, 408, 86, 17)
$Combo8 = GUICtrlCreateCombo($select_, 314, 405, 193, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $dep_grup_s, $select_)
$Label35 = GUICtrlCreateLabel("Outra caso não tenhamos uma que se encaixe com seu perfil :", 38, 505, 298, 17)
$Combo6 = GUICtrlCreateCombo($select_, 336, 502, 337, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $dep_func_s, $select_)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group6 = GUICtrlCreateGroup("Descreva sua Experiência", 688, 392, 161, 153)
$Text = GUICtrlCreateEdit("", 692, 409, 153, 129)
GUICtrlSetData(-1, "")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group7 = GUICtrlCreateGroup("Ultimas Experiências Desenvolvidas", 32, 552, 817, 81)
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$Label39 = GUICtrlCreateLabel("Empresa :", 40, 576, 51, 17)
$Input26 = GUICtrlCreateInput("", 91, 573, 121, 21)
$Label40 = GUICtrlCreateLabel("Cargo :", 216, 576, 38, 17)
$Input27 = GUICtrlCreateInput("", 253, 573, 121, 21)
$Label41 = GUICtrlCreateLabel("Periodo :", 377, 576, 46, 17)
$Input28 = GUICtrlCreateInput("", 422, 572, 89, 21)
$Label42 = GUICtrlCreateLabel("Contato :", 516, 575, 47, 17)
$Input29 = GUICtrlCreateInput("", 562, 572, 121, 21)
$Label43 = GUICtrlCreateLabel("Telefone :", 688, 576, 52, 17)
$Input30 = GUICtrlCreateInput("", 740, 572, 73, 21)
$Label44 = GUICtrlCreateLabel("Empresa :", 40, 608, 51, 17)
$Input31 = GUICtrlCreateInput("", 91, 605, 121, 21)
$Label45 = GUICtrlCreateLabel("Cargo :", 216, 608, 38, 17)
$Input32 = GUICtrlCreateInput("", 253, 605, 121, 21)
$Label46 = GUICtrlCreateLabel("Periodo :", 377, 608, 46, 17)
$Input33 = GUICtrlCreateInput("", 422, 604, 89, 21)
$Label47 = GUICtrlCreateLabel("Contato :", 516, 607, 47, 17)
$Input34 = GUICtrlCreateInput("", 562, 604, 121, 21)
$Label48 = GUICtrlCreateLabel("Telefone :", 688, 608, 52, 17)
$Input35 = GUICtrlCreateInput("", 740, 604, 73, 21)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group8 = GUICtrlCreateGroup("Indicação caso tenha favor preencher", 32, 640, 457, 57)
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$Label49 = GUICtrlCreateLabel("Indicado Por :", 42, 668, 70, 17)
$Input36 = GUICtrlCreateInput("", 111, 664, 121, 21)
$Label50 = GUICtrlCreateLabel("Empresa :", 239, 667, 51, 17)
$Input37 = GUICtrlCreateInput("", 290, 663, 169, 21)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Button1 = GUICtrlCreateButton("Continuar", 536, 664, 131, 25)
$Button2 = GUICtrlCreateButton("Sair", 698, 664, 131, 25)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

		Case $Button1
			$inputNome = urlencode(GUICtrlRead($Input1))
			$input_dt_nasc = urlencode( GUICtrlRead($Date1))
			$inputNome_mae = urlencode( GUICtrlRead($Input2))
			$inputNome_pai = urlencode( GUICtrlRead($Input3))
			$naturalidade_ = urlencode( GUICtrlRead($Input7))
			$possui_filhos = urlencode( GUICtrlRead($Combo3))
			$quant_filhos = urlencode( GUICtrlRead($Input8))
			$user_cpf = urlencode( GUICtrlRead($Input9))
			$user_rg = urlencode( GUICtrlRead($Input10))
			$user_ctps = urlencode( GUICtrlRead($Input11))
			$inputEmail = urlencode( GUICtrlRead($Input17))
			$cart_motorista = urlencode( GUICtrlRead($Combo7))
			$sexy_user = urlencode( GUICtrlRead($Combo9))
			$cep_user = urlencode( GUICtrlRead($Input4))
			$end_user = urlencode( GUICtrlRead($Input5))
			$cid_user = urlencode( GUICtrlRead($Input6))
			$est_user = urlencode( GUICtrlRead($Combo1))
			$bairro_user = urlencode( GUICtrlRead($Input19))
			$tel_fixo = urlencode( GUICtrlRead($Input12))
			$celular = urlencode( GUICtrlRead($Input13))
			$tel_rec_fixo = urlencode( GUICtrlRead($Input14))
			$tel_rec_cel = urlencode( GUICtrlRead($celrecado))
			$nome_recado = urlencode( GUICtrlRead($Input38))
			$escolari_ = urlencode( GUICtrlRead($Combo4))
			$idioma_f = urlencode( GUICtrlRead($Combo5))
			$nome_form = urlencode( GUICtrlRead($Input18))
			$user_estud = urlencode( GUICtrlRead($Combo10))
			$area_prt = urlencode( GUICtrlRead($Combo8))
			$vaga1 = urlencode( GUICtrlRead($Input20))
			$vaga1_temp = urlencode( GUICtrlRead($Input21))
			$vaga1_valor = urlencode( GUICtrlRead($Input22))
			$vaga2 = urlencode( GUICtrlRead($Input23))
			$vaga2_temp = urlencode( GUICtrlRead($Input24))
			$vaga2_valor = urlencode( GUICtrlRead($Input25))
			$vaga3 = urlencode( GUICtrlRead($Combo6))
			$inputBreveDescr = urlencode( GUICtrlRead($Text))
			$Ult_empresa1 = urlencode( GUICtrlRead($Input26))
			$Ult_empresa1_cargo = urlencode( GUICtrlRead($Input27))
			$Ult_empresa1_periodo = urlencode( GUICtrlRead($Input28))
			$Ult_empresa1_contato = urlencode( GUICtrlRead($Input29))
			$Ult_empresa1_telefone = urlencode( GUICtrlRead($Input30))
			$Ult_empresa2 = urlencode( GUICtrlRead($Input31))
			$Ult_empresa2_cargo = urlencode( GUICtrlRead($Input32))
			$Ult_empresa2_periodo = urlencode( GUICtrlRead($Input33))
			$Ult_empresa2_contato = urlencode( GUICtrlRead($Input34))
			$Ult_empresa2_telefone = urlencode( GUICtrlRead($Input35))
			$indica_user = urlencode( GUICtrlRead($Input36))
			$indicca_empresa = urlencode( GUICtrlRead($Input37))


			if $inputNome = "" then
			MsgBox(64,"Existe erros no Formulario","Campo NOME nao pode ficar em Branco")
			Elseif $sexy_user = "Selecione" then
			MsgBox(64,"Existe erros no Formulario","Campo SEXO nao pode ficar em Branco")
			Elseif $tel_fixo = "" then
			MsgBox(64,"Existe erros no Formulario","Campo TELEFONE FIXO nao pode ficar em Branco")
			Elseif $celular = "" then
			MsgBox(64,"Existe erros no Formulario","Campo CELULAR nao pode ficar em Branco")
			Elseif $area_prt = "" then
			MsgBox(64,"Existe erros no Formulario","Campo Aréa Pretendida nao pode ficar em Branco") ;Input17
			Elseif $Input17 = "" then
			MsgBox(64,"Existe erros no Formulario","Campo Aréa Pretendida nao pode ficar em Branco") ;Input17

			Else

			send_form()

			Endif


		Case $Button2
			Exit
	EndSwitch
WEnd


Func send_form()




	$Cod_habilitacao = StringReplace($cart_motorista, "Categoria ", "")

	If $Cod_habilitacao = "Sem Habilitacao" Then


		$Cod_habilitacao = "SH"

	ElseIf $Cod_habilitacao = "Em Processo" Then

		$Cod_habilitacao = "EP"

	EndIf


	$curriculo_pdf = $inputNome
	;set the properties for the pdf
	_SetTitle($titulo_curricul & " " & $curriculo_pdf & " " & $data & " " & $horario)
	_SetSubject($titulo_curricul & "  (www.bhns.com.br)")
	_SetKeywords($curriculo_pdf & "," & $data & ", pdf")
	_OpenAfter(True);open after generation
	_SetUnit($PDF_UNIT_CM)
	_SetPaperSize("A4")
	_SetZoomMode(175)
	_SetOrientation($PDF_ORIENTATION_PORTRAIT)
	_SetLayoutMode($PDF_LAYOUT_CONTINOUS)
	;initialize the pdf
	_InitPDF(@ScriptDir & "\PROFILE\" & $curriculo_pdf & ".pdf")
	;=== load used font(s) ===
	_LoadFontTT("_TimesNR", $PDF_FONT_TIMES)
	_LoadFontTT("Calibri", $PDF_FONT_TIMES, $PDF_FONT_NORMAL)
	;_LoadFontTT("_ANRB", $PDF_FONT_TIMES, $PDF_FONT_BOLD)

	_BeginPage() ; begin page



    ;$empresa_nome, $empresa_cidade, $empresa_endereco, $data_ext_pt
	; --- now fill the areas with the dates --------------------------------------------------
	; --- now fill the areas with the dates --------------------------------------------------
	_DrawLine(30, 00.80, 30, 30, "0X2", 0, 0.03, 0x000000, 0, 0)
	; _DrawLine(17.20, 25.80, 03.80, 25.80, "0X2", 0, 0.03, 0x000000, 0, 0)
	_InsertRenderedText(20, 29,$empresa_nome &" "& $horario, "Calibri", 10, 100, $PDF_ALIGN_RIGHT, 0x000000) ; Main Month
	_InsertRenderedText(10.5, 28.1, $titulo_curricul, "_TimesNR", 14, 100, $PDF_ALIGN_CENTER, 0x000000, 0x000000) ; Main Month
	_InsertRenderedText(10.5, 28, "________________________________________________________", "Calibri", 10, 100, $PDF_ALIGN_CENTER, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(1, 27, "Nome : " & $inputNome & "  |  Data de Nascimento : " & $input_dt_nasc & "  |  Sexo : " & $sexy_user, "Calibri", 10, 100, $PDF_ALIGN_LEFT, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(1, 26, "Mae : " & $inputNome_mae & "  |  Pai : " & $inputNome_pai, "Calibri", 10, 100, $PDF_ALIGN_LEFT, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(1, 25, "Naturalidade : " & $naturalidade_ & "  |  Possui Filhos : " & $possui_filhos & "  |  Quantidade : " & $quant_filhos, "Calibri", 10, 100, $PDF_ALIGN_LEFT, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(10.5, 24.1, "Formacao", "Calibri", 12, 100, $PDF_ALIGN_CENTER, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(10.5, 24, "____________________________", "Calibri", 10, 100, $PDF_ALIGN_CENTER, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(1, 23, "Nivel de Instrucao : " & $escolari_ & "  |  Nome Curso : " & $nome_form & "  |  Idiomas : " & $idioma_f & "  |  Estudando : " & $user_estud, "Calibri", 10, 100, $PDF_ALIGN_LEFT, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(10.5, 22.1, "Profissional Area Pretendida " & $area_prt, "Calibri", 12, 100, $PDF_ALIGN_CENTER, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(10.5, 22, "_________________________________________________________________", "Calibri", 10, 100, $PDF_ALIGN_CENTER, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(1, 21, "Vaga Prefencial : " & $vaga1 & "  |  Tempo de Experiencia : " & $vaga1_temp & "  |  Valor : " & $vaga1_valor, "Calibri", 10, 100, $PDF_ALIGN_LEFT, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(1, 20, "Descricao : " & $inputBreveDescr, "Calibri", 10, 100, $PDF_ALIGN_LEFT, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(1, 19, "Vaga Secundaria : " & $vaga2 & "  |  Tempo de Experiencia : " & $vaga2_temp & "  |  Valor : " & $vaga2_valor, "Calibri", 10, 100, $PDF_ALIGN_LEFT, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(1, 18, "Outra vaga de interesse : " & $vaga3,"Calibri", 10, 100, $PDF_ALIGN_LEFT, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(10.5, 17.1, "Documentos", "Calibri", 12, 100, $PDF_ALIGN_CENTER, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(10.5, 17, "____________________________", "Calibri", 10, 100, $PDF_ALIGN_CENTER, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(1, 16, "RG : " & $user_rg & "  |  CPF : " & $user_cpf & "  |  Carteira de Trabalho : " & $user_ctps, "Calibri", 10, 100, $PDF_ALIGN_LEFT, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(1, 15, "CNH : " & $cart_motorista, "Calibri", 10, 100, $PDF_ALIGN_LEFT, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(10.5, 14.1, "Contato", "Calibri", 12, 100, $PDF_ALIGN_CENTER, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(10.5, 14, "____________________________", "Calibri", 10, 100, $PDF_ALIGN_CENTER, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(1, 13, "Telefone Fixo : " & $tel_fixo & "  |  Celular : " & $celular & "  |  Email : " & $inputEmail, "Calibri", 10, 100, $PDF_ALIGN_LEFT, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(1, 12, "Recados : " & $nome_recado & "  |  Telefone Fixo : " & $tel_rec_fixo & "  |  Celular : " & $tel_rec_cel, "Calibri", 10, 100, $PDF_ALIGN_LEFT, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(10.5, 11.1, "Referencia Profissional", "Calibri", 12, 100, $PDF_ALIGN_CENTER, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(10.5, 11, "____________________________", "Calibri", 10, 100, $PDF_ALIGN_CENTER, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(1, 10, "Empresa : " & $Ult_empresa1 & "  |  Cargo : " & $Ult_empresa1_cargo & "  |  Periodo : " & $Ult_empresa1_periodo & "  |  Contato : " & $Ult_empresa1_contato & "  |  Telefone : " & $Ult_empresa1_telefone, "Calibri", 10, 100, $PDF_ALIGN_LEFT, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(1, 9, "Empresa : " & $Ult_empresa2 & "  |  Cargo : " & $Ult_empresa2_cargo & "  |  Periodo : " & $Ult_empresa2_periodo & "  |  Contato : " & $Ult_empresa2_contato & "  |  Telefone : " & $Ult_empresa2_telefone, "Calibri", 10, 100, $PDF_ALIGN_LEFT, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(10.5, 8.1, "Indicacao", "Calibri", 12, 100, $PDF_ALIGN_CENTER, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(10.5, 8, "____________________________", "Calibri", 10, 100, $PDF_ALIGN_CENTER, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(1, 7, "Indicado por : " & $indica_user & "  |  Empresa : " & $indicca_empresa, "Calibri", 10, 100, $PDF_ALIGN_LEFT, 0x000000, 0x000000) ; Previous Month
	; _InsertRenderedText(10.5, 4.8, "_________________________________________", "Calibri", 8, 100, $PDF_ALIGN_CENTER, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(1, 3, $empresa_cidade&", "&$data_ext_pt&" Ass. :________________________________________________________________", "Calibri", 10, 100, $PDF_ALIGN_LEFT, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(12.5, 2.5, $inputNome, "Calibri", 8, 100, $PDF_ALIGN_CENTER, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(10.5, 1,$empresa_endereco, "Calibri", 10, 100, $PDF_ALIGN_CENTER, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(10.5, 0.3, "Belo Horizonte Networks Solutions by www.bhns.com.br", "Calibri", 8, 100, $PDF_ALIGN_CENTER, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(10.5, 0.2, "________________________________________________________", "Calibri", 8, 100, $PDF_ALIGN_CENTER, 0x000000, 0x000000) ; Previous Month


	_EndPage() ; next month will be in a new page


	;write the buffer to disk
	_ClosePDFFile()
	; --- Functions ---


	#CS
		FileWriteLine(@ScriptDir & "\Fom_User2.txt", "Ficha de Cadastro de Recrutamento RH")
		FileWriteLine(@ScriptDir & "\Fom_User2.txt",@CRLF)
		FileWriteLine(@ScriptDir & "\Fom_User2.txt", "Pessoa")
		FileWriteLine(@ScriptDir & "\Fom_User2.txt",@CRLF)
		FileWriteLine(@ScriptDir & "\Fom_User2.txt", "Nome : "&$inputNome&"    Data de Nascimento : "&$input_dt_nasc&"  Sexo : "&$sexy_user )
		FileWriteLine(@ScriptDir & "\Fom_User2.txt",@CRLF)
		FileWriteLine(@ScriptDir & "\Fom_User2.txt", "Mãe : "&$inputNome_mae&"    Pai : "&$inputNome_pai )
		FileWriteLine(@ScriptDir & "\Fom_User2.txt",@CRLF)
		FileWriteLine(@ScriptDir & "\Fom_User2.txt", "Naturalidade : "&$naturalidade_&"  Possui Filhos : "&$possui_filhos&"  Quantidade : "&$quant_filhos )
		FileWriteLine(@ScriptDir & "\Fom_User2.txt",@CRLF)
		FileWriteLine(@ScriptDir & "\Fom_User2.txt", "Formação")
		FileWriteLine(@ScriptDir & "\Fom_User2.txt",@CRLF)
		FileWriteLine(@ScriptDir & "\Fom_User2.txt", "Nível de Instrução : "&$escolari_&"  Nome Curso : "&$nome_form&" Idiomas : "&$idioma_f&"  Estudando : "&$user_estud)
		FileWriteLine(@ScriptDir & "\Fom_User2.txt",@CRLF)
		FileWriteLine(@ScriptDir & "\Fom_User2.txt", "Profissional")
		FileWriteLine(@ScriptDir & "\Fom_User2.txt",@CRLF)
		FileWriteLine(@ScriptDir & "\Fom_User2.txt", "Aréa Pretendida : "&$area_prt&"")
		FileWriteLine(@ScriptDir & "\Fom_User2.txt", "Vaga Prefencial : "&$vaga1&"     Tempo de Experiência : "&$vaga1_temp&"     Prenteção : "&$vaga1_valor)
		FileWriteLine(@ScriptDir & "\Fom_User2.txt",@CRLF)
		FileWriteLine(@ScriptDir & "\Fom_User2.txt", "Descrição de Experiencia : "&$inputBreveDescr)
		FileWriteLine(@ScriptDir & "\Fom_User2.txt",@CRLF)
		FileWriteLine(@ScriptDir & "\Fom_User2.txt", "Vaga Secundaria : "&$vaga2&"     Tempo de Experiência : "&$vaga2_temp&"     Prenteção : "&$vaga2_valor)
		FileWriteLine(@ScriptDir & "\Fom_User2.txt",@CRLF)
		FileWriteLine(@ScriptDir & "\Fom_User2.txt", "Disposição para outra vaga de interesse : "&$vaga3)
		FileWriteLine(@ScriptDir & "\Fom_User2.txt",@CRLF)
		FileWriteLine(@ScriptDir & "\Fom_User2.txt", "Documentos")
		FileWriteLine(@ScriptDir & "\Fom_User2.txt",@CRLF)
		FileWriteLine(@ScriptDir & "\Fom_User2.txt", "RG : "&$user_rg&"    CPF : "&$user_cpf&"    Carteira de Trabalho : "&$user_ctps )
		FileWriteLine(@ScriptDir & "\Fom_User2.txt", "CNH : "&$cart_motorista)
		FileWriteLine(@ScriptDir & "\Fom_User2.txt",@CRLF)
		FileWriteLine(@ScriptDir & "\Fom_User2.txt", "Endereço")
		FileWriteLine(@ScriptDir & "\Fom_User2.txt",@CRLF)
		FileWriteLine(@ScriptDir & "\Fom_User2.txt", "Endereço : "&$end_user&", "&$bairro_user&" "&$cid_user &" "&$est_user&" CEP "&$cep_user)
		FileWriteLine(@ScriptDir & "\Fom_User2.txt",@CRLF)
		FileWriteLine(@ScriptDir & "\Fom_User2.txt", "Contato")
		FileWriteLine(@ScriptDir & "\Fom_User2.txt",@CRLF)
		FileWriteLine(@ScriptDir & "\Fom_User2.txt", "Telefone Fixo : "&$tel_fixo&"    Celular : "&$celular&"   Email : "&$inputEmail )
		FileWriteLine(@ScriptDir & "\Fom_User2.txt",@CRLF)
		FileWriteLine(@ScriptDir & "\Fom_User2.txt", "Recados : "&$nome_recado&"    Telefone Fixo : "&$tel_rec_fixo&"   Celular : "&$tel_rec_cel)
		FileWriteLine(@ScriptDir & "\Fom_User2.txt",@CRLF)
		FileWriteLine(@ScriptDir & "\Fom_User2.txt", "Referência Profissional")
		FileWriteLine(@ScriptDir & "\Fom_User2.txt",@CRLF)
		FileWriteLine(@ScriptDir & "\Fom_User2.txt", "Empresa : "&$Ult_empresa1&"  Cargo : "&$Ult_empresa1_cargo&"  Periodo : "&$Ult_empresa1_periodo &"  Contato : "&$Ult_empresa1_contato&"  Telefone : "&$Ult_empresa1_telefone)
		FileWriteLine(@ScriptDir & "\Fom_User2.txt",@CRLF)
		FileWriteLine(@ScriptDir & "\Fom_User2.txt", "Empresa : "&$Ult_empresa2&"  Cargo : "&$Ult_empresa2_cargo&"  Periodo : "&$Ult_empresa2_periodo &"  Contato : "&$Ult_empresa2_contato&"  Telefone : "&$Ult_empresa2_telefone)
		FileWriteLine(@ScriptDir & "\Fom_User2.txt",@CRLF)
		FileWriteLine(@ScriptDir & "\Fom_User2.txt", "Indicação")
		FileWriteLine(@ScriptDir & "\Fom_User2.txt",@CRLF)
		FileWriteLine(@ScriptDir & "\Fom_User2.txt", "Indicado por : "&$indica_user&"  Empresa : "&$indicca_empresa)
		FileWriteLine(@ScriptDir & "\Fom_User2.txt",@CRLF)



		FileWriteLine(@ScriptDir & "\Fom_User1.txt", "                         Ficha de Cadastro de Recrutamento RH               ")
		FileWriteLine(@ScriptDir & "\Fom_User1.txt",@CRLF)
		FileWriteLine(@ScriptDir & "\Fom_User1.txt", "                                       Pessoa                               ")
		FileWriteLine(@ScriptDir & "\Fom_User1.txt",@CRLF)
		FileWriteLine(@ScriptDir & "\Fom_User1.txt", "Nome : "&$inputNome&"    Data de Nascimento : "&$input_dt_nasc&"  Sexo : "&$sexy_user )
		FileWriteLine(@ScriptDir & "\Fom_User1.txt",@CRLF)
		FileWriteLine(@ScriptDir & "\Fom_User1.txt", "Mãe : "&$inputNome_mae&"    Pai : "&$inputNome_pai )
		FileWriteLine(@ScriptDir & "\Fom_User1.txt",@CRLF)
		FileWriteLine(@ScriptDir & "\Fom_User1.txt", "Naturalidade : "&$naturalidade_&"  Possui Filhos : "&$possui_filhos&"  Quantidade : "&$quant_filhos )
		FileWriteLine(@ScriptDir & "\Fom_User1.txt",@CRLF)
		FileWriteLine(@ScriptDir & "\Fom_User1.txt", "                                       Formação                             ")
		FileWriteLine(@ScriptDir & "\Fom_User1.txt",@CRLF)
		FileWriteLine(@ScriptDir & "\Fom_User1.txt", "Nível de Instrução : "&$escolari_&"  Nome Curso : "&$nome_form&" Idiomas : "&$idioma_f&"  Estudando : "&$user_estud)
		FileWriteLine(@ScriptDir & "\Fom_User1.txt",@CRLF)
		FileWriteLine(@ScriptDir & "\Fom_User1.txt", "                                      Profissional                            ")
		FileWriteLine(@ScriptDir & "\Fom_User1.txt",@CRLF)
		FileWriteLine(@ScriptDir & "\Fom_User1.txt", "                               Aréa Pretendida : "&$area_prt&"                       ")
		FileWriteLine(@ScriptDir & "\Fom_User1.txt", "Vaga Prefencial : "&$vaga1&"     Tempo de Experiência : "&$vaga1_temp&"     Prenteção : "&$vaga1_valor)
		FileWriteLine(@ScriptDir & "\Fom_User1.txt",@CRLF)
		FileWriteLine(@ScriptDir & "\Fom_User1.txt", "Descrição de Experiencia : "&$inputBreveDescr)
		FileWriteLine(@ScriptDir & "\Fom_User1.txt",@CRLF)
		FileWriteLine(@ScriptDir & "\Fom_User1.txt", "Vaga Secundaria : "&$vaga2&"     Tempo de Experiência : "&$vaga2_temp&"     Prenteção : "&$vaga2_valor)
		FileWriteLine(@ScriptDir & "\Fom_User1.txt",@CRLF)
		FileWriteLine(@ScriptDir & "\Fom_User1.txt", "Disposição para outra vaga de interesse : "&$vaga3)
		FileWriteLine(@ScriptDir & "\Fom_User1.txt",@CRLF)
		FileWriteLine(@ScriptDir & "\Fom_User1.txt", "                                         Documentos                            ")
		FileWriteLine(@ScriptDir & "\Fom_User1.txt",@CRLF)
		FileWriteLine(@ScriptDir & "\Fom_User1.txt", "RG : "&$user_rg&"    CPF : "&$user_cpf&"    Carteira de Trabalho : "&$user_ctps )
		FileWriteLine(@ScriptDir & "\Fom_User1.txt", "CNH : "&$cart_motorista)
		FileWriteLine(@ScriptDir & "\Fom_User1.txt",@CRLF)
		FileWriteLine(@ScriptDir & "\Fom_User1.txt", "                                          Endereço                            ")
		FileWriteLine(@ScriptDir & "\Fom_User1.txt",@CRLF)
		FileWriteLine(@ScriptDir & "\Fom_User1.txt", "Endereço : "&$end_user&", "&$bairro_user&" "&$cid_user &" "&$est_user&" CEP "&$cep_user)
		FileWriteLine(@ScriptDir & "\Fom_User1.txt",@CRLF)
		FileWriteLine(@ScriptDir & "\Fom_User1.txt", "                                          Contato                            ")
		FileWriteLine(@ScriptDir & "\Fom_User1.txt",@CRLF)
		FileWriteLine(@ScriptDir & "\Fom_User1.txt", "Telefone Fixo : "&$tel_fixo&"    Celular : "&$celular&"   Email : "&$inputEmail )
		FileWriteLine(@ScriptDir & "\Fom_User1.txt",@CRLF)
		FileWriteLine(@ScriptDir & "\Fom_User1.txt", "Recados : "&$nome_recado&"    Telefone Fixo : "&$tel_rec_fixo&"   Celular : "&$tel_rec_cel)
		FileWriteLine(@ScriptDir & "\Fom_User1.txt",@CRLF)
		FileWriteLine(@ScriptDir & "\Fom_User1.txt", "                                      Referência Profissional                           ")
		FileWriteLine(@ScriptDir & "\Fom_User1.txt",@CRLF)
		FileWriteLine(@ScriptDir & "\Fom_User1.txt", "Empresa : "&$Ult_empresa1&"  Cargo : "&$Ult_empresa1_cargo&"  Periodo : "&$Ult_empresa1_periodo &"  Contato : "&$Ult_empresa1_contato&"  Telefone : "&$Ult_empresa1_telefone)
		FileWriteLine(@ScriptDir & "\Fom_User1.txt",@CRLF)
		FileWriteLine(@ScriptDir & "\Fom_User1.txt", "Empresa : "&$Ult_empresa2&"  Cargo : "&$Ult_empresa2_cargo&"  Periodo : "&$Ult_empresa2_periodo &"  Contato : "&$Ult_empresa2_contato&"  Telefone : "&$Ult_empresa2_telefone)
		FileWriteLine(@ScriptDir & "\Fom_User1.txt",@CRLF)
		FileWriteLine(@ScriptDir & "\Fom_User1.txt", "                                           Indicação                          ")
		FileWriteLine(@ScriptDir & "\Fom_User1.txt",@CRLF)
		FileWriteLine(@ScriptDir & "\Fom_User1.txt", "Indicação : "&$indica_user&"  Empresa : "&$indicca_empresa)
		FileWriteLine(@ScriptDir & "\Fom_User1.txt",@CRLF)
	#ce


	GUIDelete()

	#Region ### START Koda GUI section ### Form=e:\rh\form3.kxf
	$Form2 = GUICreate("INVENTÁRIO DE COMUNICAÇÕES INTERPESSOAIS", 862, 507, -1, -1)
	GUISetBkColor(0xA6CAF0)
	$Label1 = GUICtrlCreateLabel("INVENTÁRIO DE COMUNICAÇÕES INTERPESSOAIS", 194, 4, 463, 28)
	GUICtrlSetFont(-1, 14, 400, 0, "MS Sans Serif")
	$Label2 = GUICtrlCreateLabel("    Este inventário lhe oferece uma oportunidade de fazer um estudo objetivo do grau e dos padrões de comunicação em suas relações interpessoais. Ele permitirá que você compreenda melhor a maneira como você se apresenta e age ao se comunicar com pessoas em seus contatos e atividades diárias. ", 8, 35, 840, 150)
	GUICtrlSetFont(-1, 14, 400, 0, "MS Sans Serif")
	$Button1 = GUICtrlCreateButton("Iniciar", 356, 431, 155, 57, BitOR($BS_DEFPUSHBUTTON, $BS_NOTIFY, $BS_FLAT))
	GUICtrlSetFont(-1, 24, 400, 0, "MS Sans Serif")
	$Label3 = GUICtrlCreateLabel("Intruções :", 6, 140, 200, 50)
	GUICtrlSetFont(-1, 18, 400, 0, "MS Sans Serif")
	$Label4 = GUICtrlCreateLabel(". Ao responder as questões, considere seu relacionamento com pessoas que não sejam membros de sua família.", 25, 175, 800, 50)
	GUICtrlSetFont(-1, 14, 400, 0, "MS Sans Serif")
	$Label5 = GUICtrlCreateLabel(". É imprescindível que as respostas sejam bastante honestas. Use de total franqueza, uma vez que as respostas terão caráter confidencial.", 25, 235, 800, 50)
	GUICtrlSetFont(-1, 14, 400, 0, "MS Sans Serif")
	$Label6 = GUICtrlCreateLabel(". ÀS VEZES deve ser marcado quando você definitivamente não puder responder com um (SIM) ou um (NÃO). Use esta opção o mínimo que puder.", 25, 295, 800, 50)
	GUICtrlSetFont(-1, 14, 400, 0, "MS Sans Serif")
	$Label7 = GUICtrlCreateLabel(". Não há respostas certas ou erradas. Responda de acordo com a maneira que você sente neste momento. E lembre-se que você não deve se referir a membros da família ao responder.", 25, 365, 810, 50)
	GUICtrlSetFont(-1, 14, 400, 0, "MS Sans Serif")
	GUISetState(@SW_SHOW)
	#EndRegion ### END Koda GUI section ###

	While 1
		$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $Button1
				ExitLoop

		EndSwitch
	WEnd

	GUIDelete()

	Local $files_splits1 = StringSplit($form_int_pergunt, ";") ; Split the string of days using the delimiter "," and the default flag value.
	Local $files_splits2 = StringSplit($form_int_sim, ";") ; Split the string of days using the delimiter "," and the default flag value.
	Local $files_splits3 = StringSplit($form_int_nao, ";") ; Split the string of days using the delimiter "," and the default flag value.


	; MsgBox(4096, "Lista =",$files_splits2[0])

	For $i = 1 To $files_splits1[0] ; Loop through the array returned by StringSplit to display the individual values.


		If $viewer_points = 0 Then

			$modo_viwer_points = ""

		Else

			$modo_viwer_points = &" | Pontos Ganhos : " & $pontos_inter

		EndIf


		#Region ### START Koda GUI section ### Form=E:\RH\Form2.kxf
		$Form2 = GUICreate("Inventário de Comunicações Interpessoais " & $i & "/" & $files_splits1[0] & $modo_viwer_points, 862, 507, -1, -1)
		GUISetBkColor(0xA6CAF0)
		$Pic1 = GUICtrlCreatePic($S_IMG & "\comunicacao.jpg", 176, 10, 497, 153)
		$Label1 = GUICtrlCreateLabel($files_splits1[$i], 16, 240, 827, 150)
		GUICtrlSetFont(-1, 24, 400, 0, "MS Sans Serif")
		$Button1 = GUICtrlCreateButton("Sim", 152, 408, 155, 57, BitOR($BS_DEFPUSHBUTTON, $BS_NOTIFY, $BS_FLAT))
		GUICtrlSetFont(-1, 24, 400, 0, "MS Sans Serif")
		$Button2 = GUICtrlCreateButton("Não", 356, 407, 155, 57, BitOR($BS_DEFPUSHBUTTON, $BS_NOTIFY, $BS_FLAT))
		GUICtrlSetFont(-1, 24, 400, 0, "MS Sans Serif")
		$Button3 = GUICtrlCreateButton("As Vezes", 563, 409, 155, 57, BitOR($BS_DEFPUSHBUTTON, $BS_NOTIFY, $BS_FLAT))
		GUICtrlSetFont(-1, 24, 400, 0, "MS Sans Serif")
		GUISetState(@SW_SHOW)
		#EndRegion ### END Koda GUI section ###

		While 1
			$nMsg = GUIGetMsg()
			Switch $nMsg
				Case $GUI_EVENT_CLOSE
					Exit


				Case $Button1
					$pontos_inter = $pontos_inter + $files_splits2[$i]

					GUIDelete()
					ExitLoop
				Case $Button2
					$pontos_inter = $pontos_inter + $files_splits3[$i]

					GUIDelete()
					ExitLoop
				Case $Button3

					$pontos_inter = $pontos_inter + $form_int_asvezes


					GUIDelete()
					ExitLoop
			EndSwitch
		WEnd




	Next

	
	
about_enterprise()



If FileExists($sFldr & "\matematica.ini") Then

$patch_form = $form_mate
$form_points_in = $_points_mate

form_incremental()
$total_fom_mate = $_total_questions
$_points_mate = $form_points_in

EndIf



if $idioma_f = "Somente Portugues" Then


else

If FileExists($sFldr & "\ingles.ini") Then

$patch_form = $form_ingles
$form_points_in = $_points_ingles

form_incremental()
$total_fom_ingles = $_total_questions
$_points_ingles = $form_points_in

EndIf

EndIf



	
	


GUIDelete()

$dep_name = urlencode($dep_name)
Local $id_dep
Local $s_dep_name = StringSplit($dep_name, ";") ; Split the string of days using the delimiter "," and the default flag value.
For $i = 1 To $s_dep_name[0] ; Loop through the array returned by StringSplit to display the individual values.
if $area_prt = $s_dep_name[$i] Then
$id_dep	= $i
EndIf
Next

If FileExists($sFldr & "\form_"&$id_dep&".ini") Then
$_Form_question = IniRead($sFldr & "\form_"&$id_dep&".ini", "FORM", "QUESTION","")
$_Form_reponse_1 = IniRead($sFldr & "\form_"&$id_dep&".ini", "FORM", "RESPONSE_1", "")
$_Form_reponse_2 = IniRead($sFldr & "\form_"&$id_dep&".ini", "FORM", "RESPONSE_2", "")
$_Form_reponse_3 = IniRead($sFldr & "\form_"&$id_dep&".ini", "FORM", "RESPONSE_3", "")
$_Form_reponse_4 = IniRead($sFldr & "\form_"&$id_dep&".ini", "FORM", "RESPONSE_4", "")
$_Form_reponse_5 = IniRead($sFldr & "\form_"&$id_dep&".ini", "FORM", "RESPONSE_5", "")
$_Form_reponse_6 = IniRead($sFldr & "\form_"&$id_dep&".ini", "FORM", "RESPONSE_6", "")
$_Form_correct = IniRead($sFldr & "\form_"&$id_dep&".ini", "FORM", "RESPONSE_CORRECT", "")
$_Form_form = IniRead($sFldr & "\form_"&$id_dep&".ini", "FORM", "FORM", "")
Local $s_Form_question = StringSplit($_Form_question, ";") ; Split the string of days using the delimiter "," and the default flag value.
Local $s_Form_reponse_1 = StringSplit($_Form_reponse_1, ";") ; Split the string of days using the delimiter "," and the default flag value.
Local $s_Form_reponse_2 = StringSplit($_Form_reponse_2, ";") ; Split the string of days using the delimiter "," and the default flag value.
Local $s_Form_reponse_3 = StringSplit($_Form_reponse_3, ";") ; Split the string of days using the delimiter "," and the default flag value.
Local $s_Form_reponse_4 = StringSplit($_Form_reponse_4, ";") ; Split the string of days using the delimiter "," and the default flag value.
Local $s_Form_reponse_5 = StringSplit($_Form_reponse_5, ";") ; Split the string of days using the delimiter "," and the default flag value.
Local $s_Form_reponse_6 = StringSplit($_Form_reponse_6, ";") ; Split the string of days using the delimiter "," and the default flag value.
Local $s_Form_correct = StringSplit($_Form_correct, ";") ; Split the string of days using the delimiter "," and the default flag value.
Local $s_Form_form = StringSplit($_Form_form, ";") ; Split the string of days using the delimiter "," and the default flag value.

$total_questions = $s_Form_question[0]

;if If FileExists($sFldr & "\form_"&$id_dep&".ini") Then

For $i = 1 To $s_Form_question[0] ; Loop through the array returned by StringSplit to display the individual values.
#Region ### START Koda GUI section ### Form=e:\rh\form4.kxf
$Form2 = GUICreate($area_prt &" "& $i & "/" & $s_Form_question[0] , 1024, 736, -1, -1)
GUISetBkColor(0xA6CAF0)
$Label1 = GUICtrlCreateLabel("Teste de Conhecimento |  "&$area_prt, 304, 1, 463, -1)
GUICtrlSetFont(-1, 14, 400, 0, "MS Sans Serif")
$Button1 = GUICtrlCreateButton("Ok", 458, 663, 155, 57, BitOR($BS_DEFPUSHBUTTON,$BS_NOTIFY,$BS_FLAT))
GUICtrlSetFont(-1, 24, 400, 0, "MS Sans Serif")
$Pic1 = GUICtrlCreatePic($S_IMG & "\"&$id_dep&"_imagem_"&$i&".jpg", 265, 30, 524, 140)
$Label2 = GUICtrlCreateLabel($s_Form_question[$i], 10, 189, 1000, 50)
GUICtrlSetFont(-1, 16, 400, 0, "MS Sans Serif")
$Radio1 = GUICtrlCreateRadio($s_Form_reponse_1[$i], 20, 245,  1000, 50)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$Radio2 = GUICtrlCreateRadio($s_Form_reponse_2[$i], 20, 314,  1000, 50)
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$Radio3 = GUICtrlCreateRadio($s_Form_reponse_3[$i], 20, 384,  1000, 50)
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$Radio4 = GUICtrlCreateRadio($s_Form_reponse_4[$i], 20, 453,  1000, 50)
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$Radio5 = GUICtrlCreateRadio($s_Form_reponse_5[$i], 20, 523,  1000, 50)
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$Radio6 = GUICtrlCreateRadio($s_Form_reponse_6[$i], 20, 592,  1000, 50)
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

         Case $Button1
        ;Buttons
	Select
		Case GUICtrlRead($Radio1) = $GUI_CHECKED
			If $s_Form_correct[$i] = 1 Then
			$pontos_teste = $pontos_teste + 1
			EndIf

			ExitLoop
		Case GUICtrlRead($Radio2) = $GUI_CHECKED
			If $s_Form_correct[$i] = 2 Then
			$pontos_teste = $pontos_teste + 1
			EndIf
			ExitLoop
		Case GUICtrlRead($Radio3) = $GUI_CHECKED
			If $s_Form_correct[$i] = 3 Then
			$pontos_teste = $pontos_teste + 1
			EndIf
			ExitLoop
		Case GUICtrlRead($Radio4) = $GUI_CHECKED
			If $s_Form_correct[$i] = 4 Then
			$pontos_teste = $pontos_teste + 1
			EndIf
			ExitLoop
		Case GUICtrlRead($Radio5) = $GUI_CHECKED
			If $s_Form_correct[$i] = 5 Then
			$pontos_teste = $pontos_teste + 1
			EndIf
			ExitLoop
		Case GUICtrlRead($Radio6) = $GUI_CHECKED
			If $s_Form_correct[$i] = 6 Then
			$pontos_teste = $pontos_teste + 1
			EndIf
			ExitLoop
	EndSelect




	EndSwitch
WEnd


GUIDelete()

Next

;-----------------------------------------------Refazer outro questionario-----------------------------------------
if $_Form_form = "" not Then




For $3i = 1 To $s_Form_form[0]

$_pontos_teste = 0

For $2i = 1 To $s_dep_name[0] ; Loop through the array returned by StringSplit to display the individual values.

if $s_Form_form[$3i] = $2i Then

$area_2	= $s_dep_name[$2i]

Local $name_dep2 = $s_dep_name[$2i]

EndIf

Next



$id_dep = $s_Form_form[$3i]



If FileExists($sFldr & "\form_"&$id_dep&".ini") Then
$_Form_question = IniRead($sFldr & "\form_"&$id_dep&".ini", "FORM", "QUESTION","")
$_Form_reponse_1 = IniRead($sFldr & "\form_"&$id_dep&".ini", "FORM", "RESPONSE_1", "")
$_Form_reponse_2 = IniRead($sFldr & "\form_"&$id_dep&".ini", "FORM", "RESPONSE_2", "")
$_Form_reponse_3 = IniRead($sFldr & "\form_"&$id_dep&".ini", "FORM", "RESPONSE_3", "")
$_Form_reponse_4 = IniRead($sFldr & "\form_"&$id_dep&".ini", "FORM", "RESPONSE_4", "")
$_Form_reponse_5 = IniRead($sFldr & "\form_"&$id_dep&".ini", "FORM", "RESPONSE_5", "")
$_Form_reponse_6 = IniRead($sFldr & "\form_"&$id_dep&".ini", "FORM", "RESPONSE_6", "")
$_Form_correct = IniRead($sFldr & "\form_"&$id_dep&".ini", "FORM", "RESPONSE_CORRECT", "")

Local $s_Form_question = StringSplit($_Form_question, ";") ; Split the string of days using the delimiter "," and the default flag value.
Local $s_Form_reponse_1 = StringSplit($_Form_reponse_1, ";") ; Split the string of days using the delimiter "," and the default flag value.
Local $s_Form_reponse_2 = StringSplit($_Form_reponse_2, ";") ; Split the string of days using the delimiter "," and the default flag value.
Local $s_Form_reponse_3 = StringSplit($_Form_reponse_3, ";") ; Split the string of days using the delimiter "," and the default flag value.
Local $s_Form_reponse_4 = StringSplit($_Form_reponse_4, ";") ; Split the string of days using the delimiter "," and the default flag value.
Local $s_Form_reponse_5 = StringSplit($_Form_reponse_5, ";") ; Split the string of days using the delimiter "," and the default flag value.
Local $s_Form_reponse_6 = StringSplit($_Form_reponse_6, ";") ; Split the string of days using the delimiter "," and the default flag value.
Local $s_Form_correct = StringSplit($_Form_correct, ";") ; Split the string of days using the delimiter "," and the default flag value.

$_total_questions = $s_Form_question[0]



;if If FileExists($sFldr & "\form_"&$id_dep&".ini") Then

For $i = 1 To $s_Form_question[0] ; Loop through the array returned by StringSplit to display the individual values.
#Region ### START Koda GUI section ### Form=e:\rh\form4.kxf
$Form2 = GUICreate($name_dep2 &" "& $i & "/" & $s_Form_question[0] , 1024, 736, -1, -1)
GUISetBkColor(0xA6CAF0)
$Label1 = GUICtrlCreateLabel("Teste de Conhecimento |  "& $name_dep2, 304, 1, 463, -1)
GUICtrlSetFont(-1, 14, 400, 0, "MS Sans Serif")
$Button1 = GUICtrlCreateButton("Ok", 458, 663, 155, 57, BitOR($BS_DEFPUSHBUTTON,$BS_NOTIFY,$BS_FLAT))
GUICtrlSetFont(-1, 24, 400, 0, "MS Sans Serif")
$Pic1 = GUICtrlCreatePic($S_IMG & "\"&$id_dep&"_imagem_"&$i&".jpg", 265, 30, 524, 140)
$Label2 = GUICtrlCreateLabel($s_Form_question[$i], 10, 189, 1000, 50)
GUICtrlSetFont(-1, 16, 400, 0, "MS Sans Serif")
$Radio1 = GUICtrlCreateRadio($s_Form_reponse_1[$i], 20, 245,  1000, 50)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$Radio2 = GUICtrlCreateRadio($s_Form_reponse_2[$i], 20, 314,  1000, 50)
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$Radio3 = GUICtrlCreateRadio($s_Form_reponse_3[$i], 20, 384,  1000, 50)
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$Radio4 = GUICtrlCreateRadio($s_Form_reponse_4[$i], 20, 453,  1000, 50)
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$Radio5 = GUICtrlCreateRadio($s_Form_reponse_5[$i], 20, 523,  1000, 50)
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$Radio6 = GUICtrlCreateRadio($s_Form_reponse_6[$i], 20, 592,  1000, 50)
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

         Case $Button1
        ;Buttons
	Select
		Case GUICtrlRead($Radio1) = $GUI_CHECKED
			If $s_Form_correct[$i] = 1 Then
			$_pontos_teste = $_pontos_teste + 1
			EndIf

			ExitLoop
		Case GUICtrlRead($Radio2) = $GUI_CHECKED
			If $s_Form_correct[$i] = 2 Then
			$_pontos_teste = $_pontos_teste + 1
			EndIf
			ExitLoop
		Case GUICtrlRead($Radio3) = $GUI_CHECKED
			If $s_Form_correct[$i] = 3 Then
			$_pontos_teste = $_pontos_teste + 1
			EndIf
			ExitLoop
		Case GUICtrlRead($Radio4) = $GUI_CHECKED
			If $s_Form_correct[$i] = 4 Then
			$_pontos_teste = $_pontos_teste + 1
			EndIf
			ExitLoop
		Case GUICtrlRead($Radio5) = $GUI_CHECKED
			If $s_Form_correct[$i] = 5 Then
			$_pontos_teste = $_pontos_teste + 1
			EndIf
			ExitLoop
		Case GUICtrlRead($Radio6) = $GUI_CHECKED
			If $s_Form_correct[$i] = 6 Then
			$_pontos_teste = $_pontos_teste + 1
			EndIf
			ExitLoop
	EndSelect




	EndSwitch
WEnd


GUIDelete()

Next




EndIf

$area_3	= $area_3 & $area_2&" "& $_pontos_teste&" de "& $_total_questions&" | "

Next

Else



EndIf

;-----------------------------------------------Refazer outro questionario-----------------------------------------




EndIf


	; Avaliar pontuacao
	Local $nivel_intelectual
	If $pontos_inter > 115 Then
		$nivel_intelectual = "TOP"
	ElseIf $pontos_inter > 110 Then
		$nivel_intelectual = "OTIMO"
	ElseIf $pontos_inter > 99 Then
		$nivel_intelectual = "MUITO BOM"
	ElseIf $pontos_inter > 84 Then
		$nivel_intelectual = "BOM"
	ElseIf $pontos_inter > 59 Then
		$nivel_intelectual = "NORMAL"
	EndIf



	$horario_fim = ("" & @HOUR & ":" & @MIN & ":" & @SEC)
	$avaliacao_user = "Avaliacao"

	;set the properties for the pdf
	_SetTitle($avaliacao_user & " " & $curriculo_pdf & " " & $data & " " & $horario)
	_SetSubject($avaliacao_user & "  (www.bhns.com.br)")
	_SetKeywords($avaliacao_user & "," & $curriculo_pdf & "," & $data & ", pdf")
	_OpenAfter(True);open after generation
	_SetUnit($PDF_UNIT_CM)
	_SetPaperSize("A4")
	_SetZoomMode($PDF_ZOOM_FULLPAGE)
	_SetOrientation($PDF_ORIENTATION_PORTRAIT)
	_SetLayoutMode($PDF_LAYOUT_CONTINOUS)


	;initialize the pdf
	_InitPDF(@ScriptDir & "\PROFILE\" & $avaliacao_user & "_" & $curriculo_pdf & ".pdf")

	;=== load used font(s) ===
	_LoadFontTT("_TimesNR", $PDF_FONT_TIMES)
	_LoadFontTT("Calibri", $PDF_FONT_TIMES, $PDF_FONT_NORMAL)
	;_LoadFontTT("_ANRB", $PDF_FONT_TIMES, $PDF_FONT_BOLD)

	_BeginPage() ; begin page


 

	; --- now fill the areas with the dates --------------------------------------------------
	; --- now fill the areas with the dates --------------------------------------------------
	_DrawLine(30, 00.80, 30, 30, "0X2", 0, 0.03, 0x000000, 0, 0)
	; _DrawLine(17.20, 25.80, 03.80, 25.80, "0X2", 0, 0.03, 0x000000, 0, 0)
	_InsertRenderedText(20, 29, "Inicio : " & $data & " " & $horario & "  |  Fim : " & $horario_fim, "Calibri", 10, 100, $PDF_ALIGN_RIGHT, 0x000000) ; Main Month
	_InsertRenderedText(10.5, 28.1, $avaliacao_user & " Pontos Obitidos Inventario de Comunicacoes Interpessoais : ( " & $pontos_inter&" ) "&$nivel_intelectual, "_TimesNR", 12, 100, $PDF_ALIGN_CENTER, 0x000000, 0x000000) ; Main Month
	_InsertRenderedText(10.5, 28, "________________________________________________________________________________________________________", "Calibri", 10, 100, $PDF_ALIGN_CENTER, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(1, 27, "Nome : " & $inputNome & "  |  Data de Nascimento : " & $input_dt_nasc & "  |  Sexo : " & $sexy_user, "Calibri", 10, 100, $PDF_ALIGN_LEFT, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(1, 26, "Possui Filhos : " & $possui_filhos & "  |  Quantidade : " & $quant_filhos, "Calibri", 10, 100, $PDF_ALIGN_LEFT, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(10.5, 25.1, "CNH " & $cart_motorista, "Calibri", 12, 100, $PDF_ALIGN_CENTER, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(10.5, 25, "___________________________________", "Calibri", 10, 100, $PDF_ALIGN_CENTER, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(1, 24, "Nivel de Instrucao : " & $escolari_ & "  |  Nome Curso : " & $nome_form & "  |  Idiomas : " & $idioma_f & "  |  Estudando : " & $user_estud, "Calibri", 10, 100, $PDF_ALIGN_LEFT, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(10.5, 23.1, "Profissional Area Pretendida " & $area_prt &" Pontos Ganhos "&$pontos_teste&" de "&$total_questions, "Calibri", 12, 100, $PDF_ALIGN_CENTER, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(10.5, 23, "__________________________________________________________________________________________", "Calibri", 10, 100, $PDF_ALIGN_CENTER, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(1, 22, "Vaga Prefencial : " & $vaga1 & "  |  Tempo de Experiencia : " & $vaga1_temp & "  |  Valor : " & $vaga1_valor, "Calibri", 10, 100, $PDF_ALIGN_LEFT, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(1, 21, "Descricao : " & $inputBreveDescr, "Calibri", 10, 100, $PDF_ALIGN_LEFT, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(1, 20, "Vaga Secundaria : " & $vaga2 & "  |  Tempo de Experiencia : " & $vaga2_temp & "  |  Valor : " & $vaga2_valor, "Calibri", 10, 100, $PDF_ALIGN_LEFT, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(1, 19, "Outra vaga de interesse : " & $vaga3, "Calibri", 10, 100, $PDF_ALIGN_LEFT, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(10.5, 18.1,"Outros Testes | " &$area_3, "_TimesNR", 12, 100, $PDF_ALIGN_CENTER, 0x000000, 0x000000) ; Main Month
	_InsertRenderedText(10.5, 18, "__________________________________________________________________________________________", "Calibri", 10, 100, $PDF_ALIGN_CENTER, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(10.5, 17.1,$form_mate&" "&$_points_mate&" de "&$total_fom_mate&" | "&$form_ingles&" "&$_points_ingles&" de "&$total_fom_ingles, "_TimesNR", 12, 100, $PDF_ALIGN_CENTER, 0x000000, 0x000000) ; Main Month
	_InsertRenderedText(10.5, 17, "__________________________________________________________________________________________", "Calibri", 10, 100, $PDF_ALIGN_CENTER, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(10.5, 16, "Referencia Profissional", "Calibri", 12, 100, $PDF_ALIGN_CENTER, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(1, 15, "Empresa : " & $Ult_empresa1 & "  |  Cargo : " & $Ult_empresa1_cargo & "  |  Periodo : " & $Ult_empresa1_periodo & "  |  Contato : " & $Ult_empresa1_contato & "  |  Telefone : " & $Ult_empresa1_telefone, "Calibri", 10, 100, $PDF_ALIGN_LEFT, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(1, 14, "Empresa : " & $Ult_empresa2 & "  |  Cargo : " & $Ult_empresa2_cargo & "  |  Periodo : " & $Ult_empresa2_periodo & "  |  Contato : " & $Ult_empresa2_contato & "  |  Telefone : " & $Ult_empresa2_telefone, "Calibri", 10, 100, $PDF_ALIGN_LEFT, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(10.5, 13, "Indicacao", "Calibri", 12, 100, $PDF_ALIGN_CENTER, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(1, 12, "Indicado por : " & $indica_user & "  |  Empresa : " & $indicca_empresa, "Calibri", 10, 100, $PDF_ALIGN_LEFT, 0x000000, 0x000000) ; Previous Month
	; _InsertRenderedText(10.5, 4.8, "_________________________________________", "Calibri", 8, 100, $PDF_ALIGN_CENTER, 0x000000, 0x000000) ; Previous Month
     _InsertRenderedText(10.5, 1,$empresa_endereco, "Calibri", 10, 100, $PDF_ALIGN_CENTER, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(10.5, 0.3, "Belo Horizonte Networks Solutions by www.bhns.com.br", "Calibri", 8, 100, $PDF_ALIGN_CENTER, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(10.5, 0.2, "________________________________________________________", "Calibri", 8, 100, $PDF_ALIGN_CENTER, 0x000000, 0x000000) ; Previous Month

	_EndPage() ; next month will be in a new page


If FileExists($sFldr & "\empresa.ini") Then	
	_BeginPage() ; begin page

		; ------------------------Sobre a Empresa---------------------------
	$_Form_question = IniRead($sFldr & "\empresa.ini", "FORM", "QUESTION", "")
	$empresa_titulo = IniRead($sFldr & "\empresa.ini", "FORM", "TITULO", "")
Local $s_Form_question = StringSplit($_Form_question, ";") ; Split the string of days using the delimiter "," and the default flag value.


$_total_questions = $s_Form_question[0]



;if If FileExists($sFldr & "\form_"&$id_dep&".ini") Then



	; --- now fill the areas with the dates --------------------------------------------------
	; --- now fill the areas with the dates --------------------------------------------------
	_DrawLine(30, 00.80, 30, 30, "0X2", 0, 0.03, 0x000000, 0, 0)
	; _DrawLine(17.20, 25.80, 03.80, 25.80, "0X2", 0, 0.03, 0x000000, 0, 0)
	_InsertRenderedText(10.5, 29, urlencode( $empresa_titulo), "Calibri", 14, 100, $PDF_ALIGN_CENTER, 0x000000) ; Main Month
Local $ID_line = 29	

$s_resposta = StringSplit($arrayImput, ";")	
For $i = 1 To $s_Form_question[0]
  
  $ID_line  = $ID_line -1

  
  
    _InsertRenderedText(10.5, $ID_line,urlencode($s_Form_question[$i]), "_TimesNR", 12, 100, $PDF_ALIGN_CENTER, 0x000000, 0x000000) ; Main Month
    $ID_line  = $ID_line -1
	_InsertRenderedText(10.5, $ID_line, $s_resposta[$i], "_TimesNR", 12, 100, $PDF_ALIGN_CENTER, 0x000000, 0x000000) ; Main Month
   
	Next
	
    _InsertRenderedText(10.5, 1,urlencode($empresa_endereco), "Calibri", 10, 100, $PDF_ALIGN_CENTER, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(10.5, 0.3, "Belo Horizonte Networks Solutions by www.bhns.com.br", "Calibri", 8, 100, $PDF_ALIGN_CENTER, 0x000000, 0x000000) ; Previous Month
	_InsertRenderedText(10.5, 0.2, "________________________________________________________", "Calibri", 8, 100, $PDF_ALIGN_CENTER, 0x000000, 0x000000) ; Previous Month

	
	_EndPage() ; next month will be in a new page

EndIf	
	
	
	

	;write the buffer to disk
	_ClosePDFFile()
	; --- Functions ---

	Local $sFilePath = @ScriptDir & "\PROFILE\" & $curriculo_pdf & ".pdf"

	; Create a temporary file to read data from.
	If Not FileCreate($sFilePath, "This is an example of using FileRead.") Then Return MsgBox($MB_SYSTEMMODAL, "", "An error occurred whilst writing the temporary file.")

	; Open the file for reading and store the handle to a variable.
	Local $hFileOpen = FileOpen($sFilePath, $FO_READ)
	If $hFileOpen = -1 Then
		MsgBox($MB_SYSTEMMODAL, "", "An error occurred when reading the file.")
		Return False
	EndIf

	; Read the contents of the file using the handle returned by FileOpen.
	Local $sFileRead = FileRead($hFileOpen)

	; Close the handle returned by FileOpen.
	FileClose($hFileOpen)

	; Display the contents of the file.
	;MsgBox($MB_SYSTEMMODAL, "", $sFileRead)

	; Delete the temporary file.
	;FileDelete($sFilePath)


	$file_encode64 = _Base64encode($sFileRead, 0)

	;FileWrite("E:\FORMULARIO\teste.txt", $file_encode64)

	$json_attachments_1 = '{"' & $curriculo_pdf & ".pdf" & '":"data:application/pdf;base64,' & $file_encode64 & '"}'





	Local $sFilePath = @ScriptDir & "\PROFILE\" & $avaliacao_user & "_" & $curriculo_pdf & ".pdf"

	; Create a temporary file to read data from.
	If Not FileCreate($sFilePath, "This is an example of using FileRead.") Then Return MsgBox($MB_SYSTEMMODAL, "", "An error occurred whilst writing the temporary file.")

	; Open the file for reading and store the handle to a variable.
	Local $hFileOpen = FileOpen($sFilePath, $FO_READ)
	If $hFileOpen = -1 Then
		MsgBox($MB_SYSTEMMODAL, "", "An error occurred when reading the file.")
		Return False
	EndIf

	; Read the contents of the file using the handle returned by FileOpen.
	Local $sFileRead = FileRead($hFileOpen)

	; Close the handle returned by FileOpen.
	FileClose($hFileOpen)

	; Display the contents of the file.
	;MsgBox($MB_SYSTEMMODAL, "", $sFileRead)

	; Delete the temporary file.
	;FileDelete($sFilePath)


	$file_encode64 = _Base64encode($sFileRead, 0)

	;FileWrite("E:\FORMULARIO\teste.txt", $file_encode64)

	$json_attachments_2 = '{"' & $avaliacao_user & "_" & $curriculo_pdf & ".pdf" & '":"data:application/pdf;base64,' & $file_encode64 & '"}'



	$json_attachments_full = $json_attachments_1 & "," & $json_attachments_2




	;Send json report
	If $report_api_mail = 0 Then
		$report_api_mail = "true"
	Else
		$report_api_mail = "false"
	EndIf


	$priorit_id = 2



	Local $messagem_descricao = "Exame Realizado com Inicio : " & $data & " " & $horario & "  |  Fim : " & $horario_fim & "<br/> Nome: " & $curriculo_pdf & "<br/>Vaga Prefencial : " & $vaga1 & "  |  Tempo de Experiencia : " & $vaga1_temp & "  |  Valor : " & $vaga1_valor & "<br/>Vaga Secundaria : " & $vaga2 & "  |  Tempo de Experiencia : " & $vaga2_temp & "  |  Valor : " & $vaga2_valor & "<br/>Outra vaga de interesse : " & $vaga3

	Global $sdata_json = '{"alert":' & $report_api_mail & ',"autorespond":true,"source":"API","name":"' & $curriculo_pdf & '","email":"' & $inputEmail & '","phone":"' & $tel_fixo & ' ' & $celular & '","subject":"' & "FCRRH " & $nivel_intelectual & " " & $pontos_inter & " CNH_" & $Cod_habilitacao & " " & $sexy_user & " " & $area_prt & " " & $vaga3 & " " & $curriculo_pdf & '   #' & $empresa & '","message":"data:text/html;charset=utf-8,' & $messagem_descricao & '","ip":"' & $ipAddress & '","priority":"' & $priorit_id & '","topicId":"' & $id_DPN_1 & '","attachments":[ ' & $json_attachments_full & ']}'
    FileWriteLine(@ScriptDir & "\log_erro.txt", $sdata_json)


	#CS  FORCE SEND IP  CHANGE FILE CLASS.API.PHP LINE 175 USED $_SERVER['HTTP_USER_AGENT'] FOR SEND IP API


		function requireApiKey() {
		# Validate the API key -- required to be sent via the X-API-Key
		# header



		if(!($key=$this->getApiKey()))
		return $this->exerr(401, __('Valid API key required'));
		elseif (!$key->isActive() || $key->getIPAddr()!=$_SERVER['HTTP_USER_AGENT']) //$_SERVER['REMOTE_ADDR'] $_SERVER['HTTP_USER_AGENT'] or '189.32.32.1' BY cleber
		return $this->exerr(401, __('API key not found/active or source IP not authorized'));

		return $key;


		}

		function getApiKey() {


		if (!$this->apikey && isset($_SERVER['HTTP_X_API_KEY']) && isset($_SERVER['REMOTE_ADDR']) )
		$this->apikey = API::lookupByKey($_SERVER['HTTP_X_API_KEY'], $_SERVER['HTTP_USER_AGENT']);//$_SERVER['REMOTE_ADDR']  , $_SERVER['REMOTE_ADDR'] or '189.32.32.1' BY cleber

		return $this->apikey;

		}

	#CE


	;$api_ip
	;MsgBox(8192, "data  ", $sdata_json)
	;MsgBox(8192, "lINK ", $api_host&$api_link)

	Local $LocalIP = $api_host

	$hw_open = _WinHttpOpen()

	$hw_connect = _WinHttpConnect($hw_open, $LocalIP)

	$h_openRequest = _WinHttpOpenRequest($hw_connect, "POST", $api_link)

	$headers = 'X-API-Key:' & $api_key & ' ' & @CRLF & _
			'User-Agent:' & $api_ip & @CRLF & _
			'Content-Type: text/html;chart=UTF-8' & @CRLF

	;MsgBox(8192, "Cabecalho  ", $headers)
	#cs 'Connection: keep-alive' & @CRLF & _
			'Host: '&$api_ip& @CRLF & _
			'REMOTE_ADDR:'&$api_ip&@CRLF & _
			'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' & @CRLF & _
			'Cookie: schemarepo=TN_MP3; userDb=D01; cqecytusid=Zjnh1Smbfl/MiWNLFGixNg==; JSESSIONID=0000F3DyGHdvfvfTMFHI_WA6q2I:-1' & @CRLF & _
			'Referer: http://localhost/osticket/api/tickets.json' & @CRLF & _
			'Accept-Language: pl,en-us;q=0.7,en;q=0.3'& @CRLF
	#ce

	;MsgBox(8192, "Encode64 data", $sdata_json)
	_WinHttpSendRequest($h_openRequest, $headers, $sdata_json)


	_WinHttpReceiveResponse($h_openRequest)


	Local $response_headers = _WinHttpQueryHeaders($h_openRequest)
	;MsgBox(8192, "Headers", $response_headers)
	Local $headers_splits = StringSplit($response_headers, @CRLF) ; Split the string of days using the delimiter "," and the default flag value.
	$headers_status = $headers_splits[1]
	;MsgBox(4096, "Status",$headers_status)
	Local $response1 = _WinHttpReadData($h_openRequest)
	While @extended = 8192
		$response1 &= _WinHttpReadData($h_openRequest)
	WEnd



	;ConsoleWrite(@extended & @CRLF)

	;MsgBox(8192, "Headers", $headers_status)
	FileWriteLine(@ScriptDir & "\log_erro.txt", $headers_status)
	$response = $response1
	If $headers_status = "HTTP/1.1 201 Created" Then

		retorno_ticket()
	ElseIf $headers_status = "HTTP/1.1 200 OK" Then

		$response = StringRight($response, 6)
		retorno_ticket()
	ElseIf $headers_status = "HTTP/1.1 400 Bad Request" Then ;HTTP/1.1 401 Unauthorized
		retorno_ticket_erro()
		FileWriteLine(@ScriptDir & "\log_erro.txt", $headers_status & @CRLF & $response & @CRLF)

	ElseIf $headers_status = "HTTP/1.1 401 Unauthorized" Then ;HTTP/1.1 401 Unauthorized
		retorno_ticket_erro()
		FileWriteLine(@ScriptDir & "\log_erro.txt", $headers_status & @CRLF & $response & @CRLF)

	Else
		retorno_ticket_erro()
		$headers_status = "Sem conectividade com o servidor" & @CRLF & $api_host
		FileWriteLine(@ScriptDir & "\log_erro.txt", $date_sql & " Sem conectividade com o servidor " & $api_host & " " & $response & @CRLF)

	EndIf




	_WinHttpCloseHandle($h_openRequest)

	_WinHttpCloseHandle($hw_connect)

	_WinHttpCloseHandle($hw_open)


	;API OS TICKET FIM

if $Delete_files = 0 Then
DirRemove($sFldr2, 1)
If DirGetSize($sFldr2) = -1 Then
	DirCreate($sFldr2)

EndIf
EndIf





EndFunc   ;==>send_form



Func about_enterprise()


		; ------------------------Sobre a Empresa---------------------------
	$_Form_question = IniRead($sFldr & "\empresa.ini", "FORM", "QUESTION", "")
	$empresa_titulo = IniRead($sFldr & "\empresa.ini", "FORM", "TITULO", "")
	$empresa_detalhes_titulo = IniRead($sFldr & "\empresa.ini","FORM", "TITULO-DETALHES", "")

Local $s_Form_question = StringSplit($_Form_question, ";") ; Split the string of days using the delimiter "," and the default flag value.


$_total_questions = $s_Form_question[0]



;if If FileExists($sFldr & "\form_"&$id_dep&".ini") Then

If FileExists($sFldr & "\empresa.ini") Then


For $i = 1 To $s_Form_question[0]
#Region ### START Koda GUI section ### Form=E:\RH\form5.kxf
$Form2 = GUICreate($empresa_titulo &" Perguntas "& $i & "/" & $s_Form_question[0], 849, 507, -1, -1)
GUISetBkColor(0xA6CAF0)
$Label1 = GUICtrlCreateLabel($empresa_titulo, 290, 4, 800, -1)
GUICtrlSetFont(-1, 14, 400, 0, "MS Sans Serif")
$Label2 = GUICtrlCreateLabel($empresa_detalhes_titulo, 10, 30, 850, 30, BitOR($SS_CENTER,$SS_CENTERIMAGE))
$Pic1 = GUICtrlCreatePic($S_IMG & "\empresa_imagem_"&$i&".jpg", 215, 59, 393, -1)
$Button1 = GUICtrlCreateButton("OK", 356, 431, 155, 57, BitOR($BS_DEFPUSHBUTTON,$BS_NOTIFY,$BS_FLAT))
GUICtrlSetFont(-1, 24, 400, 0, "MS Sans Serif")
$Label3 = GUICtrlCreateLabel($s_Form_question[$i], 5, 250, 465, 150, BitOR($SS_CENTER,$SS_CENTERIMAGE))
GUICtrlSetFont(-1, 16, 400, 0, "MS Sans Serif")
$Input1 = GUICtrlCreateInput("", 64, 368, 713, 50)
GUICtrlSetFont(-1, 14, 400, 0, "MS Sans Serif")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###


While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
			
			
		Case $Button1
		
		
		If $i = 1 Then
		
       $arrayImput =  urlencode( GUICtrlRead($Input1))&";"
		
		ElseIf $i = $s_Form_question[0] then
		
		$arrayImput =  $arrayImput & urlencode( GUICtrlRead($Input1))
		
		Else
		
		$arrayImput =  $arrayImput & urlencode( GUICtrlRead($Input1))&";"
		
		
		EndIF
		
		
		
	    ExitLoop	
			

	EndSwitch
WEnd





GUIDelete()

Next




EndIf

EndFunc


Func form_incremental()



$_Form_question = IniRead($sFldr & "\"&$patch_form&".ini", "FORM", "QUESTION","")
$_Form_reponse_1 = IniRead($sFldr & "\"&$patch_form&".ini", "FORM", "RESPONSE_1", "")
$_Form_reponse_2 = IniRead($sFldr & "\"&$patch_form&".ini", "FORM", "RESPONSE_2", "")
$_Form_reponse_3 = IniRead($sFldr & "\"&$patch_form&".ini", "FORM", "RESPONSE_3", "")
$_Form_reponse_4 = IniRead($sFldr & "\"&$patch_form&".ini", "FORM", "RESPONSE_4", "")
$_Form_correct = IniRead($sFldr & "\"&$patch_form&".ini", "FORM", "RESPONSE_CORRECT", "")

Local $s_Form_question = StringSplit($_Form_question, ";") ; Split the string of days using the delimiter "," and the default flag value.
Local $s_Form_reponse_1 = StringSplit($_Form_reponse_1, ";") ; Split the string of days using the delimiter "," and the default flag value.
Local $s_Form_reponse_2 = StringSplit($_Form_reponse_2, ";") ; Split the string of days using the delimiter "," and the default flag value.
Local $s_Form_reponse_3 = StringSplit($_Form_reponse_3, ";") ; Split the string of days using the delimiter "," and the default flag value.
Local $s_Form_reponse_4 = StringSplit($_Form_reponse_4, ";") ; Split the string of days using the delimiter "," and the default flag value.
Local $s_Form_correct = StringSplit($_Form_correct, ";") ; Split the string of days using the delimiter "," and the default flag value.

$_total_questions = $s_Form_question[0]



;if If FileExists($sFldr & "\form_"&$id_dep&".ini") Then

For $i = 1 To $s_Form_question[0] ; Loop through the array returned by StringSplit to display the individual values.
#Region ### START Koda GUI section ### Form=e:\rh\form4.kxf
$Form2 = GUICreate($patch_form &" "& $i & "/" & $s_Form_question[0] , 1024, 600, -1, -1)
GUISetBkColor(0xA6CAF0)
$Label1 = GUICtrlCreateLabel("Prova Basica de |  "& $patch_form, 304, 1, 463, -1)
GUICtrlSetFont(-1, 14, 400, 0, "MS Sans Serif")
$Button1 = GUICtrlCreateButton("Ok", 458, 523, 155, 57, BitOR($BS_DEFPUSHBUTTON,$BS_NOTIFY,$BS_FLAT))
GUICtrlSetFont(-1, 24, 400, 0, "MS Sans Serif")
$Pic1 = GUICtrlCreatePic($S_IMG & "\"&$patch_form&"_imagem_"&$i&".jpg", 265, 30, 524, 140)
$Label2 = GUICtrlCreateLabel($s_Form_question[$i], 10, 189, 1000, 50)
GUICtrlSetFont(-1, 16, 400, 0, "MS Sans Serif")
$Radio1 = GUICtrlCreateRadio($s_Form_reponse_1[$i], 20, 245,  1000, 50)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$Radio2 = GUICtrlCreateRadio($s_Form_reponse_2[$i], 20, 314,  1000, 50)
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$Radio3 = GUICtrlCreateRadio($s_Form_reponse_3[$i], 20, 384,  1000, 50)
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$Radio4 = GUICtrlCreateRadio($s_Form_reponse_4[$i], 20, 453,  1000, 50)
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

         Case $Button1
        ;Buttons
	Select
		Case GUICtrlRead($Radio1) = $GUI_CHECKED
			If $s_Form_correct[$i] = 1 Then
			$form_points_in = $form_points_in + 1
			EndIf

			ExitLoop
		Case GUICtrlRead($Radio2) = $GUI_CHECKED
			If $s_Form_correct[$i] = 2 Then
			$form_points_in = $form_points_in + 1
			EndIf
			ExitLoop
		Case GUICtrlRead($Radio3) = $GUI_CHECKED
			If $s_Form_correct[$i] = 3 Then
			$form_points_in = $form_points_in + 1
			EndIf
			ExitLoop
		Case GUICtrlRead($Radio4) = $GUI_CHECKED
			If $s_Form_correct[$i] = 4 Then
			$form_points_in = $form_points_in + 1
			EndIf
			ExitLoop
	EndSelect




	EndSwitch
WEnd


GUIDelete()

Next



EndFunc

Func retorno_ticket()

	MsgBox(64,"Fim Obrigado","Fim Obrigado")

	#cs
	Dim $iMsgBoxAnswer
	$iMsgBoxAnswer = MsgBox(8260, "Servidor HelpDesk  |  ", "Segue a ID do seu Ticket #" & $response & @CRLF & Chr(13) & "Mais detalhes sera enviado em seu email " & $inputEmail & @CRLF & Chr(13) & "Seu ticket foi registrado com sucesso.." & @CRLF & Chr(13) & "Dejesa vizualizar seu ticket via web ?")
	Select
		Case $iMsgBoxAnswer = 6 ;Yes

			ShellExecute("http://" & $api_web_front & "view.php?e=" & $inputEmail & "&t=" & $response, @SW_MAXIMIZE, "", "open") ;http://localhost/osticket/view.php?e=clebe@live.com&t=201504
			TrayTip("AIT HelpDesk ®", "Obrigado " & $inputNome & @LF & "ficamos satisfeitos...." & @LF & "AIT HelpDesk ® agradece.", 5, 1)

		Case $iMsgBoxAnswer = 7 ;No

	EndSelect
	#ce



	If $report_user_mail = 0 Then

		; enviar_mail()

	Else


	EndIf

EndFunc   ;==>retorno_ticket

Func retorno_ticket_erro()

	Dim $iMsgBoxAnswer

	$iMsgBoxAnswer = MsgBox(8244, "Erro ao processar Ticket", "Erros encontrados" & @CRLF & Chr(13) & $headers_status & @CRLF & $response & @CRLF & Chr(13) & "Por Favor, Tente novamente ")
	Select
		Case $iMsgBoxAnswer = 6 ;Yes

		Case $iMsgBoxAnswer = 7 ;No

	EndSelect
EndFunc   ;==>retorno_ticket_erro

Func _Iif($fTest, $vTrueVal, $vFalseVal)
	If $fTest Then
		Return $vTrueVal
	Else
		Return $vFalseVal
	EndIf
EndFunc   ;==>_Iif




Func urlencode($str)
	$return = ""
	$str = StringReplace($str, "ç", "c")
	$str = StringReplace($str, "Ç", "C")
	$str = StringReplace($str, "ã", "a")
	$str = StringReplace($str, "Ã", "A")
	$str = StringReplace($str, "í", "i")
	$str = StringReplace($str, "Í", "I")
	$str = StringReplace($str, "á", "a")
	$str = StringReplace($str, "à", "a")
	$str = StringReplace($str, "À", "A")
	$str = StringReplace($str, "â", "a")
	$str = StringReplace($str, "Â", "A")
	$str = StringReplace($str, "õ", "o")
	$str = StringReplace($str, "Õ", "O")
	$str = StringReplace($str, "é", "e")
	$str = StringReplace($str, "É", "E")
	$str = StringReplace($str, "ê", "e")
	$str = StringReplace($str, "Ê", "E")
	$str = StringReplace($str, "ó", "o")
	$str = StringReplace($str, "Ó", "O")
	$str = StringReplace($str, "ò", "o")
	$str = StringReplace($str, "Ò", "O")
	$str = StringReplace($str, "ô", "o")
	$str = StringReplace($str, "Ô", "O")
	$return = $str
	$return = _urlencode($return)
	$return = StringReplace($str, "%20", " ")

	Return $return
EndFunc   ;==>urlencode


Func _urlencode($string)
	$string = StringSplit($string, "")
	For $i = 1 To $string[0]
		If AscW($string[$i]) < 48 Or AscW($string[$i]) > 122 Then
			$string[$i] = "%" & _StringToHex($string[$i])
		EndIf
	Next
	$string = _ArrayToString($string, "", 1)
	Return $string
EndFunc   ;==>_urlencode



Func enviar_mail()


	#cs
		$HOST_Server = IniRead($sFldr & "\config.ini", "EMAIL", "SERVER", "")
		$emailPORT = IniRead($sFldr & "\config.ini", "EMAIL", "PORTA", "")
		$emailSSL = IniRead($sFldr & "\config.ini", "EMAIL", "SSL", "")
		$emailServer = IniRead($sFldr & "\config.ini", "EMAIL", "USUARIO", "")
		$emailSenha = IniRead($sFldr & "\config.ini", "EMAIL", "SENHA", "")
	#ce
	; https://www.google.com/settings/security/lesssecureapps
	$SmtpServer = $HOST_Server ; address for the smtp-server to use - REQUIRED
	$FromName = $emailServer ; name from who the email was sent
	$FromAddress = $emailServer ; address from where the mail should come
	$ToAddress = $inputEmail ; destination address of the email - REQUIRED
	$Subject = "AIT HelpDesk ® Ticket ID:[#" & $response & "] " & $inputBreveDescr ; subject from the email - can be anything you want it to be
	$Body = "Olá, " & $inputNome & Chr(13) & Chr(13) & "            Para acompanhar sua solicitação acesse o link abaixo " & Chr(13) & "http://" & $api_web_front & "view.php?e=" & $inputEmail & "&t=" & $response & Chr(13) & Chr(13) & "Ticket ID:[#" & $response & "] mensagem." & Chr(13) & $inputMensagem & Chr(13) & Chr(13) & "----------------------------------------" & Chr(13) & "Equipe BHNS AIT HelpDesk ® 2015" & Chr(13) & "----------------------------------------"; the messagebody from the mail - can be left blank but then you get a blank mail
	$AttachFiles = "" ; the file(s) you want to attach seperated with a ; (Semicolon) - leave blank if not needed
	$CcAddress = "" ; address for cc - leave blank if not needed
	$BccAddress = "" ; address for bcc - leave blank if not needed
	$Importance = "Normal" ; Send message priority: "High", "Normal", "Low"
	$Username = $emailServer ; username for the account used from where the mail gets sent - REQUIRED
	$Password = $emailSenha ; password for the account used from where the mail gets sent - REQUIRED
	$IPPort = $emailPORT ; port used for sending the mail
	$ssl = $emailSSL ; enables/disables secure socket layer sending - put to 1 if using httpS
;~ $IPPort=465                          ; GMAIL port used for sending the mail
;~ $ssl=1                               ; GMAILenables/disables secure socket layer sending - put to 1 if using httpS

	;##################################
	; Script
	;##################################

	$rc = _INetSmtpMailCom($SmtpServer, $FromName, $FromAddress, $ToAddress, $Subject, $Body, $AttachFiles, $CcAddress, $BccAddress, $Importance, $Username, $Password, $IPPort, $ssl)
	If @error Then
		MsgBox(0, "Error sending message", "Error code:" & @error & "  Description:" & $rc)
	EndIf

EndFunc   ;==>enviar_mail

Func _INetSmtpMailCom($s_SmtpServer, $s_FromName, $s_FromAddress, $s_ToAddress, $s_Subject = "", $as_Body = "", $s_AttachFiles = "", $s_CcAddress = "", $s_BccAddress = "", $s_Importance = "Normal", $s_Username = "", $s_Password = "", $IPPort = 25, $ssl = 0)
	Local $objEmail = ObjCreate("CDO.Message")
	$objEmail.From = '"' & $s_FromName & '" <' & $s_FromAddress & '>'
	$objEmail.To = $s_ToAddress
	Local $i_Error = 0
	Local $i_Error_desciption = ""
	If $s_CcAddress <> "" Then $objEmail.Cc = $s_CcAddress
	If $s_BccAddress <> "" Then $objEmail.Bcc = $s_BccAddress
	$objEmail.Subject = $s_Subject
	If StringInStr($as_Body, "<") And StringInStr($as_Body, ">") Then
		$objEmail.HTMLBody = $as_Body
	Else
		$objEmail.Textbody = $as_Body & @CRLF
	EndIf
	If $s_AttachFiles <> "" Then
		Local $S_Files2Attach = StringSplit($s_AttachFiles, ";")
		For $x = 1 To $S_Files2Attach[0]
			$S_Files2Attach[$x] = _PathFull($S_Files2Attach[$x])
			ConsoleWrite('@@ Debug(62) : $S_Files2Attach = ' & $S_Files2Attach & @LF & '>Error code: ' & @error & @LF) ;### Debug Console
			If FileExists($S_Files2Attach[$x]) Then
				$objEmail.AddAttachment($S_Files2Attach[$x])
			Else
				ConsoleWrite('!> File not found to attach: ' & $S_Files2Attach[$x] & @LF)
				SetError(1)
				Return 0
			EndIf
		Next
	EndIf
	$objEmail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
	$objEmail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = $s_SmtpServer
	If Number($IPPort) = 0 Then $IPPort = 25
	$objEmail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = $IPPort
	;Authenticated SMTP
	If $s_Username <> "" Then
		$objEmail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1
		$objEmail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendusername") = $s_Username
		$objEmail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendpassword") = $s_Password
	EndIf
	If $ssl Then
		$objEmail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpusessl") = True
	EndIf
	;Update settings
	$objEmail.Configuration.Fields.Update
	; Set email Importance
	Switch $s_Importance
		Case "High"
			$objEmail.Fields.Item("urn:schemas:mailheader:Importance") = "High"
		Case "Normal"
			$objEmail.Fields.Item("urn:schemas:mailheader:Importance") = "Normal"
		Case "Low"
			$objEmail.Fields.Item("urn:schemas:mailheader:Importance") = "Low"
	EndSwitch
	$objEmail.Fields.Update
	; Sent the Message
	$objEmail.Send
	If @error Then
		SetError(2)
		Return $oMyRet[1]
	EndIf
	$objEmail = ""
EndFunc   ;==>_INetSmtpMailCom
;
;
; Com Error Handler
Func MyErrFunc()
	$HexNumber = Hex($oMyError.number, 8)
	$oMyRet[0] = $HexNumber
	$oMyRet[1] = StringStripWS($oMyError.description, 3)
	ConsoleWrite("### COM Error !  Number: " & $HexNumber & "   ScriptLine: " & $oMyError.scriptline & "   Description:" & $oMyRet[1] & @LF)
	SetError(1); something to check for when this function returns
	Return
EndFunc   ;==>MyErrFunc

Func FileCreate($sFilePath, $sString)
	Local $bReturn = True ; Create a variable to store a boolean value.
	If FileExists($sFilePath) = 0 Then $bReturn = FileWrite($sFilePath, $sString) = 1 ; If FileWrite returned 1 this will be True otherwise False.
	Return $bReturn ; Return the boolean value of either True of False, depending on the return value of FileWrite.
EndFunc   ;==>FileCreate
