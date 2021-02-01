PROJECT=asqlite3
DCC=dcc32
BPL_PATH=$(DELPHI)\Projects\Bpl
REG_PATH=hkcu\software\borland\delphi\7.0

all: build

build:
	@dof2cfg $(PROJECT).dof
	@$(DCC) $(PROJECT).dpk
	
install-d7: build
	@reg add "$(REG_PATH)\known packages" /f /t REG_SZ /v "$(BPL_PATH)\$(PROJECT).bpl" /d "$(PROJECT)" >NUL

uninstall-d7:
	@reg delete "$(REG_PATH)\known packages" /v "$(BPL_PATH)\$(PROJECT).bpl" /f >NUL
	@del /s /q "$(BPL_PATH)\$(PROJECT).*" 2>NUL >NUL
