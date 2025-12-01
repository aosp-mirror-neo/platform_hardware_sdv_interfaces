// Copyright 2024 Google LLC

package google.sdv.gateway;

import google.sdv.gateway.SocketAddress;

/**
 * FindRpcServerResult contains the parameters needed to create a RPC channel to an RPC server. The
 * RPC channel should be created in the process of the application that is searching for the RPC
 * server.
 */

@VintfStability
parcelable FindRpcServerResult {
    /**
     * The host + port that the RPC client should connect its socket to to talk to the RPC server.
     */
    SocketAddress socketAddress;

    /**
     * Subject Alternative Name (SAN) value contained in the RPC server's X.509 certificates. Can be
     * ignored if insecure RPC connections are specified in @{link RpcCredentialsConfigResult}.
     */
    @utf8InCpp String subjectAlternativeName;

    /**
     * The VM name on which the server is located.
     */
    @nullable @utf8InCpp String vmName;
}
