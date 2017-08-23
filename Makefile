BUILD := _build
BINARY := vim-ver
DARWIN_AMD64_BUILD := $(BUILD)/darwin-amd64
LINUX_AMD64_BUILD := $(BUILD)/linux-amd64

all: $(DARWIN_AMD64_BUILD)/$(BINARY) $(LINUX_AMD64_BUILD)/$(BINARY)

$(DARWIN_AMD64_BUILD)/$(BINARY):
	mkdir -p $(dir $@)
	go build -o $@

$(LINUX_AMD64_BUILD)/$(BINARY):
	mkdir -p $(dir $@)
	go build -o $@

test:
	go test -v

clean:
	rm -rf $(BUILD)

.PHONY: all test clean
