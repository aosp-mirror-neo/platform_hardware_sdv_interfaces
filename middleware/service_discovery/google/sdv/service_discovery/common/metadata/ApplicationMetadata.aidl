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

import google.sdv.service_discovery.common.metadata.PublisherUnitMetadata;
import google.sdv.service_discovery.common.metadata.ServerUnitMetadata;

/**
 * Standardised metadata associated with registered Service Units.
 *
 * It is expected that the ServerUnitMetadata and PublisherUnitMetadata would diverge
 * from their current proposed structures. We will work with partners and other SDV teams
 * to figure out what the most appropriate field values for these structures are.
 */
@RustDerive(Clone=true, PartialEq=true, Hash=true)
@VintfStability
parcelable ApplicationMetadata {
    TypedMetadata typedMetadata;

    byte[] valueHolder;

    /** Transport specific metadata registered with Service Units. */
    @RustDerive(Clone=true, PartialEq=true, Hash=true)
    @VintfStability
    union TypedMetadata {
        ServerUnitMetadata serverUnit;
        PublisherUnitMetadata publisherUnit;
    }
}
