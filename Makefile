BUILD := _build
BINARY := vim-ver
DARWIN_AMD64_BUILD := $(BUILD)/darwin-amd64
LINUX_AMD64_BUILD := $(BUILD)/linux-amd64

all: $(DARWIN_AMD64_BUILD).tar.gz $(LINUX_AMD64_BUILD).tar.gz

$(DARWIN_AMD64_BUILD).tar.gz: $(DARWIN_AMD64_BUILD)/$(BINARY)
	tar czf $@ $<

$(DARWIN_AMD64_BUILD)/$(BINARY):
	mkdir -p $(dir $@)
	GOOS=darwin GOARCH=amd64 go build -o $@

$(LINUX_AMD64_BUILD).tar.gz: $(LINUX_AMD64_BUILD)/$(BINARY)
	tar czf $@ $<

$(LINUX_AMD64_BUILD)/$(BINARY):
	mkdir -p $(dir $@)
	GOOS=linux GOARCH=amd64 go build -o $@

test:
	go test -v

clean:
	rm -rf $(BUILD)

.PHONY: all test clean
