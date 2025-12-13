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
 * Parameters for subscribing to a Data Tunnel publication service unit identified by name.
 *
 * Note: not the final API.
 */
@VintfStability
parcelable SubscribeToPublicationByNameParams {
    /**
     * sdvVmName the SDV VM instance (of the publisher) to subscribe to. Mandatory if there are
     * multiple VM instances that contain an exact match for the sdvPackageName, serviceBundleName,
     * and serviceUnitName.
     */
    @utf8InCpp String sdvVmName;
    /** The SDV Package Name (of the publisher) to subscribe to. */
    @utf8InCpp String sdvPackageName;
    /** The Service Bundle Name as declared in the publisher package's manifest. */
    @utf8InCpp String serviceBundleName;
    /** The service unit name (of the publisher) to subscribe to. */
    @utf8InCpp String serviceUnitName;
}
