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

import google.sdv.gateway.service_discovery.PublisherUnitMetadata;
import google.sdv.gateway.service_discovery.UnitType;

/**
 * Parameters for creating a Data Tunnel publication.
 *
 * Note: not the final API.
 *
 * @deprecated Comm stack API will be enabled for AAOS-IVI in the future.
 */
@VintfStability
parcelable CreatePublicationParams {
    /** The name of the service unit to register and create a publisher for. */
    @utf8InCpp String serviceUnitName;
    /** The unit type of the service unit to register and create a publisher for. */
    UnitType unitType;
    /**
     * The version, the size in bytes of the publication's messages, the number of messages that
     * can be stored in the publication
     */
    PublisherUnitMetadata publisherUnitMetadata;
}
