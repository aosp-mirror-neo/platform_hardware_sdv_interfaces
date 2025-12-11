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
 * FindRpcServerByNameParams contains the parameters needed to call SDV Gateway Session AIDL's
 * findRpcServerByName API
 */

@VintfStability
parcelable FindRpcServerByNameParams {
    /**
     * The name of the virtual machine where the server is to be searched. When this is left empty,
     * all VMs will be used in the search.
     */
    @utf8InCpp String sdvVmName;
    /** The name of the server package (in the registered FQIN). */
    @utf8InCpp String packageName;
    /**
     * The name of the service bundle where the service to connect to is included (in the
     * registered FQIN).
     */
    @utf8InCpp String serviceBundleName;
    /** The name of the service unit registered via registration agent. */
    @utf8InCpp String serviceUnitName;
}
