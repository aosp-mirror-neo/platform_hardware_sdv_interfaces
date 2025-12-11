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
