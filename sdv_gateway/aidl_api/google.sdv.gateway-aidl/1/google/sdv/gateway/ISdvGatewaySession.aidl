// Copyright 2024 Google LLC
///////////////////////////////////////////////////////////////////////////////
// THIS FILE IS IMMUTABLE. DO NOT EDIT IN ANY CASE.                          //
///////////////////////////////////////////////////////////////////////////////

// This file is a snapshot of an AIDL file. Do not edit it manually. There are
// two cases:
// 1). this is a frozen version file - do not edit this in any case.
// 2). this is a 'current' file. If you make a backwards compatible change to
//     the interface (from the latest frozen version), the build system will
//     prompt you to update this file with `m <name>-update-api`.
//
// You must not make a backward incompatible change to any AIDL file built
// with the aidl_interface module type with versions property set. The module
// type is used to build AIDL files in a way that they can be used across
// independently updatable components of the system. If a device is shipped
// with such a backward incompatible change, it has a high risk of breaking
// later when a module using the interface is updated, e.g., Mainline modules.

package google.sdv.gateway;
@VintfStability
interface ISdvGatewaySession {
  void initComms(in google.sdv.gateway.InitCommsParams initCommsParams);
  google.sdv.gateway.RpcCredentialsConfigResult rpcCredentialsConfig();
  void setAuthoritiesListener(in google.sdv.gateway.ca.IAuthoritiesListener listener);
  google.sdv.gateway.RequestCertificateChainResult requestCertificateChain(in google.sdv.gateway.RequestCertificateChainParams requestCertificateChainParams);
  void registerRpcServer(in google.sdv.gateway.RegisterRpcServerParams registerRpcServerParams);
  void unregisterRpcServer(@utf8InCpp String serviceUnitName);
  google.sdv.gateway.FindRpcServerResult findRpcServerByName(in google.sdv.gateway.FindRpcServerByNameParams findRpcServerByNameParams);
  google.sdv.gateway.data_tunnel.ClientDescriptor takeOwnershipOfClientDescriptor();
  google.sdv.gateway.IDataTunnelPublication createPublication(in google.sdv.gateway.CreatePublicationParams createPublicationParams);
  google.sdv.gateway.IDataTunnelPublication subscribeToPublicationByName(in google.sdv.gateway.SubscribeToPublicationByNameParams subscribeToPublicationByNameParams);
  google.sdv.identity.ServiceIdentity ownServiceIdentity();
  google.sdv.authz.IAuthzService authzService();
  google.sdv.service_discovery.discovery.IServiceDiscoveryAgent serviceDiscoveryAgent();
  google.sdv.data_tunnel.IAgentService dataTunnelAgent();
  google.sdv.service_discovery.discovery.IServiceRegistrationAgent serviceRegistrationAgent();
  long getRpcNetworkHandle();
  void setListener(in google.sdv.gateway.ISdvGatewaySessionListener listener);
  void close();
}
