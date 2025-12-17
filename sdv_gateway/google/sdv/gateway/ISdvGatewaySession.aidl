//
// Copyright (C) 2026 The Android Open Source Project
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

package google.sdv.gateway;
import google.sdv.authz.IAuthzService;
import google.sdv.data_tunnel.IAgentService;
import google.sdv.gateway.CreatePublicationParams;
import google.sdv.gateway.FindRpcServerByNameParams;
import google.sdv.gateway.FindRpcServerResult;
import google.sdv.gateway.IDataTunnelPublication;
import google.sdv.gateway.ISdvGatewaySessionListener;
import google.sdv.gateway.InitCommsParams;
import google.sdv.gateway.RegisterRpcServerParams;
import google.sdv.gateway.RequestCertificateChainParams;
import google.sdv.gateway.RequestCertificateChainResult;
import google.sdv.gateway.RpcCredentialsConfigResult;
import google.sdv.gateway.SocketAddress;
import google.sdv.gateway.SubscribeToPublicationByNameParams;
import google.sdv.gateway.ca.IAuthoritiesListener;
import google.sdv.gateway.data_tunnel.ClientDescriptor;
import google.sdv.identity.ServiceIdentity;
import google.sdv.service_discovery.discovery.IServiceDiscoveryAgent;
import google.sdv.service_discovery.discovery.IServiceRegistrationAgent;

/**
 * A session used by a client to interact with the SDV Gateway.
 *
 * The client must keep a reference to the session to keep the session alive. Once a session is
 * deleted (by releasing the reference) all subscriptions are closed and all publications are
 * destroyed.
 *
 * @deprecated Comm stack API will be enabled for AAOS-IVI in the future.
 */
@VintfStability
interface ISdvGatewaySession {
    /**
     * Initializes bi-directional communication with remote SDV services for the calling AAOS-IVI
     * application. Creates a service identity for the calling application with the provided
     * initCommsParams (including identity key, service name and the PackageManager verified package
     * name of the application), and registers it with SDV Service Discovery.
     *
     * TODO: b/360243025 - Calling app's UID should be attested to by checking package name for
     * applications or against known UID list for native services. Remove packageName parameter
     * once this is implemented.
     *
     * @param initCommsParams A structure including the required fields to initializing the
     *         communications. See @{InitCommsParams}.
     * @return Status::ok on success
     *         EX_SERVICE_SPECIFIC containing a @{link SdvGatewayStatusCode} error code and an error
     * message in case of failure.
     */
    void initComms(in InitCommsParams initCommsParams);

    /**
     * Returns the RPC credentials configuration. Must be called after initComms. The configuration
     * does not change, subsequent calls return the same value.
     *
     * @return Status::ok on success
     *         EX_SERVICE_SPECIFIC containing a @{link SdvGatewayStatusCode} error code and an error
     * message in case of failure.
     */
    RpcCredentialsConfigResult rpcCredentialsConfig();

    /**
     * Sets a listener to receive updates on the list of CAs present in the vehicle.
     *
     * listener.onAuthoritiesChanged will immediately be called once to return the current list
     * and later whenever that list changes.
     *
     * Fails with FAILED_PRECONDITION if the @{link RpcCredentialsConfigResult} is set to insecure.
     *
     * @param listener Listener interface for receiving the list of certificate authorities
     *                 and any further updates that might happen later.
     * @return Status::ok on success
     *         EX_SERVICE_SPECIFIC containing a @{link SdvGatewayStatusCode} error code and an error
     *         INVALID_ARGUMENT if the listener is null.
     *         FAILED_PRECONDITION if the @{link RpcCredentialsConfigResult} is set to insecure.
     *         ALREADY_EXISTS if the callback was already set.
     */
    void setAuthoritiesListener(in IAuthoritiesListener listener);

    /**
     * Requests a certificate chain from the authority.
     *
     * @param requestCertificateChainParams A structure containing the certicate request.
     * @return RequestCertificateChainResult containing the certificate chain for the request.
     * @return Status::ok on success
     *         EX_SERVICE_SPECIFIC containing a @{link SdvGatewayStatusCode} error code and an error
     */
    RequestCertificateChainResult requestCertificateChain(
            in RequestCertificateChainParams requestCertificateChainParams);

    /**
     * Registers an RPC server using SDV-SD and RpcAgent with the provided information. Allows the
     * application to pass a listening port where SDV-SD and RpcAgent should listen for connections
     * on.
     *
     * The RPC server must be created before being registered. The RPC server must be created using
     * the credentials retrieved from @{link rpcCredentialsForRegisteringServer}, otherwise other
     * client applications will be able to find the RPC server but fail to open a channel to it.
     *
     * @param registerRpcParams A structure including the required fields for registering a
     *         new RPC server. See @{RegisterRpcServerParams}.
     * @return Status::ok on success
     *         EX_SERVICE_SPECIFIC containing a @{link SdvGatewayStatusCode} error code and an error
     * message in case of failure.
     */
    void registerRpcServer(in RegisterRpcServerParams registerRpcServerParams);

    /**
     * Unregisters an RPC server from SDV-SD and RpcAgent with the given name.
     *
     * @param serviceUnitName the unitName of the service.
     * @return Status::ok on success
     *         EX_SERVICE_SPECIFIC containing a @{link SdvGatewayStatusCode} error code and an error
     * message in case of failure.
     */
    void unregisterRpcServer(@utf8InCpp String serviceUnitName);

