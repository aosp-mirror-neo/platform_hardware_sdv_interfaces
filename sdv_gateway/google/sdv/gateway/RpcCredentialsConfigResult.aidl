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

/**
 * RpcCredentialsConfigResult contains the result of a call SDV Gateway Session AIDL's
 * rpcCredentialsConfig API.
 *
 * @deprecated Comm stack API will be enabled for AAOS-IVI in the future.
 */
@VintfStability
parcelable RpcCredentialsConfigResult {
    /** Whether insecure or secure channels and RPC servers should be created. */
    boolean useInsecureRpc;
    /**
     * Subject Alternative Name (SAN) value that must be set by the caller in the X.509 extension
     * field of the certificates it creates. Can be ignored if @{link useInsecureRpc} is set to
     * true.
     */
    @utf8InCpp String subjectAlternativeName;
}
