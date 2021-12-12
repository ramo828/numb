BIN = Android
BIN1 = PC

all: pc

pc:
	$(MAKE) type=PC run

android:
	$(MAKE) type=Android run

run:
	@echo $(type)
ifeq ($(type),Android)
	@echo PASSED
	mkdir $(BIN)
else
	@echo FAILED
	mkdir $(BIN1)
endif
