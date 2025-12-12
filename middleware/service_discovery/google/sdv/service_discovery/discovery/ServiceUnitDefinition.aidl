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

package google.sdv.service_discovery.discovery;

import google.sdv.identity.ServiceIdentity;
import google.sdv.service_discovery.common.UnitType;
import google.sdv.service_discovery.common.metadata.ApplicationMetadata;
import google.sdv.service_discovery.common.metadata.InferredMetadata;

/**
 * Result of a Service Discovery call.
 *
 * A ServiceUnitDefinition provides all requisite information for identifying and
 * describing a Service Unit during a Service Discovery operation.
 *
 * A ServiceUnit definition can be distinguished as a Server or a Publisher based on
 * the case-type of the TypedMetadata field.
 */
@RustDerive(Clone=true, PartialEq=true, Hash=true)
@VintfStability
parcelable ServiceUnitDefinition {
    /**
     * The identity of the Service Bundle that registered this Service Unit, as guaranteed by the
     * SDV Platform.
     */
    ServiceIdentity identity;

    /** The name of this Service Unit as provided during Service Unit Registration. */
    @utf8InCpp String serviceUnitName;

    /** The UnitType of this Service Unit as provided during Service Unit Registration. */
    UnitType unitType;

    /** The metadata of this Service Unit as provided during Service Unit Registration. */
    ApplicationMetadata appMetadata;

    /** The metadata of this Service Unit as inferred by the SDV Platform. */
    InferredMetadata inferredMetadata;
}
