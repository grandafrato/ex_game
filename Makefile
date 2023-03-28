prog :=rust_src

ifeq (${MIX_ENV}, prod)
  debug = 0
else
  debug = 1
endif

$(info debug is $(debug))

ifeq ($(debug), 0)
  release :=--release
  target :=release
  extension :=
else
  release :=
  target :=debug
  extension :=debug
endif

build:
	cd rust_src && cargo build $(release)
	mkdir -p priv
	cp rust_src/target/$(target)/$(prog) ${MIX_APP_PATH}/priv/$(prog)
