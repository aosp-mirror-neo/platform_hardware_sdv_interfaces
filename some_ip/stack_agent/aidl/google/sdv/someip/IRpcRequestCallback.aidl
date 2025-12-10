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

package google.sdv.someip;

import google.sdv.someip.SomeIpService;

/**
 * Callback interface to notify about SOME/IP RPC requests.
 */
@VintfStability
interface IRpcRequestCallback {
    /**
     * Notifies about incoming SOME/IP RPC request and sends back a serialized response.
     *
     * @param[in] service The service that the RPC is for.
     * @param[in] method_id The method ID of the RPC.
     * @param[in] payload The raw RPC payload in SOME/IP wire format.
     * @return The serialized response payload in SOME/IP wire format.
     */
    byte[] onRpcRequest(in SomeIpService service, char method_id, in byte[] payload);
}
