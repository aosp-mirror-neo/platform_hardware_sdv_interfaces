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
 * RequestCertificateChainResult contains the response to SDV Gateway Session AIDL's
 * requestCertificateChain API call.
 *
 * @deprecated Comm stack API will be enabled for AAOS-IVI in the future.
 */

@VintfStability
parcelable RequestCertificateChainResult {
    /**
     * The certicate chain corresponding to the certication request in PEM format.
     */
    @utf8InCpp String certificateChainPem;
}
