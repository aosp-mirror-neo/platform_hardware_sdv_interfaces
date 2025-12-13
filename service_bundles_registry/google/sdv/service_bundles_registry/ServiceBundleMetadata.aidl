//
// Copyright (C) 2024 The Android Open Source Project
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

// This API intends to be used by other SDV Agents.
// Using google package allows make the interface VINTF stable and be used from APEXes.
package google.sdv.service_bundles_registry;

import google.sdv.service_bundles_registry.KeyValuePair;

/**
 * Metadata describing a single SDV service bundle.
 */
@RustDerive(Clone=true, PartialEq=true, Eq=true)
@VintfStability
parcelable ServiceBundleMetadata {
    /**
     * Name of the service bundle.
     */
    @utf8InCpp String name;

    /**
     * Service Bundle Version Number.
     */
    long versionNumber;

    /**
     * Service Bundle Version Name.
     */
    @utf8InCpp String versionName;

    /**
     * Package name of the service bundle.
     */
    @utf8InCpp String packageName;

    /**
     * Absolute path to the native library to be loaded as service bundle.
     */
    @utf8InCpp String nativeLibraryPath;

    /**
     * Absolute path to service bundle processes and threads scheduling config file.
     */
    @utf8InCpp @nullable String schedulingConfigPath;

    // SDV Agents and SDV Core Components specific metadata.

    /**
     * Absolute path to the service bundle orchestration configuration.
     */
    @utf8InCpp @nullable String orchestrationConfigPath;

    /**
     * Absolute path to the service bundle Access Control List (ACL) policy
     * file.
     *
     * ACLs policy file defines access control for Unit Types and Service Units
     * owned by the Service Bundle. Service Bundle might own neither Unit Types
     * nor Service Units, thus the field is optional.
     *
     * @deprecated This field is deprecated from AIDL v3, use authorizationPolicyPath instead.
     */
    @utf8InCpp @nullable String accessControlListPolicyPath;

    /**
     * Absolute path to the service bundle Configuration and Calibration configuration.
     */
    @utf8InCpp @nullable String configurationCalibrationConfigPath;

    /**
     * Absolute path to the service bundle User Preferences configuration.
     */
    @utf8InCpp @nullable String userConfigPath;

    /**
     * Absolute path to the service bundle Health configuration.
     */
    @utf8InCpp @nullable String healthConfigPath;

    /**
     * Absolute path to the service bundle diagnostics configuration.
     */
    @utf8InCpp @nullable String diagnosticsConfigPath;

    /**
     * Absolute path to the file with protobuf schemas extracted from bundle's VSIDL definition.
     */
    @utf8InCpp @nullable String vsidlSchemasPath;

    /**
     * Absolute path to the service bundle SOME/IP configuration.
     */
    @utf8InCpp @nullable String externalProtocolMappingPath;

    /**
     * Custom service bundle metadata.
     */
    KeyValuePair[] customMetadata;

    /**
     * Service bundle log tag.
     */
    @utf8InCpp @nullable String logTag;

    /**
     * Absolute path to the service bundle authorization (AuthZ) policy file.
     *
     * AuthZ policy file sets the policy for the Service Bundle with regards to its usage of
     * the SDV Comms Stack APIs.
     */
    @utf8InCpp @nullable String authorizationPolicyPath;
}
