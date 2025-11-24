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

package google.sdv.service_discovery.common.metadata;

/**
 * Metadata about the Service that is not provided directly by the Service Bundle
 * but is inferred and computed by the ServiceDiscovery Agent.
 */
@RustDerive(Clone=true, PartialEq=true, Hash=true)
@VintfStability
parcelable InferredMetadata {
    RelativeLocation location;

    /** Describes the location of the Service relative to the caller of the API. */
    enum RelativeLocation {
        LOCATION_UNKNOWN = 0,
        LOCATION_LOCAL_SDV_INSTANCE = 1,
        LOCATION_LOCAL_HARDWARE = 2,
        LOCATION_REMOTE = 3,
    }
}
