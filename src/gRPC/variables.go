package gRPCServer

import (
	gRPCServerApi "fenix-database-administration/src/gRPC/simpleGrpcServer/go_grpc_api"
	"google.golang.org/grpc"
	"net"
)

type gRPCServerObjectStruct struct {
}

// Variable holding everything together
var GRPCServerObject *gRPCServerObjectStruct

// gRPC variables
var (
	registerGrpcServerGrpcServer *grpc.Server
	lis                          net.Listener
)

// gRPC Server used for register clients Name, Ip and Por and Clients Test Environments and Clients Test Commandst
type gRPCServerGrpcServicesServer struct {
	gRPCServerApi.UnimplementedSimpleGrpcServerServicesServer
}

// GRPCServerPort receives it value from an environment variable and is the port used by gRPC-server
var GRPCServerPort string
