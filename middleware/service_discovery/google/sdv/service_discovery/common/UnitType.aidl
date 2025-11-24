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

package google.sdv.service_discovery.common;

/**
 * Named identifier for a specific Unit Type.
 *
 * Example of a Unit Type: sdv.package.ServiceBundle#UnitType
 * where:
 * 1. sdv.package is a Package Name;
 * 2. ServiceBundle - is a Bundle Name;
 * 3. UnitType - is a Type Name.
 */
@RustDerive(Clone=true, PartialEq=true, Hash=true, Eq=true)
@VintfStability
parcelable UnitType {
    /** The SDV Package that this Unit Type is defined in. */
    @utf8InCpp String sdvPackageName;

    /** The Service Bundle (within the SDV Package) that this Unit Type is defined in. */
    @utf8InCpp String serviceBundleName;

    /** A unique identifier for this Unit Type (within the Service Bundle). */
    @utf8InCpp String typeName;
}
