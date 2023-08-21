
# cat -e -t -v Makefile

RunGrpcGui:
#	cd ~/egen_kod/go/go_workspace/src/jlambert/grpcui/standalone && grpcui -plaintext localhost:6670


compileProto_go:
	@echo "Compile Simple gRPC Server proto file..."

 # generate the messages
	protoc --go_out=src/gRPC/simpleGrpcServer src/gRPC/simpleGrpcServer/*.proto

# generate the services
	protoc --go-grpc_out=src/gRPC/simpleGrpcServer src/gRPC/simpleGrpcServer/*.proto
