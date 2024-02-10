all: build

build: client-signing.csr client-mtls.csr

client-mtls.key:
	openssl genrsa -out client-mtls.key 4096

client-mtls.csr: client-mtls.key
	openssl req -new -key client-mtls.key -out client-mtls.csr

client-signing.key:
	openssl genrsa -out client-signing.key 4096

client-signing.csr: client-signing.key
	openssl req -new -key client-signing.key -out client-signing.csr
