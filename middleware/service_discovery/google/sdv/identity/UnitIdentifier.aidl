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

package google.sdv.identity;

import google.sdv.identity.ServiceIdentity;

/**
 * UnitIdentifier is an identifier that helps recognise remote service unit
 * within a Service Bundle process.
 */
@RustDerive(Clone=true, PartialEq=true, Hash=true)
@VintfStability
parcelable UnitIdentifier {
    /**
     * ServiceIdentity is a unique identifier for the Service Bundle running the
     * Service Unit.
     */
    ServiceIdentity service_identity;

    /**
     * Unit name is a human readable name for a service unit unique within the
     * Service Bundle that is running the Service Unit.
     */
    @utf8InCpp String unit_name;
}