    /**
     * Finds an RPC server using SDV-SD and RpcAgent with the provided @{FindRpcServerByNameParams}
     * structure. Returns a structure containing the data required by the client to connect its
     * socket to to talk to the server.
     *
     * @param findRpcServerByNameParams A structure containing the package, service bundle, and
     *         service unit name for the rpc server to locate.
     * @return FindRpcServerResult containing the values needed by the client for connection channel
     *         creation in the case of successful.
     * @return Status::ok on success
     *         EX_SERVICE_SPECIFIC containing a @{link SdvGatewayStatusCode} error code and an error
     * message in case of failure.
     */
    FindRpcServerResult findRpcServerByName(in FindRpcServerByNameParams findRpcServerByNameParams);

    /**
     * Returns the ClientDescriptor along with the assigned clientId and a pair of pipe handles for
     * duplex communication. Calling this method a second time will fail because the ownership of
     * the ClientDescriptor is moved to the calling process.
     *
     * NOTE: Don't call directly. Use the C API function from "libsdvgatewayclient" to create a
     * native client that takes ownership of the client descriptor and starts receiving
     * notifications from Data Tunnel.
     */
    ClientDescriptor takeOwnershipOfClientDescriptor();

    /**
     * Creates a new Data Tunnel publication for a service unit with the specified name and type.
     * The returned @{link IDataTunnelPublication} is used by the client C library to publish
     * messages from the caller's application process.
     *
     * The created publication can be found by
     * a) name: using the package name and bundle name of the application + serviceUnitName.
     * b) type: using the UnitType. The UnitType is independent of the application's identity and of
     * the serviceUnitName.
     *
     * @param createPublicationParams the arguments for creating a Data Tunnel publication.
     * @return A Data Tunnel publication that can be used for writing.
     * @return Status::ok on success
     *         EX_SERVICE_SPECIFIC containing a @{link SdvGatewayStatusCode} error code and an error
     */
    IDataTunnelPublication createPublication(in CreatePublicationParams createPublicationParams);

    /**
     * Subscribes to the publication identified by name and returns an @{link
     * IDataTunnelPublication} used by the client C library to read messages and receive
     * notifications. Fails if the unit identifier is invalid.
     *
     * @param subscribeToPublicationByName the arguments identifying the publisher to subscribe to.
     * @return A Data Tunnel publication that can be used for reading and receiving notifications in
     *         the calling application's process.
     * @return Status::ok on success
     *         EX_SERVICE_SPECIFIC containing a @{link SdvGatewayStatusCode} error code and an error
     */
    IDataTunnelPublication subscribeToPublicationByName(
            in SubscribeToPublicationByNameParams subscribeToPublicationByNameParams);

    /**
     * Returns the ServiceIdentity of the calling AAOS-IVI application.
     *
     * @return Status::ok on success
     *         EX_SERVICE_SPECIFIC containing a @{link SdvGatewayStatusCode} error code and an error
     * message in case of failure.
     */
    ServiceIdentity ownServiceIdentity();

    /**
     * Returns the IAuthzService used to verify if that services is authorized to check.
     *
     * @return Status::ok on success
     *         EX_SERVICE_SPECIFIC containing a @{link SdvGatewayStatusCode} error code and an error
     * message in case of failure.
     */
    IAuthzService authzService();

    /**
     * Returns the IServiceDiscoveryAgent used for service discovery client side.
     *
     * @return Status::ok on success
     *         EX_SERVICE_SPECIFIC containing a @{link SdvGatewayStatusCode} error code and an error
     * message in case of failure.
     */
    IServiceDiscoveryAgent serviceDiscoveryAgent();

    /**
     * Returns the data tunnel agent for data tunnel publications and subscriptions.
     *
     * This requires initComms.
     *
     * @return Status::ok on success
     *         EX_SERVICE_SPECIFIC containing a @{link SdvGatewayStatusCode} error code and an error
     * message in case of failure.
     */
    IAgentService dataTunnelAgent();

    /**
     * Returns the service registration agent for service registration on the client side.
     *
     * This requires initComms.
     *
     * @return Status::ok on success
     *         EX_SERVICE_SPECIFIC containing a @{link SdvGatewayStatusCode} error code and an error
     * message in case of failure.
     */
    IServiceRegistrationAgent serviceRegistrationAgent();

    /**
     * Gets the handle of the network interface for SDV-RPC from RpcAgent. We assume that RpcAgent's
     * configured network interface is static, ie: it does not change for the runtime of the
     * vehicle.
     *
     * @return a handle that can be cast to net_handle_t and used with the Android Networking NDK
     *         API to bind the network interface to the one used by the RPC agent.
     * @return Status::ok on success
     *         EX_SERVICE_SPECIFIC containing a @{link SdvGatewayStatusCode} error code and an error
     * message in case of failure.
     */
    long getRpcNetworkHandle();

    /**
     * Sets a listener to receive updates for the session from the SDV Gateway.
     *
     * @param listener Listener interface for receiving updates from the SDV Gateway.
     * @return Status::ok on success
     *         EX_SERVICE_SPECIFIC containing a @{link SdvGatewayStatusCode} error code and an error
     *         INVALID_ARGUMENT if the listener is null.
     *         ALREADY_EXISTS if the callback was already set.
     */
    void setListener(in ISdvGatewaySessionListener listener);

    /**
     * Closes the SDV Gateway session and releases all associated resources (e.g. clears all
     * listeners and preventing them from triggering). Clients must not use the session after
     * calling this method.
     *
     * @return Status::ok on success
     *         EX_SERVICE_SPECIFIC containing a @{link SdvGatewayStatusCode} error code and an error
     * message.
     */
    void close();
}
